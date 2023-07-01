{% raw %}Minutes from the Across Framework Evaluation Metrics discussion on
23/08/07.

Intro: [Yusuke Miyao's
slides](http://www.coli.uni-saarland.de/~rdrid/delphinsummit/DELPH-INevaluation.ppt)

### Parse Evaluation

In discussion about the difficulty of format conversion, it was pointed
out that creating a new gold standard was also difficult and time
consuming (consuming much more time). However the conversion process
might never get past 70 or 80%, no matter how much time is expended.

Dan's suggestion: assemble a test set and get all (?) deep NLP
communities to create a gold standard in their formalism. Then get
together and discuss where we agree on analysis, and at what level.
Sentences/phenomena that we can't get agreement on will be removed from
the released standard. Create annotation (on different levels?) that
represent the analysis we agree on. Avoids the long tail,
"linguistically uninteresting" phenomena can be left til after we have a
base...

Comments about the motivation supplied by having competition. GR has
motivated a lot of comparison and work. We want a similar effect but
capable of showing more complex information.

If we can measure "something", then we can see (and show) how
abstract/grammar/parse improvements effect applications.

Lots of conversation about what data set we should use.

Important (for various reasons) that everyone can do well, by some
measurement, on the test set. (Or else no one will use it)

##### WSJ

Advantage: Comparison with other results, particularly DepBank (from sec
23)

Disadvantage: We can't parse it at the moment. A suggestion was made to
modify the sentences to parsable form to get the 'correct' analyses, but
there were concerns that we would be then contaminating it against
future use.

Recent thesis describes mappings between RMRS and PropBank, VerbNet and
FrameNet: [Sergio Roa's Masters
Thesis](http://www.informatik.uni-freiburg.de/~roa/thesis.pdf)

Suggestion: Use section 0, which is always used for development. We
should still be able to get comparisons with other systems, without
making future use of sec 23 impossible.

##### QA data

It was suggested that it would be good to have QA (and other application
specific?) data in any new gold standard we develop, since the Penn
Treebank contains very few questions.

##### Wikipedia

Stephan: "parsing Wikipedia has a certain sex appeal"

Proposal to parse a selection of Wikipedia.

Advantages:

- We can select domains according to our needs (lexical coverage,
multiple domains).
- Sentences are generally shorter.
- Difficult terms are often links and so can be identified for
pre-processing (or ignoring).
- If a sentence is unparseable, we can fix it...
- Potential for comparable corpora, through the different languages
links

Disadvantage:

- Bad punctuation a big problem.

#### Gold Standard Annotation

- We need different levels of annotation. Perhaps a way to incorporate
competing analyses (of, for example, co-ordination), so a user of
the gold standard can select the analyses they agree with.
- Can we get an annotation format that is general across languages?
Should we try?
- Use semantics as a common ground
- What is annotated should possibly be decided after (or while) the
common analysis base is being decided. (ie after we have the gold
standard parses, in their native formats, for each formalism)

##### PropBank and FrameNet

Can these resources be used? Using the PropBank annotations would be
very fiddly, since the role designations are fairly arbitrary. Maybe
worth looking at annotation formats from these resources?

Recent thesis on mapping from RMRS to PropBank, VerbNet and FrameNet:
[Sergio Roa's Master's
thesis](http://www.informatik.uni-freiburg.de/~roa/thesis.pdf)

An off-topic (for this session) suggestion that parsing the FrameNet
example sentences would be worth considering.

### Generation

What do we evaluate? At least from the ERG, realisation should be
trivial and the difficult bit is coming up with the input to the
generator.

Producing input from the parser creates a circular evaluation, but what
else do you use? How specific do you make it?

Perhaps the earlier discussed paraphrase task is a good way to start
evaluating generation?

### Conclusion

Although there seemed to be agreement that we should try and produce
data sets (from WSJ sec 0, Wikipedia and maybe some TREC question sets),
and get gold standard treebanks from DELPH-IN HPSG, Tokyo HPSG, CCG and
Rasp at least, there were no concrete action points decided on....

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/Across_Framework_Evaluation_Metrics/_edit)]{% endraw %}