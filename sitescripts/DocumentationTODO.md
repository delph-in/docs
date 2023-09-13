* Fix up all the deprecation warnings in the script
* At the summit I took the action item to figure out how to put wiki pages in multiple places in the docs, and here's the answer (for now at least), you can put them in as many places as you want in the docs site, but any link to them will only go to the *last* one in the site.  I've added a workitem to support making one of them "definitive" so that all links go there, but that's for the future. Hopefully this will hold us for now
* Grammar Engineering FAQ: https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ/
  * Has links in it to pages that don't exist: The LKB says that I am trying to unify a NULL with CONS. What could the problem be?
  * But they show up as links on the site.  Issues:
    * Used / to start
    * Had line breaks in link definitions
    * Pages didn't exist

* Testing removal (what happens if something is removed from the wiki?)
* 404 at root DNS name: https://delph-in.github.io/
* Virtual2021Participants doesn't render the table correctly
* Font is small
* Linking between pages scrolls down a tiny bit
* If we are presenting lists of discussions, include dates
* Make a visual difference between internal and external links
* Rename garage (to attic?)
* Put the latest sites in a different branch (to separate changes to content from changes to compiled content -- don't want them mixed in the same history). Bot commits end up cluttering up the history.
- Write a quick start for adding a section and a site
- Support branches deploying to different sites
- Update docs to include what happens if a file is removed