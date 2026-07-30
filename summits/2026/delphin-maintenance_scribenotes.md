# Maintenance and documentation of DELPH-IN tools
Follow-up from DELPH-IN 2046 session

**NOTE:** Need a more complete list of the tools under each ecosystem and who maintains them/holds the institutional knowledge

Ecosystems:
* LKB: [incr tsdb()] (plus use of LUI)
* ACE: ART, FTTB, LUI
* Pydelphin

### Ecosystems (rough topics added post-discussion)
Spencer: Most interested in LKB/[incr tsdb()] \
Dan: Need to do succession planning. Not too worried about the state of the LKB ecosystem. More immediate concern is ACE, its treebanker, and its batch processing tool/ART. Single author for all of the software, only a few people know how to compile it from source (names?). Woodley is still somewhat available but not actively involved. \
John: There is also LUI. Woodley is probably the only person currently who can (re-)build it \
Luis: On Linux, we have yzlui. However, there is no Metal Mac version of yzlui \
John: There is a Mac x86-64 LUI executable that works on Rosetta (maclui), available from Woodley's ftp site; however Rosetta will be withdrawn in a future version of macOS \
Luis: Can we convince Woodley to do one last effort to get ready for handoff? Some libraries are not well documented for compilation \
Dan: Maybe some incomplete info on ACE website. Woodley insists on version consistency, i.e. software requires the same version for all tools. \
Emily: Maybe Isaac can do some of this with RA time, needs a defined list of things to do. Main thing is creating/updating documentation \
Dan: Areas of importance: ACE ecosystem. Python universe (Michael Goodman) which imports some functionality from other tools. John is still good with LKB

### PET
John: Need to talk about PET? \
Dan: PET is another parser from late 90s, supplanted by ACE, which could also do generation and has a different set of debugging tools. PET has been on the sideline since the 2000s. Probably no reason to keep PET running. 2025 ERG still has PET subdirectory, but docstrings cause PET compiler to break if not stripped out \
Emily: Matrix grammars still have PET subdirectory, haven’t tried to compile with PET \
Luis: Same for Zhong/MRG \
Dan: We can recommend to remove support for PET \
Emily/Dan: PET is implemented in C++, ACE in C \
Isaac: Can work with either

### LKB/[incr tsdb()]
Dan: Can’t run LKB on Windows natively \
Luis: Was the only thing that worked on Windows for a while \
John: Got an early version of LKB-FOS running on Windows, but it was too fragile so did not release it. SDL 2 is on the horizon, so more possible in the future \
John: [incr tsdb()] can only run on Linux and only will ever run on Linux, depends on Tcl/Tk for the graphical part, would be very difficult to reimplement \
Dan: The community is developing result visualisation and analysis systems, which could in time substitute for [incr tsdb()] \
Emily: Is there compatibility between [incr tsdb()] profile schema and full forest parser output? \
Emily: When you parse a sentence, you can look at a set of trees or a set of edges, edges can be compacted by looking at equivalence classes \
Dan: Packing attempts to capture the intuition in a context-free grammar, helps with parsing efficiency by localizing ambiguity \
John: Packing is necessary for any resource grammar \
John: LKB-FOS can now create full forest profiles \
John: Full forests are represented by edges, each containing start/end indices, packing information, rule/lexical ids \
Emily: cannot compute semantic discriminants from full forest, only from trees

### Integration of preprocessing steps
Luis: Wants POS tagger functionality to be grammar agnostic; currently, built-in ACE tagger only used by ERG \
Ann: Now talking about preprocessing things, which also includes token mapping \
John: LKB/ACE are aligned on token mapping functionality \
Dan: There are few papers talking about the reasoning behind preprocessing process, more support needed for multilingual \
John: Suggest that in general an external preprocessor makes more sense than the parsing enginine containing a built-in POS tagger \
Dan: YY mode is not necessarily involved with this process \
Luis: different capabilities available for ERG vs other grammars \
Ann: For languages with a reasonable amount of NLP technology, it would be useful if people could use those technologies with grammars. How are we supposed to interface with those technologies today? Is it a documentation issue or a functionality one? Figuring this out will help people move towards using resource grammars. \
Luis: Petter asked about this in a previous session \
Ann: There are fairly standardized ways to do things like NER, should be somewhat easy to integrate \
Luis: Would this need YY mode? \
John: Olga had a python script to convert FreeLing to YY format \
Luis: Has this running on Linux, not Mac
John: Unfortunately, Olga was not able to get FreeLing running on macOS

### [incr tsdb()] source code
Spencer: Where is [incr tsdb()] code hosted? \
John: About to be moved from SVN to GitHub, in a branch that also has the LKB \
Spencer: Dead LinGO link to [incr tsdb()] source code on \
Dan: Will fix

### Public-facing parsing tools
Dan: Should talk a little about the demise of the Oslo-based public-facing repository of grammars, Grammarium covers some of this \
Luis: Some cost associated with having parsing tool publicly available online, department is OK with paying some, probably should be mostly GUI-based and restrict parsing at scale \
Dan: How can we access parsing at scale? There is some desire for this \
Luis: Grammarium can do this, it’s behind a login. Could have a self-hosted machine where non-DELPH-IN people could do this. \
Dan: We are thinking too small, if people at ACL are interested and want to use it, we should have a stable way for people with no internal knowledge of the system to use the tools \
Dan: Places where outside people can have access: Grammarium, Grammary (aimed a little more at grammar writers/linguists). What other tools might we need? \
Luis: Thinks of Grammarium as an outward-facing demo, even though we sometimes use it for more substantial tasks \
Ann/Emily: Wait for Francis to talk more about this \
Spencer: Where is Grammarium? \
Luis: Hosted at iTELL for now, but moving next month to be hosted on its own

### DELPH-IN docs
John: Moving back to LKB, about wiki pages, there are many pages about the state of LKB/[incr tsdb()] 10 years ago and how to use it that are no longer relevant; want to delete them and repurpose the relevant ones to point to LKB-FOS \
Luis: Some folks have disagreed in the past on the basis of preserving the archive \
Emily: Label pages as DEPRECATED and include a link to newer documentation? \
John: The old information is irrelevant \
Luis: Similar thing will be true for other tools \
Ann: Cares about archiving but doesn’t see a point in preserving this stuff \
Emily: Outward-facing site could not show archived pages, but they could still exist in the docs, may take a little work to configure that. Current site is a curated set of the Github docs, generated/updated with daily cron jobs \
Spencer: Several links on the external site are broken \
Dan: Many links have been broken by the Stanford and Oslo servers no longer being up, no one has made an effort to restore/fix these yet \
Emily: Can we find some missing things on Internet Archive? \
Spencer: Links work on internal site but not external one \
Emily: May be pages that are not exported, e.g. LKB installation \
Spencer: But LKB-FOS is also broken \
Luis: In the external site’s search functionality, page names are not indexed \
Emily: Grammarium should be added to ToolsTop page \
Spencer: and LTDB \
Ann: Is there a process for removing things from the list of tools? There are several that are probably not in use anymore \
Emily: Some historical interest in old tools, but should be separated from current tools \
Ann: Agrees that they should still be archived \
Emily/Dan: Need a webmaster \
Ann: Schedule a standing short summit session for updating pages? \
Multiple people: Agree \
Emily: Are there notes from the previous session where there was some debate about deleting/archiving things? Was it just me who was opposed to getting rid of things? \
Luis: Documentation versioning? So that we can delete things in the newest version \
Emily: Make a “release” at each summit, with a github tag? \
Spencer: Maintain links to the most important historical tools, e.g. PET? \
Emily: How can we do that systematically? \
Ann: DELPH-IN history page? Can update it at each summit in a designated session \
Emily: Can we easily see the state of the docs at a specific date? \
Emily: Add note to internal 404 page that says “We’ve been deleting things, if something is missing check here”?

### Sentence splitting
Ann: Something else that stops people from using the tools is the lack of ability to split sentences. Could set this up as a ML project to test different approaches. \
Luis: This was a source of the error for the medical dataset, was using NLTK \
Ann: The task requires domain-specific considerations
