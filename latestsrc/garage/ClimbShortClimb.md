{% raw %}# SHORT-CLIMB Documentation

## Overview

SHORT-CLIMB is a tool that can create metagrammar libraries for a larger
resource grammar, following the ideas in [CLIMB](https://delph-in.github.io/docs/garage/ClimbTop). It provides
a practical set-up to flip back and forth between different versions of
a grammar. The approach can be used to (temporarily) maintain and
explore an alternative analyses, or to collect standard differences
between versions of a grammar (e.g. a more restricted version and a more
robust version)

- Definitions related to a specific (alternative) analysis are located
at one spot (clear overview of related properties)
- Revisions made to one version of the grammar can be included in the
other version automatically (more systematic comparison between
versions)
- SHORT-CLIMB libraries can be applied to the grammar at any time: may
provide a good starting point to go back to an old analysis after a
long time

## General Instructions

- SHORT-CLIMB can be downloaded
[here](http://www.coli.uni-saarland.de/~afokkens/materials/short_climb.tar.gz)
- Please send requests, questions and bugs reports to
AntskeFokkens by email (for bug reports: please
include your library and the to-be-modified TDL file)

## Creating a SHORT-CLIMB library

### Running short-climb

First steps:

- [Download](http://www.coli.uni-saarland.de/~afokkens/materials/short_climb.tar.gz)
SHORT-CLIMB
- Store short\_climb.py and tdl.py in a subdirectory of your grammar
directory (i.e. where your tdl files are stored)
- Create file defining changes for the new version of the grammar,
store this in a subdirectory called *climb* in your grammar
directory (see default settings)

SHORT-CLIMB is run by the command:

    python short_climb.py [OPTIONS] input

The *input* can be one of the following:

- a file defining changes for the grammar
- a set of files defining changes for the grammar (separated in input
by a comma, e.g. file1,file2,file3)
- a predefined version calling one or more files defining changes for
the grammar

To define a version in short\_climb.py add key value pair to versions in
line:

    versions = {}

e.g.:

    versions = {'versionA' : ['fileA1', 'fileA2'], 'versionB' : ['fileB1'], 'versionC' : ['fileC1','fileC2','fileC3']}

The following options are supported:

- -D/--dir=: define output directory for the modified grammar:
**highly recommended!**
- -O/--oldversion=: create a modification file that can recreate the
original grammar from the modified grammar
- -l/--libcreation=: create two libraries and a core. The core
contains all information both versions have in common, the libraries
contain the additions for each particular version
- -b/--backup: creates a back-up of each modified file in the grammar
directory (not necessary if -D or --dir option is used)

<!-- -->


    NB: if none of the options above is given, files of the original grammar will be modified! A warning with possibility to break of the process is provided before this operation takes place

## Default settings

- SHORT-CLIMB (short\_climb.py) lives in a subdirectory of the grammar
- CLIMB libraries live in a subdirectory of the grammar called climb
- CLIMB libraries define which .tdl files must be manipulated: all
other parts of the grammar will be copied

To change these defaults adapt the following lines in short\_climb.py:

    path = '../climb/'
    gram_path = '../'

where gram\_path should lead to the directory of the grammar and path to
the directory of CLIMB libraries.

### CLIMB Library definitions

SHORT-CLIMB can insert and remove types, add new properties to types and
remove properties from types. These operations are evoked from
statements in CLIMB libraries. Examples are provided below

### input files

    input=gram_part.tdl

states that gram\_part.tdl should be included in the modification
process. Statements regarding types that are defined in tdl files that
are not defined as input will be ignored. I will use the term *input
files* to refer to files defined as input below.

#### removing types

    remove=type_name

removes all type definitions with type\_name from the input files.

    remove=type_name,addendum

removes all addenda to type with type\_name from the input files.

#### inserting new types

    location=type_name
    my_new_type := supertype &
     [ PATH.FEATURE value ].

inserts the definition of my\_new\_type above the type definition of
type\_name in the grammar. If type\_name is removed by another
statement, my\_new\_type will replace the old type. If type\_name does
not occur in any of the input files, the statement will be ignored.
location=type\_name followed by a tdl definition can also be used to
insert addenda.

#### adding properties to types

    type_name := new_supertype &
     [ NEW_PROPERTY new_value ].

adds *new\_supertype* as a supertype and \[ NEW\_PROPERTY new\_value \]
as a new value to the definition of type\_name. If type\_name does not
occur in the input files, this definition will be ignored. (A location
must be defined to insert completely new definitions)

    type_name :+ new_supertype &
     [ NEW_PROPERTY new_value ].

will add these properties to the addenda of type\_name. If type\_name
does not have an addendum yet, it will be created. If type\_name does
not occur at all in the input files, this statement will be ignored. (A
location must be defined to insert completely new definitions)

#### removing properties from types

    type_name :- old_supertype &
     [ OLD_PROPERTY old_value ]. 

removes the supertype *old\_supertype* and constraint \[ OLD\_PROPERTY
old\_value \] from type *type\_name*. As for the above: this statement
is ignored if type\_name does not occur in the input files. Careful with
lists and diff-lists:

- If the only type or constraint of a list is removed, the entire list
is removed
- Properties of elements on a list can be removed, but an element
cannot be removed completely from the list

<!-- -->


    type_name :- [ MY-DLIST <! [ ], old_type, [ ] !>

removes the constraint *old\_type* from the second element on the
diff-list. Other constraints on this element will be maintained. If no
other constraints are defined, it will be replaced by \[ \] in the new
grammar. The first and last element on the diff-list will remain
untouched

    type_name :- [ MY-DLIST <! [ ], [ OLD_C old_v ], [ ] !>

removes the feature-value pair \[ OLD\_C old\_v \] from the second
element on the diff-list. Again, other constraints on this element will
be maintained and it will be replaced by \[ \], if \[ OLD\_C old\_v \]
was the only constraint defined on the second element and no specific
type was given for it.

NB. To change the number of elements on a list, use the complete
replacement option (see below)

#### completely redefining a type

    complete=on
    type_name := supertype &
     [ SOME_CONSTRAINT value ].

replaces the type definition of type\_name in the original grammar by
the new definition below *complete=on*.

Last update: 2017-01-17 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/ClimbShortClimb/_edit)]{% endraw %}