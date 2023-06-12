{% raw %}# Summary of T5: Introduction to Emerson-Turing Types

This tutorial used the demo grammar from the 2021 summit: https://github.com/delph-in/docs/tree/main/summits/2021/turing-demo-grammar

## Intended Use Case

The value of a feature on the mother can be defined as some function of the features of the daughters, e.g. in the following simplified feature structure:

```
[ SYNSEM.NON-LOCAL.SLASH.APPEND < #1, #2 >,
  HEAD-DTR.SYNSEM.NON-LOCAL.SLASH #1,
  NON-HEAD-DTR.SYNSEM.NON-LOCAL.SLASH #2 ]
```

This mimics a relational constraint, without modifying the formalism.

Such constraints can be applied recursively, e.g. appending two lists and then reversing the result:

```
[ REVERSE [ APPEND < [ LIST < +, + > ], [ LIST < +, - > ] > ] ]
```

This would lead to `[ LIST < -, +, +, + > ]` (along with some extra structure under `REVERSE`).

## Definitions

A wrapper type introduces an additional layer of structure,
"wrapping" something you care about under a dedicated feature,
e.g. `[ LIST list ]` or `[ BOOL bool ]`.

A computation type can be unified with something (the "input") to perform a computation,
with the "output" under the `RESULT` feature.

A wrapper type can introduce a second feature which invokes a computation type, e.g. for list appends:

```
append-list := list-wrapper &
  [ LIST #list,
    APPEND list-of-list-wrappers-with-append & [ RESULT #list ] ].
```

A wrapper type that invokes a computation type should have a unique feature name, to allow the intended use case above.

Computation types can be fiddly to write,
but once they are written, you should only ever have to deal with wrapper types.
In the intended use case above, they can invoked without having to think too hard about the underlying machinery.

## Possible pitfalls

Computation types are Turing-complete, so any kind of relational constraint can be mimicked.
However, they are not "true" relational constraints,
and if they are used in a different way from the intended use case above, a few points deserve some care.

### 1. Computation types are destructive

Computation types unify with the input, which means that the input is permanently changed.
This means that it is not possible to apply two different computations to the same input.
(For example, if lists A and B are appended to give list C, and at the same time lists A and D are appended to give list E,
this would identify lists B and D, and identify lists C and E.)

This is a particular concern with analyses where a value is passed up the tree
(e.g. the SLASH list in lexical threading).
Any computation applied to that value at any point in the tree is visible at every other point.
Only one computation can be applied, across the whole tree.

In contrast, applying multiple computations sequentially is not a problem
(the output of one computation can be the input to a different computation).
In the use case above, there is no problem,
because the output is always on the mother and the input is always on the daughters.

(If it is desirable to use a value as input to multiple computations,
a workaround is to use a computation type that duplicates the input.
For details, see the `with-double-copy` type in `lambda.tdl` in the demo grammar.
For example, this could be used to allow one copy to be passed up the tree,
whie the other copy can be used as input to a computation.)

### 2. Wrapper types include computation history

A wrapper type includes not only the wrapped type, but also the computation type.
Identifying two wrapper types says that,
not only are the wrapped types the same,
but they were computed in the same way.

For example, an append list appending two empty lists and an append list appending three empty lists are not unifiable with each other.
Their LIST values are unifiable (they are both empty lists), but the APPEND values are not unifiable.

This is a particular concern if introducing a re-entrancy with a large chunk of structure containing a wrapper type
(such as in some analyses of coordination).
A re-entrancy propagates to all subparts of the feature structure,
which would include both parts of the wrapper type,
i.e. both the wrapped type, where the re-entrancy is presumably desirable (e.g. under LIST),
and also the computation type, where the re-entrancy may not be intended (e.g. under APPEND).

To avoid this, re-entrancies should only target the wrapped type (e.g. SLASH.LIST, avoiding SLASH.APPEND).

(If it is desirable to avoid exposing the computation history,
one workaround is to put the computation very high in the structure.
This is implemented for the case of nondeterministic computation (see below).
The drawback of doing this is that it becomes more awkward to trigger multiple different computations at the same time.)

(A potentially dangerous workaround is to put the wrapper's computation feature on the "deleted daughters" list,
so that the feature is discarded after unification.
This could speed up parsing (more about efficiency below), but it changes what unifications are possible.
This a particular concern for analyses like lexical threading, where computation is delayed until later in parsing.)

### 3. Computation types are unidirectional

(Thank you to the discussion participants for bringing this point to light!)

A computation type makes a clear distinction between input and output.
Constraining the input induces constraints on the output.
However, constraining the output does not immediately constrain the input.
For example, consider:

```
[ X [ BOOL +,
      AND < #1, #2 > ],
  Y #1,
  Z #2 ].
```

If the output of logical-and is `+`, then we might want to conclude that both input bools should also be `+`.
However, in the above feature structure, both Y and Z will take the underspecified value `bool`.
There is a still a "weak" constraint,
because unifying either Y or Z with `-` would lead to unification failure.
While `+` is the only more specific value that Y or Z could take,
this cannot be read off the feature structure.

If the intention is to block certain inputs, this is good enough.
However, if the intention is to force implications in both directions, this is not possible
(bidirectional computation types would require modifying the formalism to allow cycles).

(Technically, following point 1 above,
the values of Y and Z will be not be just `bool`,
but actually `bool-with-bool-pair-1st` and `bool-with-bool-pair-2nd`.
See demo grammar for details.)

(Aside, for those familiar with other flavours of HPSG:
in the Delph-in joint reference formalism, there is no "gravity",
i.e. no distinction is made between feature structures and so-called "feature descriptions",
and there is nothing formally special about leaf types.
Since the formalism is Turing-complete,
it is in general undecideable what feature structures are compatible with a given feature description.)

## Backwards compatibility

The level of separation introduced by a wrapper type is crucial.
Replacing diff lists with append lists is straightforward, because both use the LIST feature.
However, replacing normal lists with append lists (e.g. for COMPS) would require more extensive changes to the grammar.

(Alternatively, if refactoring a grammar to introduce the extra feature would be too painful,
a bespoke pseudo-wrapper type could be written at any level higher than where the computation needs to take place.
For example, allowing the COMPS list to be defined as the output of an append operation
could be done by defining a type like `valence-append-comps`,
which introduces a feature APPEND-COMPS
and puts the resulting list in COMPS.
The operation could also be placed at the very top of the structure,
similarly to the nondeterministic computation types below.)

## Advanced: Nondeterministic computation

Computation types are Turing-complete, so in principle any kind of computation is possible.
However, if there should be not just one possible output value, but a set of possible values,
encoding this directly as a computation type requires a way to represent a set of feature structures *as a feature structure*.
This is not practical.

Thankfully, the formalism already includes something nondeterministic: the parse chart.
So, we can introduce a clear division of labour between computation and nondeterminism.
The point of nondeterministic computation types and rules
is to mimic nondeterministic relational constraints in a way that does not require redesigning the entire grammar.

With a nondeterministic computation type, there are branching points in the computation,
where some value has more than one compatible subtype.
Unary rules are used to force this value to each possible subtype (one rule per subtype).
The computation is encoded at the top level of the feature structure,
including a pointer to the value where the subtype needs to be forced.

The demo grammar includes an example using a nondeterministic pop operation on lists:

```
basic-head-any-comp-phrase := basic-head-comp-phrase &
  [ SYNSEM.LOCAL.CAT.VAL.COMPS #new-comps,
    HEAD-DTR.SYNSEM.LOCAL.CAT.VAL.COMPS #old-comps,
    NON-HEAD-DTR.SYNSEM #synsem,
    NONDETERMINISTIC [ POP-INPUT #old-comps,
                       POP-OUTPUT-LIST #new-comps,
                       POP-OUTPUT-ITEM #synsem ] ].
```

Allowing nondeterministic computation in a grammar introduces some additional overhead in terms of grammar writing,
because it's necessary to keep track of when the special nondeterministic unary rules should be used (or not used).
See `pop.tdl` in the demo grammar for details.

The unary rules also mean that derivation trees become a little larger.
Comparing `basic-head-any-comp-phrase` with `basic-head-1st-comp-phrase`, `basic-head-2nd-comp-phrase`, etc.,
there will be more steps in the derivation:
when discharging the first complement, there will be one extra unary rule;
when discharging the second complement, there will be two extra unary rules, etc.
The benefit of `basic-head-any-comp-phrase` is that it can generalise to any length of list (e.g. for Bouma-style COMPS lists).

## Debugging

Diff-lists can be annoying to debug, because a missing re-entrancy or an underspecified list can break the append,
causing the final result to go missing.
Unfortunately, append-lists don't fix this problem!

The intention here is to allow grammarians to cleanly specify relational constraints.
However, all inputs need to be sufficiently constrained, otherwise the output will be underspecified.

When using wrapper types, if the output is not what you expect,
check that the input re-entrancies are correct, and that the inputs are correctly constrained.

(Debugging the definition of a wrapper type should be much less common than debugging a use of a wrapper type.)

## Computational efficiency

Using computation types does incur some additional overhead in terms of computational cost.
For example, using append-lists produces larger feature structures than using diff-lists.
A particular danger is that there are many re-entrancies,
and the number of possible paths can grow exponentially
(e.g. see [this discussion](https://delphinqa.ling.washington.edu/t/slow-processing-with-append-lists/600)).

It was brought up during the discussion that the use of "deleted daughters" changes the overall computational cost.
Features that are included in "deleted daughters" are discarded during parsing,
but can then then be reconstructed at the end of parsing.
The RELS list is typically deleted (it doesn't constrain parsing),
so the use of append-lists here should only have a small impact.

However, SLASH lists play a syntactic role and so cannot be deleted.
With lexical threading, the APPEND feature also cannot be deleted
(since the append operation is delayed until complements are found).

If the computation feature is not deleted, then the whole computation history is maintained
(e.g. we can recursively follow the path APPEND.FIRST.APPEND.FIRST.APPEND... etc.).
This can create a large structure, which has the potential to make unification computationally expensive.
(I haven't run any experiments to quantify how large this effect is in an actual grammar.)

If computational performance turns out to be an issue when there are long computation histories,
it's possible to avoid maintaining longer history:

```
[ SYNSEM.NON-LOCAL.SLASH.APPEND < [ LIST #1 ], [ LIST #2 ] >,
  HEAD-DTR.SYNSEM.NON-LOCAL.SLASH.LIST #1,
  NON-HEAD-DTR.SYNSEM.NON-LOCAL.SLASH.LIST #2 ]
```

The above code is more verbose, requiring [ LIST #X ] boilerplate.
So we could rewrite the append-list type to expect a list of lists rather than a list of list wrappers, as shown below.
This would however make it impossible to apply wrapper types recursively within a single type definition
(as illustrated by the combination of `REVERSE` and `APPEND` in the intended use case section at the top of this page).

```
[ SYNSEM.NON-LOCAL.SLASH.APPEND-LISTS < #1, #2 >,
  HEAD-DTR.SYNSEM.NON-LOCAL.SLASH.LIST #1,
  NON-HEAD-DTR.SYNSEM.NON-LOCAL.SLASH.LIST #2 ]
```
```
direct-append-list := list-wrapper &
  [ LIST #list,
    APPEND-LISTS list-of-lists-with-append & [ RESULT #list ] ].
list-of-lists-with-append := list & with-computation &
  [ RESULT list ].
cons-of-lists-with-append := cons & list-of-lists-with-append &
  [ FIRST list-with-diff-list & [ RESULT [ LIST #start,
                                           LAST #middle ] ],
    REST list-of-lists-with-append & [ RESULT #middle ],
    RESULT #start ].
null-of-lists-with-append := null & list-of-lists-with-append &
  [ RESULT null ].
```

Last update: 2022-11-10 by Guy Emerson [[edit](https://github.com/delph-in/docs/wiki/Fairhaven2022-Emerson-Turing-types/_edit)]{% endraw %}