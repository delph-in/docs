{% raw %}# Discussion: Grammar Documentation

## Lead by: Melanie Siegel

dan: the meeting is called to order. this will be a \*real\* discussion
(wp: unlike yesterday?).

melanie: this discussion connects to the jacy book presentation. basis
for discussion: why document? some reasons:

- similar phenomena in different languages
- consumers need to understand our outputs
- scientific reputation

hard to get into ACL, maybe easier to just document on our own

emily: it’s worth trying to publish in ACL etc; don’t see many perhaps
because people don’t try

melanie: LTDB is a useful start. set it up for your grammar!

francis: not hard to set up. current lkb source tree version out of
date. lex types and rules clickable at top, but all types can be
documented this way, e.g. "sign\_min". slightly hacky: put documentation
commented out in front of TDL. pending improvement: documentation string
that LKB and PET support but ACE doesn’t.

woodley: huh?

dan: like this:

type := parent1 & parent2 & "documentation" \[ constraints \].

mike: '&' has to be before doc-string?

woodley: has to be nothing but documentation on a line?

dan and francis: yes, yes.

melanie: lexical entries. would like an extension to LTDB or web demo
that can show me feature structures for lexical entries, without having
LUI or CLIM running.

dan: seems to require ACE+LUI in background.

woodley: TJ Trimble has this.

dan: let’s tell him there’s an eager customer.

melanie: document the performance of the grammar. coverage, preciseness
and beauty, usability. how? one possibility: book like the jacy book.
another possibility: collaborative document like wiki. fosters
discussion, e.g. "I did it this way, what do others think?".

corpus annotation, treebanks to demonstrate performance of the grammar.
"automatic documentation"

francis: automatic method to find provenance of specific constraint in
an AVM

emily: not too well defined; can be several sources

dan: has been on feature request list for LKB since 1997, supposedly
really hard at least in a few corner cases.

francis: even a 97% solution would be great. would be really useful for
people starting with new matrix grammars.

melanie: performance demonstrations — heart of gold, demophin, erg/lingo
online demo, online apps using the grammar. put effort into interface
designs.

woodley: demos are qualitatively different from documenting the
internals of the grammar.

melanie: we need both.

emily: I often go to the demo to find out "what does dan do with this
sentence?". not exactly documentation, but it’s really helpful for
understanding how the grammar works.

dan: can link our grammars to written reference grammars, e.g.
Huddleston and Pullum. whatever the best available descriptive grammar
is for your language. inline grammar documentation can point to "chapter
7 of …". might be able to do this semi-automatically by parsing example
sentences in the textbook. bits of the grammar that light up point to
the place in the reference grammar where that example sentence
originates, perhaps using ned’s typediff system. can do this
automatically for lots and lots of reference material.

emily: you want ODIN for this. IGT harvested from lots of PDFs on the
web, preserving provenance.

francis: for english??

emily: well, no.

dan: only interesting languages.

hans: stefan müller would be interested in this linking stuff.

francis: Christian Chacos (sp?) works on linking corpora to ontologies.

hans: he’s good, works on borderline between linguistics and linked open
data

francis: he has a delphin-aware person in the group, possibly interested
in using delphin stuff for this project.

emily: ERG semantic documentation. not documenting how the grammar is
built, but documenting what comes out. user-oriented, rather than
grammarian-oriented.

dan: you may not have noticed that each discussion on ESD has "semantic
fingerprint" which lets you search for that phenomenon in a corpus, e.g.
find me everything with a restrictive relative clause. establish a
unique fingerprint for each phenomenon. challenging to get the right
level of abstraction — e.g. compounding: are common noun compounds
distinct from title compounds? working system that is a good way to test
whether your proposed fingerprint is accurate.

hans: does it search syntax too?

dan: only semantics. interesting syntactic phenomena are harder to read
off a derivation tree. but the semantic search is a useful tool. it
turns up bugs in the grammar (like turning on the generator). helps you
think about the crucial properties of the MRS you design.

emily: the matrix can provide some building blocks that match similar
fingerprints.

melanie: this is documentation for grammar engineers.

dan: yes, but also for comparisons between grammars and languages.

emily: also for users of the MRS.

dan: people who are interested in under-resourced languages may have an
easier time starting by looking at the semantics of a language they
don’t know than looking at the syntax. having the pairing of a surface
string and MRS is a good door into the grammar.

emily: how would someone with a grammar and a treebank set up one of
these fingerprint search interfaces for their own grammar?

dan: only stephan and milan know. maybe some minimal documentation on
the wiki.

melanie: do grammarians work on their own usually these days as opposed
to collaboratively?

emily: zhong has multiple people working on it.

francis: sanghoun helps everyone. at least 2 people involved in each of
our grammars.

hans: antonio branco had lots of people working on portuguese

dan: BURGER is almost exclusively petya, ERG is just me, GG is just
berthold, etc can we exploit documentation to enable multi-person
grammar writing? might help with succession planning. some successful
succession stories: jacy, lisbon, norsource? francis or sanghoun maybe
can help illuminate documentation’s role in collaboration, relative to
face-to-face chats.

sanghoun: what we did was very simple. I talk to people in person; I
send email to developers@ frequently; I leave my "fingerprints" on the
grammar.

dan: do you record things like "I changed this feature on this date for
this reason, this works better now."

sanghoun: my "fingerprints" encode that kind of information, though
perhaps not tightly formatted.

francis: people do fine-grained commits in github, ideally. sometimes
not everyone is familiar with git enough to keep up with that.

mike: I encourage people to do detailed commit messages. also, use bug
trackers — it helps manage discussions. although that’s not directly in
the grammar.

dan: I haven’t relied on any particular version control mechanism in the
ERG; my revision history isn’t very informative. instead, archeological
layers of sedimentary comments right in the TDL. not perfect, since
things get moved around and I’m not perfectly consistent. permanence is
nice, not always easily accessible/discoverable. probably a better
policy to keep fine grained commit messages in version control.

mike: there’s old comments in the TDL about changes that don’t exist
anymore; delete them?

emily: no, don’t; those record paths explored in the past that were
unproductive.

francis: some comments in jacy are confusing. it’s well document about,
e.g. adding messages. but sometimes searching you find hits for things
that aren’t in the grammar anymore. I’d like to get rid of them.

mike: out of date comments worse than no comments.

emily: ok, maybe get rid of some. be cautious though. timestamps can
help.

mike: create a bug report before fixing the bug, so you can have links
between the issue tracker and the code. then you can later see the diffs
automatically.

emily: in 567, I encourage students to document things that have changed
in a structured way, e.g. about a particular phenomenon. those notes are
in language COLLAGE.

francis: one goal of LTDB was to have unit tests built in, in the form
of positive and negative sentences.

woodley: great idea.

emily: the inline documentation looks like clutter to me.

emily: when documenting lextypes, it’s easy to say this type belongs to
this phenomenon. harder for phrase structure rules. it’s hopeless to try
to say "the hdcmp rule belongs to these 5 phenomena." but for lexical
rules it may be reasonable.

francis: debated external vs inline documentation. when we tried
external we found we didn’t keep it up to date.

dan: there shouldn’t be much TDL there actually; real constraints should
be in supertypes. the "clutter" documentation is most of the content in
these files, for me.

emily: isn’t it a goal to have this type of documentation on all types,
not just the lexical type hierarchy yield?

francis: to a lesser extent.

chris curtis: this is not just about documentation; it’s also about
development process. it’s about software engineering discipline.

dan: yes, we could probably draw a lot from software engineering best
practices.

Last update: 2015-08-04 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/SingaporeGrammarDocumentation/_edit)]{% endraw %}