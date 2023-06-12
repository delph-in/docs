{% raw %}This page describes some approaches to batch processing and processing
multiple files with [\[incr tsdb()\]](http://www.delph-in.net/itsdb).

# Page Status

This page presents user-supplied information, hence may be inaccurate in
some details, or not necessarily reflect use patterns anticipated by the
[\[incr tsdb()\]](http://www.delph-in.net/itsdb) developers. This page
was initiated by FrancisBond; please feel free to make
additions or corrections as you see fit. However, before revising this
page, one should be reasonably confident of the information given being
correct.

# Virtual Profiles

It is possible to create \`virtual profiles', which can then serve as
the target profile for \_some\_ [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) operations.

A virtual profile, like any other profile, is a directory somewhere in
the [\[incr tsdb()\]](http://www.delph-in.net/itsdb) profile database
\`home' directory. The only file one needs to put into a virtual profile
directory is one called \`virtual'. The virtual file, in turn, contains
the profile names of sub-profiles,

     "jh0"
     "jh1"
     "jh2"
     "jh3"
     "jh4"
     "jh5"
     "ps"
     "tg"

The \`jh0' et al. must be valid profile names (visible in the podium),
and the double quotes are mandatory.

A few restrictions: virtual profiles are read-only and currently do not
show in the [tsdb](/tsdb) podium. However, they can be useful in
training and evaluating parse selection models.

# Batch Scripts

You can call [\[incr tsdb()\]](http://www.delph-in.net/itsdb) from
within a batch script. This makes it possible to parse, update,
normalize, export and so on from the comfort of your terminal.

There is an example batch scripts for exporting in the normal
installation: $DELPHINHOME/lkb/src/tsdb/home/export.

It is called as follows, to export a single profile:

      ./export redwoods/jun-04/vm6/04-06-11

There are other batch scripts in LOGON tree (see [LogonTop](https://delph-in.github.io/docs/tools/LogonTop)).
In the top directory are scripts for parsing, generating and
transfering. See the [LogonProcessing](https://delph-in.github.io/docs/tools/LogonProcessing) page for some
further instructions.

There are more scripts under lingo/redwoods/ for training stochastic
models.

There is a script by the name \`load' (essentially setting up the
environment for a variety of experimental tasks) and input files
\`fc.lisp' (creating the feature cache, a one-time operation);
\`grid.lisp' (executing a large number of experiments, with varying
feature sets and estimation parameters); and finally \`train.lisp'
(training and serializing a model, using a default set of parameters).
Note that, since virtual profiles are read-only, you will still need a
skeleton for the full data set, as each iteration in \`grid.lisp' needs
to write scores et al. In late 2006, it is suggested that people should
use the LOGON tree for parse selection experiments. It also includes
suitable TADM (and SVM) binaries.

## Memory Use

Batch processing is much faster for some tasks (e.g. automatic treebank
updates and normalization).

However, some task remain challenging. See the note on memory
requirements for exporting toward the bottom of
[RedwoodsTop](https://delph-in.github.io/docs/garage/RedwoodsTop). In the Hinoki project, we are now forced to
use a 64 bit machine to export, as we often run out of memory with the
32 bit lisp.

## Customization

You can discover which function calls to use by tracing them while using
the podium. For example, in the \*common-lisp\* buffer type
:trace tsdb::browse-trees then run the sequence of commands you want to
batch from the menus and look at the output in the buffer. This can then
be converted into a script.

Last update: 2012-08-07 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/ItsdbBatch/_edit)]{% endraw %}