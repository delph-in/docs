{% raw %}# Notes for the Delphin Summit 2020 - MWE and NE

Talk by Alexandre, scribes MWG, FCB.

Ann: We can’t summarize 8 years of research in 40 minutes, so what do
you really want to get out of this?

AR: What are the big problems now, what are our capabilities in this
area and what can we do?

Ann: in \`Pain in the Neck' paper, there’s a classification of different
MWE types, and they are implemented in the grammar except for idioms
perhaps. As for what are the big problems: what do we do for unknown
MWEs, i.e., where we don’t have a lexical entry. Do we add those to the
lexicon or not?

AR: Given the ERG and a good pos tagger, can’t we rely on those tools to
do something reasonable?

FCB: documentation is always a problem. Take HoG; it does useful things
but most systems don’t make use of it. We don’t have good guidelines
about how to deal with these, and how we deal with them differs by
grammar. E.g., “Stanford University”, do we generally want “University”
as a name or \_university\_n\_1? We need to decide these things. The
idiom machinery is good but we don’t have good coverage.

DPF: We lack both data and theory for the ERG. I don’t know the range of
possible forms. E.g. Senator John Smith same as professor Jane Smith?
professor of linguistics Jane Smith, ...

As for idioms, we are nowhere near completely covering the possible
forms.

Titles of books, plays, etc., with varying rules for capitalization,
etc. Hyphenated phrases, “the I-don’t-care-what-you-do MWEs”, etc.

Ping: Do we include mal-rules in MWE handling? I’m afraid of the
explosion of ambiguity.

DPF: Mal-rules increase ambiguity regardless of whether they are MWEs or
not. It’s the same problem, but perhaps a difference in degree.

Ann: People have over the years tried to simplify their representation
of MWEs to fit their simpler systems, which is fine, but if annotators
are trying to describe them you’ll have IAA issues if you don’t have a
good account of what they should be like. I feel like neural parsers
might be relatively good at these as they can deal with the variation
and get \*something\* out of it.

DPF: Yes, if you care about robustness then the neural approach is good
and trying to get an accurate portrayal of MWEs is not necessary, but I
care about getting the linguistics right. So maybe getting the
linguistics right doesn’t matter if you just want something handled.
Department Head and preferred Ruler of the Universe, Ann Copestake.

Ann: unless you’re, say, trying to teach someone standard English using
technology.

DPF: true

Glenn: the named-entity can be used to encapsulate information

AR: (refocusing discussion) I think we can divide the work up so some
preprocessor can detect the MWEs and insert a single token that somehow
interacts with a formal analysis in the right way. Does that make sense?

DPF: Surely we can gain something by getting some representation instead
of getting lost in the mire of the MWE, but I’m skeptical that such a
simplistic approach is sufficient to get a proper analysis because the
parts of the MWE interact with the rest of the sentence structure.

Ann: this is similar to chemical compounds; they don’t look like English
but they interact with the sentence as though they were, e.g.,
agreement, coordination...

DPF: we don’t know enough about how (and how well) lightweight
approaches work to really decide what to do.

Oe: Thanks for following 20 years of research breadcrumbs to assemble
your current understanding, but some points are now irrelevant, such as
the various deprecated PET input types, but there are features for
annotating input strings, and GML (grammar markup language) to force the
analysis of a substring as some pre-analyzed chunk. E.g., for foreign
words in Wikipedia articles, the italics indicates that they must not be
analyzed further. I think you can use GML with forced bracketing to
enforce the analysis of MWEs as single entities.

<http://moin.delph-in.net/ErgGml>

FCB: an issue we had with MWEs is that I’d like to look at the MRS but
its hard to get back to a normalized expression. E.g., “dressing table”,
goes to the string below, but it’s hard to take that and go back to the
surface string, e.g., for building a lexicon. compound⟨14:29⟩
udef\_q⟨14:22⟩ \_dress\_v\_in⟨14:22⟩ nominalization⟨14:22⟩
\_table\_n\_1⟨23:29

--- from the chat ---

FCB: Some weird corner cases: I read "if on a winter's night a
traveller' before I read "Every book its reader" and "Property Of" but
the vast majority of titles are constituents.

OE: a comparison of (parsing into) the (very lightweight) approach to
NEs in ERS, vs. the (heavy-handed) one in AMR:
<https://www.aclweb.org/anthology/W19-3304/>

Last update: 2020-07-17 by AlexandreRademaker [[edit](https://github.com/delph-in/docs/wiki/VirtualMwe/_edit)]{% endraw %}