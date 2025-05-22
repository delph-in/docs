{% raw %}These are instructions to quickly get started parsing with the ERG and
processing the results. It uses the [ACE](https://delph-in.github.io/docs/tools/AceTop) parser/generator and
[PyDelphin](https://github.com/delph-in/pydelphin).

# Linux (64-bit)

## Install ACE

You can get pre-compiled ACE binaries at
<http://sweaglesw.org/linguistics/ace/>. Command-line instructions for
getting the latest version (since this wiki was last updated) are as
follows:

```
~$ wget http://sweaglesw.org/linguistics/ace/download/ace-0.9.34-x86-64.tar.gz -q -O - | tar xz
~$ sudo mv ace-0.9.34 /opt/
```

To make ACE accessible as a command, at its directory to the PATH
variable (e.g., in .bashrc)

```
PATH=/opt/ace-0.9.34:"$PATH"
```

Confirm that it is installed:

```
~$ ace -V
ACE version 0.9.34
compiled at 18:11:19 on Jan 21 2021
```

## Download the ERG

A pre-compiled grammar file for the ERG is available on GitHub:

```
~$ mkdir -p ~/grammars  # or some suitable place for grammar files
~$ wget https://github.com/delph-in/erg/releases/download/2025/erg-2025-x86-64-0.9.34.dat.bz2 -q -O - | bunzip2 > ~/grammars/erg-2025-x86-64-0.9.34.dat
```

Confirm the grammar works with ACE (for fine tuning, see
[AceErgTuning](https://delph-in.github.io/docs/erg/AceErgTuning)):

```
~$ ace -g ~/grammars/erg-2025-x86-64-0.9.34.dat -Tq <<< "Dogs sleep."
[ LTOP: h0 INDEX: e2 [ e SF: prop ] RELS: < [ unknown<0:11> LBL: h1 ARG0: e2 ARG: x4 [ x PERS: 3 NUM: sg ] ]  [ udef_q<0:11> LBL: h5 ARG0: x4 RSTR: h6 BODY: h7 ]  [ compound<0:11> LBL: h8 ARG0: e9 [ e SF: prop TENSE: untensed MOOD: indicative PROG: - PERF: - ] ARG1: x4 ARG2: x10 [ x PERS: 3 NUM: pl IND: + PT: notpro ] ]  [ udef_q<0:4> LBL: h11 ARG0: x10 RSTR: h12 BODY: h13 ]  [ _dog_n_1<0:4> LBL: h14 ARG0: x10 ]  [ _sleep_n_1<5:11> LBL: h8 ARG0: x4 ] > HCONS: < h0 qeq h1 h6 qeq h8 h12 qeq h14 > ICONS: < > ]
[ LTOP: h0 INDEX: e2 [ e SF: prop TENSE: pres MOOD: indicative PROG: - PERF: - ] RELS: < [ udef_q<0:4> LBL: h4 ARG0: x3 [ x PERS: 3 NUM: pl IND: + ] RSTR: h5 BODY: h6 ]  [ _dog_n_1<0:4> LBL: h7 ARG0: x3 ]  [ _sleep_v_1<5:11> LBL: h1 ARG0: e2 ARG1: x3 ] > HCONS: < h0 qeq h1 h5 qeq h7 > ICONS: < > ]
[ LTOP: h0 INDEX: e2 [ e SF: prop TENSE: pres MOOD: indicative PROG: - PERF: - ] RELS: < [ _dog_v_1<0:4> LBL: h1 ARG0: e2 ARG1: i3 ARG2: x4 [ x PERS: 3 NUM: sg ] ]  [ udef_q<5:11> LBL: h5 ARG0: x4 RSTR: h6 BODY: h7 ]  [ _sleep_n_1<5:11> LBL: h8 ARG0: x4 ] > HCONS: < h0 qeq h1 h6 qeq h8 > ICONS: < > ]
[ LTOP: h0 INDEX: e2 [ e SF: prop ] RELS: < [ unknown<0:11> LBL: h1 ARG0: e2 ARG: x4 [ x PERS: 3 NUM: sg ] ]  [ udef_q<0:11> LBL: h5 ARG0: x4 RSTR: h6 BODY: h7 ]  [ compound<0:11> LBL: h8 ARG0: e9 [ e SF: prop TENSE: untensed MOOD: indicative PROG: - PERF: - ] ARG1: x4 ARG2: x10 [ x PERS: 3 NUM: pl IND: + PT: notpro ] ]  [ udef_q<0:4> LBL: h11 ARG0: x10 RSTR: h12 BODY: h13 ]  [ _dog_n_1<0:4> LBL: h14 ARG0: x10 ]  [ _sleep_n_1<5:11> LBL: h8 ARG0: x4 ] > HCONS: < h0 qeq h1 h6 qeq h8 h12 qeq h14 > ICONS: < > ]
NOTE: 4 readings, added 389 / 61 edges to chart (27 fully instantiated, 43 actives used, 15 passives used)      RAM: 1415k


NOTE: parsed 1 / 1 sentences, avg 1415k, time 0.00952s
```

## Install PyDelphin

[PyDelphin](https://delph-in.github.io/docs/tools/PyDelphinTop) is available from
[PyPI](https://pypi.python.org/pypi)

```
~$ pip install pydelphin
```

If you want the [latest
features](https://github.com/delph-in/pydelphin/blob/master/CHANGELOG.md?raw=true)
of [PyDelphin](https://delph-in.github.io/docs/tools/PyDelphinTop), you might try getting it from its [GitHub
repository](https://github.com/delph-in/pydelphin) (you'll need to have
git installed) and switching to the develop branch:

```
~$ git clone https://github.com/delph-in/pydelphin.git
~$ git checkout develop
```

Confirm it works (the following is available if you installed via pip):

```
~$ ace -g ~/grammars/erg-2025-x86-64-0.9.34.dat -1 <<< "The dog barks." | delphin convert --from ace --to eds --indent 1
NOTE: 1 readings, added 691 / 108 edges to chart (37 fully instantiated, 56 actives used, 24 passives used)     RAM: 1499k
NOTE: parsed 1 / 1 sentences, avg 1499k, time 0.01032s
{e2:
 _1:_the_q<0:3>{x IND +, NUM sg, PERS 3}[BV x3]
 x3:_dog_n_1<4:7>{x IND +, NUM sg, PERS 3}[]
 e2:_bark_v_1<8:14>{e MOOD indicative, PERF -, PROG -, SF prop, TENSE pres}[ARG1 x3]
}
```

Note: the -1 option on the ace command restricts it to only output 1
result per input, and the --from ace option on the delphin command
extracts the MRS data from ACE's output stream.

## Install art

The [art](http://sweaglesw.org/linguistics/libtsdb/art) utility is
useful for parsing [\[incr tsdb()](https://delph-in.github.io/docs/tools/ItsdbTop)\] profiles.

```
~$ wget http://sweaglesw.org/linguistics/libtsdb/download/art-0.1.9-x86-64.tar.gz -q -O - | tar xf
~$ sudo mv art-0.1.9 /opt/
```

To make art accessible as a command, at its directory to the PATH
variable (e.g., in .bashrc)

```
PATH=/opt/art-0.1.9:"$PATH"
```

Confirm it works:

```
~$ mkdir -p ~/tsdb/skeletons ~/tsdb/current  # or some other suitable location
~$ wget http://svn.emmtee.net/trunk/lingo/lkb/src/tsdb/skeletons/english/Relations -O ~/tsdb/skeletons/Relations
~$ echo -e "The dog barks.\nThe cat meows." | mkprof -r tsdb/skeletons/Relations tsdb/current/ex
~$ art -a 'ace -g ~/grammars/erg-2025-x86-64-0.9.34.dat' tsdb/current/ex
reading results for                1    2 results
reading results for                2    2 results
```

# MacOS

(add instructions here)

# Windows (with agree)

(add instructions here)

# Other configurations

If you want a more full-featured setup for grammar development, you
might look into the full LOGON distribution: [LogonTop](https://delph-in.github.io/docs/tools/LogonTop)

Last update: 2025-05-22 by Dan Flickinger [[edit](https://github.com/delph-in/docs/wiki/QuickStart/_edit)]{% endraw %}