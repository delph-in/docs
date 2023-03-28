{% raw %}Note: this page describes ideas under discussion, and may change at any
time. It is currently mainly based on from the developes list.

# Elementary Predicate cfrom/cto

The semantics of the cfrom/cto on the EP are clearly defined. They
correspond to the (character) span between the start of the first token
and the end of the last token spanned by the chart edge which introduced
the predicate (or, more simply, the text span to which the EP
corresponds).

# Global cfrom/cto

Global cfrom/cto corresponds to the character span of the input segment
("sentence") which was given to the parser. This would normally be what
the sentence splitter returns.

The input segment might have certain characters at the end (or start)
stripped by the preprocessor, or the final token might be semantically
vacuous (oe's insight). Such semantics also fit neatly with the text
interface spec, which contains a global cfrom/cto corresponding to
exactly the span of the input segment.

### Example

Suppose we have a bit of a document:

    <p>
    <b>Carp</b>: a fish.  Sometimes eaten.<br>But not oftenNevertheless it is
    tasty.

and this gets processed by a sentence splitter to give:

    "<b>Carp</b>: a fish.  "
    "Sometimes eaten."
    "But not often."
    "Nevertheless it is tasty."

cto of sentence 1 is cfrom of sentence 2, but cto of sentence 2 is less
than cfrom of sentence 3 because the &lt;br&gt; has been removed.
Sentence 3 has an additional . which wasn't in the original (assume the
sentence splitter is doing some regularisation - I can give a more
convincing example if necessary but I really hope nobody is going to
argue that we should disallow this in principle), so the \`often' has a
cto which is the same as the period's cfrom and cto.

## Issues

- We have to be more formal about specifying what the sentence
splitter does, not because we expect all sentence splitters to
behave in the same way (we don't) but because we want the cfrom and
cto to be consistent with different implementations of the same
sentence splitting algorithm.
- there are issues with the tokeniser - e.g., you have
  
  a string abc d ef' - the preprocessor tokenises to ab' \`x' - what
is the cfrom/cto for those tokens?

# What do cfrom/cto represent?

Two different axes giving four possibilities

- positions vs points
- token vs character

It would be nice to converge on one.

## Positions vs Points

The currently agreed semantics of CFROM/CTO is that they refer to
character positions (2005). Eg. given the text 'abcd' the range CFROM=0
to CTO=2 refers to the "abc" substring.

    abcd
    0123 = character positions

I would like to suggest we use character \_points\_ (the points between
characters) instead of the above -- more expressive and allows the
specification of empty ranges. Eg. given the text 'abcd' the range
CFROM=0 to CTO=2 would refer to the "ab" substring, whilst the range
CFROM=0 to CTO=3 would refer to the "abc" substring

    .a.b.c.d.
    0 1 2 3 4 = character points

The conversion from character positions to character points is simple:
CFROM values are the same, to convert a CTO character position to
character point you must add 1.

Last update: 2006-11-06 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/RmrsSpan/_edit)]{% endraw %}