{% raw %}**Lightly scribed by Luis...**

# Gtest & Semantic testing \[Lead by Michael Goodman\]

## Gtest Reminder

\- You need PyDelphin installed and findable by python if
you have not installed pyDelphin through pip, you may need to do this:
export PYTHONPATH=\~/PathToPyDelphin/

./gTest.py -G
\~[/PathToGrammar](/CapitolHillGenerationTesting/PathToGrammar) C -- l
\[tries to find profiles, you can also customise where they are\]

FCB: Is the profile stored somewhere?

MWG: Yes, it creates something under /tmp. I think it creates a folder
every time you parse a profile.

- /gTest.py -G
\~[/PathToGrammar](/CapitolHillGenerationTesting/PathToGrammar) R --
l \[R is for regression testing, it finds profiles with gold
versions\]

EMB: Is there a way to output only items with diffs?

MWG: No…

EMB: It would be nice to have it.

FCB: Also the item number and the id

Zhenzhen: How to update the gold profile?

MWG: The tsdb/gold/ and tsdb/skeletons are the ones being compared.

SSH: For INDRA and ZHONG the gold profiles are being git-ignored!

MWG: You can see BadMRSs (i.e. those which can’t be read). And also
ill-formed, disconnected and non-headed (these 3 are not exclusive).

EMB: So this works beyond what you can do with TSDB++! Cool!

DVM: Can I know which ones are Ill-formed, disconnected or non-headed?

MWG: Not here, there are other functionalities in the developers branch
on git hub. But there are things I still need to do about testing.

## Generation Test \[Excerpts of the Discussion\]

MWG: Generation testing. The idea is that when you do regression
testing, you have a set of sentences. And let’s say you have a 1000 good
sentences and you’re testing to make sure you parse them all, if your
grammar is pretty free you may able to parse them all but there are no
good parses. If you generate from them all, then you can see that some
of them are no good. I wanted to see if we can automate this generation
testing is some ways. And what would it mean for the test to pass? Do we
want to

EMB: Can’t we set it up like a gold profile, we take some input (e.g.
one or all MRS) and the next time you check if these MRSs change.

MWG: I see, so just start with all the possible MRSs.

EMB: Yeah. And at the moment I would rather have testing parsing an then
testing Generation separately, not a round trip.

GCS: There is additional information to be stored with the MRS that says
that it will be used for generation.

EMB: I’m curious of what that might be… Because the idea is that MRSs
have everything they need to be generated from.

GCS: It might be just runtime stuff. This is just metadata about the MRS
itself.

FCB: I think Gtest could be flexible enough to do this. There was a time
when not all the gold profiles ahve stored MRSs, because in theory you
can generate the MRS from the stored tree. But if there isn’t a god MRS
we can generate from the first parse. There was a discussion at some
stage of storing the whole string. DTD\[?\]?

MWG: DTD\[?\] does.

GCS: Untokenized…

FCB: So if you have an MRS that also has that then you should be able to
generate from the MRS and check that you can get the same string. There
is also an output field in the TSDB that can be the thing you want that
says “I am the output for this input”. Post logon they are not being use
much, even though we use them a fair bit.

MWG: If grammar developers would be to put something in output I could
use that…

FCB: Just for generation you don’t need that, but for multiple
generations yeah.

GCS: When I was paying with the ERG, I saw that maybe 30% of the parses
were able to generate things that didn’t seem right.

EMB: it might be tight with spurious ambiguity, but it also might not.
Being able to checking generation regularly is good, because there are
many sources of garbage and you don’t want them to stack.

FCB: I think Dan doesn’t generate much ungrammatical things.

GCS: It’s not what I found. And I think it was mostly on the
orthography, affixing. But I’ll admit it could agree AGREE.

FCB: For generation testing, when Mike first came to Japan and we
started to play with this it found real big bugs in the grammar. And
every change we made to fix those improved the parsing as well.

MWG: Improved generation 20%, but parsing only 2%.

FCB: Yeah but speed improved as well. And better analysis for some
phenomena. Etc. Etc. And I find that spotting these is easier to do by
looking at over generated text, as compared to looking at the parse
chart.

EMB: I think that it’s definitely something that it should be done. And
if it could be integrated into Gtest it would be great. And it links to
the question on “How to make grammar engineering more efficient”, and
generation testing is definitely something can can improve grammarians
lives.

MWG.: In Gtest there are summaries at the end, and I added things like
timeout, or memory exhaustion… I’ve been using Art, that gives me some
of these.

EMB: So just a diff on the gold standard with the MRS that come out. The
generation profiles could be stored and compared.

MWG: Thanks everyone.

Last update: 2017-01-07 by LuisMorgadoCosta [[edit](https://github.com/delph-in/docs/wiki/CapitolHillGenerationTesting/_edit)]{% endraw %}