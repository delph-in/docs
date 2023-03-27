# Overview

This page contains links to various scripts, libraries and packages that
people have written to make it easier to work with various DELPH-IN
systems and grammars. If you have a tool that you use regularly with the
DELPH-IN systems and think might be worth sharing, list it here.

## Parser/Generators

-   [ACE](AceTop) ([WoodleyPackard](/WoodleyPackard))

    -   ACE (the Answer Constraint Engine) is a processor for DELPH-IN
        grammars, supporting both parsing and generation.

-   [Pet](PetTop) Platform for Experimentation with efficient HPSG
    processing Techniques

    -   An efficient parser for DELPH-IN grammars.

-   ["Agree" grammar engineering environment](AgreeTop)
    ([GlennSlayden](GlennSlayden))

    -   A project to develop a new grammar engineering environment for
        working with DELPH-IN style TDL grammars.

-   [LKB](LkbInstallation) Linguistic Knowledge Builder

    -   Grammar development environment including support for parsing,
        generation, visualization, and debugging.

-   [LKB-FOS](LkbFos) ([JohnCarroll](JohnCarroll))

    -   Fully open-source LKB

## Utilities

-   [Converter](http://moin.delph-in.net/ToolsTop/converter.html)
    ([AngelinaIvanova](AngelinaIvanova))

    -   Converts ERG derivatino tree to bilexical syntactic
        dependencies, and ERG EDs to bilexical semantic dependencies
        (see ${LOGONROOT}/uio/dtm/converter.py)

-   [DelphinTools](DelphinTools)

    -   Tools for automatically efficiently running LOGON to create
        appropriate MRSs: source language, transfer, target language,
        variational.

-   [Egad](EgadTop) ([MichaelGoodman](MichaelGoodman))

    -   Error mining and grammar analysis through generation results.
        (unmaintained, but may still work)

-   [gDelta](GDeltaTop) ([NedLetcher](NedLetcher))

    -   Tool for comparing parser output from two different states of a
        grammar.

-   [Grammar Spring Cleaning](SpringCleaningTop)
    ([AntskeFokkens](AntskeFokkens))

    -   Tool that removes components of the grammar that are currently
        not used.

-   [Linguistic Type Database](LkbLtdb)

    -   A web interface for grammars made with the LKB that allows easy
        access to inline documentation and minimal corpus search.

-   [SHORT-CLIMB](ClimbShortClimb) ([AntskeFokkens](AntskeFokkens))

    -   Tool that allows you to define modifications to a grammar and
        generates a modified version of the grammar based on the changes
        (and allows you to convert back)

-   [Typediff](TypediffTop) (Ned Letcher)

    -   A web app for exploring DELPH-IN grammar types used in the
        processing of input.

-   [Vista extraction](VistaExtractionTop) ([JoaoSilva](JoaoSilva))

    -   Tool for extracting vistas from the files exported by the
        grammar. Vistas are grammatical representations that collect
        only a part of the linguistic information encoded in the
        fully-fledged hpsg grammatical representation.

-   [DELPH-IN VIZ](https://github.com/delph-in/delphin-viz)
    ([NedLetcher](NedLetcher)) Nice interface for online access to the
    grammar [Demo](http://delph-in.github.io/delphin-viz/demo/).

-   [ReppTop](ReppTop)

    -   A Regular Expression Pre-Processor, a finite-state device used
        to prepare textual input for 'deep' parsing (using DELPH-IN
        grammars)

## Libraries

-   [PyDelphin](https://github.com/goodmami/pydelphin)
    ([MichaelGoodman](MichaelGoodman))

    -   Python libraries (and some scripts) for working with DELPH-IN
        data

-   [PyPES](http://www.semantilog.org/pypes.html)
    ([RichardBergmair](RichardBergmair))

    -   Python library for scoping, first-order rewriting, and logical
        inference

-   [Ruby delphin gem](https://rubygems.org/gems/delphin)
    ([BillMcNeill](BillMcNeill))

    -   A [Ruby](http://www.ruby-lang.org) package for working with
        DELPH-IN data and tools

## Grammar Creation Support

-   [Grammar Matrix](http://matrix.ling.washington.edu/index.html)
    ([EmilyBender](EmilyBender) and many others)

    -   Grammar customization system, creates grammars to spec. [GitHub
        repo](https://github.com/delph-in/matrix) See also:
        [MatrixGettingStarted](MatrixGettingStarted)

-   [AGGREGATION](http://depts.washington.edu/uwcl/aggregation/)
    ([EmilyBender](EmilyBender) and many others)

    -   System for creating grammar specifications on the basis of IGT
        corpora. [gitlab
        repo](https://git.ling.washington.edu/agg/aggregation)

## Others

-   <http://github.com/delph-in/homebrew-delphin>

    -   Homebrew distributions (tap) of DELPHI-IN tools, including ACE and PyDelphin.

-   <https://github.com/own-pt/docker-delphin>

    -   A docker installation of LOGON and ACE and its dependents. Some
        improvements over the initial [LkbMacintosh](LkbMacintosh).

-   [Heart of Gold](HeartofgoldTop): XML-based middleware for the
    integration of deep and shallow NLP components
