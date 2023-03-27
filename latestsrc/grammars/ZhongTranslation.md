{% raw %}## jahs

First, update your Jacy and compile the grammar using ACE.

    $ ace -g ace/config.tdl -G jacy.dat

Second, compile the transfer grammar for jahs.

    $ ace -g ace/config.tdl -G jahs.dat

Note that the past tense marker in Japanese (だ) should be transfered
into a perfective marker in Mandarin Chinese (了). This is specified in
in.vpm under jahs.

    TENSE : ASPECT
      past >> perfective

Third, compile the Zhong-cmn-hans (simplified Mandarin Chinese) grammar.
Note that there are two versions (see
[ZhongGeneration](https://delph-in.github.io/docs/grammars/ZhongGeneration)). For generation, it would be better
to use a strict one.

    $ ace -g ace/config-strict.tdl -G hans-strict.dat

After that, you can run the translation process. The sequence is INPUT
\| PARSING \| TRANSFER \| GENERATION

    echo "犬 が 吠え だ" | ace -g YOUR_JACY_DIRECTORY/jacy.dat | ace -g YOUR_JAHS_DIRECTORY/jahs.dat | ace -g YOUR_HANS_DIRECTORY/hans-strict.dat -e

## hsja

Last update: 2014-09-10 by SanghounSong [[edit](https://github.com/delph-in/docs/wiki/ZhongTranslation/_edit)]{% endraw %}