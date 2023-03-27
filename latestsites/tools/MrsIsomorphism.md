{% raw %}## MRS Isomorphism

Isomorphism is one kind of equivalence test for MRSs. Two MRSs are
isomorphic if they have the same structure--that is, they have the same
kind and number of predicates, and the variables in the predicates map
to the same positions in other predicates. Variable names can differ.

### Example

The following two (contrived) MRSs are isomorphic:

    [ LTOP: u1 INDEX: u2
      RELS: < [ "rel1" LBL: u3 ARG0: u4 ]
              [ "rel2" ARG0: u5 ]
              [ "rel3" LBL: u6 ARG0: u7 ARG1: u4 ] >
      HCONS: < u4 qeq u5 > ]
    
    [ LTOP: u9 INDEX: u8
      RELS: < [ "rel1" LBL: u7 ARG0: u6 ]
              [ "rel2" ARG0: u5 ]
              [ "rel3" LBL: u4 ARG0: u3 ARG1: u6 ] >
      HCONS: < u6 qeq u5 > ]

The following two (also contrived, minimally different) MRSs are not
isomorphic. (See what the ARG0 in rel1 maps to).

    [ LTOP: u1 INDEX: u2
      RELS: < [ "rel1" LBL: u3 ARG0: u4 ]
              [ "rel2" ARG0: u5 ]
              [ "rel3" LBL: u6 ARG0: u7 ARG1: u4 ] >
      HCONS: < u4 qeq u5 > ]
    
    [ LTOP: u1 INDEX: u2
      RELS: < [ "rel1" LBL: u3 ARG0: u5 ]
              [ "rel2" ARG0: u5 ]
              [ "rel3" LBL: u6 ARG0: u7 ARG1: u4 ] >
      HCONS: < u4 qeq u5 > ]

### Implementing a check for isomorphism

Checking for isomorphism mainly involves checking that the variables
appear in the same arguments of the predicates and QEQs. One also should
check that the variable properties are the same.

One way to accomplish this task is through a recursive procedure: Given
two lists of unmapped variables (one from each MRS), assume a mapping
between two variables and then repeat on the remaining variables.
Variables that can be mapped are those that appear on the same position
in the same kind of predicate (e.g. ARG0 on a \_def\_q\_rel), and have
the same properties. If no remaining variables can be mapped and the
lists are not empty, backtrack and try other mappings until one is
found. If one is found, the MRSs are isomorphic.

### Optimizations

Because the recursive check for isomorphism can take some time, several
optimizations should be implemented. Some possible optimizations are
listed below:

- Simple check for equivalence of string/XML representation (if the
string or XML representations are equal, then they are the exact
same MRS (same structure and same variable names))
- Check the number of relations, HCONS, etc.
- Only map variables between the same type of relation (e.g. don't try
to map \_def\_q\_rel with dog\_n\_rel) and same type of argument
(e.g. ARG0s of dog\_n\_rel)
- \* Further, only map variables that appear in the same positions of
the same relations across the whole MRS (i.e. don't just look at one
relation, but all of them. In the first MRS example above, u4 has
the following pattern: ("rel1":ARG0,"rel3":ARG1) (you could also
include the HCONS))
- Order the sets of unmapped variables (where a set is all variables
in a predicate) by the length of the set, fewest first. Because
there are only 3 mappings for predicates with 2 arguments, 6
mappings when 3 arguments, 24 for 4, etc.

### Variable Properties and SEM-I

One may choose to not compare variable properties as they can differ
between MRS that have gone through SEM-I mappings and those that
haven't. This may occur when comparing MRS from parsed and generated
sentences. This would mean that sentences varying in some way not
encoded in predicates and arguments would be considered isomorphic.
Examples (depending on the grammar) may be "Kim runs the process."
(present, active) and "Kim ran the process" (past, active) and "The
process was run by Kim." (past, passive)

Last update: 2011-05-25 by MichaelGoodman [[edit](https://github.com/delph-in/docs/wiki/MrsIsomorphism/_edit)]{% endraw %}