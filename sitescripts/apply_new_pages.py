import datetime
import json
import os
import sys


# Sites whose "Pages" tree entries should never be auto-merged: this placeholder
# Site name is used by createdocs.py's propose_broken_links() for wiki files that
# aren't linked from anywhere in the built sites, so there's no reliable Site/Section
# to file them under automatically.
UNRESOLVED_SITE = "<not included or linked to>"

# This Section name is a deliberate blackhole: it holds links to pages that are
# never expected to exist (personal wiki-username pages, wiki system pages, etc),
# used to suppress "broken link" reports. Entries here are meant to stay
# FileMissing forever, so stale-page removal must never touch this section.
IGNORE_SECTION = "<ignore>"


def load(path):
    with open(path, "r") as txt_file:
        return json.loads(txt_file.read())


def existing_page_keys(pages_tree):
    keys = set()
    for sections in pages_tree.values():
        for section in sections:
            for page in section["Pages"]:
                keys.add((page["SrcDir"], page["SrcFile"]))
    return keys


# Merge proposals from the "fixes" tree (as produced by createdocs.py's
# propose_broken_links()/log_json_tree_to_file()) into the site definitions tree.
# Only proposals whose Site is already a real, defined site are applied: those are
# pages that ARE linked to from an already-included page (just not registered yet),
# so the Site/Section they were found under is a trustworthy place to add them.
# Proposals under UNRESOLVED_SITE are wiki pages nobody links to at all, so there's
# no sensible location to auto-file them; those are left for a human to triage.
def merge_new_pages(sitesdefinitions_tree, fixes_tree):
    pages_tree = sitesdefinitions_tree["Pages"]
    valid_sites = {site["Site"] for site in sitesdefinitions_tree["Sites"]}
    seen = existing_page_keys(pages_tree)

    added = []
    for site_name, sections in fixes_tree.items():
        if site_name == UNRESOLVED_SITE or site_name not in valid_sites:
            continue

        site_sections = pages_tree.setdefault(site_name, [])
        for section in sections:
            for page in section["Pages"]:
                # Skip dead links: the proposal generator sets this when the
                # linked-to file doesn't actually exist in the source repo, so
                # there's nothing real to register (see DocumentationTODO.md).
                if page.get("FileMissing"):
                    continue

                key = (page["SrcDir"], page["SrcFile"])
                if key in seen:
                    continue
                seen.add(key)

                target_section = next(
                    (s for s in site_sections if s["Section"] == section["Section"]),
                    None,
                )
                if target_section is None:
                    target_section = {"Section": section["Section"], "Pages": []}
                    site_sections.append(target_section)

                target_section["Pages"].append(page)
                added.append({"Site": site_name, "Section": section["Section"], "SrcFile": page["SrcFile"]})

    return added


# Registered pages whose source file has actually disappeared (deleted/renamed
# wiki page) currently take down the *entire* build: createdocs.py throws trying
# to open a nonexistent file and the whole run fails with "assert False" until a
# human notices and hand-edits sitesdefinitions.json. This prunes those entries
# instead -- but only once a page has been seen missing on two separate runs
# (tracked via a "MissingSince" marker persisted back into sitesdefinitions.json),
# as cheap insurance against a one-off flaky checkout wrongly deleting a real page.
# The "<ignore>" section is a deliberate blackhole for permanently-missing pages
# and is never touched.
def remove_stale_pages(pages_tree, input_content_root):
    removed = []
    flagged = []
    recovered = []

    for site_name, sections in pages_tree.items():
        for section in sections:
            if section["Section"] == IGNORE_SECTION:
                continue

            surviving_pages = []
            for page in section["Pages"]:
                src_path = os.path.join(input_content_root, page["SrcDir"], page["SrcFile"])
                if os.path.exists(src_path):
                    if page.pop("MissingSince", None) is not None:
                        recovered.append({"Site": site_name, "Section": section["Section"], "SrcFile": page["SrcFile"]})
                    surviving_pages.append(page)
                elif "MissingSince" in page:
                    removed.append({"Site": site_name, "Section": section["Section"], "SrcFile": page["SrcFile"],
                                     "MissingSince": page["MissingSince"]})
                else:
                    page["MissingSince"] = datetime.date.today().isoformat()
                    flagged.append({"Site": site_name, "Section": section["Section"], "SrcFile": page["SrcFile"]})
                    surviving_pages.append(page)

            section["Pages"] = surviving_pages

    # Drop sections that are now empty so the tree doesn't accumulate clutter
    for site_name in list(pages_tree.keys()):
        pages_tree[site_name] = [s for s in pages_tree[site_name] if s["Pages"]]

    return removed, flagged, recovered


# Render just the "Pages" tree in the same layout createdocs.py's
# log_json_tree_to_file() uses, so that untouched entries produce an
# unchanged diff and only newly added pages show up.
def render_pages_block(pages_tree):
    lines = ["  {"]
    sites = []
    for site_name, sections in pages_tree.items():
        site_text = f'    "{site_name}": [\n'
        section_texts = []
        for section in sections:
            section_text = f'      {{"Section": "{section["Section"]}", "Pages": [\n'
            section_text += ",\n".join(f'        {json.dumps(page)}' for page in section["Pages"])
            section_text += "\n      ]}"
            section_texts.append(section_text)
        site_text += ",\n".join(section_texts)
        site_text += "\n    ]"
        sites.append(site_text)
    lines.append(",\n".join(sites))
    lines.append("\n  }")
    return "".join(lines)


# Rewrite sitesdefinitions.json, keeping everything before the "Pages" key
# byte-for-byte identical (Comments/SourceRepositories/Sites are hand maintained)
# and only regenerating the Pages block.
def write_sitesdefinitions(path, original_text, pages_tree):
    marker = '  "Pages":'
    marker_index = original_text.index(marker)
    prefix = original_text[:marker_index]
    with open(path, "w") as txt_file:
        txt_file.write(prefix)
        txt_file.write(marker)
        txt_file.write("\n")
        txt_file.write(render_pages_block(pages_tree))
        txt_file.write("\n}\n")


if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: apply_new_pages.py <sitesdefinitions.json> <input_content_root> <FixesForBrokenLinksToWikiPages.json>")
        sys.exit(1)

    sitesdefinitions_path = sys.argv[1]
    input_content_root = sys.argv[2]
    fixes_path = sys.argv[3]

    with open(sitesdefinitions_path, "r") as txt_file:
        original_text = txt_file.read()
    sitesdefinitions_tree = json.loads(original_text)

    added = []
    if os.path.exists(fixes_path):
        fixes_tree = load(fixes_path)
        added = merge_new_pages(sitesdefinitions_tree, fixes_tree)
    else:
        print(f"No fixes file at {fixes_path}, skipping auto-add")

    removed, flagged, recovered = remove_stale_pages(sitesdefinitions_tree["Pages"], input_content_root)

    github_output = os.environ.get("GITHUB_OUTPUT")
    changed = bool(added or removed or flagged or recovered)

    if added:
        print(f"Added {len(added)} previously-unregistered page(s):")
        for entry in added:
            print(f'  {entry["Site"]} / {entry["Section"]}: {entry["SrcFile"]}')
    if flagged:
        print(f"Flagged {len(flagged)} page(s) as missing (will be removed if still missing next run):")
        for entry in flagged:
            print(f'  {entry["Site"]} / {entry["Section"]}: {entry["SrcFile"]}')
    if removed:
        print(f"Removed {len(removed)} page(s) confirmed missing since a prior run:")
        for entry in removed:
            print(f'  {entry["Site"]} / {entry["Section"]}: {entry["SrcFile"]} (missing since {entry["MissingSince"]})')
    if recovered:
        print(f"{len(recovered)} previously-flagged page(s) reappeared, unflagged:")
        for entry in recovered:
            print(f'  {entry["Site"]} / {entry["Section"]}: {entry["SrcFile"]}')

    if changed:
        write_sitesdefinitions(sitesdefinitions_path, original_text, sitesdefinitions_tree["Pages"])
    else:
        print("No changes to sitesdefinitions.json")

    if github_output:
        with open(github_output, "a") as out:
            out.write(f"changed={'true' if changed else 'false'}\n")
