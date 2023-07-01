{% raw %}## Abstract

In this document, we provide an outline for an overhaul of the choices
system for the Grammar Matrix. The primary changes are moving to a
standard serialization format, the introduction of a choices schema, and
the decoupling of choices and questionnaire display (matrixdef). We
propose using [TOML](https://github.com/toml-lang/toml) as an open
source, non-proprietary, generally available data storage format. We
propose providing a schema for choices files and an associated API.
These changes will make development easier and help enable connecting
the Grammar Matrix to other projects, both as a component and a target.

See [VirtualChoices](https://delph-in.github.io/docs/summits/VirtualChoices) for a discussion on this topic.

## Introduction

The Grammar Matrix is composed of several components, including but not
limited to the following:

1. matrix.tdl
2. the customization system
3. the questionnaire
4. the regression tests

A choices file is a serialized data file containing both 1) the answers
to questions in the questionnaire (as well as annotated data such as
lexical entries) and 2) information mapping choices to the matrixdef
file that participated in generating it. (2) includes, but is probably
not limited to:

- the sections and section names of the matrixdef file
- the choice names and (optionally) valid choices of the matrixdef
file
- the ordering of the above

Currently, choices are written in a proprietary storage format (DSL).

The code implementing choices is defined in three locations:

- choices.py (the main data structure definitions, API)
- deffile.py (choices deserialization)
- matrix.cgi (choices serialization)

## Motivations

The goals for changing this setup include the following:

1. **Ease of human reading**: the current choices file format is
generally human readable, and this is an important consideration of
any new changes. However, indexing and non-obvious nesting can make
choices difficult for newcomers to understand.
2. **Ease of human editing**: along with reading, being able to
identify and edit a choice without using the customization system is
a critical requirement, for use with matrix.py, debugging, and
development.
3. **Ease of creation**: it is currently difficult to write a choices
file from scratch. One must parse the current matrixdef file to
understand available sections, choices, and options. Ideally, one
would be able to write choices with very few dependencies.
4. **Computer serialization and deserialization**: choices are
currently stored in a proprietary format, so reading and writing
them requires implementing a significant amount of code.
5. **Make development easier**: currently, changing anything to do with
choices probably requires changes in several locations and is
brittle.
6. **Choices as a component**: a modularized choices format could be
used as a data format in other projects, targeting the Grammar
Matrix or not.
7. **Matrix as a target**: modularizing the choices format could help
others develop systems that use the Grammar Matrix (i.e. matrix.py)
without the Customization System (e.g. AGGREGATION).

To achieve these goals, we propose the following changes:

1. Changing the choices serialization format
2. Introducing a choices schema

## Background

The existing choices data serialization consists of the following data
types:

1. Dictionaries (maps)
2. Lists (arrays/vectors)
3. Strings / References
4. Integers

Below is an example snippet of the existing choices format as of July
2020 from the mini English choices file:

    section=morphology
      noun-pc1_name=num
      noun-pc1_obligatory=on
      noun-pc1_order=suffix
      noun-pc1_inputs=noun1
        noun-pc1_lrt1_name=singular
          noun-pc1_lrt1_feat1_name=number
          noun-pc1_lrt1_feat1_value=sg
          noun-pc1_lrt1_lri1_inflecting=no
        noun-pc1_lrt2_name=plural
          noun-pc1_lrt2_feat1_name=number
          noun-pc1_lrt2_feat1_value=pl
          noun-pc1_lrt2_lri1_inflecting=yes
          noun-pc1_lrt2_lri1_orth=s
      verb-pc1_name=pernum
      verb-pc1_obligatory=on
      verb-pc1_order=suffix
      verb-pc1_inputs=verb
        verb-pc1_lrt1_name=3sg
          verb-pc1_lrt1_feat1_name=person
          verb-pc1_lrt1_feat1_value=3rd
          verb-pc1_lrt1_feat1_head=subj
          verb-pc1_lrt1_feat2_name=number
          verb-pc1_lrt1_feat2_value=sg
          verb-pc1_lrt1_feat2_head=subj
          verb-pc1_lrt1_lri1_inflecting=yes
          verb-pc1_lrt1_lri1_orth=s
        verb-pc1_lrt2_name=pl
          verb-pc1_lrt2_feat1_name=number
          verb-pc1_lrt2_feat1_value=pl
          verb-pc1_lrt2_feat1_head=subj
          verb-pc1_lrt2_lri1_inflecting=no
        verb-pc1_lrt3_name=non-3rd
          verb-pc1_lrt3_feat1_name=person
          verb-pc1_lrt3_feat1_value=1st, 2nd
          verb-pc1_lrt3_feat1_head=subj
          verb-pc1_lrt3_lri1_inflecting=no

These choices are aligned with the matrixdef section named morphology,
and the following matrixdef snippet as of July 2020 (trimmed for
brevity, only including items relevant to choices snippet above):

    Section morphology "Morphology"
    
    BeginIter noun-pc{i} "a Position Class" 1 0
    
      Text name "Noun Position Class {i} Name" "<b>Noun Position Class {i}</b>:<br/>Position Class Name: " " " 20
    
      Check obligatory "Noun Position Class {i} Obligatory" "<br/>Obligatorily occurs:" ""
    
    Select order "Noun Position Class {i} Order" "<br/>Appears as a prefix or suffix:" ""
    . prefix "Prefix" "prefix"
    . suffix "Suffix" "suffix"
    
      MultiSelect inputs "Noun Position Class {i} Input" "<br/>Possible inputs:" ""
      fillcache c=nouns
      fillregex p=(verb|noun)-pc[0-9]+(_lrt[0-9]+)?_name
      . noun "Any noun" "any noun"
    
      BeginIter lrt{j} "a Lexical Rule Type" 1 0
    
        Text name "Noun Position Class {i} Lexical Rule Type {j} Name" "<b>Lexical Rule Type {j}</b>:<br/>Name: " "" 20
        BeginIter feat{k} "a Feature"
    
          Select name "Noun Position Class {i} Lexical Rule Type {j} Feature {k} Name" "Name: " " "
          fillnames c=both
    
          MultiSelect value "Noun Position Class {i} Lexical Rule Type {j} Feature {k} Value" "Value: " ""
          fillvalues p=noun-pc{i}_lrt{j}_feat{k}_name
    
        EndIter feat
    
        BeginIter lri{k} "a Lexical Rule Instance" 0 1
    
          Radio inflecting "Noun Position Class {i} Lexical Rule Type {j} Lexical Rule Instance {k} Has Orthography" "Instance {k}" ""
          . no "No" "" "No affix"
          . yes "Yes" "" "Affix spelled"
    
          Text orth "Noun Position Class {i} Lexical Rule Type {j} Lexical Rule Instance {k} Spelling" "" "" 20
    
        EndIter lri
    
      EndIter lrt
    
    EndIter noun-pc
    
    BeginIter verb-pc{i} "a Position Class" 1
    
      Text name "Verb Position Class {i} Name" "<b>Verb Position Class {i}</b>:<br/>Position Class Name: " " " 20
    
      Check obligatory "Verb Position Class {i} Obligatory" "<br/>Obligatorily occurs:" ""
    
      Select order "Verb Position Class {i} Order" "<br/>Appears as a prefix or suffix:" ""
      . prefix "Prefix" "prefix"
      . suffix "Suffix" "suffix"
    
      BeginIter lrt{j} "a Lexical Rule Type" 1 1
    
        Text name "Verb Position Class {i} Lexical Rule Type {j} Name" "<b>Lexical Rule Type {j}</b>:<br/>Name: " "" 20
    
        BeginIter feat{k} "a Feature"
    
          Select name "Verb Position Class {i} Lexical Rule Type {j} Feature {k} Name" "Name: " " "
          fillnames c=both
    
          MultiSelect value "Verb Position Class {i} Lexical Rule Type {j} Feature {k} Value" "Value: " ""
          fillvalues p=verb-pc{i}_lrt{j}_feat{k}_name
    
          Select head "Verb Position Class {i} Lexical Rule Type {j} Feature {k} Head" "Specified on: " ""
          . verb "The verb" "the verb"
          . subj "The subject" "the subject NP"
          . obj "The object" "the object NP"
    
        EndIter feat
    
        BeginIter lri{k} "a Lexical Rule Instance" 0 1
    
          Radio inflecting "Verb Position Class {i} Lexical Rule Type {j} Lexical Rule Instance {k} Has Orthography" "Instance {k}" ""
          . no "No" "" "No affix"
          . yes "Yes" "" "Affix spelled"
    
          Text orth "Verb Position Class {i} Lexical Rule Type {j} Lexical Rule Instance {k} Spelling" "" "" 20
    
        EndIter lri
    
      EndIter lrt
    
    EndIter verb-pc

## Proposals

### Serialization Format

Using a standard serialization format allows the Grammar Matrix code,
other code, and humans to more easily read and write choices files. By
relying on an existing third party implementation, this would also
reduce the amount of code in the Grammar Matrix repo, making development
easier.

#### Serialization Language

Several candidates were considered for the serialization format: JSON,
YAML, StrictYAML, and TOML.

- [JSON](https://www.json.org/json-en.html): generally considered hard
to read, hard to edit, and hard to create.
- [YAML](https://yaml.org): YAML has several things going for it
(widely used, easy to read and write, Python-inspired), however, it
also has many problems. It has a lot of unnecessary features (code
execution, multi-documents, lists as keys, etc.), problems with
ambiguity and typing, and has readability problems with large,
highly nested documents.
- [StrictYAML](https://github.com/crdoconnor/strictyaml): StrictYAML
is a subset of YAML that removes many features (e.g. code execution)
and fixes many typing and ambiguity problems. However, it is
currently only implemented in Python and still has readability
problems with large, highly nested documents.
- [TOML](https://github.com/toml-lang/toml): TOML is a configuration
language that represents maps and arrays, has fairly readable
syntax, has implementations in many languages
([Python](https://github.com/sdispater/tomlkit),
[JavaScript](https://www.npmjs.com/package/@iarna/toml/v/toml-1.0.0-rc.1),
etc.) and actually uses some of the same syntax as the existing
choices file format (e.g. nested dictionaries via dot notation).

We are recommending TOML in large part due to the lack of problems
compared to YAML and its readability over JSON.

#### Serialization Specifics

On top of the language, there are decisions about how choices are
organized into the choices file:

1. Lists of Choices
2. Nested Choices

##### Lists of Choices

As of writing, choices are stored as lists using indexing, e.g.:

    section=lexicon
      noun1_det=imp
        noun1_stem1_orth=n1
        noun1_stem1_pred=_n1_n_rel
      noun2_det=imp
        noun2_stem1_orth=n2
        noun2_stem1_pred=_n2_n_rel

noun1 is the first noun object as defined by this matrixdef's
BeginIter noun, which also contains the nested definition BeginIter stem
leading to the object noun1\_stem1, which has two choices: orth and
pred.

In TOML, these could be represented in a couple different ways.

The first way would be without explicit indexing, using the existing
mixed map and list nesting:

    [lexicon]
      [[lexicon.noun]]
      det = "imp"
    
        [[lexicon.noun.stem]]
        orth = "n1"
        pred = "_n1_n_rel"
    
      [[lexicon.noun]]
      det = "imp"
    
        [[lexicon.noun.stem]]
        orth = "n2"
        pred = "_n2_n_rel"

Another proposal is to keep the indexing and store everything in
maps/dictionaries:

    [lexicon]
      [lexicon.noun1]
      det = "imp"
    
        [lexicon.noun1.stem]
        orth = "n1"
        pred = "_n1_n_rel"
    
      [lexicon.noun2]
      det = "imp"
    
        [lexicon.noun2.stem]
        orth = "n1"
        pred = "_n2_n_rel"

Some considered pros and cons of each approach:

- Lists
  - Pros
    - No worry about indexing collision
    - Storing unordered values as unindexed values seems
reasonable
    - Closely aligned with the existing format
    - Better one-to-one mapping of TOML syntax to matrixdef
syntax.
  - Cons
    - Inserting/deleting entries breaks references
    - Sorting/changing order of lists is trivial, but will break
references
- Maps
  - Pros
    - Inserting/deleting entries is easy (if skipping indices
continues to be acceptable)
    - Indexed keys are similar to existing format
    - Nested maps may be seen as a simpler/more consistent data
structure
    - Arbitrary indexing may make for easier changes and reference
updates (e.g. noun5 could be programmatically replaced with
noun42)
  - Cons
    - Manually editing can cause key collisions

As of July 2020, lists of references are stored as comma delimited
strings. In TOML, they would be stored as lists.

    # July 2020
    noun-pc1_inputs=noun1,noun2
    
    # TOML
    [[morphology.noun-pc]]
    inputs = ["noun1", "noun2"]

##### Nested choices

As of writing, choices are nested using chained keys with \_ delimiters,
e.g. noun1\_stem1\_orth is the value for orth of the first stem of the
first noun.

In TOML, these nested choices would be explicitly nested as nested
dictionaries/maps, which uses a similar notation:

    # July 2020
    section=lexicon
      noun1_det=imp
        noun1_stem1_orth=n1
        noun1_stem1_pred=_n1_n_rel
    
    # TOML
    [lexicon.noun1]
    det = "imp"
    
      [lexicon.noun1.stem]
      orth = "n1"
      pred = "_n1_n_rel"

#### Serialized Example

The following is an example TOML serialization of the example choices
from the background section above, following the *Maps* proposal above.

    [morphology.noun-pc1]
    inputs = ["noun1"]
    name = "num"
    obligatory = "on"
    order = "suffix"
    
      [morphology.noun-pc1.lrt1]
      name = "singular"
        [morphology.noun-pc1.lrt1.feat1]
        name = "number"
        value = ["sg"]
    
        [morphology.noun-pc1.lrt1.lri1]
        inflecting = "no"
    
      [morphology.noun-pc1.lrt2]
      name = "plural"
        [morphology.noun-pc1.lrt2.feat1]
        name = "number"
        value = ["pl"]
    
        [morphology.noun-pc1.lrt2.lri1]
        inflecting = "yes"
        orth = "s"
    
    [morphology.verb-pc1]
    inputs = ["verb"]
    name = "pernum"
    obligatory = "on"
    order = "suffix"
    
      [morphology.verb-pc1.lrt1]
      name = "3sg"
        [morphology.verb-pc1.lrt1.feat1]
        head = "subj"
        name = "person"
        value = ["3rd"]
    
        [morphology.verb-pc1.lrt1.feat2]
        head = "subj"
        name = "number"
        value = ["sg"]
    
        [morphology.verb-pc1.lrt1.lri1]
        inflecting = "yes"
        orth = "s"
    
      [morphology.verb-pc1.lrt2]
      name = "pl"
        [morphology.verb-pc1.lrt2.feat1]
        head = "subj"
        name = "number"
        value = ["pl"]
    
        [morphology.verb-pc1.lrt2.lri1]
        inflecting = "no"
    
      [morphology.verb-pc1.lrt3]
      name = "non-3rd"
        [morphology.verb-pc1.lrt3.feat1]
        head = "subj"
        name = "person"
        value = ["1st", "2nd"]
    
        [morphology.verb-pc1.lrt3.lri1]
        inflecting = "no"

### Choices Schema

Currently, a schema for choices is defined in matrixdef. Separating this
schema away from the questionnaire information of matrixdef allows the
Grammar Matrix code, other code, and humans to more easily read and
write choices files. It also better enables other systems to target the
Grammar Matrix.

This proposal has two parts:

1. Decoupling choices and questionnaire content
2. An API for validating schemas, choices files, and matrixdef files.

Currently, reading and writing choices files has these dependencies:

    matrix.cgi (used choices, serialization code)
    ├── deffile.py (deserialization code)
    │   └── matrixdef (section definitions, choice definitions)
    └── choices.py (data structures)

A choices schema would store all of the required information about a
given choices version in one place such that the choices code
dependencies would be much simpler:

    choices.py (data structures, schema (section definitions, choice definitions))
    ├── tomlkit 3rd party dependency (serialization code, deserialization code)
    └── schema 3rd party dependency (schema parsing, validation)

#### Decoupling Choices and Questionnaire Content

Introducing a schema definition means that the matrixdef file is no
longer the source of truth for the choice definitions, but this is okay
as much of the content of the matrixdef file is actually view definition
that is interpreted into HTML and [JavaScript](/JavaScript) for
producing the questionnaire. New choices could be added to the schema
and then automatically imported into the questionnaire. Doing this
allows other programs to read the choices schema without a dependency on
matrixdef or its custom syntax, making the goal of targeting the Matrix
much easier. This also eases later modularization of the choices
component of the Grammar Matrix project, leaving the Definition File
logic in place.

As an example of the current issue with using choices in other projects,
the AGGREGATION code has a divergent copies of
[ChoicesDict](https://git.ling.washington.edu/agg/aggregation/-/blob/master/src/aggutils/ChoicesReader.py),
[deffile.py](https://git.ling.washington.edu/agg/aggregation/-/blob/master/src/aggutils/deffile.py),
and
[matrixdef](https://git.ling.washington.edu/agg/aggregation/-/blob/master/src/aggutils/matrixdef)
in order to read and write choices files. Moving to a decoupled choices
format will allow for a single shared dependency.

#### Schema Definition

The schema definition is similar to the existing matrixdef file, but
would not not store view information, but only name and type
information. To write and validate the schema, we propose using the
[schema](https://pypi.org/project/schema/) project. The schema is
written in Python, such as the following example schema for the
morphology section of matrixdef above (which is not production ready):

    from schema import Schema, And, Or, Regex
    
    withIndex = lambda expected: Regex(rf"^{expected}\d+$")
    Value = And(str, len)
    yes_no = Or('yes', 'no')
    on_off = Or('on', 'off')
    orders = Or('prefix', 'suffix')
    
    lri = {
      'inflecting': yes_no,
      Optional('orth'): Value
    }
    
    schema = Schema({'morphology':
      {withIndex('noun-pc'):
        {'name': Value,
         'obligatory': on_off,
         'order': orders,
         'inputs': [Value], # References to nominal lexical types or lexical rules
          withIndex('lrt'): {'name': Value,
                             withIndex('feat'): {'name': Value,
                                                 'value': [Value]},
                             withIndex('lri'): lri}},
       withIndex('verb-pc'): 
        {'name': Value,
         'obligatory': on_off,
         'order': orders,
         'inputs': [Value],
         withIndex('lrt'): {'name': Value,
                            withIndex('feat'): {'name': Value,
                                                'value': [Value],
                                                'head': Or("verb", "subj", "obj"),},
                            withIndex('lri'): lri}}
      }})

Some notes:

- Iterables can be handled with something similar to the above
withIndex function, though more robust.
- References are stored as strings, and subsequently are typed in the
schema as strings.
- Sections are stored in the schema.

The structure generally map to types/functionality in matrixdef:

    Top level keys => Section
    withIndex keys => (Begin|End)Iter
    Value => Text|TextArea|fillcache
    [Value] => MultiSelect
    bool => Check
    Or("a", "b") => Select|Radio

Alternatively, the schema could be defined in a TOML structure mirroring
the choices file itself. This would allow for schemas to be
language-neutral, helping facilitate the reading and writing of choices
in other programming languages. For instance, the morphology choices as
shown above could be stored in the following schema:

    [morphology]
    [[morphology.noun-pc_i]]
    name = "str"
    obligatory = "bool"
    order = ["prefix", "suffix"]
    inputs = ["str"] # References to nominal lexical types or lexical rules
      [[morphology.noun-pc_i.lrt_j]]
      name = "str"
        [[morphology.noun-pc_i.lrt_j.feat_k]]
        name = "str"
        value = ["str"]
        [[morphology.noun-pc_i.lrt_j.lri_k]]
        inflecting = ["no", "yes"]
        orth = "str"
    [[morphology.verb-pc_i]]
    name = "str"
    obligatory = "bool"
    order = ["prefix", "suffix"]
      [[morphology.verb-pc_i.lrt_j]]
      name = "str"
        [[morphology.verb-pc_i.lrt_j.feat_k]]
        name = "str"
        value = ["str"]
        # the 'head' choice specifies where the feat's value should be constrained
        head = ["verb", "subj", "obj"]
        [[morphology.verb-pc_i.lrt_j.lri_k]]
        inflecting = ["no", "yes"]
        orth = "str"

#### An Choices Schema API

Given a choices schema, one would want to do several things with it.
This is a preliminary list:

- Walk schema tree
- Validate the schema is valid (valid structure, no repeat names,
valid indexing)
- Validate a given choices file (or ChoicesFile object)
- Validate a given matrixdef file (or MatrixDefFile object)
- Generate an "empty" choices file
- Generate an "empty" matrixdef file
- Add new choices to an existing matrixdef file
- Coerce/sort a given choices file
- Coerce/sort a given matrixdef file

# Meta

Date: July 2020 Contributers: T.J. Trimble, Chris Curtis, Michael
Goodman, Olga Zamaraeva

Last update: 2020-07-14 by TJTrimble [[edit](https://github.com/delph-in/docs/wiki/MatrixChoicesRfc/_edit)]{% endraw %}