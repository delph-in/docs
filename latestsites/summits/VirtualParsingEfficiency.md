{% raw %}July 15, 2020

### References:

Overview of HPSG parsing issues: Oepen et al, eds. Collaborative Grammar
Engineering (2002)

Paper Berthold was sharing, from ACL 2007:
<https://www.aclweb.org/anthology/W07-1219.pdf>

Stephan and John’s work:
<https://www.researchgate.net/publication/2539526_Ambiguity_Packing_in_Constraint-based_Parsing_-_Practical_Results>

Glenn unfinished manuscript on lock-free chart packing
<http://www.agree-grammar.com/doc/agree-parser.pdf>

Email thread on evaluation:
<http://lists.delph-in.net/archives/developers/2015/002131.html>

Good work on parallel HPSG parsing by Marcel van Lohuizen: A Generic
Approach to Parallel Chart Parsing with an Application to LinGO
<https://www.aclweb.org/anthology/P01-1065/>

From Jan Buys : <https://arxiv.org/pdf/1705.03919.pdf> neural
constituency parser

From Jan Buys : <https://arxiv.org/pdf/1511.06018.pdf> for segmentation

From Stephan Oepen :
<https://iwpt20.sigparse.org/pdf/2020.iwpt-1.14.pdf> this year IWPT
paper on HPSG top-down parsing, Enju-style

From Jan Buys : Weiwei’s earlier work
(<https://github.com/draplater/hrg-parser>) includes a constituency
parser (although maybe not the lexical tags)

Later, in John's presentation, Stephan also linked:
<https://www.aclweb.org/anthology/W07-2207.pdf> (apropos pruning the
space of unpacking failures, zhang yi made some progress in that space)

### Discussion:

Dan: can treebank longer sentences if packing is more efficient. But
slippery: which structures I choose to pack? As a grammarian, can
decide, but automated efficient packing will take that away? Is there
still gain by ignoring some features?

Woodley(W): That’s Packing restrictor list. Open question. I tried
mechanically plugging through possibilities of adding features one by
one, to see what the impact is on performance.

Dan: Can I get to a packed forest more efficiently?

Woodley: The experiment would have to know the power set of the
features. Instead I took existing packing restrictor did O of n
algorithm of adding each one to the list. A number of features that if
you put them on speed up a small amount. No low hanging fruit. I
measured time to the forest and time to the one best unpacking.

Dan: Adding to the existing restrictor did not show any dramatic
reduction in forest construction time?

W: correct

Berthold(B): Back in 2007, got packing working for German grammar, but
it failed assumption checks having to do with verb movement. One
suggestion is to have more intelligent restrictors to cut out everything
except some features. Approximated with dash-dash features that pull
features out. Maybe impovering of the content of features will help,
without having to change the grammar and put in “hacking” features.

W: you’d like to restrict in some cases but not in others?

B: No, if I have something on SUBCAT list, need a way to lose
restrictiveness(??) Sometimes lose a lot of matching with the verb
upfront (moved verb in German) with its arguments(?). Partial
restriction: have a list that keeps track of how many elements but not
the details of those elements; maybe pointers to head values. --SUBCAT
in addition to SUBCAT (need to look up)

Dan: I want to have anything under synsem be ignored as long as there
was something on the inside?

B: Yes, anything except for head value

Dan: but not globally? Only in embedded structures, I don’t want to see
details?

B: Yes. Path-restricted. Like in CFG approximation (by DFKI and Tokyo
colleagues)

John: In LKB you won’t see some features, so you won’t see the
difference.

Woodley: the LKB only applies the packing restrictors at the top level
of the avm?

John: If you tried to restrict RELS, you won’t see anything

W: This can’t be right

Dan: This can’t be right because then nothing would pack; RELS lists are
never the same

John: I’ll look at the code

Glenn: Unless there is a coreference between RELS list and (??)

Dan: Can’t be the case.

John: sorry, I was confusing it with the daughters restrictor. (John’s
previous statement was not accurate)

Dan: they will apply wherever they’re found. Can’t apply only in
daughters, etc..

Glenn: all processors could allow for path-based restricting

Dan: more power, but remains to be seen what the actual gain will be if
at all

B: had a list with reentrancies. At the Deep NLP workshop in 2007
discussed several features that worked in the workshop proceedings.

B: For German, list of restricted features is quite long.

Stephan (OE): Conditional restrictors idea comes up regularly. Probably
not too expensive to implement

B: Downside: ugly, bigger feature structures.

W: Not hard to implement but is it well founded

Glenn: Confirms not hard to implement for AGREE

Dan: what’s the concern about the well-formedness?

OE: Needs to be more precise, what we mean by that. Formalize

Glenn: if a path has a cycle, (then what?)

Dan: We don’t allow cycles anyway.

W: restrictor is implemented at grammar load time rather than runtime.
We have version of grammar that’s restricted and the one that’s not
restricted

John: checked LKB - packing restrictors are applied to (copies of) all
rules and and lexical entries immediately after lookup and before
parsing starts. So parsing never sees any of those features that were
restricted out

W: Any further restrictions needs to be done at runtime?

John: Not in the LKB

W: when it’s just a single feature, that's a valid approach

OE: I don’t believe that, if restrictor is applied prior to parsing,
because parser only manipulates …. (Got lost here)

Dan: if restrictor is inside an element that’s on SLASH, it’s not until
I use extraction rule that this path becomes relevant. I can write that
path in the first element on the list but that won’t apply at load time

OE: W’s point is that most complex contextualizers would have to be
applied at parse time, context-insensitive ones could be applied
pre-parse time.

W: could have impact on how efficiently this can be done

B: shares a graph with (?) Dan: loadtime vs runtime, how sure are we
that (something) is impractical

W: could be practical and beneficial

John: path-based packing restrictors could be applied to the DAG that
results from a rule application. Would just be an extra bit of
processing in the copy process

Dan: each time you copy a FS, (what?)

Glenn: other processors aren’t applying this in the parser all the time.
AGREE does that, but that’s inherent to AGREE, it’s a restricting
parser. The parser does not have a concept of edges (? ) That’s not so
in other parsers. Adding runtime restrictor could therefore be
additional expense.

W: got the results of the experiment of adding things to the packing
restrictor. Each line is result of adding a particular feature to the
restrictor. Amount of time just to construct the forest. The baseline
would be for a feature that was already on it. 1:45 seconds. A number of
features that reduce it slightly, one of two a bit more, but otherwise
no dramatic reductions.

OE: notion of parsing efficiency in support of treebanking: CONT will be
(dispensible? Or not?) in treebanking

W: but that’s still just small percent of speedup. CONJ, MOD - bad idea
(to throw them out?)

OE: in theory, can use as little info as needed for treebanking. Would
forest construction be very cheap if we have few rules, atomic
categories, head types.

W: Few rules compared to CFG, the rules will be licentious? promiscuous
(WHAT?) metaphor/pun

B: Shares graphs from a 2007 ACL paper. Successful packing with partial
restriction of SLASH and double SLASH (verb movement in German). If you
have a full feature, you get worse result because of all the subsumption
checks that don’t result in packing. SLASH is used a lot in German,
every declarative is SLASHED. You can cut time in half if (if what?) If
you cut out the SLASH entirely, you also lose wrt baseline. Baseline is
“unfilling”.

W: what is the baseline? Why is unfilling incompatible with packing?

B: need to know that the feature is virtually there if the type gets
expanded.

OE: correctness of subsumption check used to be issue but W. uses more
relaxed assumption.

W: the subsumption relation is still relevant. I have to make sure the
new edge does actually subsume the edges.

OE: abandoning unfilling was nice back when we moved to packing (?not
sure what was or wasn’t nice)

W: I don’t think you should ever have to infer the type on the basis of
a feature.

Glenn: agree

W: unfilling is a good idea; i didn’t implement it but doesn't mean I
shouldn't have

Glenn: I didn’t do it because the ERG didn’t demand it for correctness.

B: in ERG, you kind of do that manually anyway (the grammar engineer
does that). You have partial redundancy in german grammar, I don’t know
how much redundancy is there.

Olga: please define unfilling?

Dan: if you have a feature structure and the value of a particular
feature is unconstrained, you can just throw it away because it’s
undefined and it doesn’t lose information. You’re copying around another
object that is unfilled. It’s smaller and moves around more
conveniently.

John: part of the issue with coreferences? Can cause subsumption check
to fail?

Glenn: might be a version with type of unfilling that considers those
types of coreference to be nonempty. I think that’s correctness problem.
If there is a coreference when feature is unconstrained, you don’t get
to unfill.

OE: if we look into more powerful restrictors, our CFG-approx colleagues
came up with a notion of contextualized restrictors, potentially cyclic
FS. You’d need some functional uncertainty, a regex over REST/FIRST. The
cycle would carry through the list. The FS that is the restrictor, when
there is a corresponding node that (X?), you’d not copy that.

G: Dangerous (why?)

OE: it’s a FS that the code uses that the grammarian decides in TDL and
the code restricts it.

G: missed

W: oe is talking about an arbitrary position on the list

G: you can get to a particular position if you know its path

D: you don’t know how long RELS list is. If you only need the pred name,
it will be hard

G: does the path-only proposal have any value? Easy to implement

OE: would have to include functional uncertainty, Kleene star. For
example, RELS?

Dan: we already know about RELS. And not SLASH because there’s only one
thing on my SLASH list.

OE: German, you want to say SLASH - REST\*. Need the Kleene star to
refer to arbitrary positions in the list.

W: you can specify one part of the path, say anything goes here, and
then lager on another part

OE: wildcard feature

B: sounds like LFG

W: The paper B. showed us, in that case going from packing with full
SLASH to packing with reduced SLASH list was a ein of factor of 10?

B: 8 in one direction

W: comparing to our situation, packin with full SLASH is what we are
doing in these terms? Can’t predict what would happen with full ERG or
GG? We can’t predict(?) if we were to fully restrict SLASH we would win
by a factor of 6?

B: not sure at this point. Something around 2.5

W: right now we don’t restrict slash at all

B: in german we do. In english we dont. (goes over table 2 in the paper
again)

W: how do we compare this to our state of play?

OE: Woodley manually copies things out and (missed)

B: load size of the grammar is bigger and has more features. Is that
true? No, it’s just ugly. The restrictor cuts out the rest of the SLASH,
during the packing time you get the full slash but that might be
harmless because it’s full of reentrencies.

W: time spent constructing is usually not that much anyway. Only happens
15-20% of the time.

B: there is exponential growth (where? missed) The ratio of equality
packing and (?), 1/100, 1/300 (still same graph)

W: questions the graph (something doesn’t add up?) (the four types of
subsumptions, to the total number, off by a factor of 30?)

(some confusion over the chart)

B: that would be unpacking failures, they are unrelated to the other
three.

(confusion cleared up it seems)

B: Important paper, feel free to look it up later: in the chat
<https://www.aclweb.org/anthology/W07-1219.pdf> (that’s where the graph
is from)

Dan: Can we talk about the unprincipled but tempting notion of how to
arrive at a first best parse without enumerating the whole space? Chart
pruning ,Supertagging, using CFG oracle as a guide, what else?

John: Grammar specialization (grammar analog to supertagging). Some rule
is not used in some domain, can get rid of. Done in the SRI Core
Language Engine

Dan: based on annotated data indicating some rules are never used (in
some data)

John: yes, their rules were DCG rules, with categories being Prolog
terms and many features being atomic-valued. Specialized rules
internally as well as at grammar level

Dan: potential benefit, if we can get a large enough corpus. Parse in
first-best mode, using our maxent model, can we find rules which we
never used in those? Human-cheaper way.

OE: in the chat links
<http://lists.delph-in.net/archives/developers/2015/002131.html> about
improvements in HPSG parsing performance

Dan: can look at instantiated values of features in derivations. It is
true in education space for sure. Learners use few rules etc. But I pay
the price (15-20%) of considering rare constructions.

OE: could we learn the distribution of the rules over domains?

John: SRI people did that, I think using Explanation-Based Learning or
something like that

OE: learn variant grammar (that was). What I meant was learning graded
distributions that translated into probability distributions. Can
probably acquire rule distribution knowledge from inspection of WSJ
treebanks etc. Having that knowledge, in our parsing setup we could take
advantage of that. Most costs are in constructing forest (OZ: didn’t
woodley say the opposite earlier? I must be confused about this)

Dan: part of your (OE) suggestion would be to be able to widen the beam
search as searching for a parse.

OE: in beam search, (something) can get in the way… (missed)

Glenn: crude approach: fallback. If you can’t parse, add rules which you
had removed before

Dan: trouble there is there are too many possible rules to remove(?) and
one might work.

Glenn: some features may be so unique so as to mitigate that?

Dan: this may work most of the time; like 100% improvement in speed and
only 1% loss in robustness; for some applications maybe OK

Glenn: but we’d fallback

Dan: but there would still be wrong analyses then

Glenn: oh, I see “false negatives” in the sense of, at least one
unwanted analysis from a “common” rule will always block all access to
(the fallback inclusion of) any wanted “obscure” rule(s) which were
preliminarily excluded

Dan: very common in large grammars

Dan: What are downsides (for grammar specialization)? Let’s say instead
of discriminant-based treebank, use existing maxent model, run over
corpora from some domain, measure (what? The rule probability I think)

John: empirically it’s fine. The cost of doing it may be an issue. The
core language engine (SRI grammar?) was smaller than ERG etc.

John: on another topic, I've noticed some strange lexical edges from the
ERG when looking at efficiency, e.g. "in" analysed as "E" + -in lexical
rule

Dan: I use the -in suffix for the informal southern style, dropping g
(in -ing). I regretted it because it explodes in silly ways, need lots
of irregular exceptions. But, that’s an example of something you could
discover, that it is not being used and so don’t need to use it in the
grammar.

John: so lexical rules as well as phrase structure rules.

John: in ACE packing under generalization, does retroactive packing
figure at all?

W: Generalization packing can be retroactive (creates a generalized DAG
and then checks it subsumes both inputs). Yes, some wasted computation
before the packing is found

John: would be good to minimize it.

W: haven’t measured it vs. subsumption. But I am sure there is some
wasted computation there.

John: in LKB, prioritizing parsing spans starting further right while
doing shorter constituents first seems to save time. Not sure why the
right-most criterion helps (perhaps due to predominantly right-branching
phrase structure?)

W: interesting, doesn’t make sense

John: doesn’t make sense to John either. But the gain was 5-10% so I
remember it well.

Dan: any experiments with trying to do some amount of top-down
constraining? E.g. If wh word is in the front, I know I need a
filler-gap construction. And if not, I don’t need filler gap at all.

John: Core Language Engine used a left-corner table for parsing (perhaps
worked well since english is mostly left-headed). This allowed checked
for connectivity top-down before proposing a rule bottom-up, i.e.
top-down prediction. I am sure there was a big gain, but their grammar
was much much smaller than the ERG.

W: tried to do gains like that with the ERG, never been able to produce
a useful inference where what’s given at the top is useful for
predicting what’s at the bottom.

Dan: could that be applicable for the pcfg that W extracted from
Wikiwoods?

John: I’ve done something similar with the RASP system grammar, but it's
a GPSG-style unification grammar so much less rich than an HPSG. Created
an LALR(1) parsing table from around 2500 CFG rules; this kind of table
encodes a lot of top-down information. But the ERG is probably too big
for this.

Dan: we have bigger machines now

John: may be worth a try

W: what would we then do with that? Suppose we have a cfg approx of the
ERG. then what

Dan: 1. Efficiency. There might be a way to use that information to
guide beam search, then ask grammar to confirm with actual rules. If
fails, then know where to do local work to build a constituent that’s
not buildable. 2. Robustness. But currently too expensive, adds too much
time.

W: if I do LR(1) parsing, I can still build a full forest for that PCFG?

John: yes but it is less efficient, with a highly ambiguous grammar. You
have a graph structured stack which unfortunately leads to less sharing
of computation than you get with a standard chart parser.

W: won’t end up with CKY chart like structure, so can’t run inside out?
algorithm.

Dan: why a parse forest for PCFG?

W: to provide pruning info. Once you’ve parsed with pscfg, you know e.g.
the P(head-comp-phrase) = x, in a certain cell

Dan: can’t compute those probabilities without the parse forest?

W: Prob. is normalized by the mass of the forest (?)

Dan: Can’t you approximate with mass of the training data?

W: can come up with a score of some sort, without doing the whole
forest. But I assumed you wanted an interpretable probability, to
specify a threshold for pruning the chart. Prune all the edges which are
not likely to appear in any tree

John: the one best or n best pcfg analyses are probably not going to be
as good as the ERG analyses

Dan: I saw in PCFG, large regions are isomorphic (to the correct ERG
analysis) but sometimes it picks the wrong lexical head for the sentence
etc. but still it was interesting to do (missed)

W: 30-50% of the time we get the right tree, vs 20% for pcfg (missed)

D: if you train a pcfg well enough, that could be useful and not
hopeless

W: nothing sacred about our existing maxent model (or shouldn’t be).
Even a lower score, if search is easier, that could be better, if loss
in score is not huge

Dan: if we add not just purity but also efficiency and robustness as
priorities...

W: purity is not the reason to go for the maxent model. Only performance
is.

John: how about this (the opposite of what we've discussed so far): if
you can’t parse quickly with the full grammar, try a smaller grammar?

Olga: what’s a scenario?

Dan: Learner data, needs to parse as quickly as possible. Big grammar
has restricted amount of time, otherwise fall back to restricted grammar
that gives fast answer, though not necessarily perfect.

W: should not ignore high quality answers we can get from neural
systems. Do need huge amounts of training data, but may be worth it.

Dan: but no report on grammar errors. There is no training data that can
give me that, in neural models.

OE: Dan is one of the rare users of the ERG who cares about the syntax.
Gamechanger was feature extraction through BiLSTMs. Look at words in
context and embed them through recurrent bidirectional structure. Inform
each of them about their neighbors. Contextualized word embeddings are
doing something similar. We’re ignoring what could be learned from those
success stories. Contextualizing prior to parsing gave a good boost in
data driven and constituency parsing. It should give us a better handle
at looking at the string we’re giving, allowing some context (?) to
influence parsing.

Jan: 1) the way our neural parsers work, if you are considering the
score of constituent label in a given span, you can use neural model
directly to compute that, once it’s trained using rules as labels in the
tree. Without the grammar. It does not give you prob. Directly for a
rule given a cell, just the ranking (score). Need to do marginalization
to obtain probability, slightly more expensive.

OE: for a useful result, need good embeddings for the input? W. says he
was not able to improve disambig. using LSTM. Where did you (woodley)
start?

W: approximately. I have an embedding for each lexical entry. I did that
training from random. Used [FastText](/FastText) to train that on the
yield of Wikiwoods.

OE: so, pretrained noncontextualized embeddings, not off-the-shelf.

W: there aren’t any, for ERG lexemes. Mapping off-the-shelf to ERG
lexemes is not transparent how to do it.

OE: but could for the surface forms or their lemmas. Would tell us about
the distribution of the tokens

W: neural should be great for reranking or parsing from the beginning, I
am sure of it, I just wasn’t able to so far.

Jan: if you compute a single embedding (missed), that’s hard to make use
of, this big compositional thing. But if you have a bag-type model, just
a tag, a span, etc., a bag of things, that should be easier.

D: could that have same benefit as supertagging? Rank if not filter
candidates for bottom cells of the chart

OE: sequence-labeling architecture, yes, could capture distributional
info at lexical level. Between the lines: pulling off more complex
tree-LSTM architectures is much harder. Neural engineering tuning,
picking the right hyperparameters, picking an architecture, is a large
part of success, perhaps bigger issue than in classic ML. UW CSE would
have gut feelings about what to do here, if they got interested in our
problems somehow.

W: back to efficiency, contextualized embeddings to predict a score for
a rule in a span, then prune the chart. Jan’s idea. Thoughts?

Dan: Yes, but Jan said it was practical only at the bottom, not middle
of chart?

Jan: It’s easiest at the bottom, but training a supertagger should be
straightforward. It will be able to give score for any cell in chart,
but it won’t be a probability. It’s usually trained in ranking based
objective rather than probability. Can still use ranking directly,
probably will work well for picking one best.

W: how to you architect such a system? Start with context. Embed. At the
bottom, then predict some layer, but what goes in between? Jan: there’s
a paper. Idea is to get contextualized embedding for each token, then
use that to compute embedding for any span/subsequence of the string by
concatenating embeddings of span. W: ignoring tokens in the middle?

Jan: yes, assume the useful info will be learned by the model somehow,
at the boundaries of the span. Couple tricks to encourage the model to
do that. Another option: attention mechanism, weighted average of the
embeddings of all the tokens in the spans. Haven't done this but could.
In the chart, you don’t have to score the label of parent and child at
the same time. Just the score of the rule you want to apply at the given
cell directly. Should think about computational cost because label size
is larger here. A bit of added cost. But should be feasible.
Supertagging could be some kind of separate step.

W: Would you use the same set of embeddings at the bottom at the higher
layers?

Jan: I don’t see why not. Only question with supertagger is scoring
segments and not (?). Generally neural taggers work well for independent
predictions for each token (missed), something about CRF

OE: there’s off the shelf code for that which works sufficiently at run
time. Essentially Viterbi decoding right?

Jan: something (?) is quadratic in the number of labels

OE: added complexity in some lexemes covering multiple input tokens.
Some information needs to be carried over to multiple tokens. W: repeat
please?

Jan: to predict a single token for a multiword expression, you still
need to predict the boundary (what boundary? OZ)

OE: not just sequence labeling also a segmentation problem. Would have
to look at what happens in neural variants of CJK? tagging?

OE: this complication applies to us just like 10 years ago. We don’t
know the segmentation(?) just from the surface organization.

Jan: not too much of an issue. Just need to think about it a bit more
carefully

OE: but off-the-shelf tools won’t work for us because of this, so, can’t
delegate to a beginner-student etc

Jan: there are models for doing segmentation directly; adds computation
costs.

B: in W’s earlier presentation, we mentioned families of rules. Dan’s
naming convention is consistent; can that be picked up by a neural
model? E.g. this is an instance of a head-comp rule.

W: could cluster the rules this way. Can be done.

OE: If the instances of the rules have shared distribution that emerge
in the embeddings?

Jan: in the chat links <https://arxiv.org/pdf/1705.03919.pdf> neural
constituency parser

W: you don’t want to bake hypotheses into the embeddings? Families of
rules would be convenient for categorizing (something; missed), for
error analysis.

OE: top-down paper from IWPT; surprising approach for us but apparently
can be done, so, tempting. But not a DELPHIN style, an Enju-style
grammar, smaller, weaker notion of grammaticality.

W: was your impression that their method might be applicable to what we
do?

OE: yes? First neural HSPG parsing paper that comes to mind

John: appeals to W. to publish on packing under generalization

W: thanks everyone!

### Secondary (much less complete) independent scribing by Woodley

Parsing efficiency

Woodley: packing appeals to me. Also happy to talk other efficiency
ideas.

Dan: let's talk packing. benefit to me: quicker, fuller treebank
profiles

Can I do some pick-and-choosing of my own about what to pack? packing
restrictor list.

Woodley: hard to get much benefit from that.

Berthold: Gains to be had in GG from careful packing restriction...
would like to restrict SUBCAT, but keep some important things from it,
e.g. how many things on COMPS and their HEAD.

Dan and Berthold: perhaps path-based restrictors.

Woodley and John: feature-based restrictors applied at load time.

Dan and Stephan: path-sensitive restrictors must be applied at runtime.

Berthold: there's literature on cutting out SUBCAT from inside of SLASH.
The baseline there was "unfilling."

Woodley: why was unfilling abandoned? Stephan: hard to recollect
exactly, but there was a correctness issue. Berthold: also, ERG min
types largely negate its effect

John: possibly the correctness issue has to do with unfilling losing
coreferences. Glenn: maybe a version of unfilling that preserves
coreferences...?

Stephan: historical remark... DFKI had a way of specifying such
restrictors, using cyclic feature structures. Concurrently traverse
feature structure to be restricted and restrictor template.

Dan: popping a few levels, what about finding a 1-best tree quickly
without trying to do the whole forest, possibly using approximations or
a different disambiguation goal? Methods: ubertagging, chart pruning,
guiding with a shallow parser, ...? John: also, restricting the rule
inventory for a particular domain. Dan: possibly parsing a subcorpus and
seeing what rules never show up, and then using that to guide reducing
the rule inventory. John: or possibly: this feature was always +, never
-; enforcing that could speed things up. Dan: in many genres I care
about, things like conditional inversion ("were I to do X, I would Y.")
or extraction of nominal compliments basically never happen and cost a
nontrivial amount. Stephan: possibly deploy automatic learning to guide
this?

John: in addition to agenda ordering shortest constituent first, I've
found a benefit from right-most constituent first.

John and Dan: how about giving the full grammar X amount of
time/resource, and if we fail in that span, try with a reduced grammar?

Stephan: we should consider using contextualized input tokens, e.g. from
BiLSTM / BERT / ELMO. We aren't taking advantage of the technology of
the time, which is very effective.

Jan: @Woodley, trying to produce an embedding for a whole tree is a
harder problem than doing some sort of tagging at the word level. What
about using neural methods to learn to prune the chart based on
contextualized embeddings? (paraphrased)

Start with contextualized embeddings for each token. Use that to compute
embedding for any subsequence, by concatenating the start and end
tokens' representations.

Woodley: ignoring the intervening tokens? Jan: yes, you assume the model
will learn to summarize the useful information at the boundaries of the
span. In practice that works fine. Or you can have an attention
mechanism.

Woodley: use the same embeddings for the rule predictor and the token
supertagger? Jan: yes, I don't see why not.

Jan: see: <https://arxiv.org/pdf/1705.03919.pdf> neural constituency
parser <https://arxiv.org/pdf/1511.06018.pdf> for segmentation Weiwei’s
earlier work (<https://github.com/draplater/hrg-parser>) includes a
constituency parser (although maybe not the lexical tags)

Stephan: <https://iwpt20.sigparse.org/pdf/2020.iwpt-1.14.pdf> for top
down HPSG parsing.

Last update: 2020-07-18 by WoodleyPackard [[edit](https://github.com/delph-in/docs/wiki/VirtualParsingEfficiency/_edit)]{% endraw %}