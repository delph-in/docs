{% raw %}# Designing and creating a DELPH-IN repository (systems, tools, data, lingware)

LisbonRepositoryDiscussion is the transcript of Discussion I on Thu
2005-08-18 (11:00-11:45) in the [LisbonTop](https://delph-in.github.io/docs/summits/LisbonTop) meeting.

Moderation: StephanOepen

Scribe: UlrichSchaefer

Stephan introduces motivation for the discussion.

- [DELPH-IN](http://www.delph-in.net) is a community effort
- central is the common repository
- internal goal: exchange not only ideas, but also tools, resources,
experiences
- external goal: increase visibility, marketing; this is closely
related to Discussion IV: [Visibility](https://delph-in.github.io/docs/summits/LisbonVisibilityDiscussion)
in the afternoon
  
  - attract new contributors and funding
  - give the consortium a visible platform with a name

Start with what's on the current webpage on [Systems &
Grammars](http://www.delph-in.net/index.php?page=3)

- Core components
  - [LKB](http://www.delph-in.net/lkb/): development environment
  - [PET](http://www.delph-in.net/pet/): fast parser
  - [\[incr tsdb()](http://www.delph-in.net/itsdb/)\]: evaluation
and benchmarking tool for both
- Lingware
  - [Matrix](http://www.delph-in.net/matrix) : starter kit for new
grammars / bottom-up crosslingual
  - [ERG](http://www.delph-in.net/erg) : English Resource Grammar
  - [Jacy](http://www.delph-in.net/jacy) : Japanese Grammar
  - [Modern Greek](http://www.delph-in.net/mgrg)
  - [NorSource](http://www.ling.hf.ntnu.no/forskning/norsource) :
Norwegian Grammar
  - German grammar to be available as open source in 2006 (already
available for DELPH-IN members now)
  - plus more candidates: Korean, French, Spanish, Catalan, ... ?
- Architecture, language technology
  - [Heart of Gold](http://www.delph-in.net/heartofgold) : framework
for hybrid processing applications
- Treebanks: [Redwoods](http://redwoods.stanford.edu), Eiche, Tiger
700, ...

Questions

- how to organize exchange and delivery
  - communication
    - wiki
    - mailing list(s)
    - external vs. internal communication
    - up-to-date info on ongoing developments (visibility; avoid
double work)
    - bugtracking system (scapegoat)
    - second generation developers experiences
    - keep in mind 'consumer-only' users like students, people not
immediately working in CL/LT research
  - repository
    - what is missing?
      - common morphology component (finite state) for
integration with LKB and PET, e.g. Spanish, Portuguese,
German, Japanese: availability vs. usage of internal
morphology, LKB optimization/lex. rules problem: more
readings than necessary
      - better interface to e.g. ambigous external
tokenization/preprocessing
      - machine translation (transfer) support
      - documentation is distributed, partly hard to find, e.g.
[DeepThought](http://www.project-deepthought.net)
deliverables
        
        - see also follow-up Discussion II: [Strategies for
documentation of grammars and
tools](https://delph-in.github.io/docs/summits/LisbonDocumentationDiscussion)
      - quality assurance; see also Discussion V: [Developing a
distributed means of testing LKB
updates](https://delph-in.github.io/docs/summits/LisbonTestingDiscussion) on Friday
      - ways of obtaining DELPH-IN components
        - release vs. full CVS access (development tracking)
      - domain adaptation support
    - which platforms (operating systems, development
environments) to support
      - what OSes are currently used?
      - which systems available via DELPH-IN are currently used?
- marketing
  - is it a good idea to separate into wiki and static 'official'
web page? (yes)
  - color and design of the current webpage
  - logo
  - online demos (holistic demonstrator / showcase app / killer app)
  - educational material
  - presentations (e.g. DELPH-IN corporate overview, tools,
available resources)
  - target audience:
    - attract new contributors (members)
    - funding agencies/companies (e.g. visibility of already
funded projects to potential funders)
  - licensing: see Discussion VI: [Developing a standard DELPH-IN
open source license](https://delph-in.github.io/docs/summits/LisbonLicensingDiscussion) on Friday

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/LisbonRepositoryDiscussion/_edit)]{% endraw %}