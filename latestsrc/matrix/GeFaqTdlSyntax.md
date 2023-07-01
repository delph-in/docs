{% raw %}# Grammar Engineering Frequently Asked Questions

## What do the punctuation marks mean in the tdl files? (A very basic guide to tdl syntax.)

tdl (Type Description Language), like any computer language, has a
particular syntax that must be followed. If you deviate from the
accepted syntax, you'll either get an error as the LKB tries to load
your grammar, or the LKB will interpret what you wrote differently from
how you intended.

A fuller, more formal description of TDL syntax can be found
here.

Typical type definitions looks like this:

    type-name := supertype1 & supertype2 &
      [ FEATURE1 value1,
        FEATURE2 [ FEATURE3 value2 ]].
    
    foo := bar &
      [ BAZ #coref & quux,
        ZXC #coref ].
    
    another-type := some-type &
      [ ZXC spqr &
            [ WOMBAT foo ]].

Some things to note:

- There can't be any spaces in the type name.
- The first thing after the type name is := (or :+, see below).
- After := comes at least one parent type (supertype), followed by an
& sign. There may be as many parent types as you like, each followed
by their own & sign.
- Next comes the constraints between square brackets (\[ and \]).
- The square brackets must be "balanced" (as many right brackets as
left ones).
- Each constraint consists of a feature and its value.
- By convention, feature names are written in ALL CAPS. Types are
written in lowercase.
- Feature structures can be nested within each other. For example, the
value of FEATURE2 in the example above is the feature structure
\[ FEATURE3 value2 \].
- If there are multiple feature-value pairs in the same feature
structure, all but the last are followed by a comma (,).
- The end of a type definition is signalled by a period (.).
- The pound sign (\#) is used to indicate that the values of two
features (which could be at different levels of embedding in the
feature structure) must be the same. \# is followed by some
identifier (coref in the example) that must be the same in both
places. The same type definition can have three or more features
that all have the same value, too, or two different sets of features
with identified values. In the latter case, you'll need to make up
different strings after the \#. You can reuse those strings in other
type definitions without trouble, however.
- Sometimes you want to provide multiple kinds of information about
the value of a feature (what type it is, what it's identified with,
and some specific feature-value constraints on it). In this case
again, use & to separate the different kinds of information.

In addition to the basic syntax above, there are some further
variations:

- If the type definition consists only of a declaration of parent
types, the final & is replaced with a period (.):
  
  -      type-name := supertype1 & supertype2 & supertype3.
- The comment character is ';'. That is, the LKB will ignore any line
starting with a semicolon. At present (March 2020), the LKB does not
support comments in the middle of a type definition, only before or
after. Some other implementations, such as [ACE](https://delph-in.github.io/docs/tools/AceTop) and
[LkbFos](https://delph-in.github.io/docs/tools/LkbFos), allow comments nearly anywhere.
- If the feature you want to talk about is buried deep inside several
nested feature structures, you can use the dotted (.) path notation
instead of lots of square brackets. In other words, the following
are equivalent:
  
  -      type := parent &
               [ FOO [ BAR [ BAZ [ QUUX quux ]]]].
        
             type := parent & 
               [ FOO.BAR.BAZ.QUUX quux ].
- While you can repeat the same path (or partially similar paths) for
different features, it's generally better style not to. That is, the
second of these two is preferred:
  -      type := parent &
               [ FOO.BAR.BAZ.QUUX quux,
                 FOO.BAR.BAZ.ZPC zpc ].
        
             type := parent & 
               [ FOO.BAR.BAZ [ QUUX quux,
                               ZPC zpc ]].
- Strings are indicated by double quotes ("). Strings show up as the
value of certain features (notably, the elements on the
difference-list which is the value of STEM and the value of PRED
inside a relation).
  
  -      chocolate := lex-type &
               [ STEM <! "chocolate" !>, 
                 SYNSEM.LKEYS.KEYREL.PRED "_chocolate_n_rel" ].
- [Documentation strings](/TdlRfc%3F#Type_documentation) are marked
with three double quotes (""") conventionally occur immediately
after the list of parent types (including the final &, i.e., just
before the AVM, if present, or the final .) in a type definition or
addendum, or after the :+ in a type addendum, if there are no parent
types.
  
  -      type := parent1 & parent2 &
             """
             Docstring for type.
             """
               [ FOO.BAR.BAZ.QUUX quux ].
        
             typo := parent-type &
             """I think there's something wrong with this type""".
- [Type addendum statements](https://delph-in.github.io/docs/matrix/GeFaqTypeAddendum) allow you to add
information to types that are already defined in the Matrix. They
are written with :+ instead of :=, and don't require the presence of
any supertypes. If there are no supertypes in the addendum, a \[ or
a """ (for a documentation string) immediately follows the :+.
  
  -      old-type :+ another-supertype &
               [ FEATURE7 quux ].
        
             old-type :+ [ FEATURE quux ].
        
             old-type :+ """I had to add some documentation here""".
- The LKB provides abbreviations for lists and [difference
lists](https://delph-in.github.io/docs/matrix/GeFaqDiffList):
  
  - An empty list: \[ FEATURE &lt; &gt; \]
  - A list with exactly one element: \[ FEATURE &lt; foo &gt; \]
  - A list with exactly two elements:
\[ FEATURE &lt; foo, bar &gt; \]
  - A list with at least one element:
\[ FEATURE &lt; foo, ... &gt; \]
  - An empty difference list : \[ FEATURE &lt;!  !&gt; \]
  - A difference list with exactly one element:
\[ FEATURE &lt;! foo !&gt; \]
  - A dot indicates the rest of the list, rather than the next
element:
\[ FEATURE &lt; first-element, second-element . rest-of-list &gt; \]
  - etc.

### Related topics

- [How do I use tab to help me figure out where my syntax error
is?](https://delph-in.github.io/docs/matrix/GeFaqTabIndentation)
- [I'm trying to add a new feature, and the LKB doesn't like it. What
should I do?](https://delph-in.github.io/docs/matrix/GeFaqNewFeature)
- [The LKB says I have an error at position number 873. How do I
figure out where that is in my file?](https://delph-in.github.io/docs/matrix/GeFaqGotoChar)
- [What's a difference list, and why do we use them?](https://delph-in.github.io/docs/matrix/GeFaqDiffList)
- [What is a type addendum statement, and when should I use
one?](https://delph-in.github.io/docs/matrix/GeFaqTypeAddendum)

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqTdlSyntax/_edit)]{% endraw %}