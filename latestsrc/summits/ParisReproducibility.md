{% raw %}# Discussion on Reproducibility from the 6th DELPH-IN Summit

Moderator: StephanOepen; Scribe:
FrancisBond

Start with mail from Rebecca:

    Now we are slowly seeing more DELPH-IN work getting published, it
    should be easier to tick off the requirement for "comparison to
    previous work", but that is not as easy as it could be.  One thing
    that would make it easier is to have an up-to-date publications list,
    perhaps even by topic, so anyone who gets, for example, a parse
    selection paper accepted adds it to the wiki under parse selection.
    Another, more necessary thing would be using comparable data.  Many of
    our papers seem to use slightly different (often unspecified) test and
    training sets, even when we are using the same basic data. A few
    suggestions for that problem:
    
    * clearly document test and training splits on released profiles
    * where possible, stick to previously used data sets
    * when creating new corpora, consider creating a held-out test set
    (perhaps by taking out every x item) and designating it as testing
    from the start
    * annotate the publication list above with technical details that
    weren't perhaps relevant to the paper, but would help someone else
    replicate the results (data set, SVN version, cheap options etc)
    
    I'd like to see a discussion of whether any of the above suggestions
    could work, and also whether there are other practical suggestions to
    help get more DELPH-IN work published (eg particular results that need
    to be published so they can be referenced?)

YiZhang: we were having issues with people not getting the
same results, and hard to verify --- different data sets may give
differences of more than 20% exact match for parsing accuracy. We should
set up a standard train/dev/text split for various grammars.

Oe: some people also use 10-fold

Yi: keeping the same split means that there will be no differences in
e.g. unknown words.

Ann: But we don't want to fall into the trap of making one standard data
set and only doing that (the WSJ problem). Also add additional metrics
--- 10-fold, additional data sets, ... We don't to use the same test set
for 20 years.

Antske: the fixed set is important for a baseline to check that all is
working

Oe: as we are setting a new standard, we want to do it right.

Ann: CL is trying to guarantee that papers are reproducible --- so we
need to to store the treebank, grammar, parser etc.

Antske: This is hard to do, as there are so many parts.

Oe: it is all open source. So it should be reproducible. We should be
able to point to the exact branch and the revision.

Yi: sometimes you don't need to reproduce everything, but we should be
able to compare on the same data

Francis: we may need to be more aggressive about putting stuff in the
svn and allowing experimental branches.

Oe: Perhaps we need more documentation on various data sets and the
their standard test/dev/train splits.

Francis: perhaps we should put it in a Readme in the skeleton file,
which goes into the svn and then we can link to it from the wiki.

Oe, Emily: that makes sense :smiley:

Last update: 2010-07-03 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/ParisReproducibility/_edit)]{% endraw %}