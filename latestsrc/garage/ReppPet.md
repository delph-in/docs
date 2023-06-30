{% raw %}# Overview

As of August 2011, PET now includes native support for the Regular
Expression Pre-Processor (REPP; see [ReppTop](https://delph-in.github.io/docs/garage/ReppTop)). Repp processing
can be requested using the -repp option to cheap, optionally with the
name of a settings file as an argument: -repp=wiki. Settings files will
be looked for in the base grammar directory, or the general settings
directory (pet/). A default settings file, repp.set, is currently
included in common.set in the trunk version of the ERG. That file
contains these settings (which can each be overridden as required):

    ;;
    ;; REPP tokenization builds on a collection of rule sets, each in a file of its
    ;; own.  these are called modules (or at times just REPPs), and all are loaded
    ;; into the processor.  a specific configuration is then obtained by picking
    ;; one REPP module as the top-level entry point, and determining which named
    ;; group calls (to other modules) should be allowed, if called.  the following
    ;; is the global set of available modules.
    ;;
    repp-modules := tokenizer xml latex ascii wiki robustness quotes lkb.
    
    ;;
    ;; the REPP module to provide the top-level entry point.
    ;;
    repp-tokenizer := tokenizer.
    
    ;;
    ;; REPP modules can be parameterized in terms of external named groups, which
    ;; conceptually resemble sub-routines and can be activated or deactivated; the
    ;; following is the default list of groups to activate (and may be overwritten
    ;; in indivudal REPP configurations).
    ;;
    repp-calls := xml ascii quotes.

An initial integration of the TnT tagger has also been added, which can
be triggered using the -tagger option and is also configured using
settings files. This implementation may yet be revised as we look at
adding multiple taggers, but as of 10th August, 2011, the settings in
the trunk version of the ERG (tERG) make the default tagger setup
replicate the Lisp wrapper, with slight modifications to allow a single
instantiation of TnT to be used. Hence to replicate the terg+tnt CPU,
use the command:

    cheap -repp -tagger -cm -default-les=all -timeout=60 -packing -memlimit=1024 terg/english.grm

For those using the LOGON tree, see also the [LogonPet](https://delph-in.github.io/docs/tools/LogonPet) page.

# Stand-Alone Tokenization

Although a relatively heavy-handed solution (and not stricly speaking
part of the supported external interfaces), the implementation of REPP
in the PET parser can also be used as a stand-alone tokenizer. Some
[practical
suggestions](http://lists.delph-in.net/archives/lkb/2013/000255.html)
were posted to the LKB mailing list in early 2013.

Last update: 2013-03-12 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/ReppPet/_edit)]{% endraw %}