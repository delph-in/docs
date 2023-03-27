{% raw %}## SIG on Wh Extraction, pied-piping, superiority, Wh questions library

Present: Olga Zamaraeva (OZ), David Inman (DI), Emily Bender (EB),
Antoine Venant (AV), Kristen Howell (KH), Guy Emerson (GE), Berthold
Crysmann (BC)

Scribe: Emily Bender

OZ: Phenomena where other constituents can come along with the wh word
in extraction (required or optional). Russian has optional pied piping
of NOM with wh determiner.

DI: Can you also say: “Good Masha gave to Ivan book”?

OZ: Yes.

DI: So this might just be part of Russian allowing discontinuous noun
phrases.

EB: But what’s interesting here is that something can come along with
the wh word.

OZ: When looking at embedded questions, things get more complicated — ex
(3) v (4). Could “you say” in (3) be something different?

EB: Could be a parenthetical, which would put “at which” and “hour” in
the same clause in (3), and so the discontinuous NP thing is clause
bounded, and pied piping of NOM with “which” becomes required.

OZ: So my library says…

EB: Discontinuous NPs are not your problem (for this library), so you
under generate (disallowing (3) and (2b)).

GE: Especially if you can get that discontinuous NP with a different
determiner, like “at that you say they arrived hour”.

OZ: Yes.

\[Moving on to superiority effects\]

OZ: Why aren’t we contrasting (1a) with (5)?

EB: Because non-subject wh questions require subj-aux inversion. You
can’t say “What did Kim?” either.

DI: English specific?

OZ: Usual claim is that Bulgarian and Serbo-Croation have superiority
effects, but it’s always the same few examples. Russian doesn’t. ‘What
who did’ looks worse in Russian than ‘Who what did’, so maybe those
judgments in Bulgarian and S-C are iffy.

DI: Ask a non-linguist to say it, and if they feel weird, then don’t put
it in your paper.

GE: But it might depend on context.

BC: Set up context where the order of patient-agent is salient in the
context.

BC: German happily fronts objects anyway, and don’t have superiority
effects. English has a strong clustering of subject properties with
topic…

EB: But wh words are always foci, so topic isn’t relevant here.

BC: Point taken. But you get strong subject first ordering preference
out of that association…

OZ: Berthold, do you agree with these German examples? (slide 6)

BC: Both are okay, but “der Peter” isn’t my dialect.

OZ: So I shouldn’t do superiority in my library?

EB: Indeed — allow multiple wh questions with the right flexibility
about how many can extract, but don’t worry about modeling superority.
Include in your testsuites, but just say I don’t get that far.

OZ: Because the data isn’t clear anyway.

EB: Yes, and if someone were to try to model it on top of your library,
it’s probably a question of adding constraints, so that’s fine.

BC: How about: “Helen tried to figure out what device which patient
ordered.” Also similar cases in German. From paper Häussler et al 2015
“Superiority in English and German”.
<https://onlinelibrary.wiley.com/doi/full/10.1111/synt.12030>

GE: Multiple wh questions already require a lot of context to be
sensible.

\[Discussion scribe missed about people wanting distinction in meaning
between “who what did” and “what who did” in Russian but the contrast
seeming to have to do with information structure.\]

BC: Those S-C examples also have suspiciously short wh phrases (just a
single word) and longer ones might work better.

OZ: Adding the (general) focus particle makes some of these better. “Who
arrived where” If you put “where” before “who”, maybe it’s not so good
but adding the focus particle next to “where” it sounds a bit better,
but even without it it’s okay.

OZ: Back to German example (from Yehuda Falk 2012 “Superiority Effects”
)

BC: (b) is worse, as I said before, but wh words from the same clause
can go in either order, but here the object wh word is from the embedded
clause. Want to remove complementizer and proper noun….

EB: As a general rule, these kind of fine-grained distinctions aren’t
compatible with a Matrix library.

GE/DI: What about resumptive pronouns? Fun but more work. Eg: “Who did
Kim say Sandy saw them?” (EB: star for me!)

EB: I think cross-linguistically this is more common with relative
clauses than wh questions, with some languages doing “The dog they saw
it barked.” but you don’t like “Who did you see them?” right?

GE/DI: Yeah, that’s out.

OZ: Displaying current questionnaire … remove stuff on superiority.

EB: Yep! Also, you might want to clarify that the first two sections are
about wh questions where the wh word stays in its own clause.

OZ/EB: Is the subj-aux inversion in matrix non-subj questions only
pattern too English specific to include? Maybe. Are there other matrix
v. embedded differences that motivate keeping those two separate in the
questionnaire?

\[Back to pied-piping\]

OZ: Clausal pied-piping: (81a) in Szendroi on Basque: who write aux-comp
book say aux Peio, meaning “Who did Peio say wrote the book?”

OZ: I’m suspicious about examples with ‘say’, even with that
translation. “Who wrote the book, Peio said?”

EB: What’s interesting here is how to associate the wh-ness of ‘who’
with the matrix clause. Pied-piping of the clause would get this.

OZ: Should I allow pied-piping of clauses?

GE: 81a could just be in situ? Clause fronting + wh in situ would get
you that.

BC: I would in general steer clear of whatever’s been said about focus
on Hungarian. There’s something dogmatic about there being only one
specific position…

\[Back to questionnaire}

EB: Pied-piping question should be something like:

Do you get pied-piping of NOMs with which? \[ \] optionally \[ \]
obligatorily \[ \] not at all Do you get pied-piping of Ps with wh
complement? \[ \] optionally \[ \] obligatorily \[ \] not at all

OZ: Should that be once, or separate for matrix/embedded/extracted from
embedded?

OZ: Back to (3) & (4), do we need do we need to say that Russian
requires pied piping for out of embedded, but optionally in same clause?

GE: But treating discontinuous NPs as a separate phenomenon, which
intersects.

BC: Serbo-Croation: Gerald Penn 1999 paper on domain structuring. Also
clause-bounded

OZ: So it sounds like pied-piping choices should be across the board?
Current version allows more flexibility, but but less theoretically
satisfying.

GE: Also more user-friendly.

OZ: And developer-friendly, too! Need far fewer regression tests…

BC: If English prime was good enough for Montague, then Russian prime
should be good enough for you :slightly\_smiling\_face:

Last update: 2019-07-18 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/CambridgeWhQLibrary/_edit)]{% endraw %}