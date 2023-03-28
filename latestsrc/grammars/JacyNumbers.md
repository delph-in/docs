{% raw %}# Numbers, Numeral Classifiers and more

# Kanji Numbers

These are parsed using the normal grammar, as described in Bender
(2002).

# Hindu-Arabic numbers

What we should do is parse numbers and pass them through using SMAF.

## ChaSen settings

We set [ChaSen](/ChaSen) to join numbers together:

    (連結品詞 ((名詞 数))
              ((記号 アルファベット)))
    (COMPOSIT_POS ((名詞 数))
              ((記号 アルファベット)))

## Work Around

Until we have a proper preprocessor, we just add all numbers from
0--999, using the script utils/make-num.perl. We add fullwidth and
halfwidth (marked -a for ascii) versions. We could add more as needed.

    n_card-42 := card_2_no_valence &
     [ STEM < "４２" >,
       SYNSEM.LKEYS.KEYREL.CARG "42" ].
    
    n_card-42-a := card_2_no_valence &
     [ STEM < "42" >,
       SYNSEM.LKEYS.KEYREL.CARG "42" ].

# References

- Bender, Emily M. 2002. *[Number Names in Japanese: A Head-Medial
Construction in a Head-Final
Language](http:http://faculty.washington.edu/ebender/papers/jnn.pdf)*.
manuscript (comments welcome)

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/JacyNumbers/_edit)]{% endraw %}