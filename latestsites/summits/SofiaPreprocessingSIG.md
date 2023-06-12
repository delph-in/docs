{% raw %}### Preprocessing and deep grammars

Lead: Kiril

Participants: Petya, Mike, Angelina, Montse, Yi

Main discussants: Kiril and Yi

0\. The focus of the discussion is on how to incorporate shallow parses
into deep parsing architectures.

1\. Problem:

\- [MaltParser](/MaltParser) - tried on Bulgarian with partial grammars
as input, BUT - not always complete trees can be derived.

\- only one format CoNLL

2\. What to be done? - input to be chosen (POS tagged, lemmatized,
chunked or DP parsed...)

\- degrees of reliability of the various preprocessing steps

\- degrees of control over the various preprocessing steps

\- towards Statistical parsong where confidence measures can be used

3\. Connection to partial FS (hence - to simplified FS)

\- language grammar specification

\- mapping between the grammar and the format, i.e. agreement info for
chunks

\- impact of the new words

\- impact of sure vs. unsure decisions, made by the various
preprocessing steps

4\. [MaltParser](/MaltParser) again:

\- no underspecification is possible now

\- discrepancies between locality in algorithm and linguistic locality

Example: for German first the topological fields are identified, and
then -- HPSG analyses are performed.

5\. Should morphology be done outside the grammar?

6\. Probabilistic model over an PCFG Grammar. However: hard with a
single probabilistic model. Thus: parallel model to HPSG grammar?

7\. Towards Robust Unification. This implies degrees of constraints. For
example, the INFLECTED+/- can be unified, but not singular and plural.

CONCLUSION: The idea of a hybrid approach; information fusion.
Everything in a complex system.

Last update: 2012-07-10 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/SofiaPreprocessingSIG/_edit)]{% endraw %}