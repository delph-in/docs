{% raw %}# Discussion: Paraphrasing

# Moderator: Francis Bond; Scribe: Michael Goodman

# Objective

- Share information on what is being done
  - parse and generate
    - problems with unknown words --- can't generate from MRS
    - can use Erik's generation model (in batch mode)
  - monolingual translation
    - [EnEn](/EnEn)
      
      - mainly underspecification *of* =&gt; poss\_rel =&gt;
compound\_or\_prep
        
        - *minutes of meeting/meeting's minutes/meeting
minutes/minutes of meeting's*
      - need to build a scoring model for the underspecified MRS
      - need a full MT model for transfer rules
    - What about lexical? *meeting/transactions* --- massively
larger TFS or external rules?
    - can everything be done by underspecification?
- Applications
  - SMT training data
  - query expansion
  - normalization
  - relaxed input for MT
  - debugging
  - anything else?
- How do we acquire paraphrase rules?
- Discuss ways to make paraphrasing more robust
  - generation often freezes (host lisp running out of memory?)
  - generation debugging tools

# Notes

Some existing discussions:

- [Early discussions](https://delph-in.github.io/docs/tools/RmrsParaphrasing)
- [Paraphrasing Top page](https://delph-in.github.io/docs/summits/ParaTop)

## Overview

Objective: see what others are doing

Work has been done with parse + generate paraphrasing

- Works for syntactic, sometimes lexical, alternations

Also have done work with a monolingual MT system (by Darren Appling)

- Would like to do everything with underspecification
  - Perhaps Tim's approach could work

How to acquire paraphrase rules?

- Look for alternations in parallel corpora?

Making paraphrasing more robust.

* * *

## Discussion

Lexical substitution:

- Tim: Wordnet has not worked well in the past
  - syntactic constraints surrounding words are important
    - cannot just swap words

Tim: Are you doing paraphrasing for SMT on both sides?

- Francis: Not yet, but Jacy may be capable now.

Bill: What's difference between parse+generate and monolingual
translation?

- Francis: Parse+generate only paraphrases where there are no semantic
differences.
  - Certain orderings are prohibited because of topicalization stati
  - Lexical substitution is limited to semantic hierarchies

Richard: Is there closure in the process, or can it be re-run?

- Francis: Some recursive rules could do this, but not really
beneficial.

Contractions are useful (eg. gonna -&gt; going to)

Dan: Allow informal output?

- Francis: only formal output.
  - some corrections have been used (eg. "go to the the bar" -&gt;
"go to the bar")

Francis: The user/evaluator doesn't need to be bilingual, and you only
need one grammar to produce paraphrases.

Francis: An issue: don't have the perfect unknown word handling
mechanism.

- eg. "I went to Barcelona and ate bacalao" (eg. don't have "bacalao")
  - Cannot generate from this.

Francis: Round trip efforts give a new perspective on your grammar.

Stephan: Can now get what is wanted (eg unknown words, normalization of
preds, etc)

- But have to add stuff to MRS construction code.
- Would rather do lemmatization on the input.

Last update: 2012-02-16 by PeterAdolphs [[edit](https://github.com/delph-in/docs/wiki/BarcelonaParaphrasing/_edit)]{% endraw %}