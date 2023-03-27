{% raw %}# Discussion Lexical Acquisition for Immature Grammars

**Discussion questions:**

How to enhance lexical acquisition for immature grammars? How to create
lexicons from languages with few resources? Immature or small grammars
have been defined as lexicons with a few hundred lexical items
(functional words with examples of each).

**Other questions:**

Can we use the Matrix for rapid lexicon acquisition? What can we do for
a grammar without a treebank? We would need to acquire types as well as
items. And what if we have an associated morphological analyzer with the
resource?

**Some different approaches were brought up: human, integrated,
automated.**

One proposal included using a good user interface for lexical entry with
a concordancer in situations where there's not enough data to implement
any machine learning or automation.

Andy Knots (?) and the unknown word process was mentioned; have native
speakers plug the word into prepared contexts. 1980's NLP interfaces and
databases were brought up.

Also mentioned was to try to work out a POS tagger with a morphological
analyzer. With a human in the loop, a morphological analyzer would be
helpful.

An unlearn mechanism with human interaction was also suggested. One
could also have the the consultant tree bank good and bad sentences.
With lexical acquisition tree banking would be faster. [The Avenue
Project](http://www.cs.cmu.edu/~alavie/) was mentioned as a source using
active collaboration.

The greek grammarians reported using a technology in the past. It was
not spectacular for developing grammars in an initial state, but they
have offered to find the paper in which it is was reported and to link
it online (here would be a good place :-).

Some people tried Frederick's unknown word mechanism (but it broke after
the LKB was updated - and it's sensitive to the environment). Users now
cannot get it to store new lexical items. Questions about whether or not
i's being actively supported were raised.

Another possibility is DEVO (sp?) which seeds lexical items from similar
language grammars (e.g. if you know word 'verb' is transitive in both
language), such as in translation lexicons. It won't help with
morphology, but has been successful in starting a Malayam (?) grammar.

There has also been work done linguistic aware web searches by Bird and
Hughes. Language identification of online documents can discover corpora
online. For immature grammars, or languages with particularly few
resources, web mining may be the way to go.

And please remember to report bugs! Email the developers' list (where
the LKB bugs email seems to be forwarding).

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/FeforPlenum_LexicalAcquisitionImmatureGrammars/_edit)]{% endraw %}