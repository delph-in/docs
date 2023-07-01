{% raw %}# Discussion: ChartMap

## Lead by: Francis Bond

\[scribed by David\]

FCB: ...the very complete goal, trying make the reduplication that we
have semi-working with the chart mapping where we expect to have a bit
of guidance from Dan and Glenn. So let me just recap the current state.
So let's just parse something with reduplication in Indonesian. Before
we jump into reduplication, a few words from our local host.

Glenn: my impression is that you can understand what the chart mapping
machinery does but there is not a whole lot we can do as group to help
you do it. It is a very cool piece of machinery. It is not as formally
precise, not as well understood, I think, and is not reversible, and it
is actually quite early in the pipeline, it is immediately after the
repp, well before the LKB morphology. I guess I just want to get a lot
more clarification about what you are going to achieve here.

FCB: What we want to do is solve the concrete problem. I want to get
feedback. Dan has done most in his grammar with the chart mapping. I am
hoping Dan can tell us it is possible or not. I think we have at least
three grammars in this room who would like to have reduplication
working.

Dan: I could do a two-minute talk. The intent of that pipeline is to
normalize ordinary running text so that the parser deals with the more
simplified problem. For example, you can use various Unicode characters
to mark an apostrophe in English writing. It is annoying to have all of
those apostrophes inside the lexicon. It is convenient to have a piece
of those normalizing which says whenever you see any of those
apostrophes, turn this into a canonical one, use it throughout your
lexicon. It is also a convenient tool for dealing with unknown words
because you can use POS taggers to give you a guess about the tag and
then you use the chart mapping to convert that into particular ... The
large intent of this preprocessor is to turn real text into something a
little bit simpler, more regular, more predictable, so that your
manually constructed lexical entry rules do not have to work so hard.
There are games we play with the chart mapping, for English involving
words with spaces, sort of putting in a space or not, pulling out
apostrophe ('s)s or possessives but not for any other thing. We also
used the token mapping for expressions that involved numbers or other
open sources of tokens where you just can't list them all, you can
pretty well list all of the dates in English but it is annoying to do
it: 31 days of the month and the variations: European encoding for that
dates etc., and for currency, units of measure, there's a lot of real
things that happen that are annoying to deal with inside a grammar. This
chart mapping squeezes into a more predictable or regular. Now for the
reduplication case, I think you want to make the machine to do some more
kind of tokenization, where there is no help from the conventional
regex, so there is a bigger thing here, you want to see what the root
is, you need an engine which can run over that sequence of characters
and find the pattern there or sets of patterns and abstract away from
the sequence of characters. It does not seem like an impossible request
for this engine because that chart mapping is supposed to be able to
manipulate and discover the regularity hidden inside the sequences of
the surface characters.

Glenn: You worked on surface strings not tree structures, so this is
before the syntax starts or deals with morphology. how we hold the
grammar to be the first priority, not make it polluted or impure with
all of this.

Dan: I think we have an intuition that there is somewhat elegant
generalization in certain corners of language. You can look at the date
expressions or units of measure and say, that's units of measure, that's
a date expression but not a telephone number. There are regularities,
they can give a pretty good guess, a nice thing about a chart mapping
machinery is you can say this sequence of characters could be this or
could be one of these other options and those are both encoded in the
chart. So you don't have to decide early, you just give the machine some
more information about the explicit possibilities.

Glenn: the input has to be a single surface string with one tokenization
hypothesis or infinite or zero tokenization, it's a string characters.
What comes out can actually be multiple hypothesis in parallel. You
don't have to actually resolve, you can't resolve because you don't have
access to syntactic upper information. You can actually feed as many
overlapping, non-contiguous, non-consuming, any possibility, you can
actually scramble as well. It's really powerful but a little bit unruly,
I think. It's certainly far beyond regex.

Dan: We do use regex for the detection mechanism, pattern matching, say,
does that thing look like a measure unit, does it look like a date
expression, or something like a telephone number. You are building
essentially a pipeline rule, each which can produce an optional output
or deterministic output, you control whether the rule throws away what
is known before and only gives a new stuff or preserves what you started
with and adds some new information into the chart and you can create
feeding mechanism.

Glenn: The way the formalism works is essentially you can break your
string into fragments and everything goes into this melting pot. What I
mean by the melting pot is everything stays in there for potentially
being consumed later, it's up to you to completely design those phases,
you can take something from phase one and process in phase five if you
want.

Dan: But there's an ordering for those rules and there's some recursion,
iteration in that.

Glenn: That's the tricky part. The ordering in the file is in fact,
results of the ordering in which rules turned out to apply based on a
given input. The machinery does the extremely expensive work for you of
making sure that there's never a duplicate token in the melting pot.
Unlike TFS or TDL, where you can spin a rule. Without that, you really
have too much power.

Dan: It's hard to control all those interactions.

FCB: We look at reduplication. Why we have to go to chart mapping? In
Indonesian and similar phenomena in Chinese, you can have something like
"anjing-anjing" which means "a plurality or a variety of dogs". Not
exactly the same as dogs in English but close enough. You can also have
reduplicated adjectives which means the subject of the adjectives is
plural or has the same plurality thing. In Chinese, reduplicated
adjective means it's like "very something", if you reduplicate a verb it
means it's "a little bit." The difference depends on the parts of
speech. Basically, the reduplication takes the meaning and does
something to it, if we try to do that in syntax we take "dog" and "dog"
and we have two dog predicates. Because our syntax is strictly
compositional, we can't get rid of one of them. The semantic we would
like to have is not "dog and dog" but dog with some extra feature
plural. Currently we are doing it in the preprocessor because I know how
to do simple regex, which means every time we see "dog-dog" we rewrite
it to "dog²" which is how Indonesians write (a shorthand) on the phone
or something, and then we have an inflectional rule that says look at
the affix superscript two (²) and triggers the inflectional rule that
does whatever we want to do on reduplication. The drawback from this is
that sometimes there are words that are lexically reduplicated such as
"eye-eye" which means "spy". If we go through regex all the time, we
have to put in our dictionary "eye²" to be "spy" which is a bit
confusing and in fact, it's ambiguous. So, "mata-mata" ("eye-eye") could
mean "spy" or "plurality of eyes".

...

FCB: In Indonesian and Chinese, the reduplication interacts with other
things like clitics or inflection of the verb, so you can get things
inflecting before or after the reduplicated. In Chinese you can have the
reduplication just the first character of the first word and various
combinations.

SSH: Is it possible to have triple reduplication in Chinese and
Indonesian? If so, I think this may not be a good solution.

DVM: Yes, fossilized and not productive in Indonesian, e.g.
"cas-cis-cus" in which the vowels change.

Joshua: Is token mapping the same as chart mapping?

Dan: I think we are using them interchangeably now.

Glenn: The machinery is actually used in two places: one before the
parse, and one after the parse. The instance after the parse is actually
called lexical ... and it has all the rules of the standard token
mapping machinery ... you can only delete.

FZZ: Which files are actually used in the chart mapping?

...

Glenn: The fundamental way to think about is essentially, first of all,
you are going to break the surface string into whatever pieces you want,
so you have a bunch of pieces and you can basically do the two to one,
you can do the one to two, you can do three to one etc. The rules,
basically there's two-one rule, there's one-two rule, there's all the
schemata already done by Dan or all the different scenarios. One of the
most important things that the token mapping does for ERG is to actually
take every word and split it into two: the unknown word and the lexicon
lookup. So, this is before the lexicon, you don't know if the word is
going to be found in the lexicon. They have to create two parallel
paths.

...

FZZ: (chart mapping rule in Zhong using regex) try: ^(十)\\1 日$ try:
^(.)\\1 日$ try: ^(.+)\\1 日$ try: ^(.)\\1(.)日$

...

DVM: [Reduplication in Indonesian](https://delph-in.github.io/docs/garage/LADIndonesianMorphology)

...

FCB: Using XFST, I don't know how, not every morphological thing deals
with reduplication, but on the other hand, if it did work, we could
predictably give it things and could give us the root plus something ...
I don't know XFST.

Joshua: So, the way you do it is you have a series of network you are
going to compile together, I build a network that says ... I have to
defind something like C for consonants and V for vowels ... there's an
operator called \_eq and you can filter that network ... I didn't have
any trouble with what I was dealing with. My forms were mapped to +RED1
or +RED2 and that's what I passed to the syntactic grammar, like you did
with the inflectional rule. I can have multiple reduplications with the
same stem e.g. root+RED1+RED2, one is diminutive and the other one is
distributive ... I have a database of roots, I want to press a button
over here to export into my XFST database, press a button over here to
build my DELPH-IN style lexicon for my HPSG grammar. So the idea is they
do share some resource ... I can show you some of the files I used for
reduplications in Lushootseed.

FCB: We are coming to the end of this session, just summarizing, thanks
everyone, I believe I understand chart mapping a little bit better. It
looks for Chinese which has a lot less in the way of
inflection/morphology, the chart maping does what we want for the things
we can put the stuffs together, it's pretty much good. For Indonesian,
it is not entirely clear whether we should have a quick look at XFST. If
on the other hand, we can do tiny bit of chart mapping on the output as
well, I'd rather..we almost certainly want to use the chart mapping
machinery for mapping telephone numbers, web addresses, and various
other things. If we are using it anyway, I prefer not to add yet another
submachinery, if I can avoid it. That's what the LFG people did, they
use an external morphological analyzer and then pipe it in and out.
There's varieties of ways, Japanese does not productively reduplicate.
Thai does, so I believe there's interest there. Depends on how much
morphology we have to some extent: Indonesian has slightly more than
Chinese. In the short term, we have been ok with just using square. We
will try to, if we produce something with the Chinese thing in Zhong, we
will put a little note somewhere in Zhong this is how we did this is how
it worked.

Last update: 2017-01-18 by DavidMoeljadi [[edit](https://github.com/delph-in/docs/wiki/CapitolHillChartMap/_edit)]{% endraw %}