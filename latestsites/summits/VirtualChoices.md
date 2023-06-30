{% raw %}Choices File Grammar Specification SIG Notes

Starting from <http://moin.delph-in.net/MatrixChoicesRfc>

- Ease of human reading: the current choices file format is generally
human readable, and this is an important consideration of any new
changes. However, indexing and non-obvious nesting can make choices
difficult for newcomers to understand.
- Ease of human editing: along with reading, being able to identify
and edit a choice without using the customization system is a
critical requirement, for use with matrix.py, debugging, and
development.
- Ease of creation: it is currently difficult to write a choices file
from scratch. One must parse the current matrixdef file to
understand available sections, choices, and options. Ideally, one
would be able to write choices with very few dependencies.
- Computer serialization and deserialization: choices are currently
stored in a proprietary format, so reading and writing them requires
implementing a significant amount of code.
- Make development easier: currently, changing anything to do with
choices probably requires changes in several locations and is
brittle.
- Choices as a component: a modularized choices format could be used
as a data format in other projects, targeting the Grammar Matrix or
not.
- Matrix as a target: modularizing the choices format could help
others develop systems that use the Grammar Matrix (i.e. matrix.py)
without the Customization System (e.g. AGGREGATION).

EMB: Size -- web is slow, so, important to be able to edit by hand

EMB: Lexicon and morphology are the culprits

EMB: Having something less idiosyncratic than [MatrixDef](/MatrixDef)
syntax should help

Glenn: JSON?

Chris: YAML, TOML, EDN. Easy to parse but too complex to read by human

Chris: looked pretty closely at YAML, but the criticism are fair

Mike: it is pretty human-readable but there are lots of obscure variants
how to do … strings; also unsecured features; when you serialize it you
might not get the format you like

Olga: Editing, need a version of the file that’s human readable. That
doesn’t need to come directly out of the grammar matrix. To what degree
do we need the editing to happen?

Mike: Integrated with the code, hard to separate. Serialize Python
objects to format.

Mike: Going between CS and web, JSON is fine, but not for humans. T.J.:
not only separating choices from how it is implemented, but the
specification then lives outside the system, as a first-class object

Glenn: “human-readable”: does it take into account JQ command-line tool?

EMB: Needs to be a text file that a 567 student can open and read

Chris: JQ is like a swiss army knife(?)

EMB: JSON too noisy; even current choices are a bit much

Chris: visualization also important, the position classes etc, decouple
formatting in the grammar specification and the formatting in the
questionnaire, etc.

EMB: some of the formats are whitespace-sensitive, we need to avoid that

Glenn: xml?

EMB: No

Chris: folks who created EDN (extensible data notation, native format
for closure/lisp), was designed specifically as something in between xml
and json, middle-ground.

Chris: shows example.

Olga: Parentheses are annoying, but which format wouldn’t have
parentheses

Glenn: whitespace is worse

Olga: agreed

T.J.: likes TOML now. Full paths are shown. In choices, you can
randomize things except for sections; in TOML you can’t do that. But
there is explicit nesting, and whitespace is not important.

EMB: No need for the choices file to be HPSG-like but the it is good
when something like dots in paths which is reminiscent of HPSG is good

T.J.: Other changes: current example was made by taking existing choices
file object and converting to TOML. You have nested dictionaries and
lists. Nested dictionaries was better (?).

EMB: use case: a large choices file, and one position class needs to be
taken out. All places which refer to it will start getting validation
errors. We need to preserve this functionality (if I broke the grammar
by editing it, the validation system should still catch that; the format
should not make such situations silent.

Chris: Has some ideas how to make sure the above works; there needs to
be indexing somewhere, somehow. An ID property for each element(?).
Currently there is a lot implied in the nested structure. The only way
we know something is a noun-pc is that it literally says “noun pc”.

Mike: 3 proposals: list but above problem, lists but with ID attribute
but no enforcement of unique IDs, using IDs in the path is the most
robust. So instead of morphology.noun-pc1 change to morphology.noun-pc.1

T.J.: Yes, but: noun-pc is in fact separate from noun in the CS. Should
it be “noun-pc.1”?

Mike: Sure but you’d need to add quotes “1” which will be ugly, but
could add a letter in front

T.J.: Another suggestion: instead of using the list indices, IDs
(hashes) instead of ordinal number-indices, included in the key name

Olga: What does that do to the readability if you have weird IDs in the
name?

Glenn: Did you mean hash as a random number?

T.J.: Yes

Glenn: That would take away from readability indeed

Mike: User needs to be able to define their own name for something like
position classes

Chris: goes back to how choices interface with the CS. The fact that the
name ends with 1 should not have any meaning from the CS’s point of
view. We can probably avoid that.

EMB: automatically inferred choices files are really big (in the
hundreds)

Chris: TOML should work well for this. Another thing: when we have
obligatory=on inflecting=no etc., either they are multivalued, or it
should be boolean

EMB: history of on/off vs yes/no related to radio buttons and obligatory
vs. optional entries in the questionnaire. Privitive features vs. (I
missed this word) features in linguistics

Chris: This is probably connected to how it is presented to the user

Mike: Grammar spec should be decoupled from questionnaire and
customization code. So boolean should be okay. Some have default values
(e.g. empty checkbox is off by default)

EMB: we should have a schema but it will cause additional work, in the
CS

Olga: Should be done even if painful. But it’s not really painful, will
just take some time. Not technically difficult.

Chris: EDN does have keywords in the LISP sense, which others do not.
Defined in customization. User defined don’t need to be as controlled as
the things that the customization system is depending on.

Olga: Already a list of keywords in the validation code. It won’t let
you name your type if you want to call it TOP, etc.

T.J.: But that’s separate; that’s more has to do with the naming of the
suffix ordering etc.

Chris: Inside the customization vs.

T.J.: Step back to the two things, this is the second thing: the
existing choices file only has the dictionaries and the lists of
dictionaries and strings with the exception of the version of the
choices of the version is int. By moving to any of the above formats, we
have the opportunity to have more types as values of objects. Once the
move happens to the serialization, changing the code is a separate
process.

Chris: there is a section \[in the wiki\] using schema.py illustrating
how this could be done. Schema defines acceptable types and values.

T.J.: The first problem I hit trying to mock up a customization system
from scratch, was figuring out what a valid choices file is. A schema
would take the key parts of matrixdef and (?) -- ultimately, provide
information about valid etc. choices, to upstream and downstream tasks.
Ideally our format will be language-agnostic (in terms of programming
languages). Aggregation depends on Choices.py, matrixdef, matrix.cgi,
just to be able to read choices files

EMB and Olga: Surprised

Olga: I remember adding choices.py. I don’t remember if I did the other
ones, but maybe forgot.

Chris: Clozure spec language, one of the features it comes with is
generative capability. Will generate valid choices files based on given
specifications

T.J.: In the section An Choices Schema API I listed some things we might
do, e.g. sorting choices files, etc.

Chris: doesn’t have to be one solution: 1) human-readable; 2) closely
tied to the schema of how that’s defined or validated

T.J.: if we are going to change the code, that’ll be a great opportunity
to pick up a better serialization format

Chris: the interchange between the CS and the web and the choices file.
The CS needs to be able to read the output of the questionnaire but
there is also the issue of the interaction of the front-end and
Matrixdef, matrix.cgi, the engine behind that. Probably don’t want to
put TOML interpreter right there in the browser (maybe?)

T.J.: the way it is now, choices are used for three things: 1) very bad:
choices are stored on disk by the questionnaire and they are your
“session” which can be retrieved at any point you are working with the
questionnaire; 2) serialization/deserialization with the user; 3) ?

Chris: that opens up space for talking about, potentially, if we move to
TOML, separate out the question how the structure of the questionnaire
and the library behind it is defined. We don’t want to ship a database
around. Orthogonal to making the choices file human-readable/writeable.

Olga: Going back to the historical reasons for the “session” usage of
the choices file, wasn’t the point to retrieve the choices file if
something goes wrong?

T.J.: yes if something goes wrong you can retrieve the choices file. If
find an exception, serialize the log file and hand it to the user.

Glenn: something bad happens and there’s an emergency isn’t a normal use
case. Expanding on the point Olga brought up, the issue with human
readability is related to the size of the data and efficiency.

EMB: no people will still want to hand edit even if it’s a very large
file.

Olga: if we want to provide choices file which are readable because
people don’t want to use a particular interface, that would be a
separate service. We end up with a version of the choices file that goes
between human readable and machine readable. If there were a perfect
interface, why do we need a text file?

EMB: disagree on gui vs text files. There will always be people who must
be able to edit file by hand. Glenn: There will have to be a “round
trip” between the system version of the file and the
human-readable/editable version; if read-only, then don’t need the
“roundtrip”

EMB: schema vs. serialization format. People need to be able to look at
it.

Olga: need to be edited by hand.

Chris: focus on human readable function, then optimize and retool back
end of the questionnaire, which may depend on the choices file format we
decide on

Glenn: session storage is competing with human readability

T.J.: That session storage is done with human-readable file is separate
(irrelevant); can be changed

Chris: define something that is both formats

T.J.: mutual dependency, but should focus on choices, then figure out
matrixdef. Hopefully main change would be deleting code.

Chris: matrixdef needs to display the questionnaire, which is related to
the way that the customization libraries are written. Would like to make
those easier to read/write.

Mike: What needs to be changed in the system throughout: there was also
the uprev function to think about.

EMB: also brings up the uprev function, we need to keep supporting
legacy choices files

T.J.: uprev is working on data in memory. We need to keep old choices
parsing code which is not that much code, and that should allow us to
keep the current uprev functions. Actually maybe the entire current
system will be required to support legacy choices.

EMB: Appreciates all the work (for bringing this up and digging into
it). Important for the longevity of the project.

Mike: Points out new home of the Matrix on github. This is important for
the longevity of the project, and we can also coordinate things there.
What if we have the choices file as a separate object, what if they
(who? The choices file and the customization system?) get out of sync?

EMB: questionnaire and the customization system will likely stay in sync
with each other. Any given version of the customization system will have
an associated questionnaire version. If an older choices file is
presented, uprev will handle it, but what if an older version of
customization/questionnaire is presented with a version of choices file
from the future?

T.J.: The code is written such that once it’s in the back-end, matrix.py
will just access that data structure. If there are choices there
matrix.py does not care about, it won’t do anything. It should probably
stay this way.

Glenn: So we will lose information in serialization/deserialization?
because customization system ignores features it’s not expecting?

T.J.: No, but in customization it may be lost (?). The only problem if
fat fingering is if you broke a reference.

T.J.: If you add an invalid choice, it will stay in the file. Nothing
deletes information from the current choices file.

Chris: as long as it’s well-formed, it will serialize it correctly. But
if it doesn’t recognize a feature, it won’t be well-formed.

EMB: Should show validation error saying “this information is not being
used”

Glenn: this could happen if there is a dev version that’s ahead of the
trunk

T.J.: I know because I’ve done that (load production system instead of
my dev system and observe it ignore my new choices). We’ve been
implicitly agreeing, can we explicitly agree?

Olga: Are we trying to get a human readable and machine readable
version, or are we trying to get code that transitions between the two?

Chris: Whatever we replace the current choices file with should be able
to de/serialize with everything that works with the customization system
in the backend. Not expecting it to also provide all of the info needed
to run matrixdef or questionnaire.

Olga: What does user edit in that case?

Chris: Either the questionnaire or the TOML file.

EMB: Settled on TOM;, hashes instead of lists; not branching out into
multiple dependencies, just choices parser/unparser, is the scope of
this particular effort. Although other subsequent changes will then be
required (which is fine).

T.J.: right now we have values that are comma separated strings that are
the output of the multi-selects. Changing these to arrays of strings
would be a separate issue.

Mike: should not have a mini-format embedded into this format, like a
CSV list inside of a list (?)

EMB: doesn’t seem different from conversation of TOML vs other (?)

Chris: Do we need to differentiate between when the value is a singleton
or not?

EMB: Multiselect vs not.

EMB: If someone creates a specification outside of questionnaire, we
won’t be able to use the validation system if (missed under what
circumstances)

EMB: if a supertype is given, use that, if not, create a supertype. Is a
kind of situation when (something happens; missed) Chris: A feature
value that by definition can only be a singleton, it’s not going to be a
list, but if it can be a list, then it is always a list

EMB: where do we locate the constraint that the feature is a singleton
or a multiselect?

EMB: this choice is down int the details of how each library is designed

Chris: We need to look at a concrete example. No need to try to nail it
down now without more hands on.

T.J.: Did we decide on indexing scheme?

EMB: I like moving away from how we use “fake” indexing now (making
something look like ordering when it isn’t)

Mike: we want to avoid writing code to maintain (text) files. Would be
nice to stick with something that is not just the Matrix because it
helps students learn useful formats. Just need to save code for old
choices file and uprev.

Olga: Formats change, struggling through the choices format teaches an
appreciation for off the shelf parsers.

Glenn: Would it be possible to read the current version of the uprev and
put it in a dictionary?

T.J.: Yes, I think we’re decided on that. Where did we end up on the
schema?

Chris: two pieces: 1) what does a valid choices file look like? 2) what
does a well-formed grammar look like? Whatever we do, should have at
least an informal schema; if it is computable even better.

Mike: schema.py does many of the things that validate.py does. A JS
schema would make sense for the questionnaire. We could use schema IN
validate.py.

T.J.: Matrix writes empty sections for where there are no choices.
Should we only serialize the choices that exist?

Mike: why does it do that?

EMB: just to show the user that there is more stuff they could have done

Glenn: aren’t there sections that are required?

Olga: person is required, case is required.

T.J.: where we mark what’s required in multiple places, so serializing
only what’s required would create a dependency again.

Appreciation all around!

Last update: 2020-07-14 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/VirtualChoices/_edit)]{% endraw %}