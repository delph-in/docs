{% raw %}# Overview

This page contains links to various scripts, libraries, and packages that
people have written to make it easier to work with various DELPH-IN
systems and grammar. If you have a tool that you regularly use with the
DELPH-IN systems and think might be worth sharing, list it here.

## Parsers/Generators

- [LKB](/delph-in/docs/wiki/LkbInstallation) Linguistic Knowledge Builder
  
  Grammar development environment, including support for parsing, generation, visualization, and debugging.
- [LKB-FOS](/delph-in/docs/wiki/LkbFos) (John Carroll)
  
  Fully open-source LKB
- [ACE](/delph-in/docs/wiki/AceTop) (Woodley Packard)
  
  ACE (the Answer Constraint Engine) is a processor for DELPH-IN grammars, supporting both parsing and generation.
- [PET](/delph-in/docs/wiki/PetTop) Platform for Experimentation with efficient HPSG processing Techniques
  
  An efficient parser for DELPH-IN grammars.
- [Agree](/delph-in/docs/wiki/AgreeTop) (Glenn Slayden)
  
  A a system for processing DELPH-IN style TDL grammars within the .NET and Mono managed runtime environments.

## Utilities

- [Converter](/delph-in/docs/wiki/DTConverter) (Angelina Ivanova)
  
  Converts ERG derivation tree to bilexical syntactic dependencies, and ERG EDS to bilexical semantic dependencies.
- [DelphinTools](/delph-in/docs/wiki/DelphinTools)
  
  Tools for automatically efficiently running LOGON to create appropriate MRSs: source language, transfer, target language, variational.
- [Egad](/delph-in/docs/wiki/EgadTop) (Michael Goodman)
  
  Error mining and grammar analysis through generation results (unmaintained, but may still work).
- [gDelta](/delph-in/docs/wiki/GDeltaTop) (NedLetcher)
  
  Tool for comparing parser output from two different states of a grammar.
- [Grammar Spring Cleaning](/delph-in/docs/wiki/SpringCleaningTop) (Antske Fokkens)
  
  Tool that removes components of the grammar that are currently not used.
- [Linguistic Type Database](/delph-in/docs/wiki/LkbLtdb)
  
  A web interface for grammars made with the LKB that allows easy access to inline documentation and minimal corpus search.
- [SHORT-CLIMB](/delph-in/docs/wiki/ClimbShortClimb) (AntskeFokkens)
  
  Tool that allows you to define modifications to grammar and generates a modified version of the grammar based on the changes (and allows you to convert back)
- [Typediff](/delph-in/docs/wiki/TypediffTop) (Ned Letcher)
  
  A web app for exploring DELPH-IN grammar types used in the processing of input.
- [Vista extraction](/delph-in/docs/wiki/VistaExtractionTop) (JoaoSilva)
  
  Tool for extracting vistas from the files exported by the grammar. Vistas are grammatical representations that collect only a part of the linguistic information encoded in the fully-fledged HPSG grammatical representation.
- [DELPH-IN VIZ](https://github.com/delph-in/delphin-viz) (NedLetcher) 
  
  Nice interface for online access to the grammar [Demo](http://delph-in.github.io/delphin-viz/demo/).
- [ReppTop](/delph-in/docs/wiki/ReppTop)
  
  A Regular Expression Pre-Processor, a finite-state device used to prepare textual input for 'deep' parsing (using DELPH-IN grammars)

## Libraries

- [PyDelphin](/delph-in/pydelphin) (Michael Goodman)
  
  Python libraries (and some scripts) for working with DELPH-IN data.
- [PyPES](http://www.semantilog.org/pypes.html) (RichardBergmair)
  
  Python library for scoping, first-order rewriting, and logical inference.
- [Ruby delphin gem](https://rubygems.org/gems/delphin) (Bill McNeill)
  
  A [Ruby](http://www.ruby-lang.org) package for working with DELPH-IN data and tools.

## Grammar Creation Support

- [Grammar Matrix](http://matrix.ling.washington.edu/index.html) (Emily Bender and many others)
  
  Grammar customization system, creates grammars to spec. (https://github.com/delph-in/matrix) and see also [MatrixGettingStarted](/delph-in/docs/wiki/MatrixGettingStarted)
- [AGGREGATION](http://depts.washington.edu/uwcl/aggregation/) (Emily Bender and many others)
  
  System for creating grammar specifications based on IGT corpora. (https://git.ling.washington.edu/agg/aggregation)

## Others

- http://github.com/delph-in/homebrew-delphin
  
  Homebrew package repository (tap) of DELPH-IN tools, including ACE and PyDelphin.
- https://github.com/LR-POR/delphin-docker
  
  This is a docker installation of LOGON, ACE, and its dependents. It has some improvements over the initial [LkbMacintosh](/delph-in/docs/wiki/LkbMacintosh).
- [Heart of Gold](https://delph-in.github.io/docs/garage/HeartofgoldTop): XML-based middleware for the integration of deep and shallow NLP components

Last update: 2024-03-26 by Alexandre Rademaker [[edit](https://github.com/delph-in/docs/wiki/ToolsTop/_edit)]{% endraw %}