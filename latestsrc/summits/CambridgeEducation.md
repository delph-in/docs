{% raw %}# Leveraging DELPH-IN grammars to develop educational materials

Discussion at the [Cambridge Summit](https://delph-in.github.io/docs/summits/CambridgeTop) led by Kristen
Howell; scribed by Francis Bond (2019).

Some discussion of coverage of various grammars.

Dan: we should also note the work of Norwegian, which has done a lot of
work with the Sparrer.

- Even a restricted vocabulary can allow interesting grammatical
phenomena, if you work with the grammar. You can try to work within
the limits to produce your exercises. You can have a very small
grammar and still start doing things with it. Grammar correction
over unconstrained text is going to be out of reach for most
grammars: although it works with the ERG. Semantic correctness is
still an issue.

David: how do we check the semantic correctness --- Dan check against
reference answers. David: is the framework there, is it documented ---
yes. Francis: Luis's stuff is in github
<https://github.com/lmorgadodacosta/LCC-AssignmentChecker> which may act
as some sort of documentation. The Sparrer also has a good documentation
of the phenomena.

Emily: how do you fail gracefully. Dan: We tell them what we found, and
are quiet if we find nothing.

David: Do you only say something is bad if you parse it and find
something and it is wrong.

Dan: yes.

Francis: we have two levels of errors (warning and error): if we can't
parse it we just give a vague warning.

Emily: what if you don't have much information about the errors you
expect?

David: For my grammar I have a fair idea of the errors but am not sure
how to write mal-rules.

- e.g. for clitics in the worng place or weird reduplication.

Guy: you normally constrain what the students can do, right?

Dan: yes, we can constrain their input and it gives us more control. So
often we will even restrict the part-of-speech. This means we cannot
show so much range of variation, which may not be so good for the
students as we can't see so many types of errors.

Francis: although we really want them to get it right, so I think this
may be a good thing (at least for early learners).

David: how do you restrict the vocab Dan: they have to chose from a list
and we reject it otherwise

Emily: picture and words can connect also to the cultural background,
...

One issue can be that different dialects exist and you may have to
specify one.

John: lexical collocations are an important problem you have not
mentioned here. You can, for example, say this n-gram has not been seen
before.

Dan: you may not be able to say what the error was but you can suggest
it is strange.

Francis: we would like to use this to keep things in genre

John: keeping people on topic is also difficult --- they may write
something good but not relevant
<https://www.youtube.com/watch?v=tTv5ckMe_2M>

Francis: we could also try to do vocabulary games, although the
literature suggests that this can backfire if you group things by
semantic field.

Dan: if you can generate, then you can produce the correct sentence, and
this may be useful. The grammar sparrer does this a lot.

Francis: I would think you need a good statistical model or you could
end up being very confusing.

Francis: I think a small grammar of beginners' sentences is going to be
very useful for almost everything.

Emily: Having a way to find examples of grammatical phenomena can also
be very useful. Like the ERS (or the ltdb: Francis).

John: my daughter teaches English and being able to find examples can be
useful.

Dan: we can do this with the ltdb

Emily: an even more friendly interface would be good here

Dan: I looked with Ned at allowing people to enter a sentence and then
use it to identify interesting phenomena.

David: what treebanker do you use?

Dan: The fully supported FFTB.

Emily: if you are not treebanking then you are not grammar engineering
\[quotes self\]

John: we train a grammar with rare constructions (typically
mal-constructions). This is trained on annotated text from the Cambridge
assessment corpus.

Dan: we are not sure what to train on, but hope to start treebanking
soon.

Francis: we have treebanked 1,000 sentences with mal-rules

David: we have an issue with rare-constructions you can go SVO but it is
weirdly marked.

John: we also look at the top 500 or so parses to try to find the weight
of errors. If you find mal-rules in most of the top parses then maybe it
is mal.

Emily: how much work is it to set up a small translation grammar.

David: it depends on how different the languages are.

Francis: we had an issue with ungrammaticality which we needed to do
something about.

Last update: 2019-07-16 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/CambridgeEducation/_edit)]{% endraw %}