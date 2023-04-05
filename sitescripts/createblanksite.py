import os
import posixpath
import shutil
import urllib


script_path = os.path.dirname(os.path.realpath(__file__))


def create_blank_sites(root_address, latest_src_path, latest_sites_path, site_definitions):
    reset_sites(latest_src_path, latest_sites_path)
    copy_root_redirector(latest_sites_path)
    copy_google_authentication_page(latest_sites_path)
    navigation_content = generate_shared_navigation(root_address, site_definitions)
    pages = site_definitions["Pages"]
    for site in site_definitions["Sites"]:
        create_blank_site(site, root_address, site["Site"], pages, latest_src_path, navigation_content)


# Remove all pages from "latest" so we don't carry over removed pages
def reset_sites(latest_src_path, latest_sites_path):
    shutil.rmtree(latest_src_path)
    os.mkdir(latest_src_path)
    shutil.rmtree(latest_sites_path)
    os.mkdir(latest_sites_path)


def copy_lunr(root_address, site_src_path):
    target_directory = os.path.join(site_src_path, "assets/js/lunr")
    template = get_template("template_lunr-en.js")
    # Can't use the normal template {} format since this is javascript
    value = template.replace("##{SiteAbsoluteRootUrl}##", root_address)
    write_template(target_directory, "lunr-en.js", value)


def copy_root_redirector(latest_sites_path):
    template = get_template("root_redirector.html")
    write_template(latest_sites_path, "index.html", template)


# This lets google know that we own the site so we can index it properly
def copy_google_authentication_page(latest_sites_path):
    template = get_template("googlebe469dbf75b6dc48.html")
    write_template(latest_sites_path, "googlebe469dbf75b6dc48.html", template)


# Create blank site
def create_blank_site(site_definition, root_address, site_name, pages_definitions, latest_src_path, navigation_content):
    site_template_path = os.path.join(script_path, "site_template_standard")
    site_path = os.path.join(latest_src_path, site_name)

    # Copy the initial template over
    shutil.copytree(site_template_path, site_path)

    # Add top level navigation
    write_template(site_path, "_data/navigation.yml", navigation_content)

    # Add the configuration
    create_site_configuration(site_path, root_address, site_definition)

    # Create the index.html page for the site
    create_index(site_path, root_address, site_definition, pages_definitions)

    # Copy the lunr search js which has a reference to the global index
    copy_lunr(root_address, site_path)


def get_template(name):
    file_path = os.path.join(script_path, name)
    with open(file_path, "r") as txt_file:
        return txt_file.read()


def write_template(site_path, relative_path, value):
    file_path = os.path.join(site_path, relative_path)
    with open(file_path, "a") as txt_file:
        txt_file.write(value)


def create_site_configuration(site_path, root_address, site_definition):
    template = get_template("template_config.txt")
    split_url = urllib.parse.urlparse(root_address)
    path_parts = split_url.path.split('/')
    base_url = "/" + "/".join(path_parts[1:])
    final_base_url = posixpath.join(base_url, site_definition["Site"])
    value = template.format(SiteFullName=site_definition["SiteFullName"], SiteBaseUrl=final_base_url)
    write_template(site_path, "_config.yml", value)


def generate_shared_navigation(root_address, site_definitions):
    template = get_template("template_navigation.txt")
    navigation_content = ""
    for site_definition in site_definitions["Sites"]:
        pages_definitions = site_definitions["Pages"]
        site_root = posixpath.join(root_address, site_definition["Site"], get_home_page_relative_url(site_definition, pages_definitions))
        navigation_content += template.format(SiteNavigationName=site_definition["SiteNavigationName"], SiteAbsoluteUrl=site_root)
    return navigation_content


def create_index(site_path, root_address, site_definition, pages_definitions):
    template = get_template("template_index.txt")
    path = get_home_page_relative_url(site_definition, pages_definitions)
    value = template.format(HomePage=path)
    write_template(site_path, "index.md", value)


def get_home_page_relative_url(site_definition, pages_definitions):
    home_page = None
    if "HomePage" in site_definition:
        home_page = site_definition["HomePage"]
    else:
        site_name = site_definition["Site"]
        for page in pages_definitions:
            if page["Site"] == site_name:
                home_page = page["SrcFile"]
                break

    if home_page is None:
        raise Exception(f'No HomePage key for site {site_definition["Site"]} and no pages defined from which to choose a default')

    path, _ = os.path.splitext(home_page)
    return path
