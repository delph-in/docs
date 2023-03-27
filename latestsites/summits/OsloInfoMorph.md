{% raw %}Discussion:

DI: look at langs with radically dicont morph (athabaskan)

BC: Navajo has been looked at (Koenig?)

GE: Panini: beyond current delphin machinery?

BC: sufficient: if in your domain you say I have constraints A and B
that apply only \[???\] you can make it explicit by applying closure
\[???\] -- it is a finite domain so it should be possible. e.g.
constraint A can apply only to NOM.SG. ultimate default: would
accumulate all the negative constriants

DI: not y, not z etc

GE: one big type hierarchy

BC: Malouf proposed using topological sort, impose order in which rules
apply. But how that would work for generation? problem: if you want to
associate XXX with parsing, specific morphosyntactic property except
ones that have more specific shape

GE: DELPHIN grammars should be bidirectional

BC: are type hierarchies bit vector-encoded?

SO: yes

GE: \[???\]

BC: would it be hard to compute the complement in this case

GE: you can create tdl automatically

BC: where you use sets is the more challenging part.

DF: sets are hard in our universe

BC lists will be ok but I need to be able to say: "I know there is X at
the end of the list but there is Y that comes before that"

WP: you want sets of atomic objects?

BC: of non-recursive feature structures. equivalent to atoms?

WP: if it is small inventory of atoms then it is similar to a large type
hierarchy

EB: size of the set would be bound by number of atoms in the inventory

BC dont want to do closure operation by hand.

WP satement in tdl: i have this list of atoms and \[???\]

BC: typically you have finite domains. you can have a lot of complexity
e.g. 30K of \[???\] in Koenig's work. With reasonable preprocessing we
can get close to \[???\]. In parsing, can split rules but that has to
factor in what you done in the inheritance because ... that's a hunch.

EB: what is the problem with processing this on the textual level?

BC spot which rule specifies something replace by two rules; a rule can
introduce two exponents. Problem with doing it textually: constraints
can come from two diff dimensions,

EB: constraints on what is being expressed? no harm in having both rules
say "case nom". we are doing it in the customization system.

BC: you dont have all the info on the textual level about the leaves

EB: why does that matter? we can spit out a modified grammar

BC: once you have done the \[expansion?\] e.g. run the korean grammar
with YADU dump out the tdl and then \[???\] ... but this didn't happen
and Jong-Bok removed defaults from his grammar.

EB: Fokkens manipulates read-in in tdl in "spring cleaning". at the end
what we are manipulating are grammar entities

BC: when to do the check? when is something fully inflected

DI: keep the inflection of the \[???\] rule

BC: if I have no way of establishing of \[???\] to inflect this, I need
e.g. agreement information.

EB: we have the FLAG feature (Goodman & Bender), it's an unordered set
features of the same type just like other feature structures are. and
you can check the inflections are satisfied

BC: but we also have other sets

MG: one rule can satisfy any number of requirements

BC: accumulation or any fusion would quality for that. common property
of any inflectional systems, even in agglutinating langs.

Last update: 2017-08-08 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/OsloInfoMorph/_edit)]{% endraw %}