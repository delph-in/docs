{% raw %}This page describes how to use and train models for **csaw** in
combination with [ACE](https://delph-in.github.io/docs/tools/AceTop). **csaw** was written and is maintained
by [WoodleyPackard](/WoodleyPackard).

There is more information at the [upstream
page](http://sweaglesw.org/linguistics/csaw/). You can download the
software [from here](http://sweaglesw.org/linguistics/csaw/download/).

The basic idea is to extract a PCFG from an HPSG-parsed corpus, use
ordinary PCFG techniques to derive approximate HPSG derivations for
unseen sentences, and then use robust unification to derive MRS
structures from those approximate derivations. It builds on earlier work
by Yi Zhong, Stephan Oepen, and others.

## Using the PCFG (with ACE)

You can use this in a stand alone csaw, or together with ace.

    export CSAW_USE_ACE_TAGGER=true 
    echo "My sentence." | ./csaw path/to/my/grammar.dat treebank.pcfg
    
    echo "My sentence." | .ace -g path/to/my/grammar.dat --pcfg=treebank.pcfg

The CSAW\_USE\_ACE\_TAGGER setting is only relevant when using CSAW
separately from ACE. CSAW's default is to invoke TNT with the WSJ model,
from the presumed-to-be-installed LOGON tree. If you don't want that
(e.g. using a non-English language, or prefer the ACE tagger), use
CSAW\_USE\_ACE\_TAGGER=true.

## Training the PCFG

Start a master

    ./exmaster treebank.pcfg

In a different terminal, start a worker for each treebanked profile. The
arguments are grammar, profile, server host, level of grandparenting
(default is 2).

    ./exworker ../path/to/grammar.dat ../path/to/profile/ localhost 0

When all the workers have finished their profiles, go back to the master
and kill it with ^C. It will then write out the pcfg.

Note, you can train on parsed, but non-treebanked profiles, in this case
parse and store only the top one.

## References

Zhang, Yi, and Hans-Ulrich Krieger. "[Large-scale corpus-driven PCFG
approximation of an
HPSG](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0ahUKEwiV9ePY8s7VAhVSaFAKHS2kC8IQFggoMAA&url=http%3A%2F%2Fwww.aclweb.org%2Fanthology%2FW11-2923&usg=AFQjCNFiPdIVpXpURRUB22FhdNkb-ihauQ)."
Proceedings of the 12th international conference on parsing
technologies. Association for Computational Linguistics, 2011.

Yi Zhang, Stephan Oepen, Rebecca Dridan, Dan Flickinger, and Hans-Ulrich
Krieger. In prep. Robust parsing, meaning composition, and evaluation:
Integrating grammar approximation, default unification, and elementary
semantic dependencies. Accessed Feb-01-2017 from:
<http://www.mn.uio.no/ifi/english/people/aca/oe/robustness.pdf>

Last update: 2017-08-11 by WoodleyPackard [[edit](https://github.com/delph-in/docs/wiki/AceCsaw/_edit)]{% endraw %}