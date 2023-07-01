{% raw %}# PET API proposal

The idea is to replace the cheap executable (with 'pipe' over stderr...)
by a library. The library in turn then could be wrapped in an executable
(if someone really still need this), or better in a XML-RPC or other
socket server. The library could also be called directly from Java (via
JNI) or scripting languages like Python.

The main motivation is to have a more flexible configuration. Currently,
the cheap binary has to be restarted (including time-consuming grammar
loading) each time the number of readings to return is to be changed,
for example. Using the new API, this option could be modified for each
parse individually.

Moreover, the different configuration sources (command line, pseudo TDL
config file, partly true TDL definitions in the grammar) should be
unified.

Generally, no new features will be added, just the implicit interface
will be made explicit and streamlined. For example, it will not be
possible to exchange the grammar during runtime, as this would require
fundamental changes in the code (and is not considered necessary).

## Elements of the API

- basic configuration like which grammar image to load, cheap command
line options that cannot be modified at runtime
- cheap command line options that can be modified at runtime
- MRS globals (shared with LKB, readable also from file via pseudo TDL
parser; cf. [JerezTop](https://delph-in.github.io/docs/summits/JerezTop) discussion)
- parse from preprocessor (SMAF) input, raw text input obsolete?
- retrieve result chart in different formats
  - MRS
  - MRS-XML
  - RMRS
  - tree
  - HTML (?)
  - typed FS (FS-XML?), with feature path to sub-FS
  - fragments
- access to type hierarchy
  - sub/supertype
  - type subsumption
  - type name and code
  - FS prototype (FS-XML?), but no feature structure unification

## Feature requests

- configurable start symbol for parsing (FrancisBond)
- change lexicon during runtime (not possible for the built-in
lexicon, but probably for lexDB)
- change model during runtime

Last update: 2006-06-14 by UlrichSchaefer [[edit](https://github.com/delph-in/docs/wiki/FeforPetApi/_edit)]{% endraw %}