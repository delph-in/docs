{% raw %}# Getting Started with the Grammar Matrix

This page provides pointers for getting started with the Grammar Matrix
customization system.

## Where is the Matrix?

The customization system can be accessed from the following web page:

    http://matrix.delph-in.net/customize/matrix.cgi

## Where can I find instructions on filling out the questionnaire?

Most of the libraries in the Grammar Matrix have at least some
documentation on the [MatrixDoc](https://delph-in.github.io/docs/matrix/MatrixDocTop) pages.

Note that filling out the questionnaire is an iterative process. To get
as much as possible out of the customization system, you should develop
a test suite illustrating the phenomena covered by the questionnaire in
the language you are modeling and then develop different versions of
your ‘choices’ file (the file containing your answers to the
questionnaire), iteratively testing the resulting grammar on your test
suite. Furthermore, it is always wise to start small and extend
incrementally. Even with morphologically complex languages, your very
first version of your grammar should have a full-form lexicon. Once you
see that working (and parsing a few sentences), you can go back and do
the morphology. If you have a lot of morphological rules to add, for
example, try one or two and see how they work before fleshing out full
paradigms.

In addition, EmilyBender's course pages for
[Ling567](http://courses.washington.edu/ling567) at UW may be helpful.
These course pages are updated each time the course is taught (roughly
annually), but typically follow the same schedule:

- Lab 1 is an exercise about getting familiar with the LKB and doesn't
really relate to the Matrix.
- Labs 2-4 walk students through creating test suites on the one hand
and filling out the customization system on the other.
- Labs 5-8 are about extending the grammars through tdl editing.

## What other software do I need?

You'll want the LKB ([LkbTop](https://delph-in.github.io/docs/tools/LkbTop)) or ace ([AceTop](https://delph-in.github.io/docs/tools/AceTop)), a text
editor (preferably emacs), and [\[incr
tsdb()\]](http://www.delph-in.net/itsdb). Typically, the easiest way to
get set up is with the [Ubuntu+LKB Virtual Box
appliance](http://depts.washington.edu/uwcl/twiki/bin/view.cgi/Main/KnoppixLKB),
maintained at UW.

## How about papers I can read?

The key references for the Grammar Matrix are the following two papers:

- Zamaraeva, Olga, Chris Curtis, Guy Emerson, Antske Fokkens, Michael Wayne Goodman, Kristen Howell, T.J. Trimble, and Emily M. Bender. 2022. [20 years of the Grammar Matrix: cross-linguistic hypothesis testing of increasingly complex interactions](https://jlm.ipipan.waw.pl/index.php/JLM/article/view/292). Journal of Language Modeling 10(1) Special Section on the Interaction between Formal and Computational Linguistics. p.49-137.
- Bender, Emily M., Scott Drellishak, Antske Fokkens, Laurie Poulson,
and Safiyyah Saleem. 2010. Grammar Customization. Research on
Language and Computation 8(1):23-72.
[\[.bib](http://faculty.washington.edu/ebender/bibtex/BenDreFokPouSal10.bib.txt)\]
\[Pre-print available on request.\]
- Bender, Emily M., Dan Flickinger and Stephan Oepen. 2002. [The
Grammar Matrix: An Open-Source Starter-Kit for the Rapid Development
of Cross-Linguistically Consistent Broad-Coverage Precision
Grammars](http://faculty.washington.edu/ebender/papers/gee03.pdf).
Carroll, John, Nelleke Oostdijk, and Richard Sutcliffe, eds.
Proceedings of the Workshop on Grammar Engineering and Evaluation at
the 19th International Conference on Computational Linguistics.
Taipei, Taiwan. pp. 8-14.

A complete list of publications from the Grammar Matrix project is
available on the [project home page](http://www.delph-in.net/matrix/).

## What else might be helpful?

Once you are working with tdl editing, the
[GrammarEngineeringFaq](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ) pages may be helpful.
The feature geometry cheat sheets at the bottom of
[GeFaqFeatureGeometry](https://delph-in.github.io/docs/matrix/GeFaqFeatureGeometry) are particularly popular.

## Where can I send questions?

Please check out the [DELPH-IN QA Discourse
site](https://delphinqa.ling.washington.edu/) and post questions there.

Last update: 2023-06-30 by emilymbender [[edit](https://github.com/delph-in/docs/wiki/MatrixGettingStarted/_edit)]{% endraw %}