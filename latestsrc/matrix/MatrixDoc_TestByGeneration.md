{% raw %}# Documentation for the Grammar Matrix Customization Test By Generation Page

# Introduction

The Test By Generation facility is partially described in [Bender et al
2010](http://aclweb.org/anthology-new/P/P10/P10-4001.pdf).

In summary, this feature enables users to quickly get feedback about the range of strings the grammar can generate according to the specifications in the Test by Generation Options below. The Test by Generation page will display sentences generated with ACE for each kind of sentence template selected in the Test by Generation Options as well as the parse tree and MRS string.

```
# Example Generated Sentence

Pattern 1: Intransitive verb phrase, with predication: _sleep_v_rel
1. The dogs sleep
   Parse tree:
     ("S" ("NP" ("D" ("the")) ("N" ("N" ("dogs")))) ("VP" ("VP" ("sleep"))))
   MRS:
     [ TOP: h0
      INDEX: e2 [ e SF: prop-or-ques E.ASPECT: aspect E.MOOD: mood E.TENSE: tense ]
      RELS: < [ _def_q<-1:-1> LBL: h4 ARG0: x3 [ x COG-ST: cog-st PNG.NUM: pl PNG.PER: 3rd SPECI: bool ] RSTR: h5 BODY: h6 ]
      [ _dog_n<-1:-1> LBL: h7 ARG0: x3 ]
      [ _sleep_v<-1:-1> LBL: h1 ARG0: e2 ARG1: x3 ] >
      HCONS: < h0 qeq h1 h5 qeq h7 > ]
```

The sentence templates are actually MRS patterns with placeholders where the noun/verb/determiner predicates should be.

```
# Example MRS Template

; A simple intransitive verb template

label=Intransitive verb phrase
[ LTOP: h1
INDEX: e2 [ e SORT: SEMSORT @ITR-VERB1@ ]
RELS: <
  [ "#DET1#"
  LBL: h3
  ARG0: x4 [ x SORT: SEMSORT @NOUN1@ ]
  RSTR: h5
  BODY: h6 ]
  [ "#NOUN1#"
  LBL: h7
  ARG0: x4 ]
  [ "#ITR-VERB1#"
  LBL: h8
  ARG0: e2
  ARG1: x4 ] >
HCONS: < h5 qeq h7 > ]
```

Note: The "owners" of the other Grammar Matrix libraries (eg. Adnominal Possession library) are responsible for adding templates relevant to their library that they would like to make available in Test by Generation.

# Options

### Test by Generation Options

The Test by Generation Options page in the Matrix Customization page or `gen-options` section in the grammar choices file allows users to specify what kind of sentences to generate.

- Simple intransitive verb phrase (`itv=on`)
- - Features: You can further specify features on the verb such as tense, aspect, etc. if those features are defined with a set of values elsewhere in the choices file.
- Simple transitive verb phrase (`stv=on`)
- - Features: Same as above.

Selecting either of the above two options will generate a simple verb phrase or sentence with an intransitive verb or transitive verb respectively. The verbs are arbitrarily selected and the system will select appropriate nouns and possibly determiners that can unify with the selected verb. If neither of these two are selected, the system will generate both a simple transitive and intransitive verb phrase by default on the Test by Generation page.

- Generate from Test Sentences (`from-test-sentences=on`)

Selecting this option will tell the system to generate sentences using the sentences in the Test Sentences section of the choices file or Matrix Customization site. In order to do this the system will first parse the sentences, create an MRS template from the parsed sentence, then generate a sentence from there. Currently, if there were issues parsing or generating the test sentences, they will not appear on the Test by Generation "results" page. 

### Test by Generation Page

After selecting test by generation options above, you can view the "results" of Test by Generation from the main page by selecting "Test by Generation". The sentences generated from the templates will be there.

- Show Remainder

When a large number of sentences are generated, the results are clipped. You can select this button to show the remainder of the sentences.

- More Sentences with this verb and pattern

Each template will have the option to generate even more sentences with the selected verb (predicate) and template pattern. This is done by generating every combination of nouns (and possibly determiners) that can fill the template pattern so it may be slow for large lexicon grammars.

# Upcoming Work

- Add the ability to specify the max number of sentences to generate on the page.
- Add the ability to select the verb to use in the template (although this is partially completed with 'Generate from Test Sentences')
- Add the ability to navigate to the Test by Generation Page from the Navigation panel on the right of the customization questionnaire
- Make the sentences look more clickable on the Test by Generation Page
- Add graceful error message handling when there are issues compiling, parsing or generating. And possibly other potential sources of failure.
- Add the ability to generate sentences from EDS

# References

Bender, Emily M., Scott Drellishak, Antske Fokkens, Michael Wayne
Goodman, Daniel P. Mills, Laurie Poulson, and Safiyyah Saleem. 2010.
[Grammar prototyping and testing with the LinGO Grammar Matrix
customization
system](http://aclweb.org/anthology-new/P/P10/P10-4001.pdf). In
Proceedings of the ACL 2010 Software Demonstrations.

Last update: 2022-08-18 by rosypen [[edit](https://github.com/delph-in/docs/wiki/MatrixDoc_TestByGeneration/_edit)]{% endraw %}