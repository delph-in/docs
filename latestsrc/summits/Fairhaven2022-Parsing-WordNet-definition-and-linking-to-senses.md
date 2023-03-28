{% raw %}# Discussion: Glosstag -- parsing wordnet definitions and linking to senses

**Moderator:** Alexandre

**Scribe:** Yi-Chien

**Slides:** [glosstag.pdf](https://www.overleaf.com/read/rkwpnkwpjjwf)

## Minutes

### Overview
- Purpose: The definitions and examples of WN can be themselves sense tagged with the senses of WN.
- Motivation:
  - The annotation of the definitions and examples provides some "certificate of completeness and correctness" for PWN
  - Definitions provide semantic information about the concept. Including semantic representation makes PWN kind of ontology.
  - Mappings between lexical resources are useful.
  - Translation of glosses to the OWN-PT.
- ERG Processing:
  - How to map the annotation? Mapping annotation to syntactic tree, MRS, or DMRS?
  - POS tagging mismatches
  - Tokenization mismatches with ERG (RPP)
  - Differences between versions. Definitions and examples are not in the exact same format -- which version to use/how to fix it?
- Problems in tokenization: extra/missing punctuations; How to deal with the punctuation formatting
- Multiword expressions: How to deal with multiword expressions:
  - Multiple words in proper nouns (e.g. San Diego)
  - MWT to single predicates (e.g. speed up)
  - NN compounds are not always MWE in WN
  - adj-nouns are sometimes MWE in WN
- Annotation (directions and tools):
  - Emacs
  - Definitions and examples are parsed and mapped to MRS predicates to tokens/senses. Mismatches can be heuristically, trained or manually solved.
  - Make data available for browsing
  - Possible directions:
    - how can sense annotations help parsing selection?
    - continuous treebanking and sense annotation alignment?
  - version difference between PWN
  - ERG enhanced lexicon
- Ideas from Francis:
  - Distinguish idiomatic (hot dog ) and compositional (guard dog) MWES.
    - Possible solutions:
      - Add idiomatic to MRS
      - Tag compositional words as single words
  - Add senses to enhanced MRS/DMRS
  - Tag ERG output
### Discussion
- Francis: Need to decide whether we want to tag all the multiword expressions. Add idiomatic to ERG? Tag compositional as single words?
- Eric: Does the mapping mean I take the MRS and get the possible links to the WN?
- Francis: Yes, will be a model to determine which one is the most likely one
- Luis: How many unique senses are actually unique? How many senses do we need to use since it might be keep growing?
- Eric: Is there a GUI for us to tell the that links to the MRS are the ones newly added?
- Francis: There is a tool that tell that a specific link is one sense in a version and the other in another version
- Alexandre: How to differentiate some senses that are highly similar
- Luis: We need to allow ambiguity and to select the core senses
- Alexandre: An IBM work proposed a method to map the WN to gloss (using some hash map).
- Guy: comment on the 1st pt. How are you going to determine where to draw the distinction. How many extra meanings to you want to get from compound nouns.
- Luis: If we have one sense that perfectly matches the MRS of one of the word in the compositional, we use that sense
- Francis: How to not tag "hot dog" as "a dog that is hot"
- Eric: If we get the different representations in MRS (i.e. the WN sense that is different from the MRS), we can't have that representation. So "red deer" can be interpreted as "a deer that is red" (mapping to the sense "red" and "deer" in WN). But "hot dog" cannot be interpreted as "a dog that is hot" (mapping to the sense "hot" and "dog" in WN).

Last update: 2022-07-20 by Yi-Chien Lin [[edit](https://github.com/delph-in/docs/wiki/Fairhaven2022-Parsing-WordNet-definition-and-linking-to-senses/_edit)]{% endraw %}