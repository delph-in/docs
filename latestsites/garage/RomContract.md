{% raw %}P+Det contracted forms are found throughout Romance to varying degrees,
and also in Modern Greek, German, ... All contributions are welcome.

## Simplest case

- The contracted forms are unambiguous (allows straightforward
string-based pre-processing into 2 forms for parsing)
- The un-contracted P+Det sequence is unambiguously ungrammatical
(allows straightfoward string-based post-processing for generation)
- no non-local, non-adjacency effects (e.g. interaction with
coordination, parentheticals)

These conditions are rarely satisfied, perhaps in Spanish?

### Spanish al/del

## French

Contractions in French involve the prepositional forms *à* and *de* in
combination with the forms of the definite article *le* and *les* (but
not *l'* and *la*):

|             |       |     |              |       |
|-------------|-------|-----|--------------|-------|
| *à* + *le*  | *au*  |     | *de* + *le*  | *du*  |
| *à* + *les* | *aux* |     | *de* + *les* | *des* |

The problem for a straightforward pre- and post-processing approach is
that identical sequences of a verbal marker *à* or *de* followed by the
pronominal clitic *le* or *les* **must not** contract:

- *J'ai besoin du conseiller* (= I need the adviser)
  
  vs *J'ai besoin de le conseiller* (= I need to advise him)
- *J'ai besoin du nôtre* (= I need ours)
  
  vs *J'ai besoin de Le Nôtre* (= I need Le Nôtre)

Contraction is also conditioned by the presence or absence of elision
(*le* vs *l'* ), a process which itself cannot be handled by simple
string matching:

- \[*à le huissier*\] &gt; *à l'hussier* / \**au huissier* (to the
bailiff)
- \[*à le huitième huissier*\] &gt; *au huitième huissier* / \**à
l'huitième huissier* (to the 8th bailiff)

Finally, there is some evidence that the contraction mechanism is part
of the grammar, in view of the following long-distance effects:

- de \[la mère et la fille\]
- \*de \[la mère et le fils\]
- \*du père et la mère
- du père et le fils

Generalization: *à* and *de* cannot combine with a coordinated NP if
**any** of the conjuncts begins with a contracting article *le* or
*les*.

\[current analysis in La Grenouille (contraction and elision analyzed as
"deep" grammatical phenomena)\]

## Portuguese

For Portuguese, we developed an approach that relies on tagging to
resolve ambiguity, scoring 99.44% accuracy.

All the details are reported this [working
paper](http://www.di.fc.ul.pt/tech-reports/03-4.pdf).

## Modern Greek

You can find a detailed description of our approach in the documentation
of the Modern Greek Resource Grammar at <http://www.delph-in.net/mgrg/>

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/RomContract/_edit)]{% endraw %}