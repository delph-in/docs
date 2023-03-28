{% raw %}Moderator: Ann Copestake

Scribe: Emily M. Bender

* * *

See [slides](https://github.com/delph-in/docs/raw/main/summits/2021/ann2021plurals.pdf) for set up

EMB: Under a system where entities are sorted based on the nominal introducing them, it seems that existential quantifiers are no longer symmetrical:

*There is a dog and it barks*

*There is a barker and it is a dog*

... a feature or a bug that the RSTR and BODY are no longer equivalent for this type of quantifier?

Ann: Yes, it does have that consequence. Some people think this is a feature rather than a bug. I don't know the recent literature on sorting in logics. There were some arguments in favor of doing this on linguistic grounds, but haven't gone back to it at all. Just raising it as a way of thinking about this which I think has some potential advantages. One has to do something other than saying there are entities in the world. Formal semanticist say there are entities in the world, and mass term stuff as well. Paper by Krifka 1987: there's just stuff, and then you count it according to a natural unit. But that doesn't allow for individuals.

Guy: 2018 PhD thesis by Marcin Wągiel "Subatomic Quantification" https://is.muni.cz/th/lax8m/wagiel-subatomic-quantification.pdf. Builds on previous work starting looking at mass nouns (Grimm's PhD thesis from 2012?). Uses tools from mereology and topology, building on Link's approach. Not just part-whole structure but how are they connected to each other? Don't just randomly take parts which might make sense in a mereological approach.

Ann: If you dismantle a car you get parts, if you smash it up you get pieces. Harry Bunt's thesis from the late 70s or early 80s had a mereological account of plurality which was also quite interesting. But that got lost, is not normally cited by linguists.

Dan: That issue about where we represent the distinctions that come from what the language morphology tells us (say) is fascinating because of what you hinted at in terms of small but important language differences. The ex I keep coming back to is that information is count in French, borrowed into English as a mass noun. If I want the representation in the MRS for the French and English sentence using that word, shouldn't be dramatically different, but English denotes as mass but French as count. Where do I do that while still capturing what is common about them?

Ann: Arguably this is going on with Japanese and Chinese all the time---usually have general number and have to use a classifier. Two ways to go: English just doesn't bother to show you the classifier and I have to put it in (like Krifka 1987). Other option: it's all count and they just didn't notice the things that you're counting. What I'm trying to get at with the leaf and mountain examples is that I don't think either of those can be right, because underlyingly not that clear even for native speakers of a single language even fixing the predicate. The information examples show a clear difference between languages, but individuation isn't straightforward even when most things are fixed!

Ann: I'd like to say that individuals are in some sense a special case and to acknowledge this difficulty of doing the individuation. Not to say that there are inherent entities there.

Dan: I'm sympathetic: We should look for an underlying commonality and try to accommodate either by implicit elements to smooth out surface differences.... That issue about the identity copula or plurality of something like group: *Our group is over there in the waiting room. Some of them are hungry*. The group is an entity but it is also made up of entities, and these are accessible for the anaphor.

Ann: Group nouns are interesting in English because they're always human or human-like denoting and in BrE you can happily say *The team are hungry*.

Dan: Dialect difference sheds light on the question of what we want to put in the semantic structure (thinking about downstream consumers of the semantic representation).

Ann: Wrote about this a long time ago. Have to be careful about whether you're talking about the agreement on the NP or the noun. (Btw, some American dialects allow the plural agreement too: The team of athletes were hungry. The band were fed up.)

Dan: Yes, with of phrase pretty easy to get the plural agreement.

Ann: I collected some examples.... depends on the predicate. I can't say *The band is hungry*. Because when you're talking about the individual members of the band... Lots of examples about members of the committee v. the committee and judges and hangmen (Landman - Landman, F. (1989). Groups, Linguistics and philosophy, 12(5), 559-605 plus Groups, ii." Linguistics and philosophy 12, no. 6 (1989): 723-744 - it's a looooooooooooong paper...)

Ann: In terms of agreement, what's going on is that there's plural reference there and BrE shows that with plural agreement on the verb. I would have to deal with that with some sort of shift, just like with *a beer* (mass term categorized with portion). I've always done this with lexical rules because I quite like them. Would be happy to do that with the team example too. People who want to do this with underspecification get stuck here because they have to underspecify everything.

Dan: In the ERG we've ended up drawing distinction between morphosyntactic and semantic agreement. *The team are hungry* ... can still be uncommitted about semantics.

EMB: What does it mean to keep sg/pl with individuals (binoculars example)? (Where is the individual?)

Ann: Depends on your theory of formal semantics. Happens with gender in German forms of *it*. Also number in English, as Guy said in the chat: *Can you get them?* even if you haven't said *binoculars*. *When's it going to arrive?* use form of *it* that matches gender of the word for *bus* or whatever word you would use. Dowty argues that means that gender is semantics ([can't find the paper at the moment but I think it's Dowty and Jacobson 1989]). But maybe that's pushing it: what you use for anaphora resolution isn't necessarily semantics, but that depends on what you think semantics is.

EMB: Thanks, I think I agree.

Ann: Another version: Why are we bothering with formal semantics anyway, if we just want to hook our MRS up with something that does something in the world? I have some sympathy because formal semantics makes abstractions without justifying them. But when you're doing visual QA for example, it is quite complicated. Have to force models to work in terms of individuals instead of just colors say. So I think it matters even if you're going to bypass the official formal semantics layer. Some of it comes in even then. Can't just shove a camera at something and link up the MRS without training on examples where you actually name things.

EMB: Sorted individuals: languages that mark sg/pl via verbs for dropped arguments or in fact sg/pl pronouns? An underspecified sort?

Ann: For a prodrop language I think you would still sort the variable but still not say very much about what that sort was. Create a hierarchy so it's compatible with what it needs to be. In a sense it's better for pro drop languages because you don't need the pron rel...

EMB: So the sorting helps with not needing the pron rel?

Ann: In the particular way we've set up the MRS, the pron rel is doing a job but in conversion to a formal logic, thinking about the nominal as sorting the thing is interesting. You can't really say you've got that elaborate a hierarchy.

EMB: What about Wakashan etc where the morphosyntax of the languages seems really unenchanted by the individual/event distinction?

Ann: Can sort anything where you have a unary predicate. Where it would get complicated is if you had a situation where you weren't really sure if the thing was nominal and verbal and it was more than one place. But can always pretend that two-place predicates are one place with a separate relation between them so maybe it doesn't really matter. If you go down this path, I think you are committed to a distinction.

EMB: I'm partial to having that distinction, so I like hearing that :)

Ann: Are you working on any languages with number on the verb (other than agreement)? Two kinds: counting events v. counting something else but I'm not sure what.

EMB: No, but I think it's about counting events v. events that are distributed across different individuals.

Dan: Like *the children sneezed* where there had to be multiple sneezes?

Ann: Can look up the Corbett examples: sending multiple packages to different places - p246 Hausa - "I send them" vs "I send-PL them" first can always be used  - second form cannot be used for the simple case "I sent them at the same time to the same place."   

EMB: ASL might be interesting here: e.g. giving to one person/whole group vs. giving to everyone in the group.

Ann: Changing topic to *The number who were annoyed was surprising* v. *A number of people were annoyed* (Ping's comment in chat). Which is the head of NP, don't know what the ERG does at the moment.

Dan: Two lex entries for number. One projects its own semantic number in its agreement, the other takes the info from the of PP. Could view as a lex rule, but it's a bit more vexed than that, so I have pairs of entries.

Ann: I think one would do something similar for German *drei Glas Wein* examples. It's really just a measure term. If you want to say there are three glasses of wine on the table have to say *Gläser*. There are examples in English where the measury noun isn't behaving like a noun at all.

Guy: *Three head of cattle* (**Three heads of cattles*)

Ann: You do say it that way.

Olga: *Three million dollars*

Guy: In the German case it also varies in different morphological paradigms. *Drei Flaschen Wein* -- the measure noun if feminine uses the plural morphology.

Ann: That's the generalization I've seen, but it isn't quite a fit with some German speakers, of course.

Dan: English *This rope is three meters long* and *The rope three meters long was more expensive* v. *A three meter long rope*. When the adjective is attributive, the measure noun must be sg; if it's predicative it has to be marked as plural. Looks like pure morphosyntax; no interesting difference in the semantics.

Ann: *Three million dollars*. Can say *a million* or *many millions of dollars*, but English normally doesn't pluralize number terms.

Guy: Hungarian uses singular nouns if there's a number.

Olga: I think it's because it's the numeral. In Russian the word million will be in a case: three of million and that's why it's not plural.

Dan: But then in English you get a contrast between: *two million dollars* v. *millions of dollars*. Apparently has also changed over time. 18th 19th century English: *Three millions of dollars*. Presence of *of* in current English is also important: *The millions of dollars spent*/**The millions dollars spent*.

Ann: I'm inclined to say these are cases where the plural marker happens not to be there, rather than genuine mismatches.

EMB: Yes: need to keep track of difference between singular and underspecified (cf. first member of NN compound as underspecified). Also difference between mass, underspecified, singular and general. Sometimes the morphology in the rest of the sentence helps. Might be good to look at Italian where the singular is arguably not unmarked morphologically. Or to cases where there's an overt plural and a mismatch.

Ann: Arguments about whether singular is semantically unmarked. But *no dogs*: can set things up so that the plural is general semantically  (Ojeda 1993). Then *the cats*, *my cats* have to force it to be genuinely plural. That's the sort of approach that you might do on the basis that it would not give the wrong answer, but you've got to force the case where the determiner is unmarked for number to get a sensible answer out. But plural with "no" feels like an agreement fact, not conveying semantics. So having a default plurality that gets over-written by the zero or other cases where you force the number.

Olga (in chat): For Russian, it will be million:SG-GEN with two, three four, but then million:PL-GEN with five through ten.

Last update: 2021-07-20 by anncopestake [[edit](https://github.com/delph-in/docs/wiki/Virtual2021PluralSemantics/_edit)]{% endraw %}