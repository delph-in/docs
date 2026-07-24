{% raw %}Defaults/defeasible constraints in the LKB

* Convener: Spencer Brooks
* Scribe: EMB
* [Slides](https://github.com/user-attachments/files/21116464/Brooks.Handout.Slides.pdf)

Ann: What do you mean by push down?

Alex: YADU was 30 years ago, so I might not remember right. But Ann and I were very careful to retain within the feature structures all default information even at any point where it was overridden. It's not that it's thrown away. I think the notation is perhaps a little bit misleading. What's happen with YADU is that you have a fs of all the monotonic information and then a tail of fs which is all default information, some of which when you want to compute an answer when you want to compute a result. It's always there anyway.

Ann: It is thrown away eventually. The operation we're talking about here is one where defaults are used as an abbreviatory convention.

Alex: So you're talking about what you do when you want to expand a grammar that features these defaults.

Ann: You're building up types, lex rules, lex entries.

Alex: That's the source of my misunderstanding.

EMB: Push down is smaller identities survive even if the larger defeasible one is overridden.

Guy: The example here comes from my slides, which might be confusing, because it's already switching around what's default. [1] is default, and dat/acc are monotonic. But this is halfway through what I was calling the backwards step. Would have longer feature paths which are identified. If you started from that single identity constraint, once you've done unification subtype with longer paths would have larger set of pairs that are identified. That's what I call pushing down.

Ann: I think we need to back off from Guy's proposal and go back to a point where ... there was always the issue of what exactly does it mean to have a defeasible identity between two nodes relatively high up in a feature structure. Do you read that defeasible identity as just affecting those two nodes, or do you expand that out all the implied defeasible identities (better than 'pushing down').

Glenn: Are you referring to the one-time expansion of the grammar when it's loaded.

Guy: I'm not wedded to that terminology.

Ann: No. I'm trying to talk to Alex so that we understand what we're talking about. SWB does not have a formal account of defeasibility, sort of assumes YADU, but not explicitly.

Ann: Defeasible identity---you have to think about the components of what is a particular defeasible constraint between two parts of a fs ... potentially means there's a defeasible identity between the leaves of those parts and all the nodes in between. If you analyze what a defeasible constraint means in terms of YADU you're talking about a whole load of path re-entrancies---which means you have ot know about the types. An interaction between the typing system and the defeasibility notion.

Alex: Nice to have quote -- I'm not sure that's expressible with YADU. You can't express embedded defaults.

Guy: This is what my proposal was extending YADU to allow.

Ann: What do you mean Alex?

Alex: You can't have a sequence of slashes meaning anything on a path. Given the way YADU is set up, we don't have talis of tails.

Ann: But you don't need it for this.

Alex: Not clear to me.

Ann: Simplest case. Here's my lex rule-- INPUT default same as OUTPUT.

Alex: If there's a default reentrancy and you've got monotonic info on paths within it with contrasting into that breaks the reentrancy.

Ann: You're saying the reentrancy. If you think about what a fs means (nevermind defaults) that thing that we express as a high up reentrancy implies a very large number of reentrancies lower down if you had the full type expansion going on.

Alex; It's proxy for an unlimited number of paths depending on how the thing expands.

Ann: At one point we thought about this...

Alex: Reentrancy was always a bloody problem. Reentrancies in defaults are a nightmare.

Ann: Particular issue due to the interaction of the defaults with the type expansion. Because you don't know-- you've got this very large number of implied reentrancies.

Alex: And during expansion you don't know what those will be until you're done.

Guy: Tried to give simplest possible example in my 2021 slides.

Spencer: Thank you for that interjection, has already helped me clarify my understanding and its limitations.

Guy: Slide 3 from 2021. This is what we would like to happen. This is not the output of YADU, which would not produce this.

Ann/Alex: Depends which version.

Alex: The credulous version would produce this.

Guy: I followed the definition in the paper and it would not produce this.

Alex: Which definition?

Guy: I think it was called def-fs. The versio that I remember said that when you have the default constraints, you take hte set of most specific fs (Carpenter) and then take the generalization of that set. Which in this case would result wiht no reentrancy.

Ann: That's because you haven't expanded out.

Guy: Yes, but that expanding out wouldn't happen in the YADU paper. Which is why I presented this alternative which would force that expansion.

Ann: It's a question of which reentrancies go into YADU, not YADU itself.

Guy: Yes.

Guy: When the subtype has further feature paths, we need a mechanism to force the first structure (with the identity constraint up high) to have those paths. The backwards step was a way to force the expansion without adding new machinery.

Ann: I don't understand your terminology, but I understand what the issue is. It's one we talked about 30 years ago.

Glenn: Filling in the well-formed type is just part of unification.

Guy: Yes. To answer your first question Spencer about how does expansion happen: by unification.

Glenn: The expansion on grammar loading would do this.

Guy: The supertype here has no further types.

EMB: I'm hearing inconsistent statements from team YADU, both that this would happen with the credulous version and that it's a big problem.

Alex: When you're unifying two things, you take the monotonic parts and unify in the normal way (and possibly get failure). With the tails (defaults) and do a set union. When you want an actual result, work through the set union and figure out what unifies and what doesn't. (30 year old memory.) In this particular case, whether COMP.CASE and DTR.COMP.CASE are monotonic or not, because it's on a sutype, even if default and therefore in the tail (default reentrancy and the default values). The subtype wins when doing the unification in the skeptical way. The tail is a bunch of atomic fs, except for these reentrancies which are weird. That's why reentrancy was a problem. You've got lots and lots of feature structures which are just one path, unless you have a reentrancy in which case it's two paths.

Guy: One way you could rephrase my proposal as expanding the tail.

Alex: Instead of set union?

Guy: In this case the tail is a singleton set (<COMP, DTR|COMP>) want it to also have <COMP|MOD and DTR|COMP|MOD> and <COMP|CASE and DTR|COMP|CASE>.

Alex: Tail has <COMP, DTR|COMP> in supertype. What are you proposing instead of set union on the tails?

Guy: Switch around what is default and what is not (temporarily).

Alex: Hwat???

Guy: I've done this so that when we apply YADU to this we could get ... and then apply YADU in the normal way (forwards), and that now gives the result that we wanted. There might be a better way of doing that.

Ann: Not sure I was there in 2021 when you proposed this, but why don't you just have all of the necessary reentrancies as part of the YADU tail.

Guy: We need some way of finding/creating them.

Dan: How many do you do?

Alex: You don't know until it's fully expanded.

Ann: Not talking about a practical implementation, but the formalism.

Alex: What Guy is proposing is known in the  non-monotonic symbolic logic lit => graded normality. "Birds fly" what does it mean? It means "Normal birds fly". "Birds lay eggs" => "Normal birds lay eggs". If you encounter an  emu, see it doesn't fly, still assume it lays eggs. Even if youre abnormal in some of the aspects of the paths that the reentrancies are involved in, want to retain what's normal for reentrancy. In symbolic logic it's a real problem because graded normality does not... we want closure on the right. Michael Morreau in this thesis showed that if you combine an axiom of graded normality with closure on the right. "Birds fly" and "All flying things without exceptoin have wing". Can conclude that birds normally have wings. Concluding a new default from an earlier default. That is an inconsistent logic, and I think we've got closure on the right, so I'm not sure this will work.

Guy: I'm not sure how that applies in this particular feature structure universe.

Guy: Slide 3. The types on the paths COMP and DTR|COMP on the supertype are very generic (no further features), which the type at those paths in the daugher are more specific.

Francis: Takes us back to Spencer's slides.

[Looking back at notes from 2016]

Francis: If YADU sometimes has a problem-- is undecidable, grinds to a halt

Alex: Not undecidable, just doesn't give the answer you want.

Francis: Can we treat this as an engineering problem, and just warn the user.

Guy: Would mean that you can't use defaults in the case that Emily wants to use them for.

Alex: With all non-monotonic logics, of which YADU is one, you can't have it all. There are apparently compelling patterns of non-monotonic inference that just aren't compatible. That's what Morreau's thesis shows.

Glenn: Francis's idea is okay just warn about those. Are they detectable?

Alex: No. The whole point is that you don't what the paths will be, because you won't know what they are until parse time.

EMB: Not parse time, grammar compile time.

Alex: You still have the problem. Just don't do default re-entrancies.

Ann: That's the only place they want defaults!

Glenn: About error reporting, there are two classes of error, one at compile time and one at run time.

Dan/EMB/Alex: Never at runtime. That would be mad.

Glenn: Can you tell at compile time what the problems would be at run time?

EMB: If we succeed at doing this then by the time we get to run time it will be monotonic constraints. The point of Guy's proposal is to use the subtypes to get the info about what the *relevant* paths are.

Ann: Then just use YADU.

Guy: But YADU by itself as in the paper wouldn't do that.

Ann: The YADU tail expands as the type description expands.

Alex: We didn't include that in the paper description, but it would be easy to do.

Guy: What's the formal mechanism for adding stuff to the tail? I was proposing one way of doing that, maybe there is a better way of doing it.

Alex: Where does MOD path come from?

Guy: The *noun* type.

Alex: As soon as you had further paths to a reentrant path, you add to the tail reentrant values for those bigger paths. That's all that's needed. No changing defaults and then changing them back again.

Ann: It's just the issue about that reentrancy meaning more, in terms of what's in the tail, as the type expansion happens. I have some recollection of working this out and I think it just doesn't get into the paper. As you build up types when you've got a default reentrancyon the supertype, there's this idea that the default reentrancy should be expanded.

Alex: It didn't end up in the paper. The proofs int he paper were for the def in the paper (YADU being commutative and associative).

Ann: Not understanding why you're worried about this formally. There's nothing formally different than what's going on in other context. Might end up with a horrendously large tail.

Alex: Tail explodes, you're doing set union and skeptical default unification on set union to get the resulting fs from a YADU binary operation. What's not clear is that the result would still remain associative and commutative. Because we're adding stuff ot hte tail before doing set union. It's probably fine, but I just didn't prove it in the paper. Would need to look at the proofs again. Not just set union on the tails anymore. It's just set union and a little bit more.

Ann: Ends up as the same as ordinary YADU in the situation with fully expanded types.

Alex: Need to sit down with pen & Paper.

Francis: If we think of it as a bushy rather than exploded tail, does this solve the problem of not doing what we expect?

Alex: Going from rat to squirrel. Closure on the right doesn't apply to fs because the values are all distinct and atomic (and don't entail each other). That's where the problems would arise, at least if Morreau's proofs are correct. It could be that with typed fs it doesn't matter, because closure on the right as an axiom is not part of the unification algorithm anyway. All values clash, unless they're the same.

EMB: But what about non-leaf types that might have subtypes?

Alex: Oh yeah, that would be a problem then.

Francis: Control back to Spencer.

Spencer: Do I have to worry about persistent defaults?

Ann: No.


Last update: 2025-07-08 by emilymbender [[edit](https://github.com/delph-in/docs/wiki/AmsterdamDefaults/_edit)]{% endraw %}