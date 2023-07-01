{% raw %}Generator input for *He bit his tongue* should be able to specify enough
to not get *He bit her tongue*

X bite Y's tongue, ICONS &lt; X =s Y &gt; where =s means 'coreferential
and share variable properties'.

Generator does post-generation semantics compatibility testing and kick
out some results.

The grammar already has some rules that handles some of these idiomatic
phrases, but these rules have to be invoked. But maybe these rules
aren't invoked post-generation. ... red herring: The idiom rules aren't
relevant for generation, since the input semantics will always be
idiomatic or non-idiomatic. But nothing in the current representation is
requiring variable property mapping between two variables. There's
already an id\_rel, and it could have identities between the properties
on the two variables.

We think that these are all idioms (incl. X's way).

This works for the idiom cases, but there may be non-idiomatic ones as
well where the MRS-producer might want to specify which variables share
variable property values. This will be possible with ICONS.

Last update: 2012-05-04 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/WeSearch_VariablePropertySharing/_edit)]{% endraw %}