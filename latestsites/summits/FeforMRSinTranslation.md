{% raw %}MRSs in Translation: interlingua vs. semantic structure

-- Semantic objects and their relation to languages: are they language
specific or shared among languages. Rels are shared among languages.

a\. Granularity in semantic representation

b\. Structure of the semantic space: none, hierarchy, network structure:
antonymy

c\. Architecture: Pipelined or semantic components

-- DELPH-IN approach:

a\. Advantage: grammars, parsers, etc., can be combined via MRSs (see
LOGON)

b\. MRSs are langage-specific

c\. MRSs are shared among languages

d\. Grammar does all the work

e\. Stochastic Ranking

f\. Transfer may be used when a paraphrase-set is monolingual

g\. Paraphrase sets for ambiguous sentences

-- Pros and cons

1\. Flexibility and practical application: Transfer rule model
translational relations are much more flexible than MRSs, but

2\. Transfer rules do not model semantic relations

-- Transfer and semantics

a\. Words vs. constructions: the problem is the same for text
understanding, or question answering with a single language

b\. The relation of translation to semantics

c\. Grammar harmonisation

d\. Translatability and the nature of languages: all meanings are not
shared

e\. TL may require grammatical distinctions that are not part of SL

Structure of a semantic space

a\. Matching on proximity

-- Issues for discussions

a\. Semantic types and features

b\. Granularity of semantic representation

c\. Structure of the semantic space

d\. Architecture

-- Contributions from the floor:

EB: When asked by colleagues if MRS is an interlingua, I say it's not.
This is because given our constraints on compositionality, we can't get
from surface strings to interlingua representations in one (monstratal)
step. That doesn't preclude doing postprocessing from grammar-produced
MRSs to an interlingua.

FB: To do the interlingua, you need to have more info about senses than
we currently have. There will be very few concepts that are markable
from all languages. Some of the problems require us to go one step more
abstract. Perhaps MRS can't be an interlingua.

JT: Some experience from LOGON: transparent rules vs. non-transparent
rules. It's possible to go from LFG to ERG. In Norwegian MRSs are
simpler than the MRSs in English.It's interesting to write transfer
rules when there are differences among the languages. But if there are
not, then what might be needed more is a better harmonisation. Semantics
closer to languages or abstract away from the argument structure.

AF: If one decides to go for an interlingua, one needs to define a
difficult target, and also confronts the problem of generation from a
rather abstract layer. It seems more advisable to stick to a (maybe
slightly more normalised) transfer on MRS, and deal with the complexity
of the transfer patterns by moving from manually written to
automatically acquired transfer rules.

LA: What are the relevant semantic aspects that we should encode?

FB: 1. In the short term, going to a high level interlingua might not be
a good idea. But it might be the final goal.

1. How often don't you know what a correct MRS in 2 languages is?
Question to DF.

DF:There are cases where there are MRSs in the 2 languages (Norwegian
and English), that are all correct, and one has to make an expert
decision of which one is the best one according to the preferred
analysis.

Last update: 2006-06-29 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/FeforMRSinTranslation/_edit)]{% endraw %}