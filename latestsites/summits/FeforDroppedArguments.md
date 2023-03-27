{% raw %}Notes from the discussion on dropped arguments: To include or not
include pronoun rels? Is it sufficient to constrain the u variable with
e.g., png or definiteness information?

[Emily's slides
(pdf)](http://faculty.washington.edu/ebender/prodrop.pdf)

The 'eat' example can be misleading, since then we have to worry about
whether there's two separate relations. 'earlier' as in "The earlier
train" vs. "\*The before train" is a clearer case. (Both are relation,
take a 'than' complement, but with earlier it's optional.)

"Move!" shouldn't be able to mean "Nobody move!"

Current assumption is that the arity of a given predicate is fixed and
known, so leaving off arg roles is not a legitimate means of
underspecification.

This leaves:

{{{\[ \_eat\_v\_1\_rel

- ARG1 x ARG2 u \]}}}

or

{{{\[ \_eat\_v\_2\_rel

- ARG1 x \]}}}

But cf 'earlier' examples where it seems less plausibile to posit two
separate relations.

What about dropped handle arguments? ("I persuaded Sandy") If that's
just a u, but MRS wellformedness requires a handle to fill that hole,
what to do? Possibility of u\_ind and u\_hand.

If we underspecify the dropped argument completely (leave off its
arg\_rel), then we potentially lose information coming from the
morphology of the verb (e.g., png) or its lexical properties
(definite/indefinite null instantiation).

Slippery slope: What about cognate objects? We have "The dog barked an
enormous bark" "sleep a long sleep" "die a terrible death". Surely
wedon't want to posit ARG positions for the cognate argument that are
underspecified everywhere the verb is used without them. Similarly, what
about denominal verbs ("to sunscreen someone") --- should the
representation have an ARG role for the sunscreen?

Spent some time looking for cases where the verb or other constraints
provides information about u that is 'genuinely semantic':

{{{Bought a book, did he? Cut well, don't they? (scissors) Cut well,
doesn't it? (scissors)}}}

... relationship to other kinds of anaphora that seem sensitive to
grammatical properties of other words for their referents, even if the
other words haven't been used in the local discourse context. Also
French "le machin/la machine" --- translations of 'thingamajig' with
grammatical gender, often used to match the grammatical gender of words
that the speaker can't retrieve.

We want to have pron\_rel in the cases where there is an overt pronoun
because that information is important for coreference resolution. On the
other hand, there is already a feature PRON-TYPE which can be used to
encode whether or not there was an overt pronoun, and if so, of which
type. At the moment, there is a close relationship between pronoun
variables and unique EPs. This raises the worry about duplicating the
work done by handles with variables, but at least some approaches to
information structure require us to talk about relations , not
variables. For example, focusing *big* in *big dog* is different from
focusing *dog*. (But: they have the same LBL, so how do we get our hands
on just one of the relations?)

This raises the question: Does the label of a pronoun\_n\_rel ever get
identified with anything else, or is it always only qeq the RESTR of a
pronoun\_q\_rel? If EPs are what is focused or topicalized, then you
can't focus zero pronouns (assuming they don't introduce any EPs). If
there is indeed such a distinction between overt and zero pronouns (in
some languages at least), do we need the contrast between introducing
and not introducing the pronoun\_n\_rel to capture it? Will PRON-TYPE be
sufficient?

What about pronoun resolution in languages which have
pronoun-incorporation? (E.g., Bantu but also Romance) Do we require
pronoun\_n\_rel to be introduced by the verbal affixes in order to do
pronoun resolution? What about languages like Japanese that have no
morphological reflex of pro-drop?

A final worry: How does this affect the MRS to RMRS conversion?

See also [FeforPng](https://delph-in.github.io/docs/summits/FeforPng).

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/FeforDroppedArguments/_edit)]{% endraw %}