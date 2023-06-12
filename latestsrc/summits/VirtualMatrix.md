{% raw %}Virtual Matrix Maintenance SIG Notes

2020-7-15

Present: Emily, Mike, Olga, Chris, Angie, T.J., Ping

\[Scribe: T.J.\]

##### Transcript

Mike: I’m going to share my screen if I can get my mouse to work here

Olga: I hope we’re not going to look at the Matrix code

Mike: no, I don’t think so

Olga: well actually, I think at some point we should

Chris: we should do the maintenance during the SIG

Olga: Matrix maintenance party

Emily: hi Ping

Ping: Hi, looks like I missed one day, I thought it was Wednesday, but
now it’s Thursday in UTC time

Emily: yes, now it’s UTC Thursday

Ping: yeah, I was thinking it was UTC Wednesday but I’m interested

Mike: Sorry, my mouse has now permanently clicked on the Zoom window, so
I \[complains about laptop\]

Olga: That sounds like using MacLUI back in the day

Mike: let’s look at the, if you can see the Firefox window here \[shows
[GitHub](/GitHub) interface\], this is now the Matrix home for the code.
I don’t know if I should do a walkthrough

Emily: yes, that would be helpful. A couple weeks ago I got a message
and I couldn’t find a spot to reply to your message, it was below the
fold \[more problems\]

Mike: for you, it might look a little different because I’m using the
experimental UI

Emily: what I was saying was familiar was the actual file structure
which is comforting

Mike: You’ll see the file structure at the top and below is the README
which if it’s markdown it will be shown with the layout and stuff. Up
here you can also see the license, but since we’ve changed the MIT
license pretty significantly with the list of contributors and stuff, it
doesn’t detect it as a MIT license. If I go to PyDelphin,
you can see that it has auto-detected it as an MIT licenses. There are
currently now releases, but we do have tags for people’s dissertations
and what-not. Also, this it the commits. This the latest commit here. If
you click the commits, you’ll get a list of them. If you click on a
commit, you’ll get a summary to see what was actually changed.

Olga: which I’m still shocked is actually a requirement. I read that SO
page, but I can’t get over the fact

Mike: Yeah, \[...\] it’s just a requirement that in unix lines are
terminated by a newline character, not separated

Olga: Yeah, I understand, it’s just brittle

Mike: okay, here there are the issues imported from trac. It shows even
the closed tickets. What I couldn’t do is connect it to the original
ticket. But, I was able to include the link to the original trac ticket
and the reporter of the ticket.

Emily: Great, there’s no reason to expect trac is going down, so that
should be good. The canonical attachment is a choices file, so those
would be important to keep.

Mike: great. So, trac has \[severities\], so they got imported to
[GitHub](/GitHub) as labels.

Emily: I suspect the component one is the most interesting.

Mike: Yeah, I was going through them and a lot of them seem to out of
date.

Emily: no one has looked at these for a long time

T.J.: Yeah, when Laura was working on them before, she wasn’t able to
reproduce most of them, so she was just closing them

Mike: Okay, if you go back to commits, many of the commits are linked to
people’s [GitHub](/GitHub) accounts. I didn’t use their email that was
associated, but rather their [GitHub](/GitHub) email, so it doesn’t
expose their personal information. For all of the people I could find
that for, I did that. For some people, I couldn’t find one, like
dljarvi, so it’s just the SVN name. I asked several times if people
wanted to change, and I didn’t get any response. Oh yeah, the big green
button is for creating issues. Labels are optional, but you can also
assign people, and it’s currently showing the people in the DELPH-IN
repository.

Emily: can I attach things?

Mike: I think so?

Emily: stupid clicky UIs

T.J.: you can use a CLI (gh/cli/cli) to make issues and attach things

Olga: I wasn’t able to embed an attachment

Mike: Let’s try dragging and dropping an image

\[talking about attachments\]

Mike: okay, so if you drag and drop it creates a link and inserts the
markdown. It works with text files too. Okay, let’s look at issues.

Emily: Okay, there was a thing with a box and some stuff and I didn’t
know what I was looking at

Mike: Okay, that was a pull request

Emily: Okay, I need a tutorial on pull requests. I don’t get the
metaphor. Who is requesting what to be pulled from where?

Olga: nice multiple constituent question there

Mike: \[opens drawing software\] Here are some commits. When you make a
fork, it makes a copy of those copies. It’s much more efficient than
SVN. The main workflow is you can either make commits directly to that
commit, or even better is to make a branch. When you make a branch, it
makes a pointer to the current commit. You do some work and then you
want to merge it. So, when you push this repository to your user
account’s fork, or if you’re working in the delphin org’s repository,
let me show you what that looks like. I don’t have a fork in my own
repository, I just have a branch in the delphin repository. If I go
here, here are the default branch, trunk. Here are my branches. This one
is 46 commits behind trunk and 3 ahead.

Emily: But those 46 commits on your local version

Mike: Well, if I pull, then they will be. And that’s nice, because if I
pull then I can deal with it on my local machine

Emily: That’s all familiar from SVN

Mike: So then you rebase it.

Emily: So basically you’re doing the merge. Okay, I’m confused about the
word pull. It seems like you’re requesting someone to do something, but
when we are doing that.

Chris: Right, exactly, that’s what you’re doing

\[some cross talk\]

Emily: Okay, so in SVN right now you set up everything on your branch
and then merge into trunk. Now someone would need to review it?

Mike: Right. We don’t have to do it this way, but right now it is. It’s
nice, Olga and I are doing it this way.

Olga: Yeah, it’s nice to have a second pair of eyes.

\[cross talk\]

Mike: Okay, let’s look at git’s CLI options. There’s fetch which
downloads the data. Pull then integrates the data. [GitLab](/GitLab)
calls them Merge Requests, which might be a better term.

Emily: Okay, so you’re saying I have some commits in my branch and I
want to put them into the trunk

Mike: Right. If we look at the pull request, it says goodmami wants to
merge 3 commits into trunk from choices-decouple. This is nice because
it means anyone can open a pull request by making a fork, but for the
core developers of the Matrix we can add people so they can make their
own branches and they don’t have to fork it. Okay, so right now I’m on
Olga’s fix-tests branch, which she was working on. If I do git pull, I
get a new branch.

Olga: I deleted fix-tests, but

Emily: OKay, if I chck out a different branch it changes what’s on my
drive? Ugh

Mike: Right. If you want to switch branches while keeping your changes,
you can use git stash. \[describes git stash\]. Now that I’ve down that
I can do git checkout trunk.

Emily: So if you do git branch it will show you’re on trunk?

Mike: Right. Now it shows I’m behind by 26 commits. It already fetched
it, but it didn’t merge it. I can do git merge, but I I’m just going to
git pull which will check the server again and then merge

Olga: Emily, what are you concerned about?

Emily: If I’m in a directory and I do git checkout and it changes the
directory that I’m in, it breaks my unix understanding of the world

Olga: Yeah, I understand. I will have multiple copies of the repo. And
then I’ll check out each branch to different directories

Chris: Which branch you’re on is also in your environment, so you can
set it up to show in your prompt

Emily: If I ever sit down to do Matrix development again, then I’ll
probably mess everything up and have to blow it all away, but that’s
okay

Chris: Yeah, that’s learning git

\[general complaining about git\]

Mike: But this is similar to SVN, right? If I do svn checkout to a
previous revision, it changes the local data in that directory.

Emily: But that’s different than this lateral move of changing branches

Mike: Yeah. Okay, so git log shows you all of the recent commits. It’s
really great. It shows you all of the commits. You can also do git log
-p which shows you all of the changes in those commits, which can be
really nice. Also, for emacs users, let’s say I change something, if I
change test to tests, there’s an emacs package called magit, maybe
pronounced like maggot, maybe not, that’s quite nice because it will
show you what you currently have in your staging area. So, if I change
something, like add a function to the bottom. If I go \[to magit\] and
press ctrl+G, I can see the changes. \[walks through the tool with lots
of keyboard shortcuts, look at <https://magit.vc> :-)\]

Emily: It’s nice that you can view just the specific lines that you’re
changing

Mike: Yeah, you can do that in SVN, but it’s a little different. Okay,
in SVN you can do revert, which is similar. In git, okay, if I do git
status, it will show me the changes that I have staged and not staged.
If I do checkout, it will remove unstaged changes. If I do git restore,
it will remove staged changes. You can also do that through the emacs
interface. Okay, back to the pull request interface that had some more
conversation. If I make a commit on my local copy, on my local hard disk
copy, then I still need to send it to the server. If you do git push and
you’re in trunk, then it will just send it there. If you’re in a branch,
it will tell you the command you need to make the new branch on the
server.

Emily: Yeah, I’ve used git enough to make the mistake of committing and
realizing that wasn’t enough

Mike: Let’s look at this one. It has a lot going on. Olga made the
original commit, which has 16 commits. You can comment on it like an
issue. As she makes new commits, it shows it in the conversation.

T.J.: Can multiple people make commits to the same pull request?

Mike: Yeah, of course. I could have made one here.

T.J.: Can you make a PR on a PR?

Mike: I don’t think so? Maybe you can make a branch off the branch and
make another pull request, but I wouldn’t suggest it. Okay, so you can
have threads and you can mark them as resolved. This is where Olga was
annoyed with the new line issue.

Olga: What is the point of resolving a comment thread?

Mike: it just makes it so that the comments are collapsed and you can
click here to show them

Olga: I guess so new people can skip the stuff that’s already done

Mike: Okay, so if it’s approved, then you can click a big green button
to approve or merge it. Let’s look at another PR. This one is a draft,
so it’s not ready to review. We can go to the files changed, which is
really great here. I can leave comments on the code, saying “don’t get
rid of this” where I got read of full\_keys(). I can say “start a
review” or “add single comment”. If I say “start a review” then it
\[makes it not a draft?\] or I can just add a comment.

Olga: Okay, all of the PR I’ve seen could be merged automatically. What
happens if they can’t be merged automatically? I’ve only seen it once,
it was a conflict in the gitignore. But what happens?

Mike: Yeah, resolving conflicts can be a pain sometimes.

Olga: Okay, well, it was easy this time, but

Mike: Well, let’s say we start without a gitignore file. If we both add
a gitignore file with the same content, it will still say it’s a
conflict and ask us to review it.

Olga: Well, yeah, that makes sense, I’m just wondering why it says it
was in conflict when it clearly wasn’t

Mike: Once you edit a file in conflict on your computer and there are no
conflicts, you still have to mark it as resolved

Olga: Well, I don’t think that was it because I was using the GUI, and
it was strange because I was able to merge it just fine later, but

Mike: Okay, \[Emily do you understand this now\]?

Emily: Yes, \[I feel much better about the pull metaphor and the
workflow\]

Mike: Okay, let’s go to the projects page now. Here’s then 10,000 Mile
Maintenance project now. It’s like a Kanban board, so there’s different
columns with cards.

Olga: or like Trello

Mike: Right. The cards don’t have to be issues, but they can be issues.
\[some other stuff\] Okay, so looking at what we have now, I have a
reorganize testing frameworks test

Olga: Wait, we have unit tests?

Mike: yeah, there aren’t a lot, but some

T.J.: When I worked on my failed project, I tried to add some for the
website, but a lot of the API had to change to support them

Emily: So, do the unit tests work?

Mike: Yeah, when I put it on git I got the unit tests working. But,
they’re not very complete. \[describes some tests\]. The web tests
haven’t been working in a long time, and I don’t know if they work in
the current system. The tests may rely on old and deleted things.
\[more\] Emily, do you want to keep any of these dead code?

Emily: hmm, revive at some point?

Mike: Well, remember they’re still in the commits, so they won’t be gone

Emily: Well, the reason we had sql\_profiles was to create random
choices files for testing \[...\]

Mike: like fuzzing?

Emily: sure? generate.py I think supports generation in the
questionnaire, but does that work?

Mike: Yeah, I’m not sure. This looks pretty old. We could probably use
PyDelphin to support generation

Emily: There was a little bit of lisp code to come up with the
headtypes.tdl file, but that was generated programmatically and then
left there

Mike: I may have already deleted that…

Emily: \[some stories\] The customization system used to be a
commandline interactive perl script, so that file may have been
pre-Scott converting me from perl to Python

Mike: Okay, well, I found them here, I just moved them.

Emily: Yeah, these look old. We can get rid of them

Mike: Okay, choices file, we had a separate SIG about that. Clean up
branches, you can see there are a bunch a branches that are out of date.
This one \[origin/foo\] was updated 19 years ago by Stephan.

Olga: We should definitely keep this one.

Emily: Laurie’s work is all committed?

Mike: She has 47 commits that are not in trunk

Emily: I would want to look through her stuff and see what we can keep.

\[some discussion about gmcs and gmmt\]

Olga: I just want to say that I hate git too. But, it’s nice to be able
to just delete everything and start over

\[more discussion about hating git\]

Chris: git is the worst feature of [GitHub](/GitHub)

Olga: The website is the best feature

Mike: Okay, we should look at the branches. The old ones that have been
merged, there’s no value, so we can delete them. There are some that
correspond to people’s thesis or dissertation, and so we should convert
the branches to tags. Okay, there’s Python project infrastructure.
There’s pyproject.toml and CONTRIBUTING.md. There’s some nice things
with [GitHub](/GitHub) where it will interact with your repo and display
your files in the UI when people are making pull requests. We also don’t
have a CODE\_OF\_CONDUCT, which says like we do not discriminate, which
I’ve added to my projects, which I think we should do. I’ve already
added the license, and so this just says what we need to do. Questions?

Olga: Thanks a lot for this walkthrough

Emily: This definitely looks a lot more robust. I guess we’re protected
by random people making changes by only people with commit access to the
repo. \[there’s stuff on the DELPH-IN page and
[MatrixDevTop](https://delph-in.github.io/docs/matrix/MatrixDevTop), should we move that stuff to
[GitHub](/GitHub)?\]

Mike: There seems the directory structure is easy to get out of date

Emily: Well, the thing that was nice about the structure was the
comments, so if we could put that in, that would be great

Mike: There’s some annotations, not in the code, but you can make
README.md for each directory and show it here

Emily: \[Ugh, I hate that the README is shown below the directory
structure\]. The point of the directory structure is for new matrix
developers to know what’s where

Mike: Ah, well, we can put that info in the README.

\[some discussion about moving or deleting things\]

Mike: Well, I think we can delete some of this stuff. We could get rid
of Python idioms, \[etc.\]

Emily: I don’t know exactly what Stephan has in mind for the updating
delph-in infrastructure discussion, but we may need to move this stuff
anyway

Mike: You can add individual people to the repo, I’ve disabled wikis, we
don’t need sponsorships

Olga: we could use one

Emily: It might be worth talking about immediate next steps. It sounds
like the projects… ah, I finally figured out what the 10,000 mile
maintenance metaphor also. Also, today I finally understood what the .md
on the file is for. If we wanted to have a wishlist for the new
libraries, would that be good for projects?

Mike: Maybe issues?

Emily: I think I want a custom label for it. It corresponds to a list we
had on the wiki that is probably out of date.

Olga: While you’re looking Emily, I was going to say that once someone
starts working on a library, a project would be appropriate. It would
have been very cool that when I started on the project I could have had
a place where I could have stayed organized. It’s not obligatory, but if
some other interested person took a look, they might \[give me some
advice about how to do it better\] which seems, making it public, like a
good idea.

Emily: Right, and if Sanghoun had done one, you could then go back and
look at it. But, that’s once the project that’s started. So, having
issues that have a characteristic tags, and I assume you can search by
tags, because otherwise what’s the point of tags.

Mike: Yeah, if you click on a tag it will show you all of the issues
with that tag.

Olga: what’s insights?

Mike: You can look at how many commits, how much traffic, how many
people are cloning it. The community \[tab\] will \[show you a checklist
that we have some of\] that is sort of project health, I guess. Yeah, I
guess we can create a project with a running list of libraries. This
project can have issues, but they can also just have notes.
\[demonstrates adding notes\]

Mike: Any other issues?

T.J.: Do we want to talk about splitting things up as separate modules
as well?

Mike: Right, yeah, I forgot about that

Olga: What is the value of splitting them up as separate repository?

Mike: Yeah, hmm

Emily: I can see having a choices files repo be useful

Mike: But with the changes we suggested to that, do we need that?

Emily: It would be great for AGGREGATION

Mike: But wouldn’t it just be a simple wrapper around the TOML library?

T.J.: I think having choices be a separate repo would be great. We do
want some other stuff, like selecting from the lower objects \[etc.\]. I
thought of some others but not while scribbing.

\[some discussion around other separation\]

Mike: What about gmmt

Emily: Yeah, that would be great

Mike: Don’t you use it for 567?

Emily: \[no, it’s a different ACE-based project\]

\[discussion around dependencies\]

\[discussion around having questionnaire and customization as separate
pieces\]

Emily: But they’re tightly coupled. \[...\]

Mike: Yeah, I guess you don’t want separate versions of the server and
client

Emily: Matrix core could be separate

Mike: Yeah, it would be great to be versioned. JACY has a very old
version, but we don’t really know from where it is.

\[T.J. explains his desire to write a React questionnaire\]

Emily: I still don’t fully understand why you need separate
repositories. Is it because you don’t want Python and Javascript in the
same repository?

Chris: No, I just think if I’m not using the questionnaire, then I don’t
want to import the dependencies for the front end.

Olga: But the questionnaire isn’t dependent on the customization right?
It’s vice versa?

Chris: Right, but because they’re all in the same repo, then I still
download them

Olga: Right, but if you’re not using them, then \[the worst thing you
get is you end up with extra files on your hard disk\]

Mike: I think I generally agree with Chris, but

Chris: \[I don’t want to have to import all of the repository in a new
world where the questionnaire is written in dart and is beautiful\]

\[Olga understanding, some other agreeing/discussion\]

Mike: When you mentioned Python packaging, that makes me think we could
put stuff in [PyPi](/PyPi), and not just the whole repo, and if you need
something you could just download what you need. And then you can make
those as a release, so you can download them as a source code. Back to
the backend/frontend thing, even if we move to a standard REST API for
the server, then someone like T.J. can make his React frontend \[without
interrupting anyone\]

Chris: Right

Emily: Right, I think it’s actually the other way that I’m concerned
about. If T.J. or T.J. prime is out there, well, if someone who isn’t a
matrix developer making a hit to the public API

T.J.: \[Just because we have an API, that doesn’t necessarily mean that
it’s a public API. We could make it credentialed or whatever\]

Emily: Yeah, I think depending upon the resources that we’re putting
into customization, then we will want to \[worry about this.\] We
already had to \[add CAPTCHA to avoid people from hitting the server.\]
I also just want to give again appreciation to everyone who is working
on this, \[this is great.\]

Olga: \[I want to show appreciation to all of these people who have
graduated who are participating, T.J., Chris, and Mike, otherwise I
would be so lonely\]

Mike: \[I don’t know if I’ll have a lot of resources soon, because I’ll
be teaching again soon\]

Emily: \[This will be great if someone decides to work on a library
again.\] Liz considered doing it but decided to work on MOM instead.
Mike, what class are you teaching?

\[Discussion of Mike’s intro to compling class\]

Olga: I don’t want to start a new discussion right now, but \[can we
discuss style? I think style is controversial, it often hinders progress
but at the same time it would help us with this project. For instance,
while we could use more constants, which I think is generally good
software engineering, in our case, the literals are very useful.\] I
don’t know if there is another project that is facing a similar problem
that we can look at. It is really getting out of hand, the amount of
literals on the one hand and the helpfulness of literals on the other
hand. I don’t think we need to start a new discussion now, but…

\[Mike struggles to unmute due to mouse problems, discussion on
unmuting\]

Mike: I’ve now lost the ability to stop sharing my screen. I want to
share this other window called actions. These are things that happen
automatically when you push commits. For PyDelphin, when I
make a tag, it uploads the package to [PyPi](/PyPi). \[some other
examples\] We could have it run the regression tests or run Flake8 which
you can configure a bit, like how you name your variables, \[etc.\] You
can run it locally or when you run it here.

Olga: It will help, but I don’t know if it will help with the literals
problem. I would like to believe there are solutions out there that
other people have faced.

Chris: It reminds me this idea I’ve been kicking around for awhile that
I think Emily once described as “skeptical but intrigued”. I have a
sense that there are a finite number of operations that library
developers have to do that would make it a lot easier for developers to
add libraries or make changes.

Emily: This reminds me of Olga’s research statement that says \[what are
the issues that are grammar engineering problems\] and \[what are the
issues that are engineering problems\].

Olga: Yeah, I guess, but that just seems like such a huge problem. I
don’t know if that can be solved in the context of a PhD.

Chris: I don’t think it’s thesis sized, maybe dissertation sized.

Olga: I think we’re running into this research versus engineering
problem \[...\] where it’s also research and the developer doesn’t know
where it’s going to go when they start their library; they don’t know
where it’s going to go, what libraries it’s going to interact with, and
by the time you’re finished, you’re off to do something else. Well, some
people have stuck around.

T.J.: Well, I’ve been planning to write unit tests for the adjectives
code for six years and I haven’t done it yet.

Chris: I appreciate that. At least in the context of the matrix, we do
have some constraints, and knowing where people have come before could
help. You have to do \[X, Y, and Z\], and that’s sort of the idea I had
with my modular approach in my valence change library. It’s a big
project, and it’s not a do it in the summer.

Olga: It’s also not a PhD project either because your PhD has to be a
theoretically attractive question, so it can’t be a purely engineering
contribution. People that do make purely engineering contributions
\[tend to take much longer and that affects their life a lot\]. But, I
do agree with you that if there were resources to make engineering
contributions like that, that would be great, but I don’t know

Emily: Well, you could write a grant and ask for engineering resources
to support that sort of project.

Olga: Right, but in an ideal world

T.J.: \[I mean in an ideal world you would have great resources for the
30,000 living languages\]

\[some discussion about fixing the bibtex entry on the main
[GitHub](/GitHub) page\]

\[discussion about dinner\]

\[Emily prompts the group about how this DELPH-IN is going\]

\[social chat\]

Last update: 2020-07-17 by OlgaZamaraeva [[edit](https://github.com/delph-in/docs/wiki/VirtualMatrix/_edit)]{% endraw %}