{% raw %}# ACE wishlist

These are some features that [ACE](https://delph-in.github.io/docs/tools/AceTop) does not support properly,
but some people think it should. [WoodleyPackard](/WoodleyPackard)
intends to consult this page to gauge user priorities when making
improvements, so please add comments if you have an interest in seeing
some particular feature supported in ACE (estimated priorities are in
parentheses).

- Time profiling for generation -- rule by rule? (low)
- YY mode: support multiple POS tags, with probabilities (requested by
???)
- Unknown word handling with lemmatization (2017-01-10: FCB, ZZF, DVM,
DPF, MWG)
- Unknown word generation (2017-01-10: FCB, ZZF, DVM, DPF, MWG)
- Documentation on how to train a parsing/realization model
(2017-01-10: FCB, ZZF, DVM, MWG)
- Unicode support for 2016-style SEM-Is (2017-05-02: MWG)
- Handling () inside of lexical items: e.g., I have lexical items with
disappearing segments, traditionally marked in ()s: -(y)a, -(č)iił,
etc. (2017-08-02: DAI)
- More informative errors stored in profiles with art, for example, if
you have a lexical gap, say where it was and what was gapped
(2018-11-29: FCB&LMC)
- Art/Ace are not producing the correct values for start :date and
end :date of a run. In fact it seems that the same wrong date is
used for both values instead. For example:
(1@@art -- arbiter/tsdb recorder@-1@@answer@@"Zhong-zhs (2018-03-30@2845@-1@-1@38251@4@55@@@@23-6-2013 14:28:24@23-6-2013 14:28:24@1523@)
This was run on 29-Nov-2018. (29-Nov-2018: LMC&FCB)
- Timeout NOTE message can interrupt other printing, causing
formatting troubles; fix!
- ace (or art)does not store the potential number of parses in
parse/readings, but the actual number stored. This means if we put a
limit on the number stored, we cannot easily check changes in
ambiguity for the grammar. I think you can calculate the number
without unpacking everything (I seem to recall PET stores it). (FCB
& LMC 2020-03-17).

### Done

- Support for TDL doc-strings
- More complete LUI support, e.g. chart browser, MRS browser (???)
- Support for outputing \[incr tsdb()\] profiles, perhaps for a given
relations file (???; requested by MichaelGoodman)
  
  - this is supported by the external 'art' program, to be released
some time soon hopefully
- 0.9.25 Timeouts for parsing/generation (???; requested by
DanFlickinger, added by
MichaelGoodman)
- 0.9.25 Generate unknown names
- rule chain specification for YY input
- Right clicking on the Macintosh ACE-LUI interface (as of August
2017-ish; anyone still having trouble? WP)

Last update: 2020-03-17 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/AceWishlist/_edit)]{% endraw %}