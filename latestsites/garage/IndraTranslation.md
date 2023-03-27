{% raw %}# Indonesian-English Translation inen

inen is a transfer grammar from INDRA (in) to ERG (en) (see
[LogonTransfer](https://delph-in.github.io/docs/tools/LogonTransfer)).

## Transfer Grammars

inen is in tm folder, along with other transfer grammars, which can be
downloaded from the [Github](https://github.com/sanghoun/tm).

For INDRA, we cloned the tm folder to grammar folder.

    ~/grammar$ git clone http://github.com/sanghoun/tm.git

## Machine Translation

1\. update and compile the source grammar INDRA.

    ~/ind$ ace -g ace/config.tdl -G ind.dat

2\. update and compile the target grammar ERG.

    ~logon/lingo/erg$ ace -g ace/config.tdl -G erg.dat

3\. update and compile the transfer grammar inen.

    ~/grammar/tm/inen$ ace -g ace/config.tdl -G inen.dat

4\. translating by INPUT \| PARSING \| TRANSFER \| GENERATION

    $ echo "anjing menggonggong" | ace -g YOUR_INDRA_DIRECTORY/ind.dat | ace -g YOUR_INEN_DIRECTORY/inen.dat | ace -g YOUR_ERG_DIRECTORY/erg.dat -e

## Transfer Rules

1\. Edit in.vpm under \~/grammar/tm/inen to transfer e.g.:

- the underspecified tense in Indonesian into present tense in
English,
- third person (underspecified for number) in Indonesian into third
person plural in English,
- perfect aspect in Indonesian into past tense in English.

<!-- -->


    E.TENSE : TENSE
      tense >> pres
    
    PNG.PERNUM : PERS NUM
      3rd >> 3 pl
    
    E.ASPECT : TENSE
      perf >> past

2\. In out.vpm

    TENSE : TENSE
      * >> *
    
    PERS : PERS
      * >> *
    
    NUM : NUM
      * >> *

3\. In test.mtr, map *menggonggong* to bark and *anjing* to dog

    bark_mtr := monotonic_mtr &
    [ INPUT.RELS < [ PRED "_menggonggong_v_rel" ] >,
      OUTPUT.RELS < +copy+ & [ PRED "_bark_v_1_rel" ] > ].
    
    dog_mtr := monotonic_mtr &
    [ INPUT.RELS < [ PRED "_anjing_n_rel" ] >,
      OUTPUT.RELS < +copy+ & [ PRED "_dog_n_1_rel" ] > ].
    
    udef_mtr := monotonic_mtr &
    [ INPUT.RELS < [ PRED "exist_q_rel" ] >,
      OUTPUT.RELS < [ PRED udef_q_rel ] > ].

## Debugging

If we find a problem in transferring and generating the translation, we
should do debugging.

1\. Check the want-to-be MRS in the target grammar ERG, save it in a
file.

2\. Compare with the MRS in the source grammar INDRA and in the transfer
grammar inen.

    $ echo "anjing menggonggong" | ace -g YOUR_INDRA_DIRECTORY/ind.dat -Tf -vv | less
    
    $ echo "anjing menggonggong" | ace -g YOUR_INDRA_DIRECTORY/ind.dat | ace -g YOUR_INEN_DIRECTORY/inen.dat -Tf -vv | less

3\. Edit the grammar(s) or transfer rules

Last update: 2015-07-06 by DavidMoeljadi [[edit](https://github.com/delph-in/docs/wiki/IndraTranslation/_edit)]{% endraw %}