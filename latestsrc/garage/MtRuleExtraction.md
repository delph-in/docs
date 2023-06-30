{% raw %}# Tool for automatic extraction of transfer rules from parallel corpora

Contents

1. [Tool for automatic extraction of transfer rules from parallel
corpora](https://delph-in.github.io/docs/garage/MtRuleExtraction#Tool_for_automatic_extraction_of_transfer_rules_from_parallel_corpora)
   1. [Preliminaries](https://delph-in.github.io/docs/garage/MtRuleExtraction#Preliminaries)
   2. [Use the tool](https://delph-in.github.io/docs/garage/MtRuleExtraction#Use_the_tool)
   3. [Adapting the tool to another language
pair](https://delph-in.github.io/docs/garage/MtRuleExtraction#Adapting_the_tool_to_another_language_pair)

This page presents a tool for extracting transfer rules from parallel
corpora. The general idea is to

- parse a sentence aligned corpus with the parsing grammar and the
generating grammar of an MT system and create a parallel corpus of
MRSs
- use statistical phrase aligners (MOSES and Anymalign) to produce
phrase tables of predicates
- check alignments against templates and write semantic transfer rules

The tool is currently used to extract rules for the [Jaen](https://delph-in.github.io/docs/garage/MtJaen) MT
system. It is located in the directory
$LOGONROOT/uio/tm/jaen/extr-rules/.

## Preliminaries

You need to install statistical phrase aligners (MOSES and Anymalign).
In the procedure described below, we will only use Anymailgn, which is
very easy to install and execute.

Install Anymalign in the extr-rules directory:

    cd $LOGONROOT/uio/tm/jaen/extr-rules/
    wget http://perso.limsi.fr/Individu/alardill/anymalign/latest/anymalign2.5.zip
    unzip anymalign2.5.zip

If you need to part-of-speech tag Japanese text, you may need to install
[MeCab](/MeCab):

    sudo apt-get install python-yaml
    sudo apt-get install mecab-ipadic-utf8 python-mecab

## Use the tool

The tool comes with two tiny parallel corpora to test the system
(located in the directory corpora).

The script extr-rule.bash executes all the commands needed to extract
Japanese English semantic transfer rules from a parallel corpus. In
order to extract rules from the smallest test corpus, give the following
command:

    bash extr-rule.bash corpora/mini.ja corpora/mini.en mini jaen

The different commands invoked by extr-rule.bash are listed below.
During development of new templates, only the last command needs to be
repeated.

1. Part-of-speech tag the Japanese corpus:
   
        python jaen/ja2yy.py corpora/mini.ja > corpora/mini.ja.pos
2. Divide the corpus into '$n' profiles
   
        n=$(python divide-corpus.py 1500 mini corpora/mini.ja.pos corpora/mini.en jaen/)
3. Batch parsing '$n' Japanese profiles with Jacy:
   
        i="0"
        while [ $i -lt $n ]
        do
            i=$[$i+1]
            mkdir -p jaen/mini-profiles/mini${i}/source/
            cheap -comment-passthrough -mrs -nsolutions=1 -results=1 -packing=15 -timeout=10 -yy -default-les -tsdbdum=jaen/mini-profiles/mini${i}/source -inputfile=jaen/mini-profiles/mini${i}/bitext/original ~/logon/dfki/jacy/japanese &> jaen/mini-profiles/mini${i}/source/log
        done 
4. Batch parsing '$n' English profiles with the ERG:
   
        i="0"
        while [ $i -lt $n ]
        do
            i=$[$i+1]
            mkdir -p jaen/mini-profiles/mini${i}/target/
            cheap -repp -tagger -default-les=all -cm -packing -mrs -nsolutions=1 -results=1 -packing=15 -timeout=10 -inputfile=jaen/mini-profiles/mini${i}/bitext/object -tsdbdump jaen/mini-profiles/mini${i}/target  ~/logon/lingo/erg/english.grm &> jaen/mini-profiles/mini${i}/target/log
        done
5. Creating a parallel corpus of MRSs from 'n' parsed profiles:
   
   - indicating valency of verbs with suffixes to the relations
   - marking nominalized verb relations with an 'nmz\_' prefix
   - marking proper name predicates with an 'nmd\_' prefix
   
   <!-- -->

   
        python profiles2mrsparcorp.py jaen/ mini n
6. Using the Anymalign phrase aligner to produce a phrase table from
the parallel corpus of MRSs. The program runs until it is stopped
with Ctrl-C
   
        python anymalign2.5/anymalign.py jaen/mini_mrs_source.txt jaen/mini_mrs_target.txt > jaen/mini-anymalign.mrs
7. Choosing the most probable phrase alignments. This script can take
both the output of Anymalign and the output of MOSES as input.
   
        python phrtab-thin.py jaen/mini
8. Reading the existing transfer rule files
   
        python hand-rules.py $LOGONROOT jaen/ >  jaen/hand-rules
9. Representing the lexicons of the parsing grammar and generating
grammar as tables
   
        python lex.py ${LOGONROOT}/lingo/erg/lexicon.tdl > jaen/target-lex.tab
        python lex.py ${LOGONROOT}/dfki/jacy/lexicon.tdl > jaen/source-lex.tab
10. Reading the processed phrase table and matching with templates. If
your source language is not Japanese you need to change the
src\_prefix in the top of the file to an empty string. The script
calls a function in 'jaen/templates.py' with language specific
templates. You may need to modify the templates in this file.
    
         python thin2mtr.py $LOGONROOT mini jaen/

The resulting transfer rule files 'mini-single.mtr' and 'mini-mwe.mtr'
will be printed in the 'jaen' directory.

## Adapting the tool to another language pair

You will need a parsing grammar, a generating grammar, and a sentence
aligned parallel corpus.

- Create a directory for your language pair. E.g. copy the 'jaen'
directory, and change 'jaen' in all the commands to your new
directory name.
- Give your parallel corpus a name and change 'mini' in all the
commands with your corpus name.
- If you are not using Jacy, skip step 1.
- Give the right commands in order to make your grammars produce MRSs
in step 3 and 4.
- Make a new list of files with hand-written transfer rules, that you
do not want to duplicate. The existing list of files is given in
'mtr-file-paths' in the 'jaen' directory. (The paths listed are
relative to the $LOGONROOT directory.)
- Represent the lexicons of your grammars as tables by giving the
right paths in step 9.
- Modify the file 'templates.py' in the language pair directory.

Last update: 2012-08-29 by PetterHaugereid [[edit](https://github.com/delph-in/docs/wiki/MtRuleExtraction/_edit)]{% endraw %}