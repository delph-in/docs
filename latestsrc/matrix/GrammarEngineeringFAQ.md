{% raw %}# Grammar Engineering with LKB and the LinGO Grammar Matrix: Frequently Asked Questions

This is a collection of frequently asked questions related to using the
LKB and the Grammar Matrix for grammar engineering. Please help
contribute or improve any questions and/or answers. Please prefix page
names for answers with 'GeFaq'. See also the [Grammar
Engineering Glossary](https://delph-in.github.io/docs/matrix/GrammarEngineeringGlossary).

* * *

## Getting started

- [I want to install the LKB on my local machine, what should I
do?](https://delph-in.github.io/docs/matrix/GeFaqLkbInstallation)
- [What should I know about documenting my
grammar?](https://delph-in.github.io/docs/matrix/GeFaqGrammarDocumentation)
- [How do I interact with the LKB through the Lisp
prompt?](https://delph-in.github.io/docs/matrix/GeFaqLispPromptTips)

* * *

## Questions about error messages

- [I don't think I'm getting any error messages. Does that mean I
don't have any errors?](https://delph-in.github.io/docs/matrix/GeFaqNoError)
- [The LKB says I have an error at position number 873. How do I
figure out where that is in my file?](https://delph-in.github.io/docs/matrix/GeFaqLoadScript)
- [When I try to load my grammar/the matrix, the LKB says "Error:
Attempt to take the value of the unbound variable ...". What am I
doing wrong?](https://delph-in.github.io/docs/matrix/GeFaqGotoChar)
- [The LKB says I'm missing a right bracket, but I can't figure out
where. What should I do?](https://delph-in.github.io/docs/matrix/GeFaqRightBracket)
- [When I load my grammar, I get "no possible type for features (...)
at path (...)". What is causing this?](https://delph-in.github.io/docs/matrix/GeFaqNoPossibleType)
- [When I load my grammar, I get "Feature ... is introduced at
multiple types (...)". What is causing this?](https://delph-in.github.io/docs/matrix/GeFaqFeatureMultiType)
- [My grammar loads just fine, but when I try to parse a sentence, it
says "no sign can be constructed for ...". What's
happening?](https://delph-in.github.io/docs/matrix/GeFaqNoSign)
- It seems that errors in the lexicon are only detected when I try to
parse a sentence containing a word with the error, not when the
grammar is loaded. How do I check the whole
lexicon?
- [When I try to parse a sentence, the LKB says "probable runaway
rule". How do I debug this?](https://delph-in.github.io/docs/matrix/GeFaqRunawayRule1)
- [When I try to generate, the LKB says "probable runaway rule". How
do I debug this?](https://delph-in.github.io/docs/matrix/GeFaqRunawayRule2)
- [When I try to generate, the LKB says "Probable circular lexical
rule". How do I debug this?](https://delph-in.github.io/docs/matrix/GeFaqCircularLexRule)
- [The LKB says "Cyclic check found cycle at ...". What does this mean
and how do I debug it?](https://delph-in.github.io/docs/matrix/GeFaqCyclicCheck)
- [I'm trying to write a lexical (or phrase structure rule), but I get
the error "Rule without daughter". What does this mean, and how
should I fix it?](https://delph-in.github.io/docs/matrix/GeFaqRuleWithoutDaughter)
- The LKB says that I am trying to unify a NULL with CONS. What could
the problem be?
- The LKB says that the Unification of rule-x and rule-y failed at
path &lt;&gt;. What's that about?
- Unifications failed to reunify when drawing parse tree. What does
this mean?

* * *

## Questions about the parse chart

- [How do I get the LKB to show me the parse chart?](https://delph-in.github.io/docs/matrix/GeFaqShowChart)
- [When I look at the parse chart, I don't see an edge that I'm
expecting to be there. How do I find out why it's
missing?](https://delph-in.github.io/docs/matrix/GeFaqMissingEdge)
- [How can I tell if an edge is missing in the parse
chart?](https://delph-in.github.io/docs/matrix/GeFaqMissingHowTo)
- [Looking at the parse chart, it seems that I do have an edge that
spans the whole chart (accounts for all the words), but the LKB
still says no parses found. What might be going on?](https://delph-in.github.io/docs/matrix/GeFaqRootFail)
- [How do I tell if I have an edge that spans the whole
chart?](https://delph-in.github.io/docs/matrix/GeFaqSpanningEdge)
- [One of my words is showing up in the chart twice.
Why?](https://delph-in.github.io/docs/matrix/GeFaqChartTwice)
- One of my words branches to two lexical edges that look exactly the
same. Why?
- One of my words isn't showing up in the chart at all.
Why?
- [I've tried to use interactive unification to find out why an edge
can't be built, and it can be built interactively, but it's still
not in the chart. What's going on?](https://delph-in.github.io/docs/matrix/GeFaqUnifySurprise)
- I get two (or more) parses for a sentence. How can I tell where the
extra parse is coming from?
- I get two (or more) parses for a sentence, but the Compare window
doesn't show any discriminators. Why not? (Same lexical rules
applied in other order.)

* * *

## Questions about lexical rules

- How do I get my lexical rules to apply in a particular
order?
- I've written a lexeme-to-lexeme rule, how do I know what
information I need to copy up?
- How do I know if my lexical rule should be lexeme-to-lexeme or
lexeme-to-word?
- Is there such a thing as a word-to-word
rule?
- [I'm trying to write a lexical rule, but I get the error "Rule
without daughters". What does this mean, and how should I fix
it?](https://delph-in.github.io/docs/matrix/GeFaqRuleWithoutDaughters)
- [I have written my lexical rule in the grammar file, but it still
isn't getting applied. What could be preventing it from being
used?](https://delph-in.github.io/docs/matrix/GeFaqNoEntry2)
- [I have a lexical rule that seems to be applying even when its
phonological conditions aren't met. What's going
on?](https://delph-in.github.io/docs/matrix/GeFaqOverApplicationLexRule)

* * *

## Questions about semantics

- [Some of my relations/qeqs aren't showing up in the MRS for the
whole parse. Why not?](https://delph-in.github.io/docs/matrix/GeFaqMissingRels)
- Someone told me that types x and y were semantically incompatible,
but they do unify. Can they still be semantically
incompatible?
- What is a filter rule, and how do I write one?

* * *

## Questions about types, constraints, and entries

- [What do the punctuation marks mean in the tdl files? (A very basic
guide to tdl syntax.)](https://delph-in.github.io/docs/matrix/GeFaqTdlSyntax)
- [How do I constrain something to be not of a certain
value?](https://delph-in.github.io/docs/matrix/GeFaqNegValue)
- [How do I do disjunction (constrain the value of a feature to be X
or Y)?](https://delph-in.github.io/docs/matrix/GeFaqDisjunctiveValue)
- [Can I make the value of one feature dependent on the value of
another?](https://delph-in.github.io/docs/matrix/GeFaqDistributedDisjunction)
- How do I define multiple different root
conditions?
- [How do I see what a type looks like with all of the constraints it
inherits from supertypes?](https://delph-in.github.io/docs/matrix/GeFaqExpandedType)
- [How do I look at fully specified lexical entries or
rules?](https://delph-in.github.io/docs/matrix/GeFaqViewEntry)
- [How do I see what definition the LKB has read in for a
type?](https://delph-in.github.io/docs/matrix/GeFaqViewType)
- [How do I browse the type hierarchy?](https://delph-in.github.io/docs/matrix/GeFaqViewHierarchy)
- How do I write a lexical entry for a word with spaces in
it?
- [What is a type addendum statement, and when should I use
one?](https://delph-in.github.io/docs/matrix/GeFaqTypeAddendum)
- [I've added a rule to my grammar but the LKB doesn't seem to have
found it. What's happening?](https://delph-in.github.io/docs/matrix/GeFaqNoRule)
- I'm trying to add a brand-new constraint on my subtypes, but it
says that there is no unification path. What's
wrong?
- I'm trying to combine constraints on my lexical items and it's
saying it can't unify. What can I do?

* * *

## Questions about features

- [What is the feature geometry assigned in the Matrix? (Or: How do I
figure out what paths I need to use?)](https://delph-in.github.io/docs/matrix/GeFaqFeatureGeometry)
- [I'm trying to add a new feature, and the LKB doesn't like it. What
should I do?](https://delph-in.github.io/docs/matrix/GeFaqNewFeature)
- [How do I get the LKB to tell me what type(s) a feature or set of
features is appropriate for?](https://delph-in.github.io/docs/matrix/GeFaqFindTypeForFeatures)

* * *

## Other questions

- [How do I do interactive unification?](https://delph-in.github.io/docs/matrix/GeFaqInteractiveUnify)
- What should I know about downloading matrix
patches?
- [The LKB seems to be "forgetting" a constraint/definition I've
coded. Why?](https://delph-in.github.io/docs/matrix/GeFaqForgottenConstraint)
- [In which files does order matter?](https://delph-in.github.io/docs/matrix/GeFaqOrderMatters)
- [A menu item seems to have disappeared (e.g., Parse &gt; Compare or
Generate). How do I get it back?](https://delph-in.github.io/docs/matrix/GeFaqExpandMenu)
- [How do I use tab to help me figure out where my syntax error
is?](https://delph-in.github.io/docs/matrix/GeFaqTabIndentation)
- [I have a type/lexical entry/rule which doesn't seem to be
inheriting a constraint from its supertype. What might be going
on?](https://delph-in.github.io/docs/matrix/GeFaqConfusingTypo)
- [I've downloaded an updated version of the matrix, but the changes
specified in the new matrix.tdl don't seem to be taking effect when
I reload the grammar. What's wrong?](https://delph-in.github.io/docs/matrix/GeFaqTdlTxt)
- How do I change the default sentence that appears in the parse
dialog box when I load up my grammar?
- [What's a difference list, and why do we use them?](https://delph-in.github.io/docs/matrix/GeFaqDiffList)
- All of the sudden, some of the nodes in my tree are labeled with ?
instead of N or S or VP. What happened?
- [How can I input strings from non-ascii character
sets?](https://delph-in.github.io/docs/matrix/GeFaqUnicodeInput)
- [What non-alphanumeric characters are allowed to be part of a string
parsed by the LKB, and how can I change that?](https://delph-in.github.io/docs/matrix/GeFaqNonAlpha)
- [When I switch between grammars (e.g., the English Resource Grammar
and a Matrix-derived grammar) the LKB sometimes behaves funny
(errors, seg faults, etc.). What's going
on?](https://delph-in.github.io/docs/matrix/GeFaqSwitchingGrammars)
- [When I close the LKB Top Menu, is Lisp supposed to exit as
well?](https://delph-in.github.io/docs/matrix/GeFaqClickX)
- [How can I tell tsdb++ to start with the directories for "home" and
"skeletons" that I want each time?](https://delph-in.github.io/docs/tools/GeFaqTsdbRc)
- Why doesn't my language appear in tsdb++ in the
treehouse?
- In LKB, when I click on nodes in a parse chart, I don't get a
pop-up menu. Why not?
- [The keyboard doesn't work in the incr tsdb() window/The keyboard
doesn't work in Emacs after running incr
tsdb()](https://delph-in.github.io/docs/matrix/GeFaqKeyboardNotWorking)
- [How do I paste into the LKB Parse dialogue?](https://delph-in.github.io/docs/matrix/GeFaqPasteShortcut)

Last update: 2023-07-01 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GrammarEngineeringFAQ/_edit)]{% endraw %}