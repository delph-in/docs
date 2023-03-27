{% raw %}# Minimal documentation for the Matrix Constituent Questions library

The constituent questions library provides support for a range of syntactic patterns associated with constructions like:

```
(1) Who did what where?

(2) What did you think Kim did?

(3) Do you know who arrived?

(4) I don't know who arrived.
```

...and similar.

## Typological scope

The library covers some of the fronting patterns including no fronting (*in situ*) (1)--(3), question particles (3), morphological marking (4),  and special question verbs (5).

```
(1) Who did what where? [eng]

(2) Kto kogda kogo videl?
    who when  whom saw
    "Who saw whom and when?" [rus]

(3) Mary John nanio yonda to   itta no
    Mary John what  read  that said Q
    "What did Mary say John read?" [jpn]

(4) qodo lʔe-t-о̄
    what be-FUT-ITRG-1PL
    "What shall we do? (lit.: "What will we become?") [yux]

(5) req-ərkənəm  igirkej gənin ekək?
    do.what-PROG now     your  son
    "What is your son doing now?" [ckt]     
```

## Relevant Questionnaire portions

The best way to figure out how to fill out the questionnaire is probably by uploading the choices files from the wh- [regression tests](https://delph-in.github.io/docs/matrix/MatrixRegressionTesting) on the Matrix [website](https://matrix.ling.washington.edu/customize/matrix.cgi). All of the typological combinations which were tested will be (by definition) covered there. All wh- regression test names start with *wh*, e.g. `wh-bxl`, `wh-dev-rus`, or `wh-sov-sg-opt`.

To summarize:

1. Specify question words on the Lexicon page. Some POS will have a checkbox "interrogative"; check that if you are specifying a question word.
2. Specify question particles and morphological marking on the Yes/No Questions page. 
3. Specify all other wh-questions-related things on the Constituent (wh-) Questions page.

### Notes on choices for question particles

With question particles, one thing to keep in mind is that the particles used in polar (Yes/No) questions are always optional in the Matrix. This led to wh-questions particles specification being a bit confusing at the moment (if you have an idea on how to improve this, please file an issue!). As it is, there are three separate areas in the Yes/No questionnaire which mention particle optionality. You can either say that all particles are optional; otherwise, you must specify for each function whether it is obligatory or impossible in wh-questions (the default still being "optional" for each particle).

### Notes on morphological marking choices
The checkbox for morphological marking on the Wh-questions webpage is actually not serving any purpose except for the user to "register" a typological feature for themselves. In reality, the only checkbox that matters is "Verbal inflection" on Yes/No Questions page. Check that, and then on the Morphology page, specify lexical rules and choose the appropriate value for the `question` feature.

## Corresponding dissertation (canonical citation) and code snapshot

The most complete information about the library can be found in [Olga Zamaraeva's 2021 dissertation](https://olzama.github.io/OZ-diss.pdf):

```
@phdthesis{zamaraeva-diss,
author={Olga Zamaraeva},
title={Assembling Syntax: A cross-linguistic analysis of constituent questions in a grammar engineering framework},
school={University of Washington},
year={2021}
}
```

The code snapshot corresponding to the dissertation when it was submitted is committed to Github under tag ["Zamaraeva-dissertation"](https://github.com/delph-in/matrix/releases/tag/Zamaraeva-dissertation).

Last update: 2021-06-07 by Olga Zamaraeva [[edit](https://github.com/delph-in/docs/wiki/MatrixDoc_WhQuestions/_edit)]{% endraw %}