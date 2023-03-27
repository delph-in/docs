{% raw %}**PyDMRS (with Demo) and Work (in Progress) on a DMRS Graph Description
Language (@** [DELPH-IN 2016](https://delph-in.github.io/docs/summits/StanfordSchedule))

*by Alex Kuhnle and Guy Emerson*

16 June 2016 (Day 1)

* * *

Scribe: Wenjie (apologies for roughness of notes!)

* * *

**\[Mid-presentation questions\]**

Alex **L**ascarides:

- With this string, that you are converting these DMRS-es to, how will
control work? Will you get a given noun, with (of one? ARG1)
relation to more than one thing coming along? So, you sort of mean,
two right arrows coming out of that string? What happens there?

Alex **K**unhle:

- It will be in the next example. So (referring to slide), here,
instead of "Kim eats cake", we have "Kim likes to eat cake".

\[... presentation continues...\]

Alex**L**:

- I have another question. Can you underspecify the type of dependency
between 2 things?

Alex**K**:

- Yeah. To a certain degree, you can put it in question 1 here. It's
an arbitrary one. I'm not too sure, but you can just say it's an
ARG, but not know which number. But yes, you can underspecify to a
certain degree.

Woodley:

- How do you define subgraph in this situation?

AlexK:

- I remove this node (referring to slide), and I test whether it's
disconnected by doing some stuff from the top node, and anything not
in this \[..?..\] top node is considered disconnected, and
considered a subgraph that is to be removed.

* * *

**\[End of presentation discussion\]**

Emily:

- Can you give me an example without 1P pronoun, where you would want
to use that constraint?

AlexK:

- I think it can be useful if you don't use it for whole nodes, but
for values in the nodes. So you can use it for values of this sorted
\[..?..\]

E:

- A really cheap form of ? resolution for pronoun? You have a pronoun
here that has something... as this other non-raising pattern?

A:

- Yes, or just one value that turns to, I don't know, \[?\] or
something. It's a few artificial examples which I can think of that
this type of paraphrasing will be useful, but it's something
\[inaudible\]

* * *

Mike:

- Comparing to the transfer machinery, which requires a context, so
that they could capture these things. Can you do that with this?

AlexK:

- You could do it by just defining partial patterns and leave the
other nodes the same.

M:

- So you can have some indication that not all nodes are consumed?

A:

- They are consumed, but if you define both the source and the target,
and just copy them. Would be much simpler, but I guess you could
think of how to add that as another feature; it doesn't exist so
far.

* * *

Stephan:

- Have you looked into the relationship of this custom graph
description language to the RDF\* universe? (\*Resource Description
Framework)

AlexK:

- This was started as just an experimentation; it's not my main
project, just something I work on the side.

S:

- We did something in similar spirit, mapping MRSs and (EDSs) into RDF
triples, and there are a number of tools to query and re-write
graphs in that language. One property it does \*not\* have is
compactness. It has very scalable, industry-standard tools, that are
used by many people. But even in its most compact notation (Turtle
or TriG, probably), it is still more verbose, more characters, than
what you are doing here.

A:

- I guess one could do some kind of mapping.

Chair:

- Ok, then let's thank Guy and Alex.

Last update: 2016-06-18 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/StanfordDMRSGraphDescriptionLanguage/_edit)]{% endraw %}