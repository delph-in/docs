{% raw %}# Discussion: Shallow Tools, Deep Grammar

(Moderator: Liling, Scribe: Glenn)

- Other than parsing, how can DELPH-IN tools interact with the wider
NLP task/application driven world?
- Using supertags/uebertags as feature sets for classification based
NLP task?
- Creating a super flattened / simplified token-annotation based parse
output
- Reviving LOGON, encouraging more DELPH-IN based MT system?
- Using MRS as feature sets for semantic related task?
- WSD, Entity linking, Knowledge Base Population with DELPH-IN?

Bec: Ubertagging gives you full tag plus lexical type. It predicts a
type of ERG tokenization.

Stephan: Ubertagging is Supertagging++ in that it operates over a
lattice. Solves Lexical tokenization jointly with lexical category
assignment. It does this by using lexical categories plus the tree of
lexical types.

Liling: Can you get that to us?

Bec: It’s in SVN, and it runs through PET too.

Stephan: We’re hoping to package it all (ubertagging) in the 1214
release of the ERG. There are a lot of moving parts but only with the
1214 release will it be “comparatively easy” to use this stuff.

Bec: Ace will need to implement it also. This will probably happen
tonight.

Liling: what about the flattened / simplified token-annotation output?

Bec: like half of bilexical dependencies?

Liling: yes.

Bec: because that’s...

Liling: Create a hash code to it, making it an annotation to the token
itself…

Bec: most of that information exists and you’re talking about formatting
it.

Woodley: What kind of systems are you looking for information...?

Dan: Would that discussion fit in a SIG perhaps?

Liling: Yes. Ok, now “reviving LOGON...”

Stephan: The term “Logon” is overloaded. In Oslo, we use the logon tree
as an infrastructure, but not for MT. Same for Francis.

T.J. Sanghoun does MT.

Stephan: There is less muscle behind MT now.

Liling: The last part: Has anyone used MRS outside of parsing?

Emily: Um, Sentiment Analysis, QA, abstrative summarization.., etc, etc.

T.J. There is work being done. It works. People used ERG to create
features for machine learning tools. We also used the ERG to augment
other systems. Woodley and I did Q/A with ERG/MRS. So it’s possible. I
feel that the tools are ripe enough to use, just a matter of actually
doing it.

Ann: What specifically are you asking?

Liling: Can we feed MRS into a VSM?

Ann: DMRS, distributional, What I’ve been trying to do for some years

Liling: Is there just a tool

Ann: No

Woodley: Mike offered to take MRSes and featurize them for people

Mike: I have a tutorial in the PyDelphin which I’ll cover
this. It works now.

T.J. Jared did it successfully.

Woodley: For MRS to feature-lists: See Mike’s SIG.

David Mott: We are Turning MRS into a representation for controlled
natural language… see my talk tomorrow.

Sanghoun: Can we use shallow tools for coref or anaphora resolution?

T.J. It’s a hard task.

Liling: Any way to use DMRS for finding coreference?

T.J. Stanford DCoref is the state of the art in CoreNLP. We added rules
to it which depend on ERG/MRS outputs. It was not a big success. It
could be investigated further.

Ann: What domain was that? Coreference is \*incredibly\* sensitive to
the domain. Stanford does badly on narrative. Results might be better
using our stuff, for some domains.

T.J. We were doing CONLL task.

Ann: It’s tuned to that, and the gap to narrative is huge.

Francis: After Emily’s talk yesterday.. are those term projects
viewable?

Emily: One will be published. Others you can ask authors in the room.

Woodley: No.

Emily: Will forward requests about it to the students for folks who are
interested.

Tim: Should there be a wiki page where such term projects can be
archived or catalogued?

Woodley: Hear, hear.

Guy: Are they on github?

Glenn: Yes

Others: not necessarily.

Guy: I took a course where the instructor required it to be posted
publicly.

Emily: I like the wiki page idea. (she creates
[DelphinApplications](https://delph-in.github.io/docs/home/DelphinApplications))

Milen: We used MRS for textual entailment. \*SEM evaluation on comparing
distributional semantics. It was ok as an experience. Limited set of
rules; matched to MRS structures. Good results. Not the top system but
above the middle, with few rules only. Gave us a good feel for using MRS
in the real world. It seemed like an obvious and viable match to the
textual entailment task.

David Mott: Useful to have a sample rule-based system into which MRS can
be mapped. You’d be able to “just run it.” A live API for this would be
more compelling than “just a file format.”

Moderator-Tim: conclude.

Last update: 2014-07-16 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/TomarShallowTools/_edit)]{% endraw %}