{% raw %}First of all, the list of all completed items:

- converge main & cm into one new main branch
- [code style recommendations
fixed](http://pet.opendfki.de/wiki/Programming%20Style%20Guide)
- poll for functionality, esp. in input part, has been done
- no need for a ticketing system other than trac
- have a sub-group working out a list of deprecated things
- (decided to not be an issue) copyright notice updates
- include C++ REPP implementation (work in progress by
RebeccaDridan)
- Put most of TODO and this page into tickets

This is a list of possible topics to discuss in this session. Please add
topics freely that you feel are missing.

- after that: *refactoring the code*
  
  - get rid of ECL as much as possible
    - remove input modes that rely on ECL, complete MRS treatment
as far as necessary
  - remove as much of the load on "item" as possible
  - encourage developers to remove obsolete code and merge similar
functionality where possible
  - refactoring into new code style, once it is fixed
  - documentation of (especially new) modules,
    - add scripts to illustrate use
    - necessary resources (data to train / models, training
scripts, etc)
- release plans / procedures (LOGON?)

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/PetRoadMap/_edit)]{% endraw %}