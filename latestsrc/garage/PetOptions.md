{% raw %}# Overview

# flop Command-Line Options

# cheap Command-Line Options

\`-tok=(string\|yy\|xml\|xml\_counts)\`  
- select input method (default string)

\`-yy\`  
- YY input mode

\`-packing\[=n\]\`  
- set packing to n (bit coded; default: 7). The bits mean: selective
unpacking, retro-active packing, pro-active packing and equi-active
packing. Note that for selective unpacking to take effect,
-nsolutions&gt;0 is required, as well as a Maximum Entropy Model,
usually set in pet/common.pet. Read
[PetSelectiveUnpacking](https://delph-in.github.io/docs/garage/PetSelectiveUnpacking) for more details.

\`-sm=filename\`  
- specifies the filename of the [MaxEnt](/MaxEnt) model, overriding
the (possible) setting in pet/common.pet.

\`-cp=\[strategy\]limit\`  
- enable chart pruning. Strategy can be a(ll), s(uccessful), or
p(assive), the default.

\`-verbose\[=n\]\`  
- set verbosity level to n

\`-nsolutions\[=n\]\`  
- find best n only, 1 if n is not given

\`-results=n\`  
- print at most n (full) results. Difference with -nsolutions?

\`-timeout=n\`  
- times out after n seconds

\`-limit=n\`  
- maximum number of passive edges

\`-memlimit=n\`  
- maximum amount of fs memory (in MB)

\`-no-shrink-mem\`  
- don't shrink process size after huge items

\`-default-les\`  
- enable use of default lexical entries

\`-compute-qc\[=file\]\`  
- compute quickcheck paths (output to file, default /tmp/qc.tdl)

\`-qc-unif=n\`  
- use only top n quickcheck paths (unification)

\`-qc-subs=n\`  
- use only top n quickcheck paths (subsumption)

\`-tsdb\[=n\]\`  
- enable \[incr tsdb()\] slave mode (protocol version = n)

\`-mrs\[=mode\]\`  
- compute MRS semantics (in specified mode). The combination
-tsdbdump dir -mrs (without arguments) outputs the MRS in the
[\[incr tsdb()\]](http://www.delph-in.net/itsdb) profile.
  
  Modes are **mrs**: MRS as text (default); **mrx**: MRS as xml;
  
  **rmrs**: RMRS as text; **xml**: RMRS as xml

\`-no-filter\`  
- disable rule filter

\`-no-chart-man\`  
- disable chart manipulation

\`-no-online-morph\`  
- disable online morphology

\`-no-fullform-morph\`  
- disable full form morphology

\`-no-hyper\`  
- disable hyper-active parsing

\`-no-derivation\`  
- disable output of derivations

\`-rulestats\`  
- enable tsdb output of rule statistics

\`-key=n\`  
- select key mode (0=key-driven, 1=l-r, 2=r-l, 3=head-driven)

\`-comment-passthrough\[=1\]\`  
- allow input comments (-1 to suppress output) comments are marked by
a "\#" or "//" at the start of a line

\`-server\[=n\]\`  
- go into server mode, bind to port \`n' (default: 4711)

\`-lattice\`  
- word lattice parsing

\`-interactive-online-morph\`  
- morphology only

\`-failure-print\`  
- print failure paths

\`-log=\[+\]file\`  
- log server mode activity to file' (+' appends)

\`-tsdbdump directory\`  
- write incr\[tsdb\] item, result and parse files to directory

\`-jxchgdump directory\`  
- write jxchg/approximation chart files to directory

\`-partial\`  
- print partial results in case of parse failure

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/PetOptions/_edit)]{% endraw %}