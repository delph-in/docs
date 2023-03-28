{% raw %}Some common use examples for [Ace](https://delph-in.github.io/docs/tools/AceTop), illustrated with
[Jacy](https://delph-in.github.io/docs/grammars/JacyTop):

For the full list of command line options see [AceOptions](https://delph-in.github.io/docs/tools/AceOptions).
For some discussions of picking best values for the ERG, see
[AceErgTuning](https://delph-in.github.io/docs/erg/AceErgTuning).

## Parsing

Prepare for parsing, outputting only the top best MRS, nicely formatting
the output (one EP per line)

    $ ace -g grammar.dat -Tf1
    $ 犬　が　吠える
    
    SENT: 犬　が　吠える
    [ LTOP: h0
    INDEX: e1 [ e TENSE: pres MOOD: indicative PROG: - PERF: - ASPECT: default_aspect PASS: - SF: prop ]
    RELS: < [ udef_q_rel<-1:-1> LBL: h3 ARG0: x2 [ x PERS: 3 ] RSTR: h4 BODY: h5 ]
     [ "_inu_n_rel"<-1:-1> LBL: h6 ARG0: x2 ]
     [ "_hoeru_v_1_rel"<-1:-1> LBL: h7 ARG0: e1 [ e TENSE: pres MOOD: indicative PROG: - PERF: - ASPECT: default_aspect PASS: - SF: prop ] ARG1: x2 ] >
    HCONS: < h4 qeq h6 > ]
    
    NOTE: 1 readings, added 183 / 63 edges to chart (22 fully instantiated, 26 actives used, 11 passives used)      RAM: 1327k

#### Batch Parsing

With sensible limits and using tnt for POS tagging (which enables
unknown word processing).

    cat FILE | ace --max-chart-megabytes=1920 --max-unpack-megabytes=2048 --tnt-model wsj.tnt -g eng.dat -Tf -n 10 

## Paraphrasing

Pipe parse output into generation:

    $ ace -g grammar.dat -Tf1 | ace -g grammar.dat -e
    $ 犬　が　猫　を　追う　。
    NOTE: 1 readings, added 323 / 101 edges to chart (31 fully instantiated, 37 actives used, 17 passives used)     RAM: 1996k
    犬 が 猫 を 追う
    猫 を 犬 が 追う
    NOTE: 85 passive, 431 active edges in final generation chart; built 88 passives total. [2 results]

## Compiling the Grammar

This produces the compiled grammar.

    $ ace -G grammar.dat -g path-to/config.tdl

When you compile a grammar, ace gives you a brief summary:

    2057 types (601 glb), 16751 lexemes, 63 rules, 12 orules, 52 instances, 22622 strings, 168 features

These refer to (FCB thinks):

|           |                          |                                                  |
|-----------|--------------------------|--------------------------------------------------|
| types     | number of non-leaf types | of which X are created by ace as glbs            |
| lexemes   | lexical items            |                                                  |
| rules     | grammar rules            |                                                  |
| orules    | inflectional rules       | ?both with and without orthographic effect       |
| instances | ???                      | everything else: roots, chart-mapping rules, ??? |
| string    | distinct strings         |                                                  |
| features  | distinct features        |                                                  |

### YY input mode

The YY input mode (see the corresponding section in
[PetInput](https://delph-in.github.io/docs/garage/PetInput)) allows you to pass information such as POS tags.

    cat yy.txt | ace -g erg1214.dat -y

where yy.txt contains inputs like:

    (42, 0, 1, <0:11>, 1, "Tokenization", 0, "null", "NNP" 0.7677 "NN" 0.2323)

Last update: 2019-07-17 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/AceUse/_edit)]{% endraw %}