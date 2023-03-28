{% raw %}# Required Components

In order to run Zhong with the YY-mode inputs, you have to install and
set up the Stanford tools and NLTK. See
[ZhongPreprocessing](https://delph-in.github.io/docs/grammars/ZhongPreprocessing).

Note that your ACE version must be at least
[0.9.19patch1](http://sweaglesw.org/linguistics/ace/download/ace-0.9.19patch1-x86-64.tar.gz)
(release 02 Jan 2015) or later, or you may get segfaults with ACE's yy
mode.

# Parsing in YY mode

If you would like to parse raw sentences (i.e. unsegmented sentences),
you can use the folloing command. Before that, you have to compile the
data file (e.g. hans.dat). Note that you have to add the -y option.

    $ ./utils/yy.sh path/of/sentences | ace -g hans.dat -y

For example, "17 只猫去了首尔。" is parsed as follows.

    $ ./utils/yy.sh ~/Desktop/sample.txt | ace -g hans.dat -y1Tf
    SENT: (yy mode)
    [ LTOP: h0
    INDEX: e2 [ e SF: prop E.ASPECT: perfective ]
    RELS: < [ card_rel<0:2> LBL: h4 CARG: "17" ARG0: x6 [ x SPECI: bool SF: prop COG-ST: cog-st PNG.PERNUM: pernum PNG.GENDER: gender PNG.ANIMACY: animacy ] ARG1: x3 [ x SPECI: + SF: prop COG-ST: cog-st PNG.PERNUM: pernum PNG.GENDER: gender PNG.ANIMACY: animacy ] ]
     [ 只_x_rel<2:1> LBL: h4 ARG0: i7 [ i SF: prop ] ARG1: x3 ]
     [ "_猫_n_rel"<3:1> LBL: h4 ARG0: x3 ]
     [ "exist_q_rel"<-1:-1> LBL: h8 ARG0: x3 RSTR: h9 BODY: h10 ]
     [ "_去_v_2_rel"<4:1> LBL: h1 ARG0: e2 ARG1: x3 ARG2: x11 [ x SPECI: bool SF: prop COG-ST: cog-st PNG.PERNUM: pernum PNG.GENDER: gender PNG.ANIMACY: animacy ] ]
     [ named_rel<6:2> LBL: h12 CARG: "首尔" ARG0: x11 ]
     [ "proper_q_rel"<-1:-1> LBL: h14 ARG0: x11 RSTR: h15 BODY: h16 ] >
    HCONS: < h0 qeq h1 h9 qeq h4 h15 qeq h12 >
    ICONS: < > ]
    NOTE: 1 readings, added 639 / 447 edges to chart (63 fully instantiated, 62 actives used, 60 passives used)     RAM: 4375k

# Making a Profile in the YY mode

## Installing ART

<http://sweaglesw.org/linguistics/libtsdb/art>

After installing ART (and libtsdb
<http://sweaglesw.org/linguistics/libtsdb/index.html>), you want to
export the path of the folder where art exists in your \~/.bashrc. For
example,

    export ARTROOT=/home/sanghoun/tools/art
    export PATH=$PATH:$ARTROOT

## Segmentation

Note that the sentences in \[item\] are assumed to be segmented. The
segmetation can be carried out using the following command.

    $STANFORD_SEGMENTER_PATH/segment.sh ctb PATH/OF/INPUT_FILE UTF-8 0 > PATH/OF/OUTPUT_FILE

You can create the basic profile using the output of the command above.

## Running ART

First, you have to create a profile.

    $ mkprof -s /PATH/TO/SKELETON /PATH/TO/PROFILE_TO_WRITE

Run the following command.

    $ art -Ya "python utils/cmn2yy.py | ace -g hans.dat -y" /PATH/TO/PROFILE_TO_WRITE

Here is an example.

    $ mkprof -s tsdb/skeletons/chart-mapping/ tsdb/gold/chart-mapping/
    9746  bytes     relations
    167   bytes     item
    $ art -Ya "python utils/cmn2yy.py | ace -g hans.dat -y" tsdb/gold/chart-mapping/
    reading results for                1    1 results
    reading results for                2    1 results

## Trouble Shooting

If you are using the latest version of NLTK, cmn2yy.py may not work,
because the data structure was slightly changed. If so, edit the
following line (add *\[0\]* after *result*).

    for w in result:
       ...

Last update: 2015-04-22 by SanghounSong [[edit](https://github.com/delph-in/docs/wiki/ZhongYYMode/_edit)]{% endraw %}