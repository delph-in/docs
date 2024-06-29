{% raw %}# LKB Wishlist

This page is for listing wishlist items in the LKB. Just because they
are here doesn't, of course, mean that anyone will implement them for
you. In some cases, there has been relevant discussion on the developers
mailing list (e.g., non-ASCII encodings).

- **Head-daughter shown in trees**: It would be nice if the graphical
display marked which daughter was the head daughter in headed
constructions, either by a thicker branch to it or maybe an arrow.
An alternative would be to label the arcs (H for head, S for
subject, etc) but that would probably be overdoing things).
- **Some treatment of capitali(z\|s)ation**
- **Normalization of numbers** e.g. PLUS (CARG 20 CARG 3) =&gt; CARG
23
- **Robust generation of numbers** CARG 23 =&gt; PLUS (CARG 20 CARG 3)
- **Redundancy rule check**: define a conventional syntax in the
comments to suggest that a type is the combination of another type
and a rule (or rules) and create a batch check to see if they are
really the same, e.g.
  
      generic_adj_te_infl-lex := generic-i-adj-lex &
      "combine: i-adj-stem-lex + adj-te-t-lexeme-c-stem-infl-rule; I am the generic type for te inflected adjectives, e.g. 美しく"
      [RMORPH-BIND-TYPE t-morph,
       SYNSEM.LOCAL.CAT.HEAD i-adj_head & [MARK < [LOCAL.CAT.HEAD.H-TENSE te] > ],
       J-NEEDS-AFFIX +].
- **Linear precedence constraints**: see
[LkbLpconstraints](https://delph-in.github.io/docs/tools/LkbLpconstraints) for a discussion document.
- **Filter in the generator that blocks application of lex rules**
which add constraints to e.g., PNG which are incompatible with the
input. (This should keep edges corresponding to verbs inflection for
the "wrong" agreement from overpopulating the gen-chart.) This
turned out to be particularly problematic in Zulu, which inflects
for both objects and subjects and makes a \~18-way distinction in
each case.
- **treebanking support**: provide ACE-like tsdb output? add support
for connection to \[incr() tsdb\] and FFTB?
- **alternative web interface**: would it be possible to have an
alternative UI to the McCLIM? A web interface like what Babel2 (FCG
implementation, one demo at
<https://www.fcg-net.org/demos/planning/>) does would be nice and
may solve some problems with the fonts?!
- **shared configuration files**: would it be possible for the LKB and
ACE/PET to share some or all of their configuration files? For
example, if the LKB could read the english.tdl file, ...

### In Progress / Done

- **Control over font size in show-gen-output windows**: in
[LkbFos](https://delph-in.github.io/docs/tools/LkbFos), these and other list-like windows (such as the
'Apply all lex rules' window) obey the \*parse-tree-font-size\* user
parameter.
- **Comments in TDL**: although the TdlRfc specification
does not provide a way to comment out a section of TDL by wrapping
it in a definition, [LkbFos](https://delph-in.github.io/docs/tools/LkbFos) fully implements the
BlockComment facility. There is partial support for block comments
in the 'classic' LKB, but they are only allowed between definitions.
- **Support for multibyte encodings in the error messages**: for TDL
reading errors, the classic version of the LKB (unhelpfully) reports
byte positions --- [LkbFos](https://delph-in.github.io/docs/tools/LkbFos) reports line numbers and
character positions.
- **Consistent treatment of infl-pos**: the user-defined function
find-infl-pos controls location(s) of lexical rule application for
multiwords. It seems to work as expected in parsing, but not in
manual lexical rule application or generation. This issue is
currently being fixed in [LkbFos](https://delph-in.github.io/docs/tools/LkbFos).
- **Proper support in the display/entry for non-ASCII encodings**
  
  - entering text in the parse window
  - sentence display in the window-name
  - correct display in trees/feature structures
  - currently some support in Linux with Trollet, doesn't work in
windows for some (most?) encodings
  
  These points are (mostly) implemented in [LkbFos](https://delph-in.github.io/docs/tools/LkbFos), although
some work is required to pre-select the Unicode fonts to be used.
- **Filter in parse chart windows to suppress lexical items with
unfulfilled morphological rules** otherwise the display is fairly
unusable for grammars with a substantial number of orthographemic
rules. In [LkbFos](https://delph-in.github.io/docs/tools/LkbFos), set the parameter
\*show-incomplete-lex-rule-chains\* to NIL to stop such
lexical items being displayed.

Last update: 2024-06-28 by John Carroll [[edit](https://github.com/delph-in/docs/wiki/LkbWishlist/_edit)]{% endraw %}