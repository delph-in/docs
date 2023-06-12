{% raw %}## A-not-A questions in Chinese

*Discussion led by Wenjie*

*Notes scribed by Guy*

Wenjie: Reduplication can be full (AB-not-AB) or partial (A-not-AB) or
phrasal (ABO-not-ABO or ABO-not-AB). It can apply to verbs or
adjectives.

Emily: example of preposition? 'swims at the pool or not at the pool'

Wenjie: prepositions are 'co-verbs'/like verbs

Wenjie: 'not' can be 不 (bù) or 没 (meí). Question types: sentence final
吗 (ma), A-not-A, 还是 (haí-shì) 'or'. Some differences in scope (???),
presuppositions, and information structure. You could put extra stuff in
the phrasal A-not-A, but this is never observed. With haishi, there can
be modifications, and the negative can be before the positive. Haishi
can be in relative clauses, while A-not-A cannot. (Both possible in
embedded clauses.) Haishi allows e.g. 比较好 (bǐ-jiaò-haǒ) 'relatively
good'. Take A2 as head: it cannot be reduced, but A1 can. Or is the
construction headless? Or directly in the lexicon?

Our account needs features FCHAR (first character), WCHAR (whole
string), LENGTH (one or more-than-one). Additional lexical entries for
reduplicated first characters. A-not-A phrase requires re-entrancy
between FCHAR/WCHAR features.

Can't enforce the same object in ABO-not-ABO (but this is rare anyway)

Guy: could we rule out different objects in ABO-not-ABO on semantic
grounds? (cf. Geoffrey Pullum "winter olympics or no winter olympics")

Various: Could be plausible.

Wenjie: If we treat A-not-A in the syntax, should there be one predicate
or two? Alternatively, this could be done lexically -- but this hugely
expands the lexicon

Emily: unless Dan's right about being able to do the reduplication in
the morphology, as long as we can mark reduplication patterns

Dan: is it idiosyncratic?

Wenjie: it's regular, even O-not-OK

Francis: or E-not-Email

Sanghoun: Ma and A-not-A -- do we make the MRS the same?

Zhenzhen: We can add focus information

Sanghoun: But do we need an additional EP?

Emily: It depends on what the meaning differences are. The
info-structure is ICONS. Inclined to towards making them the same.

Zhenzhen: Agreed. And prefer morphological level.

Guy: Or controversially, squish the EPs together?

Francis: Also in the lexical approach?

Dan: No, there's only one predicate there.

Sanghoun: Can we generate to/from ma-questions and A-not-A questions?

Zhenzhen: Ma is more general. May have a specific reading which is
A-not-A.

Emily: We can model that with focus.

Dan: Ma is underspecified.

Zhenzhen: Focus most frequently on the main verb.

Dan: A lexical rule would let you do this on the fly, with only one
predicate. Puts more strain on the the relationship between form and
meaning. It's clear what we want to build, and how it should behave --
we just need to know how to get to the surface form. If our technology
does not let us get to the orthography, then we should get better
technology, because it looks straightforward. It would however draw a
big divide between the lexical and phrasal ones.

Zhenzhen: There's a spectrum, and we don't necessarily need one
mechanism. The phrasal one is like coordination of clauses.

Mike: Coordination also in "You like three-four dogs"

Francis: We're looking for a process that goes from a verb with some
number of characters to a new constituent with a bu in the middle, and
it's not clear whether we can do this with the current machinery, but we
should feel entitled to.

Dan: We should write a modest specification for an enhancement of the
current machinery.

Francis: If we treat the orthography as a list of strings, rather than a
single string, this would be easier.

Dan: This would remove the need for FCHAR, WCHAR, LENGTH features, as we
can derive this (e.g. PHON\|FIRST for FCHAR).

Dan: For lexical rules, there is no clear notion of 'head', so we decide
what information to propagate.

Sanghoun: We can add more information to the constraint. Bu and Mei
encode different aspectual information.

Dan: Have this lexical rule have two subtypes for bu and mei. Similarly
for '-er' and 'more' in English.

Guy: Why is this needed?

Emily: For bu as a lexical entry.

Luis: Interaction with le? E.g. 吃了没吃? (chī-le-meí-chī,
eat-past-not-eat)

Wenjie+Zhenzhen: Okay.

Zhenzhen: Luis has come up with a rare thing which I hate, as always.
Sort of okay, but rare.

Luis: Suggests example with different aspect marker:

    吃过没吃? 
    chī-guo-meí-chī
    eat-past-not-ea

Wenjie+Zhenzhen: No.

Zhenzhen: For the first example:

    吃了没吃 
    chī-le-meí-chī

the 了 le is redundant.

Dan: I'd be inclined to go with Luis. When we're deciding how powerful
the machinery should be, the rare examples are informative.

Guy: Le and mei have the same aspect, but guo is different.

Francis: More of the aspectual marking has to be done by lexical rules.

Luis: How about \[second marker above, repeated\]:

    吃过没吃过
    chī-guo-meí-chī-guo 
    eat-past-not-eat-past

Wenjie+Zhenzhen: Okay.

Luis: Because there's an interaction with the aspect markers, we have to
deal with these together.

Dan: These examples are fundamental to the analysis. If we decide do the
A-not-A in the morphology, then we should do the aspect markers in the
morphology as well.

Luis: Some people argue that these should be morphological. I don't want
to choose a side. I just wanted to point out the co-occurrence.

Emily: Once we say, this thing of characters is in the morphology, then
anything else that can go in there should also be in the morphology.

Luis: Even if you treat it in the morphology, we're not going to get
consistency with the phrasal ones. I'm not native, but I'd like to think
they're analogous.

Francis: Should we go back to the literature? Co-occurrence with le?

Wenjie: Only with mei.

Zhenzhen:

    吃过榴莲还是没吃过榴莲？ 
    chī-guo-liú=lián-haí=shì-meí-chī-guo-liú=lián
    eat-past-durian-or?-not-eat-past-durian
    
    吃过还是没吃过榴莲？
    chī-guo-haí=shì-meí-chī-guo-liú=lián 
    eat-past-or?-not-eat-past-durian
    
    吃过没吃过榴莲？ 
    chī-guo-meí-chī-guo-liú=lián
    eat-past-not-eat-past-durian
    
    吃没吃过榴莲？ 
    chī-meí-chī-guo-liú=lián
    eat-not-eat-past-durian
    
    吃没吃榴莲？ 
    chī-meí-chī-liú=lián
    eat-not-eat-durian
    
    吃了没？ 
    chī-le-meí
    eat-past-not
    
    吃过了没？ 
    chī-guo-le-meí
    eat-past-LE-not [could be sentence-final rather than aspectual LE...]
    
    *吃过没吃？
    *chī-guo-meí-chī
    *eat-past-not-eat

... someone raises 没 (meí, not) vs. 没有 (meí-yoǔ, not-have).

Emily: Asyndetic disjunctive coordination. There is also a tag question
mei-you.

Luis: How about:

    吃过榴莲吃过没有? 
    chī-guo-liú=lián-chī-guo-meí-yoǔ 
    eat-past-durian-eat-past-not-have

Zhenzhen: No.

Luis: 没 (meí) is just a contraction of 没有 (meí-yoǔ)?

Wenjie: for A-not-A, use 有没有 (yoǔ-meí-yoǔ, have-not-have)

Emily: There is A-not-A with bu and mei, and a separate phrasal type.
Zhenzhen is making a face as if you ate durian, in response to these.

Guy: Also 是否 (shì-fǒu, is-is.not)

Zhenzhen: It's a yes/no question.

Emily: Goes to the left of the verb?

Zhenzhen: Yes. Like 是不是 (shì-bu-shì, is-not-is)

Emily: Can shi-bu-shi be used with verbs?

Zhenzhen: Yes.

Guy: 是 (shì) can also be for focus.

Emily: Analogous to cleft sentences.

Zhenzhen: Chinese tend to contract more and more the terms that are
commonly used.

Francis: Summarising, there's pressure to treat this as a morphological
thing.

Luis: For or against?

Francis: For. Which makes predictions about whether some aspectual
things should be morphological as well. This is a nice clear prediction.
It's nasty if it's wrong.

Emily: CLIMB could be useful for such things.

Francis: People seem to share my feeling that it's hard to unthinkable
to delete predicates.

Guy: I wasn't suggesting deleting them. Re-entrancies aren't deletion.

Dan: Appending two lists when one is re-entrant with another.

Guy: I don't want to append.

Dan: But we have a general rule is to append the lists. That's all you
get to do. We're going to give up principle number one? It's not a minor
twiddle.

Guy: We use a RELS list, when really this should be a set. Procedurally,
we can introduce a re-entrancy in the phrasal type between the
daughters' predicates, but there is only one copy in its own RELS list.
We can deal with the 'lexical' case because we only have one
re-entrancy, rather than re-entrancies between all pairs of predicates.

Emily: Special bu for this construction? We still have another predicate
there. Even stepping back from the implementation, any EP that comes
through in a word gets accounted for up the tree.

Guy: It still goes up the tree, just from two places.

Petter: I started doing what Guy is doing. A preposition may end up on
the rels list or not. I just underspecify it. Let's say we have a verb
and we want it on the rels list, we add it. If we don't want it, we just
drop it.

Guy: So you lose an EP?

Petter: I compare it with Dan's analysis of selected prepositions.

Dan: I used to do that.

Emily: What about the phrasal case (AB-not-AB)? Or even verbs which
introduce multiple EPs on their own (lexical decomposition)?

Dan: Causatives?

Guy: Wasn't dealing with this, as identifying a whole MRS would be
messy, and speaker intuitions are vague anyway. The other approach
didn't deal with phrases either.

Emily: LKEYS or the whole RELS list?

Dan: Petter didn't put something into the RELS list. You're manipulating
the RELS list. This is different and more powerful.

Guy: So we can either append the RELS lists, or identify them, as two
general options in the grammar. Then this approach can also deal with
the phrasal case.

Luis: Could Petter clarify?

Petter: Wait until some operation takes place, before the semantics
contributes to the meaning of the sign. The predicate lingers somewhere
else in the feature structure, but not in the RELS list.

Francis: Or an even less principled approach, is to give these things
the same ARG0, and say that if we have two things with the same ARG0, we
just throw one of them away.

Guy: I still think my approach can be called monotonic.

Dan: You're in the best position here to find out the answer to that.
Walk into Ann's office, and put on a seatbelt. If you don't ever show up
again, we'll know the answer.

Francis: Can our definition of monotonic be compatible with this? Is
this the best way to do it?

Petter: I'd almost call this lingering of predicates an abuse. There's
compositionality but in a different way.

Francis: I think we're slowing down. I'd like to thank everyone.

Last update: 2015-08-11 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/LADChineseAnotA/_edit)]{% endraw %}