{% raw %}This is a page for us to keep links to questions on the delphinqa site, ERG issue tracker, etc that could help further populate the ErgSemantics pages. This might include nice answers elaborated on one of those fora, but also just questions that should be answered even if not yet.

- https://delphinqa.ling.washington.edu/t/converting-mrs-output-to-a-logical-form/413

The need here is for the reference docs to include *some* description of what they are implying in terms of logical evaluation. I'll use all the wrong terminology here but I hope my point comes through: For example:
- `_car_n_1(x)` logically means "restrict x to those nouns that are a car". 
- `neg(eh)` logically means...I'm not even sure how to explain it, but there must be a logical model we have in mind for determining the truth condition of the predicate since we wrote it. I really think we need to explain it. 
- `_which_q(xhh)` the two scopal arguments share a "logical evaluation" model with many predicates, but I suspect there is something special going on.  
- And I know there is for `d_number_q(xhh)` because Dan described it [here](https://delphinqa.ling.washington.edu/t/where-is-page-3-unnecessarily-ambiguous-quantifier/641/3).  
- `muchdashmany_a(exh)` does something very different with its scopal argument than `neg(eh)` does, obviously. 

It would be *extraordinarily* helpful if we described the logical model that is being used for different predicates. Especially those with scopal args.

- https://delphinqa.ling.washington.edu/t/interpretation-of-on-p-state-for-drop-the-diamond-on-the-table/483
- https://delphinqa.ling.washington.edu/t/scopal-and-non-scopal-modifiers/589/11

as per Dan in that thread "I don’t see the description we should have on the ERS pages explaining the difference between stative and directional preposition senses".  [Another example](https://delphinqa.ling.washington.edu/t/understanding-drop-put-swipe-x-on-the-floor-and-the-final-scopal-argument-for-the-verb/748) of this.

- https://delphinqa.ling.washington.edu/t/how-to-think-about-mrs-structures-that-use-a-non-verb-as-the-mrs-top-like-where-are-you/491

MRS constructs where something like "blue" is treated as the verb (i.e. top?) of the phrase. 

- https://delphinqa.ling.washington.edu/t/what-is-the-discourse-predicate-trying-to-say/548

Need a discussion of the discourse predication.

- https://delphinqa.ling.washington.edu/t/how-to-consistently-get-a-parse-of-quoted-phrases-that-uses-fw-seq-with-quoted-predicates/553

I know `fw_seq` and friends have been updated by Dan since that post, but I suspect there is a valuable discussion about when they get used, if there is *always* an `fw_seq` interpretation from ACE if something is quoted (I hope there is!), etc.

- https://delphinqa.ling.washington.edu/t/is-the-light-on-off-which-parse-is-right/605/9

Not sure what the answer is here, but how words like "on" and "off" get handled in the ERG were not obvious to me as seen in that thread

- https://delphinqa.ling.washington.edu/t/desk-is-countable-generates-proper-q/638

Might just need a reference page on proper_q since it can be used in ways that weren't obvious (to me at least) from the name.

- https://delphinqa.ling.washington.edu/t/where-is-page-3-unnecessarily-ambiguous-quantifier/641

Again more quantifier confusion here. I don't know how many phenomena we could break quantifiers into, but it is a question I'd love to see answered

- https://delphinqa.ling.washington.edu/t/open-all-of-the-drawers-and-generic-entity/697

"part of" "some of", "generic_entity", etc.

- https://delphinqa.ling.washington.edu/t/difference-between-look-v-for-and-look-v-1-for-p/744

This is one where we just need descriptions of what the different senses are since they can all be generated as alternatives from the same sentence, so you can't tell from context.  I assume there are a lot of these in the ERG somewhere.

- https://delphinqa.ling.washington.edu/t/mal-rules-for-adding-articles/776

Seems like there are some "popular" mal rules that are included in the ERG, and then a larger set that get turned on manually if you choose.  Seems like we should have this somewhere

- https://github.com/delph-in/erg/issues/29 explains compound as an underspecified preposition and why it does not share labels with all its components. 
- https://delphinqa.ling.washington.edu/t/variables-and-variable-types/424/4
- https://delphinqa.ling.washington.edu/t/new-uses-of-underspecified-variables-in-the-erg-2018/299/9

As shown in those two posts: Variable and variable types are way more subtle and complicated than the simple explanation given in the docs now:
> “i (for individual) is a generalization over eventualities and instances; p (the half-way mark in the alphabet between h > and x) is a generalization over labels and instances; and u (for unspecific or maybe unbound) generalizes over all of the > above. Note that Copestake et al. (2001) use individual for what is called instance here.”


It would be great to at least get some definitions and examples for what "Tense and aspect" mean as properties in the MRS

Last update: 2022-10-23 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_Raw_Materials/_edit)]{% endraw %}