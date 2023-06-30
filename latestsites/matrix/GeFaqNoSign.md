{% raw %}# Grammar Engineering Frequently Asked Questions

## My grammar loads just fine, but when I try to parse a sentence, it says "no sign can be constructed for ...". What's happening?

This error occurs when the LKB is unable to build an edge for a word in
the input string. This can happen in at least the following two
scenarios:

1. The word requires the application of lexical rules, but the
constraints on the sequence of lexical rules required to build the
feature structure are not compatible (the required sequence of rules
cannot be unified). To understand this, one needs to know the
following: In processing each word from the surface string, DELPH-IN
parsers first determine all possible chains of lexical
rules--considering only those which involve spelling changes--that
can change the word into a stem form. For each sequence that results
in stem which is found in the lexicon, the parser then tries to
build a chart object. (Since now it it's starting from the stem, it
actaully uses the reverse of the sequence). It also tries to build
an object for all possible interleavings of each viable sequence
with non-spelling-change \[or constant\] lexical rules. It is only
during the second, chart-object-building phase that parser verifies
that the constraints on the lexical rules in the sequence are
compatible. If they are not, the "no sign can be constructed for"
error is output, and the word won't appear in the chart.
2. The word is available only as part of a multi-word lexical entry,
and the other required words are not in the input string. \[Confirm
this.\]

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqNoSign/_edit)]{% endraw %}