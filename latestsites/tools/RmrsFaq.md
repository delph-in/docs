{% raw %}Here are some (not necessarily) frequently asked questions and answers
about [(R)MRS](https://delph-in.github.io/docs/tools/RmrsTop).

Q Are MRS predicates fixed arity?

A Yes. This is required to make the models logically well-formed.

Q Are MRSs feature structures?

A No. Any hierarchies of predicates are also not type hierarchies. The
suggested term is predicate hierarhcy, with the higher elements called
"subsumers" and lower elements "subsumed".

Q What are the elements in *hcons*: qeq, lheq, and outscopes.

A They are:

- **qeq** - equality modulo quantifiers. A qeq constraint always
relates a hole to a label. The intuition is that if a handle
argument h is qeq to some label l, either that argument must be
directly filled by l (i.e., h=l), or else one or more quantifiers
‘float in’ between h and l.
  
  **lheq** - label-handle equality. The label and handle are
constrained to be equated. Explicit equalities are used in various
papers - the option of working with them rather than making the
variables the same is useful theoretically and sometimes
practically.
  
  **outscopes** - directly or indirectly takes scope over. This is the
relationship used by most work on underspecification. mentioned as
an option in the MRS paper. Two possible versions: a) hole outscopes
label - like qeq with no restriction to quantifiers b) label1
outscopes label2 - label1 must dominate label2 in all scope-resolved
solutions. Not currently supported by the LKB scoping code in either
case.

Q what kid of variables are there?

A:

    u := top.
    i := u.
    p := u.
    h := p.
    
    e := i & 
    [ TENSE tense, MOOD mood, 
      PERF luk, PROG luk, SF sforce ].
    
    x := i & p & 
    [ PERS person, NUM number,
      GEND gender, 
      IND bool, DIV bool,
      PRONTYPE prontype ].
    
    ;;;
    ;;; to check for `arity' in MTRs, sometimes we need an `anti-'variable type
    ;;;
    a := u.

Last update: 2013-04-28 by GlennSlayden [[edit](https://github.com/delph-in/docs/wiki/RmrsFaq/_edit)]{% endraw %}