{% raw %}This page is a repository for documenting known issues with the LKB such
that they can be investigated and corrected, should developers visit or
revisit the relevant areas of the code.

- In the following full type hierarchy:

<!-- -->


    a := *top*.
    b := *top*.
    d := a & b.
    c := b.
    e := a & c.
    f := a & c.

the LKB establishes a type hierarchy with redundant edges from a - f and
a - e:

![](http://www.computational-semantics.com/webshare/inv-3-hierarchy-lkb.png)

One expects a graph with 10 edges, rather than 12, since ‘a’ already
subsumes both ‘f’ and ‘e’ via ‘glbtype1’ and ‘glbtype2’. This bug is
present in the Allegro CL version of the LKB, but is fixed in the fully
open source version, LKB-FOS.

Last update: 2021-12-17 by John Carroll [[edit](https://github.com/delph-in/docs/wiki/LkbBugs/_edit)]{% endraw %}