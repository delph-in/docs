{% raw %}Some thoughts on mapping MRSs to Wordnet sense (mainly illustrated with
the ERG and PWN). Examples use a variant of the indexed MRS to save
space (part of the work on [Lexical Semantics](https://delph-in.github.io/docs/garage/LexsemTop)).

Contents

1. [Single Words](https://delph-in.github.io/docs/summits/LexsemMapping#Single_Words)
   1. [Proper Nouns](https://delph-in.github.io/docs/summits/LexsemMapping#Proper_Nouns)
   2. [Decomposed nouns](https://delph-in.github.io/docs/summits/LexsemMapping#Decomposed_nouns)
   3. [Superlatives](https://delph-in.github.io/docs/summits/LexsemMapping#Superlatives)
   4. [Different POS](https://delph-in.github.io/docs/summits/LexsemMapping#Different_POS)
2. [Multiple Words](https://delph-in.github.io/docs/summits/LexsemMapping#Multiple_Words)
   1. [Compositional Compound Nouns](https://delph-in.github.io/docs/summits/LexsemMapping#Compositional_Compound_Nouns)
   2. [Non Compositional Compound
Nouns](https://delph-in.github.io/docs/summits/LexsemMapping#Non_Compositional_Compound_Nouns)
   3. [Idioms](https://delph-in.github.io/docs/summits/LexsemMapping#Idioms)
3. [Phrases](https://delph-in.github.io/docs/summits/LexsemMapping#Phrases)
   1. [Coordination](https://delph-in.github.io/docs/summits/LexsemMapping#Coordination)
   2. [Light Verbs](https://delph-in.github.io/docs/summits/LexsemMapping#Light_Verbs)

## Single Words

In straight forward cases like this, each open class predicate maps to a
wordnet sense.

    The cat_{cat_n1} ate_{eat_v1} a dog_{dog_n1}.
    e3:
     _1:_the_q⟨0:3⟩[BV x6]
     x6:_cat_n_1⟨4:7⟩[]
     e3:_eat_v_1⟨8:11⟩[ARG1 x6, ARG2 x9]
     _2:_a_q⟨12:13⟩[BV x9]
     x9:_dog_n_1⟨14:18⟩[]

Mapping the predicates to lemmas gives us directly:

    x6:_cat_n_1 = cat_n1
    e3:_eat_v_1 = eat_v1
    x9:_dog_n_1 = dog_n1

Note that quantifiers are sometimes in wordnet, sometimes not:

    Each_{each_a1} cat_{cat_n1} ate_{eat_v1} a dog_{dog_n1}.
    e3:
     _1:_each_q⟨0:4⟩[BV x5]
     x5:_cat_n_1⟨5:8⟩[]
     e3:_eat_v_1⟨9:12⟩[ARG1 x5, ARG2 x9]
     _2:_a_q⟨13:14⟩[BV x9]
     x9:_dog_n_1⟨15:19⟩[]

Here we also have:

    _1:_each_q = each_a1

(with a non matching pos a &lt;&gt; q)

### Proper Nouns

For proper nouns (and numbers and a few others), the predicate is an
abstraction like named\_rel, and the value is in the CARG:

    Bast_{Bast_n1} ate_{eat_v1} a dog_{dog_n1}.
    e3:
     _1:proper_q⟨0:4⟩[BV x6]
     x6:named⟨0:4⟩("Bast")[]
     e3:_eat_v_1⟨5:8⟩[ARG1 x6, ARG2 x9]
     _2:_a_q⟨9:10⟩[BV x9]
     x9:_dog_n_1⟨11:15⟩[]

We want:

    x6:named = Bast_1

### Decomposed nouns

Some words are given complex semantics:

    A cat_{cat_n1} ate_{eat_v1} here_{here_a1}
    e3:
     _1:_a_q⟨0:1⟩[BV x6]
     x6:_cat_n_1⟨2:5⟩[]
     e3:_eat_v_1⟨6:9⟩[ARG1 x6]
     e10:loc_nonsp⟨10:15⟩[ARG1 e3, ARG2 x11]
     x11:place_n⟨10:15⟩[]
     _2:def_implicit_q⟨10:15⟩[BV x11]
     e16:_here_a_1⟨10:15⟩[ARG1 x11]

*here* is given semantics equivalent to "in this place". Ideally, we
would like a mapping such as:

    e10:loc_nonsp = here_a1
    x11:place_n = here_n1

with "e16:\_here\_a\_1" unmapped. "in this place" = here\_a1 and "this
place" = hear\_n1

There are not so many of these, it should be possible to do them with
exception handling

### Superlatives

Wordnet has some superlatives (linked through domain usage to
superlative\_n\_1): *best, worst, least, ...*

As far as I can tell, they are not actually linked to the relevant
adjectives!

I think we should tag these with the relvant adjective (*good, bad,
less; , ...*) and distinguish if need be by the presence of the
superlative predicate.

### Different POS

ERG collapses many adjective/adverb distinctions: they are all 'a'.
Wordnet often has them as different entries, linked with derivation
links. I lean towards collapsing them :-).

## Multiple Words

Sometimes both the ERG and PWN treat a MWE as a single concept, and then
it is easy.

    The cat_{cat_n1} gobbled_{gobble up_v1} a dog_{dog_n1} up_{gobble up_v1}.
    e3:
     _1:_the_q⟨0:3⟩[BV x6]
     x6:_cat_n_1⟨4:7⟩[]
     e3:_gobble_v_up⟨8:15⟩[ARG1 x6, ARG2 x9]
     _2:_a_q⟨16:17⟩[BV x9]
     x9:_dog_n_1⟨18:21⟩[]

The character mapping is a bit less direct, but the final mapping should
be just:

    x6:_cat_n_1 = cat_n1
    e3:_gobble_v_up = gobble_up_v1
    x9:_dog_n_1 = dog_n1

**PROBLEM** sometimes they will disagree. Postpone mapping for now.

### Compositional Compound Nouns

    The cat_{cat_n1} ate_{eat_v1} a guard_{guard_dog_n1} dog_{guard_dog_n1}.
    e3:
     _1:_the_q⟨0:3⟩[BV x6]
     x6:_cat_n_1⟨4:7⟩[]
     e3:_eat_v_1⟨8:11⟩[ARG1 x6, ARG2 x9]
     _2:_a_q⟨12:13⟩[BV x9]
     e15:compound⟨14:23⟩[ARG1 x9, ARG2 x14]
     _3:udef_q⟨14:19⟩[BV x14]
     x14:_guard_n_1⟨14:19⟩[]
     x9:_dog_n_1⟨20:23⟩[]

NTU WN tags just MWE in this case, [SemCor](https://delph-in.github.io/docs/garage/SemCor) maps
only the MWE I think we want:

    x6:_cat_n_1 = cat_n1
    e3:_eat_v_1 = eat_v1
    x9:_dog_n_1 = guard_dog_n1
    x14:_guard_n_1 = x

We get this in two steps.  First we get the compositional reading from the ERG's treebanking (really we get guard_n_per, which also includes basketball guard, ...):

    x6:_cat_n_1 = cat_n1
    e3:_eat_v_1 = eat_v1
    x9:_dog_n_1 = dog_n1
    x14:_guard_n_1 = guard_n2 'a person who keeps watch over something or someone' 

Then we write an (optional) mtr, that rewrites the compound to a single noun (hopefully dealing with modifiers correctly).

<guard_n2, compound, dog_n1> => <guard_dog_n1>

It would be good to also link these in wordnet: we should have guard_dog_n1 is_a dog_n1, we also want 'guard_n2' internally modifies 'dog_n1' in 'guard_dog_n1'.

One could instead think of something like this:

    x6:_cat_n_1 = cat_n1
    e3:_eat_v_1 = eat_v1
    x9:_dog_n_1 = dog_n1
    x14:_guard_n_1 = guard_n1
    e15:compound = guard_dog_n1

But this isn't quite right: too many predicates, compound is not a noun, ...

### Non Compositional Compound Nouns

    The cat_{cat_n1} ate_{eat_v1} a guard_{hot_dog_n1} dog_{hot_dog_n1}.
    e3:
     _1:_the_q⟨0:3⟩[BV x6]
     x6:_cat_n_1⟨4:7⟩[]
     e3:_eat_v_1⟨8:11⟩[ARG1 x6, ARG2 x9]
     _2:_a_q⟨12:13⟩[BV x9]
     e14:_hot_a_1⟨14:17⟩[ARG1 x9]
     x9:_dog_n_1⟨18:21⟩[]

Here, we don't want the semantics "a dog that is hot", so:

    x6:_cat_n_1 = cat_n1
    e3:_eat_v_1 = eat_v1
    x9:_dog_n_1 = hot+dog_n1

Ideally, the ERG should contain "hot dog" as a single entry, so that
things map even better.

### Idioms

*X keeps tabs on Y*

We don't really know how to mark the whole idiom (although the ERG
recognizes it)

But we can write a machine translation rule to rewrite it.

*X doesn't know X's arse from X's elbow* "X is an idiot." ?Postprocess

How should we show this?

## Phrases

### Coordination

*grass and brown snakes* grass\_snakes and brown\_snakes ?Postprocess

### Light Verbs

*give a start* give\_start? Do we just make entries for all light verbs?

Many more corner cases to come :-): "Sleeping Beauty: is sleep v or n",
more complex MWEs, ... .

Last update: 2023-02-23 by Francis Bond [[edit](https://github.com/delph-in/docs/wiki/LexsemMapping/_edit)]{% endraw %}