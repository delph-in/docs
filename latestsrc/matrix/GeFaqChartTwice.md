{% raw %}# Grammar Engineering Frequently Asked Questions

## One of my words is showing up in the chart twice. Why?

This situation can arise if you have a multi-word lexical entry, and
another lexical entry for just part of the multi-word, for example:

    bastille-day := noun-lex &
      [ STEM < "bastille", "day" >,
        SYNSEM.LOCAL.LKEYS.KEYREL "_bastille_day_n_rel" ].
    
    day := noun-lex &
      [ STEM < "day" >,
        SYNSEM.LOCAL.LKEYS.KEYREL "_day_n_rel" ].

If you try to parse a sentence with *Bastille Day*, the LKB will find
lexical entries for both *Bastille Day* and *day* and put them both in
the chart. Unless you also have an independent lexical entry for
*Bastille*, the entry for just day won't be included in any complete
parses, but the algorithm doesn't know this.

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqChartTwice/_edit)]{% endraw %}