{% raw %}# MRS modeling mini-symposium at UW 2013-02-27

## Participants

- EmilyBender (scribe)
- DanFlickinger
- VaryaGracheva
- MichaelGoodman
- [PrescottKlassen](/PrescottKlassen)
- [WoodleyPackard](/WoodleyPackard)
- ZinaPozen
- [MeganSchneider](/MeganSchneider)
- GlennSlayden
- SanghounSong

## Notes

Topic: More clarity for named entities; how to annotate named entities
in a corpus in a way that is useful.

Criteria:

- Beginning and end markers -- grammar's opinions not always aligned
with surface NER systems (blurry edges for articles, predeterminers)
- Consistent annotation of internal structure
  - What is the right answer? (determine headedness, inter alia)
  - How to get annotators to consistently choose

ERG constraints:

- No more than binary structures =&gt; need to find bracketings even
where annotators might say "flat" (e.g., International Business
Machines, John B. Smith, John Smith Jones); adding a flat structure
category will add to ambiguity. Solution might be a set of
heuristics for the annotator (and eventually the max ent model). How
to ensure consistency of annotation here?

Other questions:

- Proper names with multiple tokens where at least one token has no
content: San Francisco, San Jose, Los Angeles, Las Vegas. Gazetteer?
Or treat these as two names in the same way that "Peabody Kitter
Smith" is three names. Borderline cases: North Carolina, New York,
North Korea. Always resist the temptation to put in a multi-token
for a proper name? Can we go to the extreme position of relying
entirely on external NER system. (Fails with texts written by people
allergic to the shift key.)
- How to decide on headedness?
- Capitalization doesn't always indicate opaqueness. The White House
(opaque), the Senate/the House (less opaque), the \[Dd\]emocrats
voted for X. etc. TV is definitely not a named entity. MP (British
English), PI also not. At the MRS level the named entities look
completely different from the common noun. Deeper issue about the
deep divide between proper name and common name.

NER in question is a set of tokenization rules which are part of the
grammar; non-deterministic, doesn't disambiguate. Can also take external
NERs which give labeled bracketing and have the parser respect those
bracketed structures. Very useful for "The Wall Street Journal" and "The
New York Stock Exchange".

List of cases to try to boil down to fewer rules. Target: What is the
annotation handbook going to say to promote annotation consistency (and
useful results)?

- Title: *Mr. Jones*, *Dr. Jones*
  
  - Head is almost certainly the name. The title words are
productive.
- Suffixes: *John Jones, Jr.*, *John Jones III*, *Smith-Kline
Corp/Co/Inc/Ltd/Mfg/SpA/GmBH/& co/& sons*
  
  - Corp etc treated more or less the same as Jr/Sr/etc; if Co is a
post-head modifier, then we don't expect *Smith-Kline Corp
president* (N-N compound), so special handling required
- Transparent Mixed Case: *the University of Washington*, *the Agency
for International Development*, *the Overseas Private Investment
Corporation*, *the G \[sS\]treet \[bB\]ridge*, *Leland Stanford Jr
University*
  
  - Name consisting of true named entities (arbitrary) and ordinary
words with their ordinary meaning; needs to be productive
    
    Headed by University, with post-complement. But then again N-N
compounds: *the University of Washington professor*, cf. *\*a
friend of mine book, \*a picture of Mary magnet*
- Opaque Mixed Case: *the Voice of America* (with later references
within a document shortened to *the Voice*, *the VOA*),*the Big
Board* (part of the NYSE), *the Farm Belt*, *the Pentagon*, *the
White House*
- Murky Mixed Case: *Central America*, *North Dakota*, *New York*,
*the House*, *the International Union of Bricklayers and Allied
Craftsmen*, *the State Commerce and Justice Departments*, *the
Secretary of Defense*, *the Supreme Court*, *District Court*
  
  - No longer quite transparent, but tempting to treat as
productive/compositional
- Proper names as adjectives: *The Costa Rican Embassy*, *the Soviet
Economy* Not all proper names have adjective forms. Some (cf
*Soviet*) are homophonous with the nouns. A similar problem arises
away from proper nouns: *the satellite campus*
- Obligatory the: *(the) I-5*, *the United States*, *the Philippines*,
*the Pacific*,
  
  - *Pacific* doesn't always have *the*: *Georgia Pacific* When it's
used to name the ocean *Pacific* requires *the*.
- Run on proper names: *Laten E Croft MD President Robert Wood Johnson
Foundation New Jersey*
  
  - Here a preprocessor making hypotheses about likely boundaries
would be useful
- Confounded with S-initial capitalization: *Tiny Tots Corp made a new
toy.* *Grumpy just walked into the room.*
  
  - If *Tiny Tots* isn't listed by hand, need to be fairly
aggressive to get that as a top parse. All first words of
sentences get a named-entity candidate, except 'the', 'this',
'that', and a few others. Leads to extra ambiguity/time for tree
banking.
- Name-internal, sometimes obligatory punctuation:
*[McDonald](/McDonald)'s*, *Standard & Poor's*, *Macy's*, *Ruth's
Chris Steak House*, *Ceiva-Geige Company* (cf. *the Regan-Bush
years*), *Balantine/Del Rey/Fawcett* (cf. regular use of / to mean
'and' or 'or'), *AT&T*, *Smith, Klein, Peabody & Jones*, *Kitterson,
Peabody & co*
  
  - Particularly vexed when 's names are in possessor position: not
*[McDonald](/McDonald)'s's stock price*
- Errors: *New York state said no yesterday.*
  
  - State as suffix, used in those cases where there's a city in
competition (Washington, New York)
- WSJ weird capitalization at the start of an article, but also for
emphasis (all caps)
  - Glenn/Woodley: this is really a bug in the preprocessor. This
shouldn't be the grammar's problem. Dan: extend treatment that
already handles italics, double quotes, etc.
- Kline of words written in all caps: TV, IPO, C.D. (plural: C.D.'s),
CEO, CTO,

Candidate analyses:

- Proper names, completely unrelated to the common nouns
- Idiom approach, with dictionary of idiomatic names: parser finds
literal interpretation
- Non-branching rule over compositionally analyzed phrase that wraps
compositional semantics in a named-entity rel

External NER

- Provides bracketing that would allow for fw-like treatment (in the
limit)

Would be useful to have NE types as well as just NE/not NE.
Compositional approach might also help with this.

Woodley: What about a separate external post-processor that tags
named-entities with the benefit of the syntactic information? This span,
btw, with this characteristic variable, is a named entity (of this
type). Keeping all of the semantics of "the University of Washington" in
there, and then add the named entity semantics as a separate way of
addressing it.

Dan: Maybe based on the idiom processing… But there are reasons to not
delay:

*Today General Peripherals is announcing…* The only way to get a
singular verb is to make that one singular. So this needs to be done
during parsing, in order to get the parse.

Emily: Could have a non-branching rule that makes the number change and
puts in a named\_entity rel.

Zina: What about coreference --- might refer back to something inside
the named entity.

Dan: Also: *the Universities of Washington and Oregon*, *the original
University of Washington*

What's the difference semantically? A named entity is anchored in a
particular individual; common nouns name a set of individuals. Encoded
in MRS with named\_rel (distinctive predicate) plus associated
quantifier (proper\_q\_rel).

Woodley: What's the object to a semantic representation that had both
dog\_rel and named\_rel. Example?

Dan: Famous transformational grammarian Noam Chomsky

Zina: But that's only if the class is named in the surface string. But
if you had a gazetteer that says what type of named entity each is,
could that make it into the MRS?

Dan: In a general case, a referential index should be associated both
with its class and its name.

Woodley: *Fido chased the cat.* String doesn't say what kind of entity
Fido is, then get: generic\_entity(x) and named\_entity(x,CARG: Fido)

Zina: Propagating info about what kind of entity Fido is from other
sources (e.g., context) and unify it in…

Dan: Not just convenient, but also gets at something deep about NPs.
They can pick out a set of individuals (and maybe there might be none:
*no dog*) or name a particular individual or in some cases name a class
and pick out an individual.

Woodley: Put the CARG on the quantifier?

Dan: One relation with two attributes: CARG (name) and type/class
attribute.

Emily: One argument against CARG is the attempt to try to get down to
just one quantifier for the whole named entity in *John Smith Jones* ---
need CARG (or equivalent) for each piece of that.

Mike: CARG feature with structured information inside of it?

Dan: EP that comes from *University* will contribute partial information
about the predication --- fill in CARG or TYPE or both.

Emily: Relationship between TYPE and PRED?

Dan: They're different. For all nouns (in this hypothesis): PRED is
noun\_rel and then there's TYPE and PRED.

Mike \[channeling Francis\]: Position for link to [WordNet](/WordNet) or
similar?

Dan: Almost certainly stick to something fairly close to stem form.

Dan: Already don't introduce separate PRED for distinct proper names ---
it's always named\_rel. Not a different kind to say we're going to do
that for common nouns as well.

Emily: Seems very different to me. The relationship between a proper
name and the individual named is different from the relationship between
common nouns and the class of entities they describe. Propose instead:
named\_rel to wrap around transparent named entities, with
underspecified CARG; could be filled in with post-processing.

Megan: What about song titles and movie titles? *Mr. and Mrs. Smith*

Dan: WSJ example: *Your October 6th editorial* So Long LA *…* When
safely bounded within double quotes, kind of tractable. But when only
marked by capitalization, hard.

Woodley: The only reasonable way to handle these is with a preprocessing
step that flags these for you. But that's not the same as using the
preprocessor for everything.

Zina: Can still have a preprocessor for NEs and still look inside them.

Dan: First version of this will be in 1212 release of the ERG.

Woodley: Would be nice to normalize in post-processing so both types
look the same in the output. (Plus flag saying who's responsible for
guessing them.)

Dan: Would named entity grouping rule also apply to *John Smith*?

Emily: Yes, ideally.

Dan: What about *John and Mary Smith* ((John and Mary) Smith) and (John
and (Mary Smith)) -- real ambiguity, but where does the proper\_q
introducing rule apply in the left-hand case?

Emily: Left-headed analysis of ((John and Mary) Smith)?

Dan: Yes, has to be.

Emily: So quantifier points to coordinated entity.

Dan: How do interpret that quantifier? What work is the proper\_q doing?
Seems like it's something about info about what to look for in the
model. And if there's just one for *John and Mary* doesn't that mean you
can only go look for the group *John and Mary* and wouldn't you want to
find just John in addition?

Emily/Woodley: Two cats fought. That's just one quantifier, for multiple
individuals.

Dan: proper\_q is not any quantifier, it's a hunting license.

\[... tennis match ...\]

There may be consequences about whether we do the wrapping early or late
in the case of multi-name named entities.

Woodley: *General Electric announced a new car.* *The president made the
announcement.* Isn't that pointing back to part of the larger entity?

Dan: Not convinced that that's the same.

Dan: More generally, like the packaging idea, and leaving to post
processing the question of whether to preserve the *house* or *voice*
ness of *the House* or *Voice of America*.

Zina: Put in info about type?

Dan: Don't want the ambiguity that comes with Pacific\_ocean and
Pacific\_company

Zina: Preprocessor could tell you?

Dan: Is it infallible?

Zina: Value of that attribute is a ranked list of possible classes.
Still just one entry.

Prescott: That gets fragile; mixing in stuff the grammar doesn't care
about. (The grammar doesn't have constraints that would interpret it.)
Just a decoration.

Zina: But we have other kinds of decorations.

Emily: Could come in afterwards if it's a decoration. Doesn't have to
come in before parsing.

Woodley/Prescott: Might be easier to do later on, with the info from the
MRS.

As we were wrapping up: Discussion of how the "wrapper" rule might help
solve the problem of post-modified nominal projections in the pre-head
position of compounds: *a University of Washington professor* If the
"wrapper" rule doesn't copy up the information about the
post-modification/complementation when creating the named entity phrase,
it could make these systematically eligible for that position, on the
named entity reading.

Last update: 2013-02-28 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/RmrsNes/_edit)]{% endraw %}