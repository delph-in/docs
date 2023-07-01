{% raw %}# Delph-in Developers Meeting

This page contains some information about the Delph-in developers
meeting to be held in Jerez 2006-02.

Date\
February 20--24, 2006

Place\
[Hotel los Jandalos Jerez](http://www.jandalos.com/Jerez_EN/hotel.html)

Cost\
There will be a 100 EUR fee to cover workshop expenses.

Participants\
FrancisBond, Ann Copestake,
DanFlickinger, ChikaraHashimoto,
BerndKiefer, [EricNichols](/EricNichols),
StephanOepen, UlrichSchaefer,
[TakaakiTanaka](/TakaakiTanaka), BenWaldron

Contents

1. [Delph-in Developers Meeting](https://delph-in.github.io/docs/summits/JerezTop#Delph-in_Developers_Meeting)
   1. [Proposed Timetable](https://delph-in.github.io/docs/summits/JerezTop#Proposed_Timetable)
   2. [Topics](https://delph-in.github.io/docs/summits/JerezTop#Topics)
      1. [MT](https://delph-in.github.io/docs/summits/JerezTop#MT)
      2. [What's new](https://delph-in.github.io/docs/summits/JerezTop#What.27s_new)
      3. [API/StandOff/Preprocessors](https://delph-in.github.io/docs/summits/JerezTop#API.2FStandOff.2FPreprocessors)
      4. [PET bug squashing/LKB
harmonization](https://delph-in.github.io/docs/summits/JerezTop#PET_bug_squashing.2FLKB_harmonization)
      5. [Parse Ranking](https://delph-in.github.io/docs/summits/JerezTop#Parse_Ranking)
      6. [Large Lexicons](https://delph-in.github.io/docs/summits/JerezTop#Large_Lexicons)
      7. [Enhancements](https://delph-in.github.io/docs/summits/JerezTop#Enhancements)
      8. [(Automated) Testing](https://delph-in.github.io/docs/summits/JerezTop#A.28Automated.29_Testing)
      9. [Still More](https://delph-in.github.io/docs/summits/JerezTop#Still_More)
   3. [Detailed Ideas](https://delph-in.github.io/docs/summits/JerezTop#Detailed_Ideas)

## Proposed Timetable

|           |                            |                               |
|-----------|----------------------------|-------------------------------|
|           | Morning                    | Afternoon                     |
| Monday    | Agenda Setting             | Automated Testing/Delivery    |
| Tuesday   | API/Standoff/Preprocessors | PET bug squashing             |
| Wednesday | Parse Ranking              | API/Stand Off/Post processors |
| Thursday  | MT/Large Lexicons          | Free hacking                  |
| Friday    | Free hacking               | Sharing Results               |

## Topics

### MT

Goal\
make J-E functional again; provide internal access to LOGON set-up.

People\
Stephan, Ann, Francis

### What's new

BRIEF (10-20 minute) intros of new stuff (maybe these should be part of
the other sessions)

- Eric - RMRS2sql, ontology, packaging
- FCB - parse ranking, Itsdb perl modules, Cabocha RMRS
- TT - Chasen PIC
- Ben - MAF
- Ulrich - latest HoG
- Stephan Parse/Ranking

### API/StandOff/Preprocessors

Goal\
one usable, general preprocessor, supported in LKB, PET, iTSDB

People\
\- Ben, Ann, Stephan, Ulrich

### PET bug squashing/LKB harmonization

Goal\
squash bugs, merge branches if possible, 64 bit if possible

People\
Bernd, Eric, Stephan

Bugs:

- flop slowness **fixed** --- check accuracy
- merge **done**
- MMAP --- document on wiki
- 2.6 kernels
- punctuation --- documented
- gcc 4.0
- 64bit (ECL &gt; 0.9h) **todo: bernd**
- mrs.system synchronization
- selective unpacking **todo: eric**
- :+, comment string **todo: oe,bernd**

Should also get Eric CVS access

### Parse Ranking

Goal\
allow cheap to use the new models

### Large Lexicons

Goal\
allow efficient use of large lexicons

### Enhancements

Goal\
discuss and set priorities

### (Automated) Testing

- See also [LisbonTestingDiscussion](https://delph-in.github.io/docs/summits/LisbonTestingDiscussion)
- Using Apache Ant for Testing DELPH-IN Tools and Resources: see
[TestingWithAnt](https://delph-in.github.io/docs/garage/TestingWithAnt)

### Still More

- Encoding
- Automatic Documentation
- ITSDB robustness/flexibility **done: oe**
  
  - \- continue treebanking even if parses fail to unify (just warn
and lose that parse) - restart cheap if it dies - handling
different parsers (e.g. Cabocha2RMRS)

## Detailed Ideas

-&gt; Preprocessors

- \- syntax for orthographemic rules: the recent LKB changes resulted
in
  - cleaning up the syntax for %letter-set, %suffix, et al.
annotations on lexical rules. only \#\\!, \#\\?, \#\\\*, and
\#\\) need escaping in the new universe, and \#\\\\ is the
escape character. i believe only the ERG makes use of funny
characters in orthographemics currently, but still i think we
should update PET to reflect the above. i all but promised dan
to do this, hence will hopefully look into it soon.

-&gt; Preprocessors

- \- chart dependencies: re-working the processing of lexical rules in
  - the LKB resulted in a change to the chart dependencies
mechanism, where in the old set-up chart dependencies were
checked after all lexical rules had been applied, and in the
current universe they are tested among lexical entries only
(i.e. prior to application of lexical rules). PET (main), on the
other hand, i believe has moved to a set-up where parsing is
divided into two phases, viz. one with lexical rules only, the
second with non-lexical rules only. there is an underlying
difference between the systems here, where the LKB notion of
\`lexical' rules only entails that a rule can be annotated with
an orthographemic effect; otherwise, the LKB will happily feed
the output of a non-lexical rule into a lexical rule.
grammarians tend to not be aware of this, as they maintain the
word vs. phrase distinction in the type system already (in my
view, the LKB use of the term \`lexical' rule is potentially
mis-leading; but documented).

-&gt; Preprocessors

- i (still) have yet to re-read the earlier discussion on this on the
\`developers' list, but currently at least berthold seems affected
by the two systems not doing the same (and the LKB no longer doing
what it used to). so, it seems as if a written specification for the
mechanism was needed, and then hopefully we can aim at getting all
processors to implement it alike.

-&gt; Preprocessors

- \- lexical rule processing: at some point, interleaving lexical
rules
  - without orthographemic effect prior to orthographemic rules
(e.g. dative shift prior to passivization) had broken in the PET
\`main' branch; i remember fixing it in the \`oe' branch, but
are not quite sure about the state of play in recent \`main'
versions (i believe the patch propagated). generally, it would
seem tempting to have a
    
    few testing grammars (e.g. the toy' and polymorphan' grammars in
the LKB source tree), so as to mechanically (and regularly)
confirm all systems output the sameresults on these.

-&gt; PET bug squashing/LKB harmonization

- \- TDL syntax extensions: ann (i believe) added a comment facility
on
  - types some time ago, and emily last year added a \`:+' operator
for \`overlay' type definitions, i.e. monotonic extensions to an
earlier defined type. the latter is already in use in the
Matrix, i think, and the former we were thinking to use for
adding documentation to grammars, specifically to annotate types
that should be part of the SEM-I for a grammar (i.e. exported).
for all i know, PET does not yet have support for either
operator, but probably should. conversely, bernd (i believe)
extended PET at some point to allow a variant rule notation,
viz.
    - \[ \] --&gt; \[ \], ..., \[ \].
    
    which should be equivalent to embedding the RHS of the
definition as a list below some designated path (e.g. \`ARGS')
in the LHS; to make this compatible with the (mostly unused) LKB
option of having a separate feature embedding the LHS (which, in
a sense, would be cleaner in terms of which parts of the FS
corresponds to what), it could become necessary to also allow
this in PET, but while no-one is using this option that seems
hardly a priority. the arrow, on the other hand, i quite like
and would love to get into the LKB.

-&gt; Preprocessors

- \- input chart description: from what i gather we have at least
three
  - and a half ways of describing partly processed input for
parsing,
    
    viz. (a) the original YY mode (\`[PetInput](https://delph-in.github.io/docs/garage/PetInput)' on the
wiki), (b) SPPP of the early Deep-Thought days
(\`[LkbSppp](https://delph-in.github.io/docs/tools/LkbSppp)'), (c) the XML input chart in PET
(\`[PetInput](https://delph-in.github.io/docs/garage/PetInput))', and (d) emerging MAF support. of
these, (a) and (c) are available in PET ((c) only in the \`main'
branch), while (b) and (d) are in the LKB. i personally believe
in plurality, and at least (a) -- (c) currently have active
users, but if nothing else we should try to document the various
options better (and work out what their strong and weak points
are for candidate users).

-&gt; Parse Ranking

- \- [MaxEnt](/MaxEnt) features: in recent work (jointly with erik
velldal at UiO),
  
  - we have extended the range of [MaxEnt](/MaxEnt) features in
\[incr tsdb()\] and changed their textual representation in a
non-backwards compatible way. the new code generates \`\[1 2
imper hcomp vc\_prd\_be\_le "be"\]', where the second integer is
new. the immediate effect is that PET will still read \`.mem'
files created with the new code, but utterly mis-interpret
features, i.e. effectively ignore the model. we hope to wrap up
our re-redesign in the [MaxEnt](/MaxEnt) space fairly soon and
then put out documentation on the feature templates. at that
point, PET will need an update to minimally recognize the new
format properly, and ideally make use of more of these new
features (grandparenting, lexicalization, et al.).

-&gt; Preprocessors

- \- ERG and HoG: the current use of the ERG in HoG is, say,
sub-optimal
  - in terms of interfaces and results. two core issues, i think,
are (a) divergence in tokenization assumptions (e.g. \|we
haven't slept\| fails to parse due to the contracted auxiliary)
and (b) the need to further fine-tune the interactions with
pre-processing steps (e.g. \|Kim arrived at 2:00am.\|, email
addresses, URLs, et al. all get not quite the analysis they
could). these problems would get far worse with recent versions
of the ERG, where most punctuation is treated as affixation now.
dan, ulli schaefer, and i have talked about the issue in some
depth and have concluded that a general solution will be
somewhat challenging to build (though interesting): in principle
it would have to allow for multiple views on tokenization
(taggers have good reasons to consider punctuation separate
tokens, the ERG has its reasons to consider punctuation marks as
affixes), and then annotations contributed (to tokens) by one
component might refer to only part of a token from the point of
view of another component. when we last talked, ulli and i
resolved to further investigate the general solution but also
look for a more pragmatic solution to the current issues with
using the ERG in the HoG. i believe the recent development in
the ERG has actually simplified things, as we mostly now expect
token boundaries at whitespace (plus for a small number of
contracted forms, e.g. \|'s\|, \|'ve\|, et al.). our proposal
would be to make tokenization rules semi-explicit in the form of
a token test suite, i.e. a collection of relevant examples plus
associated tokenizer output). given that, ulli believes he
should be able to re-organize the input to PET, so as to
collapse token boundaries in several cases. we were hoping to
look into this more when both dan and i are at DFKI in
mid-november. differences in lexical rule processing might be
another issue here, of course, as the ERG for the time being is
developed against the \`oe' branch of PET (see above and below).

-&gt; PET bug squashing/LKB harmonization

- \- PET branches: dan and i still use what is effectively a version
of
  - PET as of sometime in 2003 (with moderate patches here and
there). the main reason for this, i believe, is the flop(1)
slow-down from moving to using Boost (over LEDA). some remaining
uncertainty of which of the various patches have migrated to the
main branch, our overall conservative natures, and difficulties
compiling the main branch last i tried add to our inertia.
however, maintaining two distinct branches is not a good thing,
and once flop(1) performance with Boost were resolved, some
testing of the ERG on \`main' should fairly quickly allow
merging of the two branches, i hope.

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/JerezTop/_edit)]{% endraw %}