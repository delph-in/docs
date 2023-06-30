{% raw %}The following is a step-by-step instruction to do INDRA treebanking:

1\. Make a testsuite

General guidelines and formatting:
<http://compling.hss.ntu.edu.sg/courses/hg7021/testsuites.html>

2\. The testsuite should be placed in \~/ind/tsdb/skeletons

3\. Add testsuite information in \~/ind/tsdb/skeletons/index.lisp

At the end of index.lisp: ((:path . "nameoftestsuite") (:content .
"explanation"))

4\. Make a shortcut of ind folder in \~/logon/ntu

5\. Make a shortcut of skeletons folder in
\~/logon/lingo/lkb/src/tsdb/skeletons

Rename that folder into ind

6\. Make sure that the paths for ind skeletons etc. are in these files:

- \~/logon/bin/answer
- \~/logon/dot.tsdbrc
- \~/logon/parse

7\. Run this command in logon$

    ~/logon$ ./parse --binary --ind --protocol 2 --best 1 --limit 0 --count 8 mrs

- 8 is the number of CPU. It can be checked in System Monitor.
- mrs is the name of testsuite folder.

8\. Run \[incr tsdb()\]

- Database: Home/logon/lingo/lkb/src/tsdb/home/ind
- Skeleton: Home/logon/lingo/lkb/src/tsdb/skeletons/ind
  
  See [GeFaqTsdbRc](https://delph-in.github.io/docs/tools/GeFaqTsdbRc) to make changes to the default
Database and Skeleton paths

9\. Activate external treebanking tool

Trees &gt; Switches &gt; External Treebanking Tool

10\. To automatically update:

Compare &gt; Source Database and choose a previously annotated file

then

Trees &gt; Update : Automatic Update

11\. To annotate:

Trees &gt; Annotate

The profile will be saved in \~/logon/lingo/lkb/src/tsdb/home/ind/

# Treebanking with ACE

Based on [CapitolHillTreebank](https://delph-in.github.io/docs/erg/CapitolHillTreebank)

1\. Compile the grammar

    ~/grammar/ind$ ace -g ace/config.tdl -G ind.dat

Check by parsing sentences

    ~/grammar/ind$ ace -g ind.dat -l

2\. Step-by-step command line to FFTB

\(1\)

    ~/grammar/ind$ mkprof -s tsdb/skeletons/(name of testsuite) /tmp/(name of testsuite)-demo

\(2\)

without YY mode (for unknown word handling):

    ~/grammar/ind$ art -f -a 'ace --disable-generalization -g ind.dat -O' /tmp/(name of testsuite)-demo/

with YY mode (for unknown word handling):

    ~/grammar/ind$ art -f -Ya './yy.sh | ace --disable-generalization -g ind.dat -O -y' /tmp/(name of testsuite)-demo/

\~/grammar/ind$ vi /tmp/(name of testsuite)-demo/edge

\(3\)

    ~/grammar/ind$ fftb -g ind.dat --browser --webdir=$LOGONROOT/lingo/answer/fftb /tmp/(name of testsuite)-demo/

Save the result to the gold folder and update

    ~/grammar/ind$ fftb -g ind.dat /tmp/(name of testsuite)-demo/ --browser --gold tsdb/gold/(name of testsuite)

# Feature Forest-based Maximum Entropy Model Trainer

1\. Download fftrain-0.9.25-linux-x86.tar.gz from
[http://sweaglesw.org/linguistics/](/Woodley%27s%20Website)

2\. Extract and put the folder fftrain-0.9.25 into any folder

3\. Command lines (e.g. mrs gold profile), choose a name e.g. mrs-ff:

    ~/grammar/ind$ mkprof -s tsdb/gold/mrs mrs-ff
    ~/grammar/ind$ art -a "ace -g ind.dat -O" -f mrs-ff
    ~/grammar/ind$ FFGRANDPARENT=0 ~/tools/fftrain-0.9.25/ffmaster 1 mrs-gp0.mem &
    ~/grammar/ind$ FFGRANDPARENT=0 ~/tools/fftrain-0.9.25/ffworker ind.dat mrs-ff tsdb/gold/mrs localhost

Try parsing a sentence:

    ~/grammar/ind$ echo "Kucing mengejar anjing." | ace -g ind.dat -1Tf --maxent=mrs-gp0.mem

or

    ~/grammar/ind$ ace -g ind.dat -1Tf --maxent=mrs-gp0.mem -l

# Make a new profile based on the Maximum Entropy Model Trainer

    ~/grammar/ind$ mkprof -s tsdb/skeletons/mrs /tmp/mrs-demo
    ~/grammar/ind$ art -a 'ace -g ind.dat --maxent=mrs-gp0.mem' /tmp/mrs-demo/
    ~/grammar/ind$ ~/tools/fftrain-0.9.25/mrs-scorer-linux-x86.static ~/grammar/ind/tsdb/gold/mrs /tmp/mrs-demo

Last update: 2018-10-10 by DavidMoeljadi [[edit](https://github.com/delph-in/docs/wiki/IndraTreebanking/_edit)]{% endraw %}