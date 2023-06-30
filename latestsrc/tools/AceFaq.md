{% raw %}# ACE Frequently Asked Questions

## When I try to compile my grammar with ACE, I see a lot of errors

You may inadvertently be using a very old copy of ACE. If you have
installed an older version of the LOGON distribution (dating to before
mid-June 2013), there used to be an **ace** binary on your PATH which
dates to roughly 2005. Current versions of the LOGON tree include
up-to-date ACE binaries (invoked through a wrapper script called
‘answer’; see the [LogonAnswer](https://delph-in.github.io/docs/tools/LogonAnswer) page). Or, if you have a
locally installed binary, you may try invoking a modern copy of ACE by
its full path. Modern versions of ACE support the -V command-line option
to report the version; if your ACE does not recognize the -V option, it
is too old to be useful.

## Why are the compiled grammar images so big?

The ACE precompiler prepares a complete image of the initial contents of
memory that will be needed for runtime processing. For complex grammars,
this can be a few hundred megabytes. The advantage of this is that ACE
can start up and be ready to parse or generate in a matter of a few
milliseconds, if the file is in cache.

## Why isn't ACE stripping punctuation like the LKB or PET?

The LKB and PET used to have their own idiosyncratic methods for
stripping punctuation, pre-dating the inclusion of Regular
Expression-Based Pre-Processing (REPP) rules as part of each grammar.
Older grammars may not have been upgraded yet for REPP usage. For
example, in Jacy's pet/japanese.set file:

      punctuation-characters := "!\\"!&'()\*+,-−./;&lt;=&gt;?@\[\\\]^\_\`{\|}\~。！？…．　○●◎＊☆★◇◆" 

ACE uses the REPP tokenizer (see [ReppTop](https://delph-in.github.io/docs/garage/ReppTop)) to accomplish this.
The above can be made into a REPP rule as follows (where → is a tab
character and ▁ is a space; note that special characters may need to be
escaped):

      !\[!"&'()\*+,\\-−./;&lt;=&gt;?@\[\\\]^\_\`{\|}\~。！？…．　○●◎＊☆★◇◆\]→   →       ▁ 

## Does ACE use the maxent model for both parsing and generation?

Yes. If you want separate models, you can make two grammar images.

## I tried using the -l option for LUI display, and yzlui is on PATH, but the display window closed immediately after opening.

The LUI window closes when ACE exits, and ACE exits when it reaches the
end of its input stream. If you piped sentences to ACE at the command
line (e.g. echo "Abrams chased Brown" \| ace -g erg.dat -l), ACE will
close as soon as it finishes parsing those sentences, and thus the LUI
window won't be open for long. Try using ACE without a pipe, such that
it waits for input on STDIN:

    $ ace -g erg.dat -l
    Abrams chased Brown
    
    # LUI window displayed here
    # Ctrl-D exits ACE

## What does "Lexemes do not span position ... " message means when ACE is run to parse sentences?

This message means ACE couldn’t find any appropriate feature structure
to use for that word for the bottom of a derivation tree, so it couldn’t
even try to build the rest of the derivation. Position N (0,1...) means
it was the N-1 word in the sentence (0 means 1st).

Given a surface form, ACE has to apply all the morphological rules you
supplied (in reverse, so to speak) to hypothesize every conceivable stem
that might give rise to that form, and then check the lexicon to see if
any of those stems actually exist. If none of them do, that error crops
up. It can also happen when a lexeme does exist whose stem form would
inflect to the observed surface form but the required lexical rules fail
to unify. Either way, the basic content of the error message is that ACE
thinks the surface form in question is unanalyzeable according to your
grammar. The most likely explanation is you are missing a lexeme or
missing a morpheme / orthographemic rule.

If you find the error surprising, you can check what hypotheses were
generated with something like this:

      echo "my sentence" | ace -g mygrammar.dat -vvv | less

The section of the output that you’re interested in is after "finished
token mapping" and before "finished lexical lookup". When I try the
following:

      echo "eatinginging" | ace -g erg-1214.dat -vvv | less

the section of the output that talks about these hypotheses is something
like this:

```
eatinginging -&gt; eatinginging \[2 ways\]

-   non\_third\_sg\_fin\_v\_rbst

eatinginging -&gt; eatinginge \[1 ways\]

-   v\_prp\_olr

eatinginging -&gt; eatinging \[1 ways\]

-   v\_prp\_olr

eatinginging -&gt; eatinge \[0 ways\] eatinginging -&gt; eating \[0
ways\] eatinginging -&gt; eate \[0 ways\] eatinginging -&gt; eat \[0
ways\] .......

-   lexical lookup found lexeme 'eat\_in\_v1' lexical lookup found
    lexeme 'eat\_of\_v1' lexical lookup found lexeme 'eat\_out\_v1'
    lexical lookup found lexeme 'eat\_up\_v1' lexical lookup found
    lexeme 'eat1'
```

If you actually try it you’ll see the list of hypotheses is triplicated,
because the ERG posits 3 tokens for the single input word. After each
hypothesis is the list of rule sequences that arrive at that hypothesis,
already somewhat filtered by rule unifiability considerations. For a
healthy analysis, you would want to see something like the following:

```
pre1-stem-suf1-suf2 -&gt; sten \[1 way\]

-   rule-pre1-prefix rule-suf1-suffix rule-suf2-suffix

```

## I am fairly sure I have all the lexemes and morphemes in the grammar, but ACE fails to parse the sentence and gives the "lexemes do not span position ..." message. Why could that be?

A problem may arise with polysynthetic languages. By default ACE is
willing to entertain the possibility of up to 7 orthographemic rules
applying to a stem before giving up. This is to protect the unwary from
large search spaces.

You should then see something like:

> WARNING: ran up against orthographemic rule chain limit (configured at 7) during orthographemic analysis


when you try to parse, although if you are parsing with art rather than
directly with ace from the commandline, that warning will likely be
silently ignored.

It can be changed in your ace/config.tdl as follows:

      ortho-max-rules := 500.

or whatever number you like.

## How to cite Ace?

    @inproceedings{crysmann-packard-2012-towards,
    title = "Towards Efficient {HPSG} Generation for {G}erman, a Non-Configurational Language",
    author = "Crysmann, Berthold  and
      Packard, Woodley",
    booktitle = "Proceedings of {COLING} 2012",
    month = dec,
    year = "2012",
    address = "Mumbai, India",
    publisher = "The COLING 2012 Organizing Committee",
    url = "https://www.aclweb.org/anthology/C12-1043",
    pages = "695--710"}

Last update: 2021-06-21 by Alexandre Rademaker [[edit](https://github.com/delph-in/docs/wiki/AceFaq/_edit)]{% endraw %}