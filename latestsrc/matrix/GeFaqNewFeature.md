{% raw %}# Grammar Engineering Frequently Asked Questions

## I'm trying to add a new feature, and the LKB doesn't like it. What should I do?

There are two rules about where you can declare new features:

1. Each feature can only be declared for one type. This means you can't
reuse feature names.
2. Features can only be declared for a type on the definition of a
type. This means that new features are always features of the
outermost feature structure in the type definition in which they are
declared.

* * *

### "No possible type ..."

If you're getting the error message "No possible type for features (...)
at path (...)" you have probably tried to introduce a feature other than
in the outermost feature structure. For example, if you wanted to add a
feature CASE appropriate only for nouns, the correct way to do it is on
the type **noun** (subtype of **head**):

    noun := head &
       [ CASE case ].

If instead, you tried to do it on **noun-lex**:

    noun-lex := basic-noun-lex & spr-only-lex-item &
       [ SYNSEM.LOCAL.CAT.HEAD noun &
                               [ CASE case ] ].

you would get this error message. (If you also have the correct
declaration on noun, the constraint shown here on **noun-lex** won't
cause an error, but it will be redundant.)

* * *

### "Feature ... introduced at multiple types (...)"

As stated above, features can only be declared for one type. If two
types need the same feature, they need to have a common supertype from
which to inherit it. You might hit this error if you happen to try to
reuse a feature name already in use in the matrix, or if you try to
declare a feature for two types at the same time (e.g., FORM on **verb**
and **prep**) instead of putting it on a supertype.

NB: You can of course mention features on multiple types, and often need
to in order to constrain their values appropriately. They just need to
be introduced on a supertype to all types that they are appropriate for.
This doesn't mean that e.g., **noun-lex** needs to inherit from noun in
order to constrain a value of CASE. In the example above, CASE remains a
feature of noun, which happens to be the value at the end of a path
inside **noun-lex**.

* * *

### Adding a feature to an existing type

If you want to add a feature to a type that's already declared in the
matrix, you need to write a [type addendum
statement](https://delph-in.github.io/docs/matrix/GeFaqTypeAddendum).

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqNewFeature/_edit)]{% endraw %}