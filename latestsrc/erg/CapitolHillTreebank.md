{% raw %}**Mostly subscribed by Joshua Crowgey! I just created this page.**

# Discussion

Francis: Treebanking is important but only Dan does it

Dan: Montse used to do it too

Francis: ... but we need a reminder/walkthrough of how. Also, I need a
reminder of a few things. Eg: I know I want the tree that has X type in
it, so I go through the trees and I'd like to save some of my steps to
repeat them more than once. But let's start with a walkthrough:

Dan: Ok, what I will show you is how I run though the steps of grammar
modification/updating a treebank, inspecting the results and repeating
the loop. My procedures has roots in an older machinery with a
lisp-based interface, I am still partially using that, but a person in
the room doesn't use that. ... I use this $LOGONROOT/parse script, but
there are other ways to do this first part. Of course I also need to
know which set of profiles I want to use:

\[ONSCREEN\]

danf@baseque3:\~$ $LOGONROOT/parse --terg/ace --protocol 2 --best 1
--count 4 hike

\[/ONSCREEN\]

I will talk through these arguments:

First argument is which grammar and which engine you want to use. This
is in the dot.tsdbrc file. (--terg)

Other arguments are --protocol (which for me) means "store the edge
relations", I want to store the packed forest, what else does that do,
woodley, (Woodley: store the forest). Stefan used to suggest --best 0
but that doesn't make sense for me, I prefer to "unpack 1 tree". --count
4 is how many cpus I can use. Last argument is profile (hike). So I call
that...

\[ONSCREEN\] LKB loads grammar ... \[/ONSCREEN\]

\[Dan talks about how this shows how he still uses LKB under the hood\]

Some discussion about how this isn't really necessary...

Some discussion about how this relates to the loading of malrules...

... so the engine has now parsed this and has stored it in a directory,
\`erg/trunk/hike/DATE/ace'

So I can now go back to the treebanking tool, answer (or fftb, which
answer invokes)

\[People complain of the long command on the screen\]

Dan: I said I would show people how I do this, not ...

Woodley: this thing called answer is a 20 line script written by Oe in
order to hide people from the truth ... I've clarified what I wanted to
clarify

Dan: I have copy and paste function and the history program in my shell
so I have a way to invoke that long command. I do so, it opens a
webbrowser \[pointing to 127.0.0.1:50768/private/session?0\] ...

Francis: We see an exuberant use of color ...

Dan: green is great, red is disappointing, I get a lot of browns, which
means I have added some ambiguity. The yellow means that I have stuff I
haven't really added. Down here for example, I see a brown. I can say
"show me that item" \[he clicks on it\], and I see that it's actually
spurious...

Glenn: asks a question about this particular example, whether this is a
case where the ERG blocks on semantics

Woodley: What is an expletive index

Dan: it's an 'it' or 'there',

Woodley: how are those indices? I'm being a bit snarkey, there is not
semantic difference because they have no semantics

Francis: ---moving on!---

Dan: ok, so I pick the one I wanted ..., now I can see the tree that I
want by clicking 'accept', and I am now taken to the next one which has
a difference, here we see an example where I have recently conceded that
'on' can be an intransitive prep. Here I have some ambiguity then, as in
"Saturday, he went"\~"On, he went". I had to retouch a lot of trees
because of this, but there are a few , not in the 17,000 that I had to
retouch, where I wanted this new analysis ... anyway, life.

Glenn: for the people who don't do treebanking, this is what they're
scared of

Dan: I knew what I was in for. \[Gives another example of something
similar where he changed his mind about the copula be and a comma\]
---:So if we're still actively developing the grammar, we probably
shouldn't be treebanking.

Dan: No, that's the wrong thing to learn, I made a conscious decision to
do this because I had a spare month, mostly, things aren't like this.
For example, in this 'hike' corpus, I didn't actually have a lot of
changes. I think the lesson here is to do treebanking all the time so
that when you make a change, you have a small amount of things to change
each time.d

Francis: You'll note that this tool uses your previous work so that as
long as you're continuously treebanking, you'll just have a little bit
of work to do each time you do it.

Luis: Treebanking may force you to deal with amigiuity early on, you
waited a long time to deal with this ambiguity, would you have preferred
to have done this earlier in the development of this project? (question
continues ...)

Dan: this particular example was on which was relatively rare, so I
waited until I was ready to deal with it.

Luis: If you know you have to deal with it eventually, why don't you do
it earlier

Woodley: It's not that he has to redo anything

Luis: but that descriminant...

Dan: ...didn't exist before

Luis: fair enough

Francis: so Dan fixed more important problems first...

Luis: I see now, that problem didn't exist before, now he's decided to
work on it

Glenn: when you were in your blissful period, is there a sense of a
generalization which is true now...because you're ... when you're adding
a constraint, ...

Dan: the types were all there, I had them, I just added "on" to a new
class which was already there

Dan: we probably wasted enough time on this, let me show you something
else...Here we see that I can highlight a part of a substring and I can
see what options I have for, which rules can span this string. I can
select one and it will try to build a tree using that rule for this
string, and try to find a spanning parse for the rest. This is a way to
force the machine to use a particular rule.

Glenn: where's the part where you're certifying your choices?

Dan: I choose "accept" here, it's hard to see because of my font sizes,
but this is where I click.

Dan: here is one more instance, "don't be tricked by that" is "by" the
passive by or the locative by? I know that it's the passive by in this
case, so I can click here and . There is some efficiency stuff which
actually creates some false potential analyses here, so you can actually
turn it off if your grammar is small enough that you don't hit resource
limits when parsing with it off.

Dan: ok, and now I'm back at the overview, everthing is green or yellow,
and I'm ready to exit.

Woodley: the command line that you had people copy, has some
--browser=..., what that actually is is a shell script from Oe which
does some magic to deal with LD\_LIBRARY\_PATH

Francis: for example, someone without logon would have a hard time
finding these scripts

\[ Woodley takes screen to show how to replicate these command without
having logon \] Woodley: this is OSX, there is no logon for OSX, the
libtsdb you can download from my website,

\[he uses ./mkprof -s and ./art -f -a \]

Two commands, didn't require loading the lkb.

The fftb software can be downloaded via svn and compiled, there may also
be a binary, it can also be pulled out of the logon tree.

Luis: so there's nothing stopping us from running a server and having
people working on this in other location.

Woodley: nothing stopping you, no.

# Command lines

## Key Commands

    ./mkprof -s ../erg-1214/tsdb/gold/mrs /tmp/mrs-demo
    ./art -f -a '../ace/ace --disable-generalization -g ../ace/erg-1214.dat -O' /tmp/mrs-demo/
    ./fftb -g ../ace/erg-1214.dat /tmp/mrs-demo/ --browser --gold ../erg-1214/tsdb/gold/mrs
    ./ace -g erg-1214.dat -1f --rooted-derivations
    ./ace -g erg-1214.dat -1f --rooted-derivations --udx=leaf
    ./ace -g erg-1214.dat -1f --rooted-derivations --udx=all
    ./ace -g erg-1214.dat -1Tf --pcfg=all-treebanks-gp0.pcfg

## Test Sentences (ungrammatical)

    $ ./ace -g erg-1214.dat -l --pcfg=all-treebanks-gp0.pcfg
            I usually small talk with my friend and classmate.
            I am want to see you.
            If anyone help customer, it is a little easier.

## A Sample Treebanking

    libtsdb $ ./mkprof
    usage: ./mkprof [ OPTIONS ] destination
      -v   show version
      -h   show usage information
    mkprof -s source  destination
       creates the 'destination' profile by copying
       the 'item' and 'relations' files from the source
       profile/skeleton (as well as item-set and fold,
       if present).  empty files are created for all
       other defined relations.
    mkprof -r relations_file  [ -i input.txt ]  destination
       creates the 'destination' profile by copying
       the 'relations' file, populates an 'item' file
       with a record for each line in 'input.txt' if
       specified, or each line of <stdin>.  empty files
       are created for all other defined relations.
    libtsdb $ ./mkprof -s ../erg-1214
    erg-1214/        erg-1214-bridge/ 
    libtsdb $ ./mkprof -s ../erg-1214
    erg-1214/        erg-1214-bridge/ 
    libtsdb $ ./mkprof -s ../erg-1214/tsdb/gold/mrs /tmp/mrs-demo
    9746  bytes     relations
    2303  bytes     item.gz
    433   bytes     item-set.gz
    0     bytes     fold
    0     bytes     analysis
    0     bytes     phenomenon
    0     bytes     parameter
    0     bytes     set
    0     bytes     item-phenomenon
    0     bytes     run
    0     bytes     parse
    0     bytes     result
    0     bytes     rule
    0     bytes     output
    0     bytes     edge
    0     bytes     tree
    0     bytes     decision
    0     bytes     preference
    0     bytes     update
    0     bytes     score
    libtsdb $ ./art -f -a '../ace/ace -g ../ace/erg-1214.dat -O' /tmp/mrs-demo/
    reading results for               11    0 results
    reading results for               21    0 results
    reading results for               31    0 results
    reading results for               41    0 results
    reading results for               51    0 results
    reading results for               61    0 results
    reading results for               71    0 results
    reading results for               81    0 results
    reading results for               91    0 results
    reading results for              101    0 results
    reading results for              111    0 results
    reading results for              121    0 results
    reading results for              131    0 results
    reading results for              141    0 results
    reading results for              151    0 results
    reading results for              161    0 results
    reading results for              171    0 results
    reading results for              181    0 results
    reading results for              191    0 results
    reading results for              201    0 results
    reading results for              211    0 results
    reading results for              221    0 results
    reading results for              231    0 results
    reading results for              241    0 results
    reading results for              251    0 results
    reading results for              261    0 results
    reading results for              271    0 results
    reading results for              281    0 results
    reading results for              291    0 results
    reading results for              301    0 results
    reading results for              311    0 results
    reading results for              321    0 results
    reading results for              331    0 results
    reading results for              341    0 results
    reading results for              351    0 results
    reading results for              361    0 results
    reading results for              371    0 results
    reading results for              381    0 results
    reading results for              391    0 results
    reading results for              401    0 results
    reading results for              411    0 results
    reading results for              421    0 results
    reading results for              431    0 results
    reading results for              441    0 results
    reading results for              451    0 results
    reading results for              461    0 results
    reading results for              471    0 results
    reading results for              481    0 results
    reading results for              491    0 results
    reading results for              501    0 results
    reading results for              511    0 results
    reading results for              521    0 results
    reading results for              531    0 results
    reading results for              541    0 results
    reading results for              551    0 results
    reading results for              561    0 results
    reading results for              571    0 results
    reading results for              581    0 results
    reading results for              591    0 results
    reading results for              601    0 results
    reading results for              611    0 results
    reading results for              621    0 results
    reading results for              631    0 results
    reading results for              641    0 results
    reading results for              651    0 results
    reading results for              661    0 results
    reading results for              671    0 results
    reading results for              681    0 results
    reading results for              691    0 results
    reading results for              701    0 results
    reading results for              711    0 results
    reading results for              721    0 results
    reading results for              731    0 results
    reading results for              741    0 results
    reading results for              751    0 results
    reading results for              761    0 results
    reading results for              771    0 results
    reading results for              781    0 results
    reading results for              791    0 results
    reading results for              801    0 results
    reading results for              811    0 results
    reading results for              821    0 results
    reading results for              831    0 results
    reading results for              841    0 results
    reading results for              851    0 results
    reading results for              861    0 results
    reading results for              871    0 results
    reading results for              881    0 results
    reading results for              891    0 results
    reading results for              901    0 results
    reading results for              911    0 results
    reading results for              921    0 results
    reading results for              931    0 results
    reading results for              941    0 results
    reading results for              951    0 results
    reading results for              961    0 results
    reading results for              971    0 results
    reading results for              981    0 results
    reading results for              991    0 results
    reading results for             1001    0 results
    reading results for             1011    0 results
    reading results for             1021    0 results
    reading results for             1031    0 results
    reading results for             1041    0 results
    reading results for             1051    0 results
    reading results for             1061    0 results
    reading results for             1071    0 results
    libtsdb $ vi /tmp/mrs-demo/edge 
    libtsdb $ # ./mkprof -s ../erg-1214/tsdb/gold/mrs /tmp/mrs-demo
    libtsdb $ # ./art -f -a '../ace/ace -g ../ace/erg-1214.dat -O' /tmp/mrs-demo/
    libtsdb $ ./art -f -a '../ace/ace -g ../ace/erg-1214.dat -O' /tmp/mrs-demo/
    libtsdb $ cd ../fftb
    fftb $ cd ../ace
    ace $ ./ace -g erg-1214.dat -1f --rooted-derivations
    Dogs smile at cats.
    SENT: Dogs smile at cats.
    [ LTOP: h0
    INDEX: e2 [ e SF: prop TENSE: pres MOOD: indicative PROG: - PERF: - ]
    RELS: < [ udef_q<0:4> LBL: h4 ARG0: x3 [ x PERS: 3 NUM: pl IND: + ] RSTR: h5 BODY: h6 ]
     [ _dog_n_1<0:4> LBL: h7 ARG0: x3 ]
     [ _smile_v_at<5:10> LBL: h1 ARG0: e2 ARG1: x3 ARG2: x8 [ x PERS: 3 NUM: pl IND: + ] ]
     [ udef_q<14:19> LBL: h9 ARG0: x8 RSTR: h10 BODY: h11 ]
     [ _cat_n_1<14:19> LBL: h12 ARG0: x8 ] >
    HCONS: < h0 qeq h1 h5 qeq h7 h10 qeq h12 > ] ;  (root_strict (1099 sb-hd_mc_c 4.272374 0 4 (1092 hdn_bnp_c 0.143203 0 1 (1091 n_pl_olr 1.086701 0 1 (82 dog_n1 0.000000 0 1 ("dogs" 58 "token [ +FORM \"dogs\" +FROM \"0\" +TO \"4\" +ID *diff-list* [ LIST *list* LAST *list* ] +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +TAG \"NNS\" +PRB \"1.0\" ] ] +CLASS alphabetic [ +INITIAL + +CASE capitalized+lower ] +TRAIT token_trait [ +UW - +IT italics +LB bracket_null +RB bracket_null +HD token_head [ +LL ctype [ -CTYPE- string ] +TG string +TI \"0\" ] ] +PRED predsort +CARG \"Dogs\" +TICK bool ]")))) (1098 hd-cmp_u_c 3.015372 1 4 (1093 v_n3s-bse_ilr 0.571051 1 2 (63 smile_at_v1 0.000000 1 2 ("smile" 50 "token [ +FORM \"smile\" +FROM \"5\" +TO \"10\" +ID *diff-list* [ LIST *list* LAST *list* ] +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +TAG \"NN\" +PRB \"1.0\" ] ] +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT token_trait [ +UW - +IT italics +LB bracket_null +RB bracket_null +HD token_head [ +LL ctype [ -CTYPE- string ] +TG string +TI \"5\" ] ] +PRED predsort +CARG \"smile\" +TICK bool ]"))) (1097 hd-cmp_u_c 1.306115 2 4 (67 at_prtcl 0.430778 2 3 ("at" 52 "token [ +FORM \"at\" +FROM \"11\" +TO \"13\" +ID *diff-list* [ LIST *list* LAST *list* ] +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +TAG \"IN\" +PRB \"1.0\" ] ] +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT token_trait [ +UW - +IT italics +LB bracket_null +RB bracket_null +HD token_head [ +LL ctype [ -CTYPE- string ] +TG string +TI \"11\" ] ] +PRED predsort +CARG \"at\" +TICK bool ]")) (1096 hdn_bnp_c 0.242672 3 4 (1095 w_period_plr 0.614374 3 4 (1094 n_pl_olr 0.997276 3 4 (69 cat_n1 0.000000 3 4 ("cats." 54 "token [ +FORM \"cats.\" +FROM \"14\" +TO \"19\" +ID *diff-list* [ LIST *list* LAST *list* ] +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +TAG \"NNS\" +PRB \"1.0\" ] ] +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT token_trait [ +UW - +IT italics +LB bracket_null +RB bracket_null +HD token_head [ +LL ctype [ -CTYPE- string ] +TG string +TI \"14\" ] ] +PRED predsort +CARG \"cats\" +TICK bool ]")))))))))
    NOTE: 1 readings, added 900 / 189 edges to chart (69 fully instantiated, 85 actives used, 50 passives used)     RAM: 1788k
    
    
    NOTE: parsed 1 / 1 sentences, avg 1788k, time 0.14727s
    ace $ ./ace -g erg-1214.dat -1f --rooted-derivations --udx=leaf
    The dog slept.
    SENT: The dog slept.
    [ LTOP: h0
    INDEX: e2 [ e SF: prop TENSE: past MOOD: indicative PROG: - PERF: - ]
    RELS: < [ _the_q<0:3> LBL: h4 ARG0: x3 [ x PERS: 3 NUM: sg IND: + ] RSTR: h5 BODY: h6 ]
     [ _dog_n_1<4:7> LBL: h7 ARG0: x3 ]
     [ _sleep_v_1<8:14> LBL: h1 ARG0: e2 ARG1: x3 ] >
    HCONS: < h0 qeq h1 h5 qeq h7 > ] ;  (root_strict (721 sb-hd_mc_c 0.818283 0 3 (718 sp-hd_n_c 0.997967 0 2 (66 the_1@d_-_the_le -0.486623 0 1 ("the" 46 "token [ +FORM \"the\" +FROM \"0\" +TO \"3\" +ID *diff-list* [ LIST *list* LAST *list* ] +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +TAG \"DT\" +PRB \"1.0\" ] ] +CLASS alphabetic [ +INITIAL + +CASE capitalized+lower ] +TRAIT token_trait [ +UW - +IT italics +LB bracket_null +RB bracket_null +HD token_head [ +LL ctype [ -CTYPE- string ] +TG string +TI \"0\" ] ] +PRED predsort +CARG \"The\" +TICK bool ]")) (717 n_sg_ilr 1.169754 1 2 (50 dog_n1@n_-_c_le 0.031966 1 2 ("dog" 41 "token [ +FORM \"dog\" +FROM \"4\" +TO \"7\" +ID *diff-list* [ LIST *list* LAST *list* ] +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +TAG \"NN\" +PRB \"1.0\" ] ] +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT token_trait [ +UW - +IT italics +LB bracket_null +RB bracket_null +HD token_head [ +LL ctype [ -CTYPE- string ] +TG string +TI \"4\" ] ] +PRED predsort +CARG \"dog\" +TICK bool ]")))) (720 w_period_plr -0.219947 2 3 (719 v_pst_olr -0.106307 2 3 (54 sleep_v1@v_-_le 0.000000 2 3 ("slept." 43 "token [ +FORM \"slept.\" +FROM \"8\" +TO \"14\" +ID *diff-list* [ LIST *list* LAST *list* ] +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +TAG \"VBD\" +PRB \"1.0\" ] ] +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT token_trait [ +UW - +IT italics +LB bracket_null +RB bracket_null +HD token_head [ +LL ctype [ -CTYPE- string ] +TG string +TI \"8\" ] ] +PRED predsort +CARG \"slept\" +TICK bool ]"))))))
    NOTE: 1 readings, added 542 / 46 edges to chart (19 fully instantiated, 30 actives used, 10 passives used)      RAM: 1068k
    
    
    NOTE: parsed 1 / 1 sentences, avg 1068k, time 0.04985s
    ace $ ./ace -g erg-1214.dat -1f --rooted-derivations --udx=all
    The dog slept.
    SENT: The dog slept.
    [ LTOP: h0
    INDEX: e2 [ e SF: prop TENSE: past MOOD: indicative PROG: - PERF: - ]
    RELS: < [ _the_q<0:3> LBL: h4 ARG0: x3 [ x PERS: 3 NUM: sg IND: + ] RSTR: h5 BODY: h6 ]
     [ _dog_n_1<4:7> LBL: h7 ARG0: x3 ]
     [ _sleep_v_1<8:14> LBL: h1 ARG0: e2 ARG1: x3 ] >
    HCONS: < h0 qeq h1 h5 qeq h7 > ] ;  (root_strict (721 sb-hd_mc_c@subjh_mc_rule 0.818283 0 3 (718 sp-hd_n_c@hspec_rule 0.997967 0 2 (66 the_1@d_-_the_le -0.486623 0 1 ("the" 46 "token [ +FORM \"the\" +FROM \"0\" +TO \"3\" +ID *diff-list* [ LIST *list* LAST *list* ] +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +TAG \"DT\" +PRB \"1.0\" ] ] +CLASS alphabetic [ +INITIAL + +CASE capitalized+lower ] +TRAIT token_trait [ +UW - +IT italics +LB bracket_null +RB bracket_null +HD token_head [ +LL ctype [ -CTYPE- string ] +TG string +TI \"0\" ] ] +PRED predsort +CARG \"The\" +TICK bool ]")) (717 n_sg_ilr@n_sg_inflrule 1.169754 1 2 (50 dog_n1@n_-_c_le 0.031966 1 2 ("dog" 41 "token [ +FORM \"dog\" +FROM \"4\" +TO \"7\" +ID *diff-list* [ LIST *list* LAST *list* ] +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +TAG \"NN\" +PRB \"1.0\" ] ] +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT token_trait [ +UW - +IT italics +LB bracket_null +RB bracket_null +HD token_head [ +LL ctype [ -CTYPE- string ] +TG string +TI \"4\" ] ] +PRED predsort +CARG \"dog\" +TICK bool ]")))) (720 w_period_plr@punctuation_period_rule -0.219947 2 3 (719 v_pst_olr@v_pst_inflrule -0.106307 2 3 (54 sleep_v1@v_-_le 0.000000 2 3 ("slept." 43 "token [ +FORM \"slept.\" +FROM \"8\" +TO \"14\" +ID *diff-list* [ LIST *list* LAST *list* ] +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +TAG \"VBD\" +PRB \"1.0\" ] ] +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT token_trait [ +UW - +IT italics +LB bracket_null +RB bracket_null +HD token_head [ +LL ctype [ -CTYPE- string ] +TG string +TI \"8\" ] ] +PRED predsort +CARG \"slept\" +TICK bool ]"))))))
    NOTE: 1 readings, added 542 / 46 edges to chart (19 fully instantiated, 30 actives used, 10 passives used)      RAM: 1068k
    
    
    NOTE: parsed 1 / 1 sentences, avg 1068k, time 0.02070s
    ace $ cd ../fftb
    fftb $ ./fftb 
    usage:  ./fftb -g grammar.dat [--gold profile_path [--auto]] [--browser [firefox]] [--webdir web_path] profile_path
    fftb $ ./fftb -g ../ace/erg-1214.dat /tmp/mrs-demo/
    grammar image: ../ace/erg-1214.dat
    listening on http://127.0.0.1:9080/private/
    should GET    /private/
    should GET    /favicon.ico
    should GET    /favicon.ico
    should GET    /favicon.ico
    should GET    /private/parse?profile=/&id=71
    item id 71 -> input 'Abrams bet Browne a cigarette that it rained.'
    profile parse id 71
    -> loaded stored forest
    found stored forest (25 edges connected to 1 roots).<br/>
    UCSTAT: input 25 edges, output 17 edges
    should GET    /private/session?0
    should GET    /private/assets/render.js
    should GET    /private/assets/control.js
    should POST    /session?0;1;;
    should POST    /session?0;0;;v_pst_olr@v_np-np-cp_le:=:1-2:0&_olddecs=
    constraint: v_pst_olr@v_np-np-cp_le [1-2] type 2
    should POST    /comment?0&
    writing tsdb relation 'tree' with 1 tuples
    should POST    /session?0;0;;v_pst_olr@v_np-np-cp_le:=:1-2:0&_olddecs=
    constraint: v_pst_olr@v_np-np-cp_le [1-2] type 2
    should POST    /save?0&accepted=1
    writing tsdb relation 'decision' with 1 tuples
    remaining = 1 [1 decisions used]
    date string: 03-01-2017 17:04:54
    date string: 03-01-2017 17:05:03
    writing tsdb relation 'tree' with 1 tuples
    writing tsdb relation 'result' with 1 tuples
    writing tsdb relation 'preference' with 1 tuples
    writing tsdb relation 'parse' with 107 tuples
    should GET    /private/next_unannotated?0
    old item id '71' + dir 1 = new item id '81'
    should GET    /private/parse?profile=/&id=81
    item id 81 -> input 'Abrams knew that it rained.'
    profile parse id 81
    -> loaded stored forest
    found stored forest (14 edges connected to 1 roots).<br/>
    UCSTAT: input 14 edges, output 9 edges
    should GET    /private/session?1
    should GET    /private/assets/render.js
    should GET    /private/assets/control.js
    should POST    /session?1;1;;
    ^CTIMERS (0 calls = ~ 0.0µs overhead):
    fftb $ 
    fftb $ 
    fftb $ 
    fftb $ ./fftb -g ../ace/erg-1214.dat /tmp/mrs-demo/ --browser
    grammar image: ../ace/erg-1214.dat
    listening on http://127.0.0.1:59552/private/
    should GET    /private/
    should GET    /favicon.ico
    should GET    /favicon.ico
    should GET    /favicon.ico
    should GET    /private/exit
    TIMERS (0 calls = ~ 0.0µs overhead):
    fftb $ ./fftb -g ../ace/erg-1214.dat /tmp/mrs-demo/ --browser --gold ../erg-1214/tsdb/gold/mrs
    grammar image: ../ace/erg-1214.dat
    Just one TSDB profile: /tmp/mrs-demo/
    Would update from profile: ../erg-1214/tsdb/gold/mrs
    listening on http://127.0.0.1:59559/private/
    should GET    /private/
    should GET    /favicon.ico
    should GET    /favicon.ico
    should GET    /favicon.ico
    should GET    /private/update?/
    [11]    {0 decisions}   UCSTAT: input 5 edges, output 3 edges
    {3 edges}       {1 / 1 trees active}    identical       ... saving this tree as preferred, with decisions from goldwriting tsdb relation 'decision' with 1 tuples
    writing tsdb relation 'tree' with 2 tuples
    writing tsdb relation 'result' with 2 tuples
    writing tsdb relation 'preference' with 2 tuples
    writing tsdb relation 'parse' with 107 tuples
     [ success ]
    [21]    {0 decisions}   UCSTAT: input 7 edges, output 3 edges
    {3 edges}       {1 / 1 trees active}    identical       ... saving this tree as preferred, with decisions from goldwriting tsdb relation 'decision' with 1 tuples
    writing tsdb relation 'tree' with 3 tuples
    writing tsdb relation 'result' with 3 tuples
    writing tsdb relation 'preference' with 3 tuples
    writing tsdb relation 'parse' with 107 tuples
     [ success ]
    [31]    {7 decisions}   UCSTAT: input 17 edges, output 8 edges
    {8 edges}       {1 / 2 trees active}    identical       ... saving this tree as preferred, with decisions from goldwriting tsdb relation 'decision' with 8 tuples
    writing tsdb relation 'tree' with 4 tuples
    writing tsdb relation 'result' with 4 tuples
    writing tsdb relation 'preference' with 4 tuples
    writing tsdb relation 'parse' with 107 tuples
     [ success ]
    [41]    {7 decisions}   UCSTAT: input 18 edges, output 12 edges
    {12 edges}      {1 / 3 trees active}    identical       ... saving this tree as preferred, with decisions from goldwriting tsdb relation 'decision' with 15 tuples
    writing tsdb relation 'tree' with 5 tuples
    writing tsdb relation 'result' with 5 tuples
    writing tsdb relation 'preference' with 5 tuples
    writing tsdb relation 'parse' with 107 tuples
     [ success ]
    [51]    {10 decisions}  UCSTAT: input 31 edges, output 20 edges
    {20 edges}      {1 / 3 trees active}    identical       ... saving this tree as preferred, with decisions from goldwriting tsdb relation 'decision' with 25 tuples
    writing tsdb relation 'tree' with 6 tuples
    writing tsdb relation 'result' with 6 tuples
    writing tsdb relation 'preference' with 6 tuples
    writing tsdb relation 'parse' with 107 tuples
     [ success ]
    [61]    {0 decisions}   UCSTAT: input 19 edges, output 11 edges
    {11 edges}      {1 / 1 trees active}    identical       ... saving this tree as preferred, with decisions from goldwriting tsdb relation 'decision' with 25 tuples
    writing tsdb relation 'tree' with 7 tuples
    writing tsdb relation 'result' with 7 tuples
    writing tsdb relation 'preference' with 7 tuples
    writing tsdb relation 'parse' with 107 tuples
     [ success ]
    [81]    {0 decisions}   UCSTAT: input 14 edges, output 9 edges
    {9 edges}       {1 / 1 trees active}    identical       ... saving this tree as preferred, with decisions from goldwriting tsdb relation 'decision' with 25 tuples
    writing tsdb relation 'tree' with 8 tuples
    writing tsdb relation 'result' with 8 tuples
    writing tsdb relation 'preference' with 8 tuples
    writing tsdb relation 'parse' with 107 tuples
     [ success ]
    [91]    {15 decisions}  UCSTAT: input 30 edges, output 21 edges
    {21 edges}      {1 / 4 trees active}    identical       ... saving this tree as preferred, with decisions from goldwriting tsdb relation 'decision' with 40 tuples
    writing tsdb relation 'tree' with 9 tuples
    writing tsdb relation 'result' with 9 tuples
    writing tsdb relation 'preference' with 9 tuples
    writing tsdb relation 'parse' with 107 tuples
     [ success ]
    [101]   {22 decisions}  UCSTAT: input 53 edges, output 42 edges
    {42 edges}      {1 / 14 trees active}   identical       ... saving this tree as preferred, with decisions from goldwriting tsdb relation 'decision' with 62 tuples
    writing tsdb relation 'tree' with 10 tuples
    writing tsdb relation 'result' with 10 tuples
    writing tsdb relation 'preference' with 10 tuples
    writing tsdb relation 'parse' with 107 tuples
     [ success ]
    [111]   {0 decisions}   UCSTAT: input 8 edges, output 5 edges
    {5 edges}       {1 / 1 trees active}    identical       ... saving this tree as preferred, with decisions from goldwriting tsdb relation 'decision' with 62 tuples
    writing tsdb relation 'tree' with 11 tuples
    writing tsdb relation 'result' with 11 tuples
    writing tsdb relation 'preference' with 11 tuples
    writing tsdb relation 'parse' with 107 tuples
     [ success ]
    [121]   {13 decisions}  UCSTAT: input 27 edges, output 16 edges
    {16 edges}      {1 / 2 trees active}    identical       ... saving this tree as preferred, with decisions from goldwriting tsdb relation 'decision' with 75 tuples
    writing tsdb relation 'tree' with 12 tuples
    writing tsdb relation 'result' with 12 tuples
    writing tsdb relation 'preference' with 12 tuples
    writing tsdb relation 'parse' with 107 tuples
     [ success ]
    [131]   {0 decisions}   UCSTAT: input 8 edges, output 5 edges
    {5 edges}       {1 / 1 trees active}    identical       ... saving this tree as preferred, with decisions from goldwriting tsdb relation 'decision' with 75 tuples
    writing tsdb relation 'tree' with 13 tuples
    writing tsdb relation 'result' with 13 tuples
    writing tsdb relation 'preference' with 13 tuples
    writing tsdb relation 'parse' with 107 tuples
     [ success ]
    [141]   {0 decisions}   UCSTAT: input 6 edges, output 3 edges
    {3 edges}       {1 / 1 trees active}    identical       ... saving this tree as preferred, with decisions from goldwriting tsdb relation 'decision' with 75 tuples
    writing tsdb relation 'tree' with 14 tuples
    writing tsdb relation 'result' with 14 tuples
    writing tsdb relation 'preference' with 14 tuples
    writing tsdb relation 'parse' with 107 tuples
     [ success ]
    [151]   {0 decisions}   UCSTAT: input 11 edges, output 7 edges
    {7 edges}       {1 / 1 trees active}    identical       ... saving this tree as preferred, with decisions from goldwriting tsdb relation 'decision' with 75 tuples
    writing tsdb relation 'tree' with 15 tuples
    writing tsdb relation 'result' with 15 tuples
    writing tsdb relation 'preference' with 15 tuples
    writing tsdb relation 'parse' with 107 tuples
     [ success ]
    [161]   {13 decisions}  UCSTAT: input 25 edges, output 17 edges
    {17 edges}      {1 / 4 trees active}    identical       ... saving this tree as preferred, with decisions from goldwriting tsdb relation 'decision' with 88 tuples
    writing tsdb relation 'tree' with 16 tuples
    writing tsdb relation 'result' with 16 tuples
    writing tsdb relation 'preference' with 16 tuples
    writing tsdb relation 'parse' with 107 tuples
     [ success ]
    [171]   {23 decisions}  UCSTAT: input 47 edges, output 32 edges
    {32 edges}      {1 / 9 trees active}    identical       ... saving this tree as preferred, with decisions from goldwriting tsdb relation 'decision' with 111 tuples
    writing tsdb relation 'tree' with 17 tuples
    writing tsdb relation 'result' with 17 tuples
    writing tsdb relation 'preference' with 17 tuples
    writing tsdb relation 'parse' with 107 tuples
     [ success ]
    [181]   {0 decisions}   UCSTAT: input 6 edges, output 3 edges
    {3 edges}       {1 / 1 trees active}    identical       ... saving this tree as preferred, with decisions from goldwriting tsdb relation 'decision' with 111 tuples
    writing tsdb relation 'tree' with 18 tuples
    writing tsdb relation 'result' with 18 tuples
    writing tsdb relation 'preference' with 18 tuples
    writing tsdb relation 'parse' with 107 tuples
     [ success ]
    [191]   {12 decisions}  UCSTAT: input 24 edges, output 11 edges
    {11 edges}      {1 / 4 trees active}

Last update: 2017-01-05 by SanghounSong [[edit](https://github.com/delph-in/docs/wiki/CapitolHillTreebank/_edit)]{% endraw %}