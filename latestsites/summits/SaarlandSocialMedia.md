{% raw %}Discussion: Parsing Social Media Data

First, [Tim's slides](http://www.delph-in.net/2013/tim.pdf)

Glenn: Should we hold this on twitter?

Tim: Yes --- \#delphin

oe: Interesting questions. We have one relevant ongoing project in Oslo,
[WeSearch](https://delph-in.github.io/docs/garage/WeSearch) "Semantic parsing for the web" is the subtitle.

Woodley: The Norwegians would be happy to help you with the how fast can
you make it question.

oe: Wrote into the grant that after a decade of working on
coverage/robustness/accuracy in analyzing English it's a good time to
work on efficiency again (e.g., übertagging). In our grant we were
applying to a funding scheme thinking of social media, used the term
user-generated content, not brave enough to go all the way to facebook
and twitter. Still have great respect for those genres. I wonder what
proportion of interpretation is determined by the grammar vs. other
aspects of the context. We picked genres that are slightly better
behaved (wikipedia, blogs, reviews, forums). Surely the genres form a
continuum.

Tim: One thing that can help on the messier end is user priors. If you
believe there is a one-sense per discourse heuristic, is there a
one-sense per user heuristic? Are people so one-dimensional in their
discourse that they tweet words only in one sense? It turns out that if
you believe in one of thee two heuristics, you should believe in the
other: the skew is equivalent (for one-sense per discourse/user).
Knowing what people talk about and using those priors could really help,
perhaps reducing the reliance on parsing proper.

Bec: And would you be putting that in with preprocessing (super tagging)
or putting it directly into the parser (would be curious how this could
be done).

Tim: Don't have answers for the parsing, do for preprocessing for things
like user geolocation, using sense-priors on a user-basis. Learning
lexical priors we can do. Don't know what that means in terms of
parsing, whether you're throwing words into a chart and seeing if we can
form a parse some how (like generation) … thinking on the spot.

oe: The other thing from our experience so far we see better parsability
figures than what you reported here (actually 10–20% higher than these
numbers; LREC 2010 and 2012). Robustness to the idiosyncrasies of these
genres are not… the reason we see better (nb: raw) coverage figures may
be because we used the first 1.5 years of the project looking at
old-school aspects of preparing the data. Getting out the relevant
linguistic content, tokenizing, preserving and using mark-up for these
tasks (e.g. 95% &gt; 99% sentence segmentation accuracy). That might
well translate into a 4% difference in parsability. It's important to
pay more attention to the extralinguistic aspects of these signals and
to introducing these into grammatical analysis (e.g., feeding markup
info like italics into the grammar) --- this is an important part of
improving results on any text that comes with markup/lay out.

Dan: One of the crucial characteristics of twitter (in my opinion, being
too old to use it) is that it is very much more a dialogue-like
interaction: the way in which one interprets the utterance is so much
more dependent on what went before (the minute before or the week
before, but linked by the hashtags) --- the utterance can be more
efficiently interpreted because of that semi-explicit linking of the
dialogue. My inclination would be to take on the long-postponed goal of
trying to go beyond single sentence processing in the representations we
build or exploit -- even a simple-minded way of relating the previous
context to the current item being processed might help --- beyond just
pronouns, say supplying the missing verbs. That would also pay respect
to the nature of the genres.

Tim: Only about 10% or so of tweets are in explicit conversation, but
another 50-60% are in some larger (social, or other alinguistic context,
e.g., an event that has triggered the tweeting); capturing that would be
an extra order of magnitude difficult. But I agree, if we had the
information it could be very useful.

Glenn: OTOH having a dialogue framework would benefit many other areas,
beyond social media.

Yi: Regarding robustness measures, PCFG approximation just tries to
smooth out the missing coverage assuming that the constructions can
still be covered by one of the constructions introduced int he ERG. The
problem is that there is not yet any treebank that marks the
extragrammatical instructions that the grammarian decided not to go
into. But these will be more frequent in social media data. Then PCFG
approximation and other smoothing mechanisms can learn from such a
treebank.

David: Is this idea of dialogue context a special case of the question
of how to feed back external semantic reasoning back into the parsers?

Glenn: Could be done in several different ways, a huge area of inquiry.
That could be one, carrying a world model (auxiliary to the parser)
could be another.

Ann: There's a chance that I'm going to become extremely interested in
this if some funding comes through. Would have a number of PhD students
working on language processing, ML, network analysis with social media
data. By this time next year I might be ---

Tim: ---the QUEEN of social media.

Ann: At the other end of the spectrum, I've been thinking about this
sort of stuff as a way of investigating the idea that individuals are
using terms very differently (compared to one corpus with everyone mixed
in). This idea about negotiation of meaning which is an old one but
never has a decent computational investigation, but that sort of thing
would be very interesting to investigate in this context. In fora you
get lots of things going on where you get consensus meaning, new terms
coming up and stuff like that. Could be very interesting and there's a
lot of data out there, where the data \[can be found that is\] somewhat
specific to a particular topic --- could be cool.

Tim: In this space, data management becomes a huge issue.

Francis: Not quite social media, but hopefully at NTU will hopefully be
looking at electronic medical records which share the short
incomprehensible utterance space.

Tim: Natively electronic?

Francis: Yes, very Singlish, but no sentence boundaries.

Last update: 2013-08-04 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/SaarlandSocialMedia/_edit)]{% endraw %}