{% raw %}# Background

This page provides some historical and statistical background to the
discussion on modernizing the DELPH-IN collaboration infrastructure
during the [2020 Annual
Summit](http://moin.delph-in.net/VirtualSchedule).

# A Little Bit of History

    $ whois delph-in.net | grep Date
    Updated Date: 2019-12-04T14:35:04
    Creation Date: 2002-12-19T21:45:28
    Registrar Registration Expiration Date: 2020-12-19T21:45:28

In 2020, some [50,000 visits](http://traffic.delph-in.net) to DELPH-IN
web pages per month (excluding SVN, WeSearch, and probably the ERG
demonstration).

Used to be hosted as part of Norwegian HPC services (at Oslo
University), which gave premium up-time and availability. National HPC
is moving away from Oslo (to Northern Norway, later to Finland), which
will make it harder for StephanOepen to continue support
of these services.

# Public (Outward-Facing) Web Pages

<http://www.delph-in.net>

Hosted in Mediawiki (1.16) with MySQL back-end. Maintained by the
DELPH-IN standing committee (average two edits per year since 2013; last
edit in August 2017). Practically unmaintained ... candidate for
removal.

Also used to serve non-versioned content for download, e.g. the
materials from most previous summits and bulk like release versions of
[DeepBank](https://delph-in.github.io/docs/garage/DeepBank), the WeSearch Corpus, etc. One might want to
spring-clean a little (possibly consulting the web server logs) to
determine which of these remain active.

    du -h -s * |egrep -v 'cle|events|oe|synsem|titan|favicon.ico|gfx|images|robots.txt|\.php|\.html'
    304K    2006
    7.7M    2009
    19M     2010
    28M     2011
    44M     2012
    43M     2013
    21M     2014
    16M     2016
    31M     2017
    26M     2020
    288K    bib
    8.7M    cdc
    130M    courses
    616M    deepbank
    288K    deler
    845M    ftp
    68K     generics.pdf
    156K    include
    14M     itsdb
    2.9M    jacy
    4.0K    lingo
    830M    logon.tgz
    404K    lui
    381M    redwoods
    5.6G    sdp
    66M     tsnlp
    3.9G    wescience
    22M     wesearch
    8.0K    wiki
    100K    wikiwoods
    348K    wordnet.pdf

# The Wiki (You are Here)

<http://moin.delph-in.net>

Hosted in MoinMoin (version 1.9.3, current is 1.9.10; both require
Python 2.7). Some 34,000 pages and 12,000 users (has been frequent
target of spam attacks).

# SubVersion

<http://svn.delph-in.net>

|                      |          |             |
|----------------------|----------|-------------|
| *repository*         | *gbytes* | *revisions* |
| LOGON                | 99.9     | 3989        |
| ERG                  | 36       | 2090        |
| [DeepBank](https://delph-in.github.io/docs/garage/DeepBank) | 27       | 1306        |
| LKB                  | 0.9      | 4724        |
| Burger               | 0.002    | 5           |
| KRG                  | 0.3      | 107         |

# Mailing Lists

<http://lists.delph-in.net>

Five or so (of originally 16+) mailing lists remain active (developers,
erg, logon, sdp-users, and standing) remain active. Most are very
low-traffic in recent years, with occasional spikes on developers.
Archives are about 3.5 gbytes for 28,519 message (306 mbytes and 3084
messages for developers).

# ERG On-line Demonstration

<http://erg.delph-in.net>

    $ for i in 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020; do
    echo -n "${i}: "; egrep -- "-[a-z]{3}-${i} " pure.txt | wc -l; done;
    2010: 3578
    2011: 5124
    2012: 5653
    2013: 8419
    2014: 17703
    2015: 26950
    2016: 69790
    2017: 85862
    2018: 263998
    2019: 59154
    2020: 222654

# WeSearch Semantic Graph Query

<http://wesearch.delph-in.net>

Built using Java Enterprise technologies (Apache Jena, Apache Tomcat,
and others), hence near-trivial to maintain and adapt for adult software
engineers. The original developer (MilenKouylekov)
has moved on, so remaining support at UiO (practically) is limited to
keeping the current versions running in support of the [Semantic
Dependency Parsing](http://sdp.delph-in.net) community. Hosted on (what
used to be) relatively 'beefy' hardware (256 gbytes of RAM, 2 tbytes of
solid-state RAID5).

# Semantic Dependency Parsing

<http://sdp.delph-in.net>

# Web Traffic Analyzer

<http://traffic.delph-in.net>

# The Abbey (ACE, FFTB, etc.)

<http://sweaglesw.org/linguistics/ace/>
<http://sweaglesw.org/linguistics/libtsdb/art.html>

# Matrix Customization (UW)

<http://matrix.ling.washington.edu/customize/matrix.cgi>

# Discourse Forum (UW)

<https://delphinqa.ling.washington.edu/>

# DELPH-IN Visualizations (M$ GitHub)

<http://delph-in.github.io/delphin-viz/demo/>

# Linguistic Type Databases

# Notes (by Emily M. Bender)

EMB: Wiki is really valuable still -- migrate?

EMB: [WeSearch](https://delph-in.github.io/docs/garage/WeSearch): Some work at UW on addressing rot/adding
features, but we aren't hosting.

oe: Apology to UW -- the improved software that fixes some known bugs
isn't running currently for want of someone who has time & knowledge to
load improved app into the Tomcat software.

Glenn: Candidate for removal outward facing web pages -- not visited,
not useful, and blocks Google access sometimes. End up on those pages
from searches rather than here (wiki?).

Francis: I spend more time with [MediaWiki](/MediaWiki) than moinmoin,
so it would be great to migrate. There are scripts, but imperfect. In
[WordNet](/WordNet) this year we applied for and got accepted into
Google Season of Docs. Maybe could do that for DELPH-IN next year with a
paid technical writer? Otherwise it's hard to imagine who would do the
work of checking & rewriting.

Francis: Could lessen some of oe's burden by moving from svn to github,
with good interaction with issue trackers. But I'm feeling the worry
that no one feels that they can host something like
[WeSearch](https://delph-in.github.io/docs/garage/WeSearch). We're having trouble serving things also at NTU
(CITS making it harder to do these things). If the two big DELPH-IN
sites Oslo & UW think they can't do this, we have to buy a server or...
Feeling worried about that.

Olga: Honest question (no strong opinion): About hosting things
yourself... I understand why one would like to host things themselves,
but I also wonder at what point does it become similar to wanting to
have your own electricity or to be your own ISP? I'm not saying that's
the case, but I'm just wondering if we are in fact headed in that
direction.

oe: I've been a proponent of hosting, in part because of the branding
opportunities but also in part because of the ownership and control that
it gives. When [SourceForge](/SourceForge) folded, Google Code went away
and that has caused pain to those developer communities. I've been
skeptical of [GitHub](/GitHub) because it's not an open-source platform,
but have overcome that skepticism because it's one of M$'s better
products. M$ is hosting that service for everyone for free, with some
limitations. We would have to ask if the limitations would get in our
way. Some of my recent development done collaboratively with others was
on M$ [GitHub](/GitHub). Choice of platform, then choice of self-hosting
or not. The trade-offs might be different nowadays than 20 years ago.

Guy: What about [GitLab](/GitLab), which I believe is open source?

oe: Yes, if we have someone prepared to set it up, host it, and maintain
it for the next 10 years. Not me.

Alexandre: Things can change for sure, but the trend towards the cloud
is because of that. No one wants to be in charge of maintaining
software. Any decision made today would need to be revised in 5 years or
more. But [GitHub](/GitHub) is widely used, including by people we
interact with. Can apply as a research org to have some of the
limitations reduced (e.g. have private repos for free). My vote to move
more to the cloud (rather than to [GitHub](/GitHub) in particular).

Alexandre: Another important point is how to make it easy to self-host,
like with dockers.

Olga: That's absolutely true & what oe was talking about, how he used to
have those resources but now they're going away. We've been hosting the
discourse server at UW for a while now. And it seems to be overall
working well, except I don't feel like we have sufficient resources for
tech support. We find ourselves unable to update it as regularly as it
seems to require and whenever there's issues, sometimes it's down and
nobody can actually attend to that properly. Oftentimes, I feel like
that defeats the purpose of hosting it yourself, but it has been there
for a while and we can be relatively sure it's not going away.

EMB: Two kinds of resources: hardware (that's why we can't do the
[WeSearch](https://delph-in.github.io/docs/garage/WeSearch) semantic graph search) and personnel (sysadmin to
reboot/upgrade discourse server). On that one, we had a decision to make
about short term risks (might be down) v. long term (might lose it,
without control).

Olga: But disrupted communication is also a long-term problem, because
it prevents people from adopting the platform.

Alexandre: [GitHub](/GitHub) wikis can also just be pulled and
reinstalled somewhere else.

Francis: I'd be happy to go back to the mature technology of mailing
lists, but I seem to be losing that battle.

oe: I didn't know we were in that battle together. We could have
coordinated better. But the DELPH-IN mailing lists were down for a
couple of days earlier (while I was on summer vacation). The problem
with mailing lists is that you don't notice when they are down. I want
to reduce my exposure to that kind of responsibility.

Francis: Have to be more careful in the future considering the burden on
the person maintaining things. [MediaWiki](/MediaWiki): has to be hosted
somewhere. [GitHub](/GitHub): for now Microsoft; can download local
copies for insurance. We can't necessarily do that for e.g. semantic
search.

oe: Semantic search isn't a DELPH-IN collaboration tool.

Francis: It could be! If I had easy access, would link it to ltdb, but
would use in teaching.

oe: But not as central as version control & communications.

Francis: And the wiki (documentation is very important). Could put these
in the DELPH-IN [GitHubs](/GitHubs) ... ERG docs to ERG
[GitHub](/GitHub), LKB docs to LKB [GitHub](/GitHub).

EMB: Don't splatter the DELPH-IN information across repositories like
that.

Luis: Can just create a single wiki in the delph-in organization on
[GitHub](/GitHub).
<https://docs.github.com/en/github/building-a-strong-community/about-wikis>

EMB: That would be okay with me, aside from my general aversion to
[GitHub](/GitHub).

oe: Can keep the wiki for years to come. Continuing to host the wiki in
its current form I can do for many more years to come. We don't have to
move everything if we think what we have works well enough.

Olga: Perhaps just keeping the wiki in a frozen form, maybe no longer
updated after a certain point, but it seems to be possible to just keep
it for reference.

Woodley: What would were you proposing the updates would go to then?

Olga: Assuming we decide we want to use this other platform, that's just
a separate question. If that happens, there's still nothing wrong with
freezing the old wiki, whether parts get migrated or not, it can still
remain available as is for reference.

Woodley: Maybe snapshots can be rendered to static html.

EMB: I have noticed that it's gotten slower over the years. Maybe the
number of pages?

oe: Yes. It's slow even here in Oslo, so not about internet speed. To
fix that would require weeding out pages. Some of which contain content
we don't consider compatible with the DELPH-IN mission statement.
(Result of repeated spam attacks.)

EMB: Maybe a small text classification project that an MS student could
do?

Francis: [GitHub](/GitHub) wiki is not [MediaWiki](/MediaWiki), it's
markdown.

Alexandre: It also supports other formats.

Francis: Including [MediaWiki](/MediaWiki)?

Alexandre: It should.

Francis: Some discussion of problems of size in [GitHub](/GitHub), in
particular the magnificent Redwoods forest is perhaps too large (or just
barely within the size limit), at present? One possibility would be to
split it into smaller forests. Or to use large file support, or put it
in a public open data repository like Zenodo.

oe: Just in case Dan is beginning to worry: what we are discussing are
community preferences, but the individual resource should be free to
pick the hosting and communication platform that they prefer. DFKI has
put PET and GG in the OpenDFKI ecosystem. I'll continue to run that svn
server for the foreseeable future.

EMB: Agreed that developers should get to store their software as they
like, but for communication, we need critical mass on any given
platform. So far we have two: mailing lists and discourse. Seems okay
because people mostly know where to get whose attention. But more than
that could be too separated.

oe: There's at least one more: [GitHub](/GitHub) issues.

Woodley: What are the priorities from your point of view oe, for
divesting yourself of responsibility? svn and wiki not so modern, but
can keep up with them.

oe: That depends on my and our joint assessment of value. In sum, I'd
like reduction and specifically the public web pages... that's a
separate [MediaWiki](/MediaWiki) with a separate MySQL. If we agree that
the content there doesn't really call for public hosting anymore that
would simplify infrastructure at UiO somewhat. Owning www.delph-in.net
gives us flexibility. Could just go to some landing page in the current
wiki.

EMB: I'm also fine with it going. We always talk about updating the
public-facing web pages and then don't. I think the worry was that the
internal wiki was too unpolished, but I'm not worried about it.

John: I just noticed there's no [DelphinTop](/DelphinTop) on the wiki.
That would be a nice landing page.

oe: Should we ask for volunteers today to effectuate that transition?

EMB: Sure let's ask.

Francis: Let's wait a moment, because my suggestion is that we use a
[GitHub](/GitHub) space for that.

oe: Would you volunteer?

Francis: No. How about Alexandre?

Alexandre: Sure.

oe: My understanding of how we work is that the standing committee
should have a chance to discuss them & comment.

Francis: It would be polite to run it past absent members.

EMB: We also have to worry about keeping it content-wise up-to-date, no
matter where we put it. Should be somewhere that we see it.

oe: Next on the list: moinmoin wiki. It's possible that UiO might say
can't run python 2.7 anymore (don't foresee this, but ...) Migration of
the wiki, including archival content. Is that a project we can
conceivably take on?

EMB: I'm inspired by the Season of Docs idea, but that seems to be about
content and not just migration, which is probably too big.

Woodley: I'm curious what the liabilities are... what's likely to go
wrong with a script?

Francis: Different programs lose different things (tables, lists,...)
some non-trivial number of pages would need fixing to have the same
level of info available.

Woodley: Because no one has put the effort in, or because there's
something tricky?

Francis: Just running one of those scripts and seeing output would be
interesting, but need access to the code, so?

oe: I'd be happy make an archive available (privacy questions?) to
someone who wants to invoke that script.

Woodley: It's possible to set privacy settings...

EMB: Yes, we used that this time to protect the Zoom room links, but
also folks should know we'll be unprotecting the schedule page in a bit
if you want to take down your video links (but prefer that you don't).

EMB: There is also the pdfs that oe has been hosting at UiO that we
point to from the wiki.

oe: Yes, for at least all summits I have attended, I've been collecting
the slides. That's another bit of infrastructure I didn't list.

John: Both Cambridge and Paris, all the pdfs are at Sussex.

Glenn: pdfs only?

oe: Not just pdfs.

Francis: I think that's largely doable.

Francis: Sounds like there's a general consensus encouraging people to
move to git. But that's up to the individual maintainers.

Alexandre: During the conversation with Woodley, we mentioned the
possibility of synchronizing svn with git and then have a clone hosted
in github, and save a branch to be the sync point. This could be
considered in general for some of the repositories as an intermediary
stage.

oe: Does the authoritative copy remain in DELPH-IN svn, but become
workable through github?

Alexandre: Yes. Pull changes from svn to the authoritative branch
periodically.

Woodley: I have my blessing to the experiment of trying this with fftb.
I will do development with svn, but Alexandre is going to try having a
git repo that mirrors it to have the benefit of issue tracking, etc.

oe: We're not going to modernize in one 50 min discussion, or even in
one year. I'd be happy for you to conduct that pilot and for others to
try out M$ [GitHub](/GitHub) and report back in a year.

Last update: 2021-07-20 by Alexandre Rademaker [[edit](https://github.com/delph-in/docs/wiki/VirtualInfrastructure/_edit)]{% endraw %}