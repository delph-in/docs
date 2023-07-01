{% raw %}# Grammar Engineering Frequently Asked Questions

## What is a type addendum statement, and when should I use one?

Type addendum statements are a recent extension to tdl syntax. Type
addendum statements allow you add information to a previously defined
type. Prior to the development of the Matrix, there wasn't really a need
for this kind of functionality: if you wanted to add to a type, you
could just edit its defintion. However, we strongly discourage editing
the matrix files (particularly matrix.tdl) when building a grammar from
the Matrix.

You may find that you would like to add a feature to an existing type
(notably the values of HEAD), or add a constraint to an existing type.
To some extent, this can be done by adding subtypes, but this can become
awkward.

A type addendum statement looks like this:

    existing-type :+ new-supertype & 
    "documentation string"
       [ EXISTING-FEATURE more-specific-value,
         NEW-FEATURE some-value ].

Unlike type definitions, type addendum statements use :+ instead of :=.
Type addendum statements are only valid with existing types. There must
be at least one piece of information after the :+: a new supertype, a
documentation string (in quotes), or a constraint (in square brackets),
or any combination of those. Note that it's not valid to specify a
supertype in a type addendum which is already a supertype of the type in
question.

In general, if you would like to add information to a type already
declared in the Matrix, a type addendum statement is the way to go. For
types that are defined in language-specific files, it's probably best to
avoid type addenda.

## Related topics

- [What do the punctuation marks mean in the tdl files? (A very basic
guide to tdl syntax.)](https://delph-in.github.io/docs/matrix/GeFaqTdlSyntax)
- [I'm trying to add a new feature, but the LKB doesn't like it. What
should I do?](https://delph-in.github.io/docs/matrix/GeFaqTdlSyntax)

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqTypeAddendum/_edit)]{% endraw %}