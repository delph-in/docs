{% raw %}\[See [SingaporeSchedule](https://delph-in.github.io/docs/summits/SingaporeSchedule) page for link to slides.\]

Mike: \[Introduces topic of surprising MRSs---cases where his code
failed because the MRSs it encountered were unexpected.\]

Mike: Issue \#1 --- assume ARG0s are unique, but Jacy analysis of
*赤くなる akaku naru* shares ARG0 between two verb rels. I don't think
it's sensible, but Joshua Crowgey apparently does.

Issue \#2 --- assume ARG0s are always x or e, but i variable shows up as
ARG0, Jacy and ERG (*Kim unheard it.*)

Guy: Just a notational issue, or is that something about i that I don't
understand?

Mike/Dan: i is the supertype of events or instances.

Dan: Not part of the original MRS introduction; not surprising you were
surprised.

Mike: In several places, I've heard that ARG0s are es or xs...

Mike: Issue \#3 --- assume all EPs have ARG0s, but found discourse well
without one.

Mike: Issue \#4 --- coindexed dropped arguments (i variables instead of
zero pronouns in Jacy). When you go to DMRS those are not represented as
links because there's no node (EP) for them, so coindexation will be
lost. ICONS might be useful in solving this problem.

Mike: Other issues --- LTOP completely unattached to rest of the
structure, variable properties on ICONS (no corresponding rel).

Mike: Question: Is it possible to have more than one constant argument
on an EP?

Mike: Definition of headed paths in MRS (see slides). Can we assert that
in a valid MRS there's one path like this that covers all EPs in the
MRS?

Mike: Missing slide --- wanted to count them in Redwoods.

Dan: Would be fun to do that count over both 1212 and 1214 to see if
there are fewer invalid structures. (If not, don't tell me.)

Emily: Let's go issue by issue.

Mike: Issue \#1: ARG0s should be unique (except quantifiers).

Guy: That's required for DMRS conversion, right?

Woodley: Can you think of any reason to require unique ARG0s.

Mike: pyDelphin would break...

Francis: I think there used to be more principled reasons for
introducing ARG0s. We used to do intersective modification by sharing
ARG0s. (This is a hold over).

Dan: As we got more familiar with the formalism and through the RMRS
detour ... we have come around to the DMRS view that it is very useful
to have every predication identifiable in some reliable way, and the
ARG0 is the one that is most reliable (except for with quantifiers). In
DMRS version ARG0 is relabeled as BV.

Guy: For this particular example, would there be an ambiguity if you say
"It becomes red again" --- does that again have two different ways it

Francis: *また赤くなった mata akaku natta* ?

Takayuki: Not sure.

Emily: Aren't those really close in the real world?

Francis: Do you get that in English?

Guy: Was blue, became red, became blue, became red, became blue, became
red: 2nd time it becomes red, it's red again. The third time, it's
become red again.

Hans: That's an old discussed example of Dowty's --- *entered the
atmosphere again* could be either that it was in, left and came back, or
that it has entered it for the second time.

Sanghoun: In the Chinese grammar, we have similar issue in A-not-A
questions.

Dan: A little puzzling to imagine what the semantics would be for *it
became red and blue* --- would have to share coordinated event and
becoming event. What about the negation of that? *It became red but not
blue.* Even without coordination: *It didn't become blue.*/*It became
not blue.*

Woodley: Negation is about whether the predicate is true of those
variables.

Dan: I agree that there's nothing formally to stop you, but it doesn't
make sense here.

Woodley: But what about the general case? Should we say that ARG0s
should always be unique?

Dan: Don't know yet. But this example can't support Joshua's crazy idea
which we'll just call the wrong one...

Chris: Joshua's contention is that all verbs can do this and it's still
just one event.

Mike: Relationship to neo-Davidsonian use of event variables can confuse
people. We're using this as a more technical device.

Dan: Not just technical --- we use it for intersective modification.
Intersective modifiers can't take the label, and grabbing the predicate
value is silly. For modifiers of modifiers we need a thing to grab ahold
of. Accounts for lots of ranges of modification types, including complex
nesting of modifiers.

Emily: Still doesn't answer the general question...

Dan: But it does point to the question you want to ask yourself. In
Joshua's case predicts that you would never find something that modifies
one and not the other. Joshua might say that true for Lushootseed---but
then why should it be different for English causative/inchoative.

Woodley: Causative might not be Joshua's strongest case.

Sanghoun: The sentence was *I go after the boy.*/*I chase the boy.*

Guy: How does that work in Lushootseed?

Emily: \[Tries to describe examples.\]

Guy: What about *make someone run quickly* --- would that be a way to
test?

Dan: Seems like Parsons-style representation in RMRS. chase(e),
arg1(e,x), arg2(e,y). If Joshua wants to think of what he's doing with
these transitive markers as doing that, we know how to talk about that.
We've even been tempted to suggest pushing that into the ERG and the
Matrix, because having that decomposition easier to talk about later is
appealing because you can underspecify argument relations. Maybe we
oughta send Joshua off into Parsons-land for a while and see if he goes
away and just doesn't come back.

Hans: *He dreamt himself into an office*, but can't do *He went himself
into an office* isn't good because go already has an ARG2.

Mike: Issue \#2?

Dan: Yes, that's okay. ARG0s can be i.

Mike: Issue \#3 -- should all things have an ARG0?

Francis: neg\_rel used to not, but now it does. For consistency it seems
easier to say they all have

Mike: Issue \#4 -- coindexed is.

Francis: Sad that current DMRS representation seems to lose these.

Dan: Could say as an ICONS constraint?

Francis: Still wouldn't be in the DMRS...

Ann: DMRS will have ICONS, it's intended to.

Dan: If there were an ICONS that said that those two underspecified
ARG1s were identified, even though they're not ARG0s of any predication,
would the DMRS preserve that info?

Francis: \[Wrong parse for this example, but we want it for
'shine-twinkle'.

Ann: Does this scope?

Dan: I believe it does as long as those are is.

Ann: There is an MRS constraint which is explicit which is that
everything's got to scope. The answer is to do with ICONS.

Emily: But that still doesn't answer Dan's question ---there's no EP,
would it survive?

Ann: Would have to try.

Francis: \[It does scope.\]

Mike: In order to RT and survive, it also needs the role and the target.

Ann: The question is whether there's some way of making it work,
depending on what you do with ICONS.

Woodley: With respect to the ICONS idea---if the subject were not
dropped would you still want that?

Emily: No.

Woodley: And during composition, do you know that before you know if the
subject is dropped?

Guy: What happened to pron\_rel?

Francis: We used to put it in, and when we took it out, we got a 30%
speed up in processing ... is the main reason.

Ann/Francis: Could put it in in post-processing --- turn all 'i's into
zero pronouns.

Francis: We also have to put a quantifier in, which means a fairy dies.

Dan: But you don't have to. We've debated this endlessly... I have a
version of the grammar that takes them out, and have ensured that the
grammar (for the most part) shares the label of the pronoun with the
label of the thing that takes it as an argument. Have to be rather more
careful with the head-complement, head-subject rules. Increases burden
on the grammar writer to do something which is much more compatible with
the semantic algebra.

Last update: 2015-08-21 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/SingaporeMrsWellformedness/_edit)]{% endraw %}