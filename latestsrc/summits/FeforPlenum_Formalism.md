{% raw %}## Discussion Formalism Extensions: Discontinuous Parsing? Can it be Done Efficiently? Relational Constraints (Basic List and Maybe Set Functionality, Say)? Others?

Moderators: Berthold Crysmann and Stephan Oepen Scribe: Petter Haugereid

### Stephan's list of possible formalism extensions:

[Introductory Slides](http://www.delph-in.net/2006/formalism.pdf)

Default unification

- in LKB

Relational constraints

- difference lists
- list operations member, remove, shuffle
- other data types, sets, general relations

Lineariazaton or Discontinuous Parsing

Type resolution (Feature co-occurrence)

Inter-Constituent Dependencies

### Chart dependencies (Berthold)

The mechanisms for checking chart dependencies (lexical entry that
requires a particle + particle) function differently in LKB and PET. PET
and LKB should be brought closer toghether. Chart Dependencies are
checked in LKB before lexical rules apply. Maybe the chart dependencies
should be checked after the lexical rules apply. It was suggested that a
subcommittee should have a look at this. (Stephan, Berthold, Ann and
Ben)

### List manipulations

It was suggested by Emily to have an easy form of manipulating difflist
information. According to Ann, not knowing where the end of the list is
tricky. According to Berthold, grammar writers already simulate list
manipulatins in the grammars.

### Discontinuous parsing

Discontiuous parsing was brought up by Emily (for example parsing of
noun and adjective with same case marking, but situated in different
positions in the sentence. According to Stephan, this needs LP
constraints. Linear constraints once existed in the generator, Ann
doesn't have time to build into the parser, but can help someone to do
that. Mike Daniels has worked on something similar -Berthold.

### Type resolution

Jesse wanted that 4 years ago, but has designed his grammar not to
assert that. The ERG has 16 pairs of rules because of lack of type
resolution. The processing would go faster if this doubling of rules
could be removed. Ann is not optimistic. There are 2 versions of tfs
formalisms: One where everything is resolvable to leaf types (the HPSG
formalism). This version is endlessly slow. The other other version is
the LKB (Carpenter) typing which is a moderate extension of feature
structures.

What we want is a hybrid which in some cases gives full resolution. It
requires that one is careful about recursion.

Can this be achieved by enforcing gravity? Ann does not see how it could
be implemented. Enforced gravity does not work well now. Multiple
inheritance with glb types prevent one from being forced down to the
desired type that carries the features.

c := a & b &

- \[ F1 t1,
  - F2 t2 \].

d := a & b &

- \[ F1 t3,
  - F2 t4 \].

By saying that something is of type a' and b' does not mean that one is
forced down to either c' or d' since the system creates a necessary glb
type that inherits from a' and b' and has c' and d' as subtypes.

### Macros

It was discussed whether macros should be (re?)introduced. There was
agreement that types would do. According to Berthold, macros are
unmaintainable. Ann suggested LexDB as an alternative solution to macros
for lexical definitions.

### Defaults

Francis mentioned that there will work with defaults in the japanese
grammar.

Last update: 2013-10-14 by GlennSlayden [[edit](https://github.com/delph-in/docs/wiki/FeforPlenum_Formalism/_edit)]{% endraw %}