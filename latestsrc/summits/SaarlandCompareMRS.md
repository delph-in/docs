{% raw %}Organizer and scribe: Dan

Several DELPH-IN facilities for (D)MRS comparison exist in varying
levels of current usability:

- The LKB has the richest functionality, including comparison of MRSs
and DMRSs with exact match and with subsumption, as well as support
in principle for paraphrase equivalence via MRS-to-MRS "transfer"
rules, though such rules only exist as small experimental sets as
yet. Operations on DMRSs are also supported in principle to "prune"
larger units such as the semantics of modifier phrases.
- PET does not currently support MRS comparison in the main branch,
but Yi has added an MRS equivalence check in an experimental branch,
and could merge that functionality into the main branch if given an
input/output spec and some test data.
- ACE also supports MRS subsumption and (by also reversing this test)
equivalence. It also includes implementation of the transfer
formalism, so paraphrase equivalence should also be supported. An
input/output specification would be needed to make MRS comparison an
externally available function of the ACE engine.
- Mathieu's "inexact graph matching" implementation may soon be
available (M. estimates needing a week or two to complete the
packaging), and should enable a graded comparison of MRSs via edit
distance. This approach will require some experimentation, and the
current implementation will impose an efficiency burden for MRSs of
longer sentences, but it holds promise as a means of comparing MRSs
that may be similar but not identical.

To advance the current state of functionality, Dan agreed to produce a
proposed input/output specification, and a set of test data in the form
of pairs of MRSs plus a judgment as equivalent, subsuming, or not
equivalent. This data set might later be enriched to reflect more graded
measures of distance in order to text Matthieu's engine.

Last update: 2013-08-07 by DanFlickinger [[edit](https://github.com/delph-in/docs/wiki/SaarlandCompareMRS/_edit)]{% endraw %}