{% raw %}# A modest proposal for proper nouns

by Francis (see also [Ann's Modest
Proposal](https://delph-in.github.io/docs/summits/TheAbbey_Chrysalis2014SchrodingerMrs))

- Get a very large Gazetteer --- try to find something that updates
itself (LOD)
  - try to curate/treebank at least some of them
- Parse it with the ERG
  - the ERG now only very nominally marks proper nouns
  - lose named\_rels
- things that don't parse into some kind of useful thing
  - create a word with spaces

e.g.

    "if on a winter's night a traveller"
    "the the"

- For other things, we try to apply the parse as an idiom\_style rule
- so e.g.
  - *New York* New(e,x) York(x)
  - *Bill* Bill\_n(x)
  - *Grumpy* Grumpy(e,x) thing(x)
  - *University of Washington* University(x) of(e,x,y) Washington(y)
  - *From* From\_n(x)
  - *Devour* Devour\_n(x)
  - *The Cathedral and the Bazaar* cathedral\_n(x) and\_c(x,y)
bazaar\_n(y)
  - *Under* under\_n(x)
- Keep them both in some way --- this is not yet clear
  - Partially inspired by the RMRS doubling up (and idioms)
- nice to have this available to the treebanker
  - (maybe when down to a few hundred trees)
- possibly matching flexibly
  - *Secretaries of State*
  - *Universities of Washington and Delaware*

We need to think more about:

- how to get the gazetteer(s) FCB: maybe Babelnet for a start
- backup processing for NEs not in the gazetteer(s)

## The discussion that led up to this summary

\[Minus the real science that got done over coffee, but is summarized
above.\]

Proper v. common nouns

Dan: Current state of play, never mind quantifiers, is that we have a
named\_rel with a CARG value. If it's a multiword proper name, we
represent the spaces with +: CARG New+York. This is tempting if we're
working with Kim and John and Mary and more vexing if we're working with
something like *The Secretary of Peace just declared war on
Afghanistan*. That's alright, just make CARG peace named\_rel and it
doesn't mean peace. Even company names don't necessary mean what they
seem to mean. They're just made up names. Freedom Foundation, British
Broadcasting Corp. But that's a slippery slope/blurry line. It might
well be that the Dept of Defense is a dept involved in thee defense of
the nation. Seems disingenuous to just say what the orthographic strings
are. Sometimes in the same sentence *The Dept of Defense has indicated a
willingness to fund this project, but the dept of defense will run out
of funding soon.* Sometimes not consistently capitalized, doesn't mean
they're different.

Woodley: Also *the Departments of Homeland Security and Defense*

Francis: *Finally I must admit that I nearly called this essay The
Cathedral and the Agora, the latter being the Greek word for
marketplace.*

Dan: The task of annotating [DeepBank](https://delph-in.github.io/docs/garage/DeepBank) led me to think this is
broken/not scalable. Can't keep it consistent from one paragraph to the
next, even if conventions written down.

Dan: My modest proposal is to abandon named\_rel in its entirety. Have
every predication directly reflect the orthography of the word that gave
rise to it: \_Paris\_n\_rel, and then add an indication that it was
capitalized, maybe that it's a proper name. Maybe fiddle with
quantifiers?

Emily: What about syntactically weird proper names?

Dan: An example would be foreign terms: Gaz de France. I frankly don't
know how to do that. Previously unsolved problem.

oe: Even if you go away from manually constructed multiwords, this could
be the exception. For frequently occurring expressions that can't
otherwise be analyzed. Then it can have \_Gaz+de+France\_n\_rel.

Woodley: What about ordinal numbers in a name: *The 175th Cavalary*,
*The 39 Steps*?

Dan: We've always treated integers in a consistent way. 39 is cardinal,
steps was proper name, now is \_Steps\_n\_rel.

Emily: Are there times when the syntax tells us this has to be a proper
name, and would we be losing that info?

Dan: *Red Dog just read up on his motorcycle*. Proper name rule is still
involved, so if there's no overt quantifier (and the N is singular) can
introduce the proper\_q\_rel.

Emily: udef\_q then interpreted as underspecified between common and
not, but proper\_q\_rel is more specified.

Dan: *Brown chased Chang*; can get a tagger to say that the unknown
words are likely proper names, put in proper\_q\_rel in because they're
capitalized non-plural nouns. The semantics would look similar to what's
there now but no named\_rel.

oe: Would no longer need noun native lexical entry.

Dan: Remove the danger of misannotating.

Francis: Potential downside is that we're saying less about things.

Dan: Giving all the info currently, but broken up a different way. This
is \_kim\_n\_rel and orthographically capitalized.

Woodley: Where hang the capitalization information?

Dan: Can figure that out.

Francis: If the first word in a sentence?

Dan: Ambiguous.

Emily: Ambiguous or underspecified?

Dan: Underspecified (if there's nothing there to disambiguate).

Francis: So taking out New+York?

Dan: Yes. That didn't scale.

oe: Removing the distinction between common & proper nouns.

Francis: For languages like Japanese, where there's no orthographic
distinction.

oe: Upside: Less ambiguity. Downside is that in most object languages,
these are considered different things. What about in the adjective
space?

Dan: Have to list what can be adjective.

Emily: Would still have the caps/no-caps info.

oe: Better example: *The Green Party*

Dan: I would produce \_Green\_n\_rel. Not eliminating ambiguity… colors
are vexed.

Francis: *The New Party*

Dan: Still getting two parses: \_new\_a\_rel (+caps), \_new\_n\_rel
(+caps).

Emily: Why do you need two parses there?

Dan: Because *New* doesn't mean new there.

Emily: What about *Air Canada*?

Dan: And *Swiss Air*, now owned by Texas. The name has nothing to do
with anything Swiss, but they still want to call themselves Swiss for
marketing purposes…

Emily: *Air Canada* and *Swiss Air* should be exactly parallel.

Dan: Canada is uppercase.

Emily: You can do that for Swiss too.

Dan: I need Grumpy as a noun in *Grumpy just walked in*.

Emily: NP -&gt; A rule, which would remove the ambiguity for *The New
Party*.

Francis: *He is a Very Important Person*.

Dan: There will be two readings there.

Francis: Do we get two readings there?

Dan: Yes in the current version, where \_Very\_n\_rel and
\_Important\_n\_rel come in because of the caps.

Dan: To construct the more opaque semantics would need the rule to be
able relate \_Very\_a\_rel etc.

Emily/oe: But that's a way to keep getting more than one analysis. Why
do you want more than one?

Emily: *Swiss Air*/*Air Canada* should be parallel.

Dan: Because we'll meet *Very Smith* one day.

Emily: So the real problem is that there are unknown proper nouns that
are spelled the same as any other word in the language.

oe: Jan Tore's trick for numbers in names could be applied to adjectives
to remove the ambiguity there.

Dan: Doesn't scale. Why not do it for every word in the language?

Emily/oe: But you're trying to do something special for nouns, so we're
trying to push you down that slippery slope.

Dan: Because I have a way to put nouns together into a compound name.

Emily: Why not attach the adjectives as adjectives and the pump *Swiss
Air* to proper NP the same way *Smith* does?

Dan: But what about *the Under Book*.

oe: We're not being very effective at keeping the discussion focused on
adjectives…

Emily: He's trying to pull us down

Francis: Do the two nouns in a proper name compound each refer to
something.

Dan: What about *the Afraid Team*… (non-attributive adjective)

Emily: I agree that you can't scale this to all proper nouns, by why not
do it for adj+N if you're doing it for N+N?

Woodley: If the compositional analysis is very different from what a
name representation should be…

Emily: Ah, so you have an intuition about what proper names should be.
From where?

Woodley: Because I want them to be opaque.

Emily: What about titles like *How to Train Your Dragon* --- I hear that
and know they're referring to a title, but also I get something from the
internal structure. And people wouldn't call it *Train to How Your
Dragon*.

Dan: People do.

Emily: That's marked, though, and you can tell when it's happened.

Francis: If you could make one long CARG how+to+train+your+dragon, if it
it were possible.

Dan: The grammar doesn't give one entity for George Bernard Shaw, but
rather representations that have structure.

Francis: We want *How to Train Your Dragon* --- still pointing to one
thing, but the internal structure is not noun-compound, noun-compound,
noun-compound etc. We can do things internally with these structures,
because they're compound nouns (George and Franke Bernard Shaw), but we
can't for *How to Train Your Dragon*, because it's not noun compounds.

Dan: How do you decide which grammar rules can be violated… it's a
slippery slope!

oe: No, I think that's a lost cause.

Francis: I can see the slippery slopes… it doesn't slow me down at all.
\[straps on roller blades\]

I'm prepared to accept that we do that, but I'd like it to be
acknowledged. I believe you can do things to proper nouns that you can
interpret that you can't do to ones that you can't. We're losing
something if we're not modelling it, but we're always losing something.

Last update: 2014-06-03 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/TheAbbey_Chrysalis2014ProperNouns/_edit)]{% endraw %}