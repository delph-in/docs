{% raw %}Discussion at [SuquamishTop](https://delph-in.github.io/docs/summits/SuquamishTop) on shared scripting
libraries.

There may be some duplication of code it would be nice to reduce.

Things I know of:

- MT experimentation scripts (Eric)
- MT rule building (Petter)
- MT grammar subset selection (Petter)
- profile2db scripts (Francis)
- MRS comparison code (Rebecca)

Things I think I heard:

- MRS to html
- Dependency to nltk

## "Minutes"

Is it possible to make changes to the MRS structure, given enough
reason? Laurie says Ann says yes.

Emily: shouldn't stop us from documenting what exists now.

Is there a final canonical publication describing it? Stephan: yes. but
it may not be "final."

Dan: even if MRS doesn't exhaust what we want to say about meaning...
been talking about adding room to put constraints on coreference between
individuals, e.g. "ICONS" like "HCONS", like "x7 is coreferent to x9",
or "x3 is NOT coreferent to x10", from binding principals. want to
implement that. BUT, I don't think that will be a showstopper; other
implementations can gradually assimilate an extra attribute. Also we
only use 'qeq' in HCONS currently, but some people may want to use
'geq'. I support having multiple implementations of this formalism.

Francis: I've noticed there's been some reimplementation of things in
Perl or Python; scripts for batches (mixes of Lisp and other stuff);
scripts for building and training models; scripts for profile
manipulation. I suspect work done in place A could be useful for people
in place B. E.g. tools for pulling bits and pieces of information out of
TSDB profiles. Or renumbering profiles.

Emily: How about starting with IGT and building a TSDB skeleton?

Is there a list of the tools and what they do, for people new to the
community?

Rebecca: Come to the meeting.

Glenn: We talked about worrying that MRS functions depending on Lisp as
a problem; what about the tokenizer for the ERG?

Stephan: Hey, Lisp is great, it's not a problem. But ok, having tools in
other languages is nice too.

Rebecca: Releasing a C++ REPP library. With deterministic
characterization. Working on integrating to PET. Everyone: document it!

Most useful if we can integrate TNT also.

Dan: Can we have Chart Mapping in the LKB? Stephan: Good idea, go do it.

Stephan: REPP is a good example of evolution. Been OK for a while, but
characterization always been a slight question mark. Re-implementations
can trigger resolution of old problems.

Dan: Talking about python and other tools... the lex type db is
fabulous. Rebecca: I find it useful too.

Francis: Good example of something written in perl currently that could
be used by other people too. Dan: Scalability to wikiwoods? Francis:
yes. aside from writing a page for every tree. would be great if we
could call MRS-&gt;HTML or Tree-&gt;HTML easily in a lightweight
fashion.

Francis: Who still uses Perl? Who uses Python? (around the table, mostly
python... UW... but many perl users) Stephan: I use Clozure

Francis: Where next? /logon/scripts? Stephan: DELPH-IN SVN repository,
perhaps Francis: First step to collaborating is making the code
available. Put it in SVN and also mark it on the Wiki. And announce it
on the Developers list. Stephan: Everyone, get your acts together about
marking up on the wiki!

Name of tool? What use cases are people trying to fill?

Rebecca: See [ToolsTop](https://delph-in.github.io/docs/tools/ToolsTop) -- there is some stuff there.

Rebecca: I put up C++ training code. And EDM code (on any MRS simple
string). Emily: Sign up to be informed when the [ToolsTop](https://delph-in.github.io/docs/tools/ToolsTop)
page changes.

Last update: 2011-06-28 by WoodleyPackard [[edit](https://github.com/delph-in/docs/wiki/SuquamishDelphinLibP/_edit)]{% endraw %}