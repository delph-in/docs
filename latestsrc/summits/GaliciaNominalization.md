{% raw %}Notes from discussion of action nominalization in the Grammar Matrix at the [Galicia Summit](https://delph-in.github.io/docs/summits/GaliciaSchedule)

* [Keren's slides](https://github.com/delph-in/docs/blob/main/summits/2023/ActionNominalsInTheGrammarMatrix.pdf?raw=true)
* Scribe: Emily

Dan: The ex focused on simple transitive verbs & their nominalizations, but of course there at least examples with three examples:

*Kim's gift of the book to the child*

Dan: That third argument isn't a possessive.

Keren: I believe non obj/subj arguments, the marking just carries over from verb to noun.

Dan: I thought you said that to have both present, the language needs to have two ways to mark possessive.

Keren: It has to have two different genitive constructions. E.g. Russian, can express both and either as genitive, but not both at the same time.

Guy: Question about typology. The correlation between having nominal arguments and expressing as genitive. How strong is that relationship? Might just be a diachronically common outcome.

Olga: In the Russian ex if you wanted to add another argument, you'd just use a different case (instrumental for subject).

Guy: Then surely the instrumental doesn't look like marking of arguments of a nominal.

Keren: Depending on the language, it can be partial.

Guy: Instrumental is neither marking of arguments of a nominal nor of a verbal.

Keren: Right, that's not sentential marking. It's often comparable to what happens with passive subjects. Not true for all languages. (True of Russian.)

Emily: So what do people think of poss_rel or not? What about *Kim's gift of the book*

Dan: For the frozen action nominals, I don't do anything. But for the gerunds (*Kim's giving of the book*) I have more control because still have a SUBJ, but I think I pretty uniformly put in the poss_rel as an underspecified representation. Treating it as a Parson's style representation.

Guy: For gift, I don't think it's strict. *They lavished us with gifts. This is my gift, that's yours.*

Francis: It's ambiguous.

Guy: Not true for *giving*.

Emily: That just means that poss+gift is ambiguous.

Dan: I don't want *my gift* to be ambiguous. Would rather keep that as vague.

Emily: What about *my gift of the sculpture*. Do I have to be the giver --- can I be the recipient?

Dan: Have to be giver...

Emily: So the syntax does pin it down.

Dan: Could have two separate entries for gift, one with no complement and ambiguous role for possessive. And the other with PP[of] required complement and with more specific interpretation of poss_rel on specifier.

Emily: Obligatory PP[of] complement.

Dan: Also fondness.

Guy: *gift from* forces recipient role on possessive.

Francis: *Kim's gift from China*

Dan: That's the locative from. 

Guy: What about *gift for*.

Dan: You have a gift for obfuscation...

Francis: Another example of tension between showing only semantics as provided by syntax vs. wanting more detail...

Dan: This set of data definitely pushes us towards wanting more syntactic ambiguity in order to capture more. Lexicon v. some post-processing.

Emily: But in all cases we're talking about poss_rel as underspecified.

Dan: Yes, we're firmly committed to that being what *'s* contributes. Like compound_rel.

Emily: But when we specialize poss_rel to arg1_rel in *My gift of the sculpture* we're putting in something we don't usually see in the MRS.

Dan: Ann has long talked about pulling apart EPs into these smaller pieces. In some sense a notational variant of what we already do, but what change the shape of the raw MRS into something even harder to read, but would also give us more expressive power.

Francis: What do you think, Eric?

Eric: Haven't thought much about these. LVCs -- I've specifically ended up doing a pre-transform of the MRS to create fake verbs. Even beyond light verbs: *would like* meaning "want". I usually create those as alternative MRSes, and keep the original around too.

Keren: *creation* can be a concrete thing vs. the more abstract idea.

Dan: There's a class of nouns ambiguous between the result of the process and the process itself. Called something like resultative nominals --- or ambiguity between result nominalization and the action nominalization. Is that something that is fully productive or predictable in some languages?

Francis: Same ambiguity exists in Japanese.

Dan: Predictable?

Francis: I think people label them, so probably not fully predictable. Interacts with the aktionsart of the verb.

Dan: Presumably an adjective might help disambiguate:

* *slow creation* (probably event)
* *hasty creation* (could be either)
* *thoughtful creation* (could be either)

Guy: *I enjoyed my gift of a delicious coffee cake so much I want to give one to my friends* --- counterexample to above claims, found in a review on the web. So maybe this isn't grammaticalized.


Last update: 2023-06-27 by emilymbender [[edit](https://github.com/delph-in/docs/wiki/GaliciaNominalization/_edit)]{% endraw %}