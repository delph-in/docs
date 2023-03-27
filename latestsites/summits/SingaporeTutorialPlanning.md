{% raw %}## Goals

- Increase visibility of DELPH-IN resources
- Train people in how to use DELPH-IN resources as a component in
applications, especially:
  - ERG-based parsing
  - ERG-based treebanks/sembanks
- Create artifacts that will be useful beyond the tutorial
  - Training materials (see learning goals below)
  - Quick-start DELPH-IN packages
- Maybe: pointers to resources beyond ERG-based parsing and treebanks:
  - State of grammars for other languages (without over promising)
  - Generation with the ERG

## Target audience

- Typical ACL attendees
- Anyone using syntactic dependency parsing (of English) as a source
of (ML) features in some task

## Use cases

- MRS dependency triples as features in e.g. sentiment analysis
application
- Training a semantic dependency parser over MRS-derived bilexical
dependencies

## Tutorial learning goals

1. Understand how to set up ERG-based parsing stack, including
preprocessing.
2. Understand how to access ERG/Redwoods treebanks in the various
export formats.
3. Understand how to interpret ERS

## Tasks

### Tutorial proposal to \*ACL

- EMB willing to volunteer on leading the writing of this
- Will use developers mailing list to coordinate further effort

### Software packaging

- Mostly there between ace & pyDelphin
- Also relevant is [SemEval](/SemEval) shared task distribution
- Status of full Redwoods sets?

### Tutorial materials/documentation

- For tutorial materials, see notes in discussion below

## Notes

*Present: Emily, Woodley, Guy, Ned, Mike, Tuan Anh, David M., Chris*

*Present in spirit: Dan, Francis, Luís*

Mike: Some folks have deep-resource allergy; maybe downplay the
hand-built nature in favor of the comprehensiveness and detail of the
resource.

Guy: There is a hand-built component, but the parse ranking is
stochastic, plus CSaw can get 100%. There is machine learning in there;
don't have to harp on the dichotomy.

Mike: Avoid showing AVMs. Just say we have a "semantic parser".

Mike: My contribution would probably be with demophin and pyDelphin. We
already talked about having other people contribute to that, too.

Woodley: One of the most convincing things we could have would be
numbers that show we're good at some particular thing.

Emily: Don't want to spend too much time on that.

Guy: Just in the intro---here's ways of applying it, like the RCL task.

Emily: ERG parsing black box?

Woodley: We've had it for 5 years.

Guy: Can you make one that includes CSaw?

Woodley: Maybe, but CSaw is too slow for the public to care.

Guy: Will that change by the time of the tutorial?

Emily: Inputs and outputs in the default setting?

Woodley: Input is text, output is text + MRS and derivation tree, which
can be hidden.

Emily: Sentence tokenized text?

Woodley: Yes.

Emily: Simple MRS format.

Emily/Woodley: Used this blackbox in Ling 575 2014.

Emily: What about extracting features from the simple MRS format?

Woodley: Mike does something with it.

Mike: You can use pyDelphin to do that to inspect the MRS
structure---read the MRS in and make it a program-explorable structure.

Woodley: Someone in 575 wrote some java code.

Mike: Prescott wants to make a jDelphin package... TJ has already
started some of that.

Chris: I'm in the room and that's my interest.

Guy: It would be appealing to people to give them a blackbox that
delivers objects in python or java.

Woodley: Does pyDelphin parse ace STDOUT?

Mike: Yes, for parsing and generation, not yet transfer. In currently
crashes when ace gives a deadly signal.

Woodley: That's ace crashing too.

Mike: Could that go to STDERR instead?

Woodley: Just a signal handler for segfault etc. Could just ignore and
the shell would catch it. Point is to export the sentence.

Mike: I might even be conflating STDERR and STDOUT.

Woodley: But it would be helpful to have ERROR: at the start...

Emily: We have a blackbox, but people are not discovering it.

Woodley: And MRS in program readable form it's a two-component almost
black box for now.

Emily: Could we make it into one thing in time?

Woodley: Tarball, with a sample program for parsing a sentence and
getting the MRS out?

Mike: Shell scrip that loads ace with the ERG? No, because we want to
interpret the output somehow.

Guy: Have it so that people can follow along hands-on in the tutorial.
ace+ERG, pyDelphin, basic script.

Mike/Chris: Back to jDelphin. TJ's jDelphin as yet empty (on github). We
should talk to TJ/Prescott and see if they're prefer to work with
Clojure.

Chris: At the risk of adding feature requests to Woodley's stack: how
hard is it to add a slightly different textual structure to what you
output?

Emily: For example?

Woodley/Chris: json, xml, edn (midpoint between json and xml).

Mike: Even more esoteric...

Chris: The nice part about it is that it's very parseable and easy to
generate. All the friendliness of json (convertible to json) but you
don't have to deal with the machinery of xml.

Mike: Python has standard json, xml reader libraries, but not for edn.

Chris: Many languages have one for edn. For an internal interchange
format, there are some advantages. But there's no reason why it can't be
json.

Emily: The bridge is already there between ace and pyDelphin in text...

Woodley/Mike: With slight headaches; a little different for generation
and parsing.

Woodley: For humans reading it, it's nice how it is.

Chris: Flag not a default.

Woodley: Three more code paths to maintain.

Guy: Are you imaging people want to use things other than pyDelhpin or
jDelphin?

Chris: Just thinking in terms of the easiest way to rehydrate the output
from ace into something to pass around within a native environment.

Woodley: Everyone's going to have their own funny language they want to
use. It is worth having the ace output very well documents.

Emily: Simple MRS isn't?

Woodley: Yes, it is, as is the derivation tree format. It's the little
bit of formatting ace wraps around that.

Chris: Rather than trying to make ace output something that everyone's
happy with, instead maybe focus on providing small micro-libraries in
handful of languages.

Emily: And then someone with a weird language they want to work with can
contribute their own micro-library.

Woodley: Related to the repository we said we'd create yesterday of
tools which take Simple MRS (and derivation tree) and know how to render
them.

Mike: That's not just the structured output from ace, but also json
formatted MRSs for these visualization things.

Emily: What flags does the current black box require?

Woodley: Suggestion for default on
<http://sweaglesw.org/linguistics/ace/> Unlike what Francis thought, you
don't need TNT for unknown word handling. -1Tf uses ace tagger. 1 = 1
best, T = no derivation tree, f = one EP per line, maybe not ideal for
automatic consumption.

- Emily: **Action Item**: Seek agreement on changing the first
recommendation on [ErgProcessing](https://delph-in.github.io/docs/erg/ErgProcessing) to ace.

Emily: Black box exists, people have used it (575 @ UW).

Woodley: Should have a few people try it out to help detect options with
suboptimal defaults. E.g. ROOT\_STRICT v. ROOT\_INFORMAL. Or maybe there
are cases where unknown word handling doesn't work. *More testers would
be welcome.*

- TODO: Test our black box in a variety of locations/OSs.

Emily: Tell me about platforms.

Woodley: Binaries for linux 64-bit, OSX distributed. Should work on any
such machine, but there's always surprises.

Mike: Last problem was on patas at UW which had old libraries.

Emily/Woodley: Windows not supported.

Chris: Could consider making it an actual blackbox, building a docker
container. Super light weight...

Mike: For cloud service, includes anything it might be dependent on.

Chris: Superminimalist linux implementation.

Woodley: How small? Virtual machine image?

Chris: Not that big---meant to run on a host. Most linux installations
can run them easily. There's also [Boot2Docker](/Boot2Docker) that will
work on OS X, maybe one for windows as well.

Mike: Not a VM, just a virtual environment. Not running an OS.

Woodley: Built like cygwin?

Chris: Kinda, except that cygwin sucks. If you're just using the cygwin
libraries, probably closer to that.

Mike: I haven't used a docker, but people need to set up their machine
to run them, which might be just as much work.

Emily/Chris: This would be a solution for windows, if you can run docker
in windows.

Chris: Could build a minimalist VM (smaller than Ubuntu+LKB).

Mike: Explore setting up on Amazon EC2.

Woodley: We could do an .ami.

Chris: That's kind of similar to a docker image.

Woodley: I think an ami image would be useful for DELPH-INites too, not
just external users.

\[Looking at AMR tutorial slides from
<https://github.com/nschneid/amr-tutorial/blob/master/slides/AMR-TUTORIAL-FULL.pdf>\]

- Need snappy marketing line for first slide.
- Link on first slide to something to try out.
- Formalism section, applications/algorithms section.
- Manual input + machine provided consistency. Need catchy question
for the top. "Weren't all the linguists fired in the 1980s?"
  - Include IAA numbers from IWCS paper (or other?)
- Explanation of formalism.
- Depending on interest of the audience could highlight differences to
AMR.
- Movie tie-ins/memes are important
  - If we use a meme, make it the whole slide. (images in general)
- Trained people to annotate AMR to teach them what it means. Analogy
for us would be semantic discriminant-based treebanking. Hands-on is
good, but that activity might be off-putting.
- Better: MRS-fingerprint based searching, to get a sense of what's in
the ERSs.
  - Queries based on participant interest.
  - Any DELPH-INites in attendance welcome as volunteers to help
with hands-on component.
  - Avoid putting too much into the hands-on that isn't also in the
slides, for latter usefulness of the slides
  - Go through a few phenomena, selected to show off what we can do
    - Negation
    - Apposition
    - Control
    - easy-adjectives, relative clauses, other LDDs
    - gpreds -- noun-noun compound
    - expletive pronouns
- Demo ideas:
  - Mike: pronoun detector, also catches zero pronouns; input to
anaphora resolution
- Links to documentation
  - Include something searchable especially for gpreds
- Using the black box, getting the Treebanks
- Applications: Focus on how you could use it, not what you need to do
to make it useful.

Guy: Volunteers to be the aesthetic consultant on slide design

Last update: 2015-08-07 by LuisMorgadoCosta [[edit](https://github.com/delph-in/docs/wiki/SingaporeTutorialPlanning/_edit)]{% endraw %}