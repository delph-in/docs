{% raw %}\[See [SingaporeSchedule](https://delph-in.github.io/docs/summits/SingaporeSchedule) for link to slides\]

Francis: Can you recite Jabberwocky or something?

Ann: \[Recites a truly impressive amount of Jabberwocky.\] (The whole
thing as far as I can tell -EMB)

Dan: Now you're just bluffing.

Mike: \[Presents from slides\]

Tuan Anh: One of the most important ways for SMT folks to sell their
system is broad coverage, robustness. Can we do something like that with
our system where we generate lexical entries and revise manually or use
fake rules to provide an analysis no matter the input? We did something
very similar with unknown word handling and bridging rules, but we can
we have something even more than that, so we can give a complete
structure as the output rather than just fragments?

Mike: We have some strategies to help with robustness in parsing, but
there's probably more to do in generation (no bridging rules
equivalent). We like to claim that our systems provide better output (as
humans would evaluate it). What Francis et al do in evaluation is only
look at the ones where we get an answer. Can always back off to the best
statistical system if we can't find an output.

Matic: Thoughts on robustness in general. The aim of my work is improve
statistical MT. I'd like to see an improvement on hierarchical
phrase-based systems. It's assuming that semantics won't be able to get
things right all of the time, so I don't rely on it solely. Basic
approach DMRS-string rules in synchronous CFG. This is combined with a
standard string-to-string SCFG that is part of a state of the art
hierarchical SMT system. Then combined with a linear model to pick with
output to give. A bit of a different view from Mike's.

Mike: So you're getting something for every input; don't have to worry
about backing-off.

Matic: Even in a case where the parser might not give a DMRS (because
input is broken) it will still work fine. Even if the output is not
reliable, we still hope there will be outputs in the final language.

Ann: This is a case where it would be useful to be able to do something
even if the parser couldn't find a complete spanning structure. The
system could do something with a partial DMRS if we could get it. Still
more of a robust system than just backing off to the SMT approach when
the system fails because you can't have the best guess of both systems
merged, but we could make it use more of the parsing potentially by
having some sort of robust output that said I've got a good DMRS for
this bit.

Emily: Matic, what language pairs are you working with?

Matic: My first language pair for translation is English to German.

Emily: So English to X, but starting with German?

Matic: Yes. Plan was maybe to do English to Japanese in the future. For
Japanese to English, the coverage of the grammar (for Japanese) might
not be high enough. Need high enough coverage to make
differences/advantages of the semantics-based system visible. Maybe Jacy
is big enough now.

Francis: A very small comment: Our story was always that we would back
off to an SMT system when we needed. In practice, system was never used
by a customer who needed that. Focused on getting better outputs for the
sentences we could parse, so long as that number wasn't embarrassingly
small. &gt;20% coverage, willing/possible to publish.

[TuanAnh](/TuanAnh): We always we say that we use SMT as a back-up. But
what if within the sentence we only have one unknown word? We fall back
to the SMT when we don't really need to do so...

Francis: We already have unknown word handling in the grammar, so we
don't fail just because of not knowing just one word. Unless it's a
really weird word.

Mike: What if you have a lexical entry, but it's not the one you want?

Francis: Depends on settings in the unknown word handler.

Woodley: When you tried to train on more than two sentences, things got
too slow. Training hard or decoding hard?

Mike: The decoding. Over 100 (or maybe 1000) sentences, decoding had too
many options to consider. Not doing enough pruning (EMB: yet).

Woodley: You said we don't know how to align MRSs across languages. Have
you tried doing that?

Mike: The problem isn't that it's different languages, but that they're
graphs (and not sequences, etc) --- can't use Giza++ or whatever.

Woodley: A hard problem, I'm working on it...

Mike: I tried, asked \[name not caught\], and he suggested linearizing.

Francis: Mathieu Morey who was relatively knowledgable about graphs and
in the beginning relatively confident. Didn't get something that worked
fast enough before (early) end of [PostDoc](/PostDoc).

Woodley: I've proposed a SIG.

Mike: I think Glenn also had something about using SVD.

Francis: Eric Nichols and I try tried translating what we could and then
aligning things. And it sort of worked, but then he went and graduated
and stopped working on it.

Mike: \[Displays DMRSs of English *The dog whose tail wagged barked.*
and Japanese translation *尻尾を振った犬が吠えた*.\] They are
translations, but the structure is interestingly different. Easy to get
*the dog barked*, *the tail wagged/was wagged* slightly more difficult,
the relationship between the two clauses even more so. Point is that I
need larger subgraphs: Just triples isn't enough to get an accurate
translation; probably need a depth of four.

Francis: Three to one is common.

Emily: Three what?

Francis: Predicates.

Emily: So you need depth two (after clarification with Mike) to capture
those.

Woodley: So which part of this requires depth four?

Mike: Maybe there is enough to get all of it with depth three. The
longest bit: **dog to wag to tail to quantifier**

Francis: Don't we also want the possessive in the translation?

Mike: That would be in the depth three.

Woodley: dog to poss to tail could align to dog to rel\_p to ... sorry.

Ann: What did the hand built transfer rule look like for this example?

Francis: It doesn't. Not a hugely common construction.

Mike: My favorite example because of the non-directed eqs, and not too
complicated. Woodley did a corpus study and found more than expected
prevalence of undirected eqs or cycles.

Woodley: I don't remember doing that.

Francis: One of the things we looked at was various ways of saying maybe
some of these predicates are less important than others (e.g.
quantifiers). With the thought in the back of our head that not all
quantifiers are as interesting as others (ignore udef\_q etc). Early
experiments found the alignments useful, I thought.

Mike: Completely ignoring them yielded strange realizations.

Emily: Very reminiscent about simplifying DMRSs.

Mike: SIG about this.

Guy: I think Matic has been removing the udef\_q\_rels.

Mike: Also in the area of translation in DELPH-IN, I brought up WSD. In
Japanese, the same word is used for meow (the cat meows), bark (the dog
barks), and roar (the lion roars). Don't want to do that in a hand-built
fashion. I'm also wondering if we can add in [WordNet](/WordNet) sense
IDs and then do [WordNet](/WordNet)-y things like going up the tree to
senses that might be in the model. Any thoughts on integrating external
ontologies?

Francis: It's definitely one of the motivations for doing it. We don't
yet have anything that gives us senses well enough to be able to do
anything useful yet, but it's a medium-term goal of ISF.

Prescott: You mean going up an ontology to find a more general term for
an animal making a sound?

Mike: For one thing, our predicates are underspecified (e.g. between
river bank and financial bank). Also in context you can find a more
appropriate sense.

Mike: Has anyone tried to map our representations to something like
[FrameNet](/FrameNet) or [OntoNotes](/OntoNotes) so we can compare our
representations to what other folks are doing?

Prescott: AMR is pretty simple. Do they have mismatches to contend with
as well?

Mike/Francis: They use senses from an ontology, but only for verbs, but
lots of nouns are represented with verb senses.

Mike: Instead of something like neg\_rel, they have :polarity -, and
richer set of edges between things. :location, :domain, etc. About 100
of these.

Emily: I've lost the thread of what this has to do with MT.

Mike: Just talking about external ontologies.

Francis: One thing that was a strength for rule-based MT was that we
were able to make little hierarchies for things we wanted to
underspecified, e.g. much/many which isn't distinguished in Japanese.
can/be-able-to, few/a-little. It would be nice to to try and learn that,
but rather to use the abstractions we have. So ways of integrating that
into the SMT system even if it's just saying "use this rule as well".
Had lots of rules like this.

Emily: What about doing a tiny bit of transfer on the English side of
the bisem, and then learn over that?

Francis: We did something like that for learning the language model. Dog
+ quantifier gives 'a dog', noodle + some kind of confine 'noodles'.

Mike: Anything else to discuss?

Ann: Is there anything specific we should be doing about collaborating?

Francis: It would be useful to list the simplifications or things you
ignore and also these generalizations (maybe useful for Matic?). See
where just putting a little bit of human knowledge in the loop gets you
a big boost (don't know enough about German to predict; very
language-pair specific).

Mike: If we're doing the same language pairs, share data sets.

Emily: Use the wiki?

Mike: Are you using pyDelphin for the simplifications?

Matic: Yes.

Mike: So we could probably share code as well. E.g. functions for
simplifying DMRS.

Matic: I have a github repository pyDmrs that implements some of those
things. Would be open to sharing more of that.

Francis: One of the things that made an enormous difference in LOGON was
the transfer ranking model. As I recall something as simple as unigrams
over MRS predicates for a language model got a \~2 figure BLEU score
win. Anything that could be used as a LM on MRSs could have many
applications. How close is what you're learning to a monolingual MRS
model?

Ann: One could presumably at least get the training data by generating
from the MRSs, assuming you can, then doing a language model on the
strings, and then using that to train an MRS ranking model. But we're
doing ranking on strings in terms of the LM at the moment.

Mike: I think I have the tools to make a LM based on semantics instead
of strings. It's something I'd like to do but haven't started yet.

Ann: It all depends on how complicated you want to get. At a simple
level you would do it on the basis on the predicates only.

Francis: That's what we were doing, I think.

Ann: Then you could do a few of those cases like the eating v. drinking
like things. Could probably cherry pick the ones that make the most
difference.

Francis: Or even build a model over pairs of MRSs and the relations
between them.

Ann: The advantage of LM trained over strings is that you've got lots
more string data. Don't want to have to parse huge quantities of data,
but learn from the ones where you do have the MRS-string mapping.

Francis: Using it to filter MRSs before generating, so don't want to
generate the strings. Already feel committed to parsing vast quantities
of data...

Mike: Can decompose an MRS into little subgraphs and check how often
they appear. Interpolation by breaking subgraphs into smaller bits.

Ann: I understand you want a LM on MRSs and that seems quite right, but
the question is whether you could actually train that model on a very
large amount of string data as well as directly on the MRSs. That's the
way you're going to get the fine-grained sense distinctions to the
extent that they work already for SMT.

Mike: My hypothesis would be that auto parse selection, even over
bridged analyses, could get a useful enough MRS.

Emily: It's not just grammar coverage, but also just processing time.
Can always crunch through more string data than parsed data.

Ann: For things like binomial order or adjective order, don't need
parsed data. And then at least potentially that could be transferred
back to an MRS LM.

Emily: Do you have ideas about how to do it in the MRS?

Ann: That example is an instance where it's surface order you're
interested in, not preserved in the MRS. But if you were talking about
other cases where the MRSs were different so the MRS LM idea makes some
sense, then it's going to depend on how complicated you want to get. At
the simplest level, just a unigram model based on the predicates.

Francis: Classic example: *強い tsuyoi* (strong or powerful), but for we
want to rank MRS for *strong tea* over *powerful tea* before generating.
Unigram frequency might not be enough.

Ann: In this case, you just need alignments of very small bits. Could
say: I'm going to learn Adj-N combinations, V-subj combinations, etc.
Have an LM trained on lots and lots of data and have just enough
connection between LM and MRS that you understand it's going to
correspond to the ARG1 and then go back from the LM to the MRS. For
limited cases that should work fairly straightforwardly and it should be
relatively easy to work out which those would be.

Woodley: 'strong tea' v. 'powerful tea' is within the power of the data
we can parse, namely [WikiWoods](https://delph-in.github.io/docs/garage/WikiWoods). 30 instances of the former,
none of the latter.

Last update: 2015-08-10 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/SingaporeSmtModel/_edit)]{% endraw %}