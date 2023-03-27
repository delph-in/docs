These are all examples of links that appear in the wild in the wiki, some need to be fixed, some are legit.

In the Github wiki:
- links with no starting slashes are links to other wiki topics in the same wiki
  - They can have "#" to link to a heading within that page
  - If they have slashes within them, they are invalid because there are no subfolders in the wiki
- links starting with slashes ("root-relative links") link to http://github.com since that is the root they are on
  - this can be legit for linking to another github project, subproject, etc
  - They can have "#" to link to a heading within that page
- links with "http(s)" are public websites
 
# Examples
## Legit
another wiki page in the same wiki: [ErgSemantics](ErgSemantics)

a local wiki page with non-ascii characters [ArneSkj%C3%A6rholt](ArneSkj%C3%A6rholt)

a heading on another page (used - to replace spaces) [DelphinApplications#Robot-Control](DelphinApplications#Robot-Control)

a subheading on same page [#ace](#ace)

a wiki topic that the author is encouraging someone to create [CreateMe](CreateMe)


A misguided, but legit, link to another wiki page in the same wiki (treated as an absolute link, but does work): [/delph-in/docs/wiki/ErgTop](/delph-in/docs/wiki/ErgTop)

another github project [/delph-in](/delph-in)

a github *user* [/ericzinda](/ericzinda)


another website: [http://wikipedia.com#foo?bar=goo](http://wikipedia.com#foo?bar=goo)

link that is valid but hangs:(http://erg.delph-in.net/)[http://erg.delph-in.net/]


## Wrong
A poorly formed link to another existing wiki page (github iterprets as a link to a project) [/ErgSemantics](/ErgSemantics)

A poorly formed link to a heading on another page (github iterprets as a link to a project) [/DelphinApplications#Robot-Control](/DelphinApplications#Robot-Control)

A poorly formed link to a wiki topic that the author is encouraging someone to create (github iterprets as a link to a project) [/CreateMe](/CreateMe)

A couple of test links just to test the code
( / /ErgSemantics)[ / /ErgSemantics]
( //ErgSemantics)[ //ErgSemantics]
[http://aclweb.org/anthology/P/P11/P11-4002.pdf](http://aclweb.org/anthology/P/P11/P11-4002.pdf)
[http://portal.acm.org/citation.cfm?id=1564038](http://portal.acm.org/citation.cfm?id=1564038)

A poorly formed link to ? (github interprets as a subproject in github) [/CapitolHillGenerationTesting/PathToGrammar](/CapitolHillGenerationTesting/PathToGrammar)

A (kind of) poorly formed link to a heading (used _ instead of -, links to topic but not to heading) [DelphinApplications#Robot_Control](/DelphinApplications#Robot_Control)

A poorly formed attempt to link to a local wiki doc MatrixDoc_Lexicon#A_Features_Analyses (/MatrixDoc/Lexicon#A_Features_Analyses)[/MatrixDoc/Lexicon#A_Features_Analyses]


