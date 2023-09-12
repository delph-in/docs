{% raw %}# Create  Getting Started Tutorials for DELPH-IN Tools

## About DELPH-IN
The [DELPH-IN Consortium](https://github.com/delph-in/docs/wiki) is a collaboration among computational linguists from research sites world-wide working on ‘deep’ linguistic processing of human language. The goal is the combination of linguistic and statistical processing methods for getting at the meaning of texts and utterances. The partners have adopted Head-Driven Phrase Structure Grammar (HPSG) and Minimal Recursion Semantics (MRS), two advanced models of formal linguistic analysis. They have also committed themselves to a shared format for grammatical representation and to a rigid scheme of evaluation, as well as to the general use of open-source licensing and transparency.

There are many open-source projects that are part of the DELPH-IN tool chain.  Primary among them, and the focus of this documentation effort, are:

- The Answer Constraint Engine or [ACE parser](https://github.com/delph-in/docs/wiki/AceTop)
- The Linguistic Knowledge Builder or [LKB](https://github.com/delph-in/docs/wiki/LkbTop)
- The most fully developed grammar is the English Resource Grammar or [ERG](https://github.com/delph-in/docs/wiki/ErgTop).	

## Problem
*Tell us about the problem your project will help solve. Why is it important to your organization or project to solve this problem?*

DELPH-IN is a long-standing collaboration involving many researchers from many different institutions. It is built on and produces a rich set of open source tools and technologies that have been in development since the early 1990s. It has been used successfully by a number of large scale projects to do natural language processing of many languages using a variety of  approaches. 

While there is a large amount of documentation for the DELPH-IN technologies available on a [wiki](https://github.com/delph-in/docs/wiki), and in one published book ([Part 1](http://web.stanford.edu/group/cslipublications/cslipublications/site/1575862603.shtml), [Part 2](http://web.stanford.edu/group/cslipublications/cslipublications/pdf/1575862603h.pdf), [Part 3](http://web.stanford.edu/group/cslipublications/cslipublications/pdf/1575862603usersmanual.pdf)),  some of it is out of date. Furthermore, it is not in a consolidated and up-to-date form that is friendly to new users. Readers have to pick through a lot of documentation to find what is most relevant to their problem at hand. To date, it has required the help of existing users to get started adopting the technologies. 

Our goal is to enable adoption by a broader set of users by building a consistent, up-to-date set of focused documentation that allows them to get started using the main tools: the ACE parser and the LKB FOS.

## Scope
*Tell us about what documentation your organization will create, update, or improve. If some work is deliberately not being done, include that information as well. Include a time estimate, and whether you have already identified organization volunteers and a technical writer to work with your project.*

### 1. ACE Reference:
Using the raw materials that start at these two locations (and including the links from there):
- http://sweaglesw.org/linguistics/ace/
- https://blog.inductorsoftware.com/docsproto/tools/AceTop/

Assume the reader has no knowledge of the DELPH-IN technologies:

First, create an updated set of new reference pages that focus on the basic task of getting ACE installed and using it to parse phrases using a grammar and generating MRS output on Windows, Macintosh and Ubuntu Linux. 

Then, update, clarify and fill out the more advanced sections on:
- How to build from source
- How to configure and use ACE for building and debugging grammars
- How to use the more experimental features such as Ubertagging, LogonTransfer, and various others described here: https://blog.inductorsoftware.com/docsproto/tools/AceExperimental/

### 2. ACE and Pydelphin Tutorials:
To illustrate how to use ACE and [Pydelphin](https://pydelphin.readthedocs.io/en/latest/), create several short tutorials that show different approaches. Each of the tutorials will be a much simplified and abridged version of a larger project that already exists. The writer will cherry-pick a few illustrative paths through the larger project to illustrate, and then point to the finished project so the user can see a more in-depth version:
- ([Unabridged Version](https://scholar.google.com/citations?view_op=view_citation&hl=en&user=y2WMWysAAAAJ&citation_for_view=y2WMWysAAAAJ:2osOgNQ5qMEC), [Another Version](https://aclanthology.org/W06-0502/)) Create a simple ontology by parsing dictionary entries (or really any set of phrases) looking for language patterns that represent "is a" or "part of" relationships. Convert the found relationships into a simple ontology format.
- ([Unabridged Version](https://blog.inductorsoftware.com/docsproto/howto/devhowto/devhowtoOverview/)) Create a simple Python application that allows a user to get answers to a few English queries about their file system such as "how many files are in '/documents'?".
- ([Unabridged Version](http://www.let.rug.nl/30years/festschrift/11.%20Flickinger.pdf)). Create a simple program that takes a few well-formed first order logic statements (excluding quantifiers) about a simple "blocks world" and produce a rich set of English paraphrases that translate the FOL into English.
- (Unabridged Version (To be built by Alexandre, data [here](https://www.cs.utexas.edu/users/ml/nldata/geoquery.html))) Create a simple program that allows the user to answer a few questions about the mapping data included in the Geoquery dataset.

This should also include introductory sections that describe what ACE and Pydelphin do, where to find them, and how to install them on Windows, Macintosh, Ubuntu and Docker.

### 3. Linguistic Knowledge Builder, Free Open Source Version (LKB FOS) Tutorials:
Using the raw materials from:
- http://web.stanford.edu/group/cslipublications/cslipublications/pdf/1575862603h.pdf
- http://web.stanford.edu/group/cslipublications/cslipublications/pdf/1575862603usersmanual.pdf
- https://blog.inductorsoftware.com/docsproto/tools/LkbTop/

Create new "Getting Started with LKB FOS" documentation that walks users through adding a new linguistic construct to an existing (simple) grammar and fixing a bug in an existing (simple) grammar.  

This should also include sections that describe what the tools do, where to find them, and how to install them on Windows, Macintosh, Ubuntu Linux and Docker.

### Work that is out-of-scope for this project:
Creating updated reference documentation to replace the [current LKB User Manual](http://web.stanford.edu/group/cslipublications/cslipublications/pdf/1575862603usersmanual.pdf).

### Identified Resources
We have a project leader from the DELPH-IN team identified for the project and are still recruiting main points of contact for the different tools we'll be documenting. We are still looking for technical writing candidates for this project. 

### Measuring Success
*How will you know that your new documentation has helped solve your problem? What metrics will you use, and how will you track them?*

Short term metrics: Do a before and after experiment with 5-10 users:  

**Before**: Assign them the tasks of doing the following using the current documentation given only the current home page:
- Install and use ACE and Pydelphin to parse English phrases to find the syntactic head of a sentence
- Install and use LKB FOS to fix a bug in a particular example grammar

**After**: Do the same two tasks with the new documentation (and a different set of users)
- Measure the time it takes and collect free form feedback in both cases.

Long term metrics: Track the change in stars and forks in GitHub as a proxy for how much use and new on-boarding has happened for all of the repositories in DELPH-IN: https://github.com/delph-in.

### Timeline
*How long do you estimate this work will take? Are you able to breakdown the tech writer tasks by month/week?*

All documentation is written in Markdown in an existing Github wiki site.  Overhead to learning the documentation tools should be very minimal.

Assume that questions to DELPH-IN experts will have a time lag of a day or two, and that feedback turnarounds could take up to a week.

ACE Reference (working time: 1 week, elapsed time: 4 weeks):

- 1 day: Learn tools and existing documentation
- 2 days: Write new documentation from experience and existing documentation
- (1 week lag): Send documentation out for review
- 1 day: Update based on feedback, final edits
- (1 week lag): Send documentation out for review
- 1 day: Update based on feedback, final edits
- (1 week buffer): Buffer for question and answer turnaround, lag for meeting setups, etc

ACE and Pydelphin Tutorials (working time: 6 weeks, elapsed time: 10 weeks):

- 1 week: Learn tools and existing documentation
- 3 weeks: Write new documentation from experience and existing documentation
- (1 week lag): Send documentation out for review
- 1 week: Update based on feedback, final edits
- (1 week lag): Send documentation out for review
- 1 week: Update based on feedback, final edits
- (2 week buffer): Buffer for question and answer turnaround, lag for meeting setups, etc

Linguistic Knowledge Builder Tutorials (working time: 6 weeks, elapsed time: 10 weeks):

- 1 week: Learn tools and existing documentation
- 3 weeks: Write new documentation from experience and existing documentation
- (1 week lag): Send documentation out for review
- 1 week: Update based on feedback, final edits
- (1 week lag): Send documentation out for review
- 1 week: Update based on feedback, final edits
- (2 week buffer): Buffer for question and answer turnaround, lag for meeting setups, etc

## Project Budget

[Budget Template Information](https://developers.google.com/season-of-docs/docs/org-proposal-template#project_budget)

Assume $30 an hour rate (median US Technical Writer salary from [www.salary.com](https://www.salary.com/research/salary/benchmark/technical-writer-i-hourly-wages))

All of the following include the time to learn the tools, read existing documentation, write, edit and review new documentation with stakeholders. Because it will take time to review documentation with stakeholders, writers should assume some down time while waiting for reviews/answers to questions. Buffer is included in the above timeline to attempt to account for this.

|Budget Item|Amount|Running Total|Notes/justifications|
|----|----|----|----|
| Ace Reference (1 week = 40 hours @ 30$ an hour) | $1,200 | $1,200 | |
| ACE and Pydelphin Tutorials (6 weeks = 240 hours @ 30$ an hour) | $7,200 | $8,400 | |
| Linguistic Knowledge Builder Tutorials (6 weeks = 240 hours @ 30$ an hour) | $7,200 | $15,600 | |

*Include here any additional information that is relevant to your proposal.*
*Previous experience with technical writers or documentation:*

The project organizer has managed documentation and worked with writers for many projects such as the Microsoft .Net Framework, Visual Studio, Microsoft Access, Microsoft Investor (website). He has written documentation for open source projects such as [SWI Prolog](https://www.swi-prolog.org/pldoc/doc_for?object=section(%27packages/mqi.html%27)), [swiplserver](https://www.swi-prolog.org/packages/mqi/prologmqi.html), [InductorHtn](https://github.com/EricZinda/InductorHtn/blob/master/gettingstarted.md?raw=true), and [Inductor Prolog](https://github.com/EricZinda/InductorProlog/blob/master/gettingstarted.md?raw=true).

*Previous participation in Google Season of Docs, Google Summer of Code or others*

Several members of the DELPH-IN team have done Google Season of Docs once before for part of the WordNet documentation.

Last update: 2023-02-24 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GoogleSeasonOfDocs2023ProjectProposal/_edit)]{% endraw %}