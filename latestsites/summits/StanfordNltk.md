{% raw %}This is a partial transcript of the SIG for incorporating DELPH-IN into
the NLTK

(scribing begins \~15 minutes after starting)

- OE: Our tokenization looks weird to most people but it's right
- Francis: I don't think we need to map our tokenization to others but
we should note it in the corpus
- OE: We've put work into mapping our tokenization, for compatibility
with PTB ‘de facto’ standard.
- OE: For example, SDP graphs (in SemEval tasks) all used PTB-style
tokenization.
- Mike: OE you would want to include just DM?
- OE: I would include MRS, EDS and DM
- Ned: Go-to format?
- Francis: the one at the top of our list is the one people will use
- OE: We should embrace plurality
- OE: IT's going to be hard to explain to someone why in the MRS for
"angry dog is fierce" angry and fierce are different predicate
arguments
- Guy: MRS and DMRS could go in different versions
- Mike: We can convert it in the background instead of distributing
the same data twice
- Guy: We're already doing that. But if we have different versions,
then we want to have DMRS separately? (More was said- scribe missed
it)
- Francis: NLTK isn't the only place people can use our things. We
point to where people can get more.
- OE we don't need to have a separate corpus.
- Francis: There is a feature structure that allows directed acyclic
graphs. It may not be efficient, but that might be the thing to use.
  - From the data we need a representation...?
- OE: We need a typed feature structure
- Francis: A DAG
- Guy: Are we trying to provide different versions of the corpus with
each semantic representation
- Francis: Space is cheap- why not include it all?
- MS: What about the input side? Preprocessing?
- Francis: If we have representations of MRS, DMRS, EDS, DM, UDF,
input is always a sentence or tokenized corpus or whatever
- MS: Is it possible to preprocess outside the NLTK?
- Francis: yes.
- Guy: We have 2 options: process the restful interface or the local
interface
- Francis: (scribe didn't hear which) is the cheap way
- OE: We have better interfaces than NLP tokenizers. I'd like to
support token lattice input.
- Francis: We should have a wish list beyond the initial release
- OE: If the goal is to introduce people to our things, that will
help. We have different layers in the parser, including the token
lattice, then there is token mapping, and lexical lookout when we do
not have tokenization.
  - We have a mature architecture. I would expect that people will
appreciate that.
- Mike: OE people give us PTB style tag, we convert it to what we know
and convert it back
- OE: We can add that at a later stage. One thing at a time
- Francis: A default NLP tagger expects a tokenized input. From the
beginning we should have a parsed string input.
- OE: That suggests that we should prioritize tagged input in the
RESTFUL API. I'll work on that now.
- Francis: What kind of processing aside from strings? Do we want a
generator?
- OE: I can generate from some DMs.
- Mike: I think generation would be a compelling thing to put in.
- OE: It's on the future list.
- Mike: It will be quick to put in. Because the back end is already
there.
- Francis: We can have a corpus.dmrs.string. I think people would use
the trees if we put the trees in
- Mike: What dataset?
- Francis: We should think of multiple languages, but I'm not proud
enough of the Japanese yet
- Mike: So ERG only?
- Francis: Dan?
- Dan: We might only put thin profiles, those are pretty small.
- OE: I would think redwoods is already a considerable volume. One set
at a time.
- Mike: Is the NLTK more Penn Treebank oriented?
- Dan: I think of redwoods as including the wall street journal. Going
forward, we should view it as a coherent whole for datasets
- OE: a coherent acquisition
- Mike: Is there a standard numbering scheme?
- OE: ours reflects the structure of the treebank
- Dan: but the answer is no
- OE: it's yes.
- Francis: the NLTK does not by default give sentences IDs
- OE: we're trying to fix that.
- Francis: Okay. So all of redwoods. Then you can filter "groves" wall
street journal, redwoods, stuff about hiking
- Dan: orchards
- Francis: sub-corpora. We should look at the existing corpus reader
- OE: that people can compare. we should support that.
- Mike: would it be possible to narrow this list of initial
representations? Do we want to go all in?
- OE: who will put in that work?
- Mike: that's the next question.
- Guy: (asked a question- scribe missed it)
- OE: Marco Kuman is proposing a catalogue of graph banks. to compute
high level graph statistics
- Guy: what's it called?
- OE: [GraphaLog](/GraphaLog)(ue). It's not public yet. It would be a
useful starting point for a unified abstract syntax. we should talk
to Marco and be compatible with that.
- Mike: I'd like to put together some plan to get this out there.
Stage 1: corpus reader, redwoods dataset, put the dataset to restful
or to ACE. Any other thoughts about what else is required?
- Guy: Do we need new data structures or can we use PyDMRSes. If we
want something more compatible with other software, I don't know
what the process is for that
- Francis: We write to the NLTK dev list, tell them what we think- see
what they think. who wants to do that?
- Mike: you're looking at me
- Francis: you're chairing
- Mike: will someone be the contact? Woodley? Ulrich?
- Ulrich: I have plans... I want to wait on the book
- Mike: version 3.0 has been released
- OE: whose using the NLTK in their teaching?

Ulrich, Francis and Melanie raise hands

- OE: then you're the beneficiaries
- OE: I volunteer to check with Marco about incorporating the
interface with the NLTK. That will strengthen our case.
- Dan: can we convince Woodly to contact the NLTK?
- Guy: I'm hesitant to take more on
- Mike: Me too.
- OE: but you're a good person for it

(More pressure from the guys)

- Mike: I need to progress with my coursework
- Francis: Not one has the burning need to do it. We agree it's a good
idea. So we wait until someone is available/wants it bad enough to
do it
- Dan: Do we have a roadmap of preparatory tests? Who are other python
people?
- Guy/Mike: pyD(MRS\|elphin) has that.
- Mike: Let's put together a wiki and a log of communications
- Francis: I'm happy to do testing and talk to people, but I/my group
doesn't have the time now to take the lead.
- Mike: I'd like to get our representation in before AMR
- OE: AMR is going to blow over
- Francis: maybe your supervisors will allow you the time to write out
a roadmap
- Dan: Will Cambridge take this on?
- Guy: we all use python, but none of us will take the lead. Ann will
be reluctant to let us
- Dan: she wants to do it herself. Why don't you (Guy) go talk to your
colleagues about taking this on?
- Francis: taking the lead isn't scary
- Guy: even if we don't have someone willing to put in a lot of time,
can we get started putting something together
- Francis: we can start thinking about the corpus reader, the restful
design, and putting our own corpus in
- Dan: I can make the introduction to Ewan Klein
- Guy: Dan can put a foot in the door and pass it over to us.
- Dan: we need to identify a point person, if we don't have that
person today, we wait.
- Mike: thinking ahead- if this gets in, how do we get in the book?
does someone write a chapter?
- Francis: yes
- Guy: the chapter of the book could refer to typed feature
structures, etc.
- Francis: it's more closed than that
- Mike: are we good then?

Last update: 2016-06-24 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/StanfordNltk/_edit)]{% endraw %}