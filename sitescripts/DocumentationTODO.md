


* Fix 404 https://delph-in.github.io/GrammarEngineeringFaq
      (This is on all of the FAQ pages at the bottom)
      * Debug why some links from
      https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ/
      are broken .... answer has to do with those being missing pages in the underlying wiki. So link shouldn't have been added.

* Testing removal (what happens if something is removed from the wiki?)
* If we are presenting lists of discussions, include dates
* Make a visual difference between internal and external links
* Rename garage (to attic?)
* 404 at root DNS name: https://delph-in.github.io/
* Test whether you can put links to one thing in two places -- Grammar Matrix Getting Started page now moved to How To, should it also be in Matrix?
* Put the latest sites in a different branch (to separate changes to content from changes to compiled content -- don't want them mixed in the same history). Bot commits end up cluttering up the history.



- Some images are broken
      - Github camo is used: https://github.com/atmos/camo by default in WIKI, this doesn't happen on github pages
      - https://github.blog/2014-01-28-proxying-user-images/
      - https://github.com/sionide21/camo-client
- Write a quick start for adding a section and a site
- Support branches deploying to different sites