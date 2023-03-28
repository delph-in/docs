{% raw %}# Overview

The ‘RmrsDmrsComparison’ tool operates on DMRS syntactic representation
of sentences in XML format and stores them in memory using efficient
data structures. These files contain many sentences each with many
associated parses. The tool has five different usages triggered by
different command line arguments.

The packing and unpacking tool output the internal representation to an
XML file in packed and unpacked DMRS representations respectively. The
structural comparison function takes two sets of DMRS sentences and
identifies which sentences are the same, different or partially match.
Structural similarity identification compares two parses for common
nodes and links and finally the duplicate node and link identification
tool finds duplicate nodes and links within a parse.

Source code and a ready to run .jar file can be downloaded from the
google code repository.

<http://code.google.com/p/cstitproject/>

**Complete implementation details and framework explanations can be also
be found under the repository download section in thesis.pdf.**

A brief explanation of functionality will be given here for convenience.

# Usage

The tool has 5 different functions triggered by command line tags. A
brief reminder of these usages can be found by running the tool with no
arguments.

*USAGE 1: -compare \[options\] DMRS1in DMRS2in*

*USAGE 2: -pack \[options\] DMRSin out*

*USAGE 3: -unpack \[options\] DMRSin out*

*USAGE 4: -parseSim \[options\] DMRS1in DMRS2in pairFile*

*USAGE 5: -duplicate \[options\] DMRS1in*

Each of these usages are defined below.

# Input Format

The input format is flexible. The command line input source paths can
point to a single file or a directory of related files. These files can
be either packed or unpacked in either the the standard or alternative
DMRS formats. Files can also optionally be gzipped. A file ending in .gz
is assumed to be gzipped.

The XML specifications for the original and alternative versions of the
unpacked and packed DMRS representations can be downloaded from the
downloads section of the code hosting.

<http://cstitproject.googlecode.com/files/xml%20descriptions.zip>

# Options

The tool accepts several options that can be passed with the command
line arguments.

*OPTIONS:*

*-o out Output File*

*-gzip Output files using GZip*

*-s Do not use sortinfo in node comparison*

*-sh Output to shell ON*

*-alt Output alternative XML format*

DESCRIPTIONS:

-o and its argument 'out' specify the file where results will be output.

-gzip forces all output files to be gxzipped.

-s ignores the 'sortinfo' fields in the DMRS node structures during
comparison. This field cannot be set when packing or unpacking.

-sh prints results to the shell as well as to any specified file.

-alt changes the DMRS output format to the alternative format. This is
only applicable for functions that output XML files.

# Functions

## Pack

The packing function converts any input to a packed representation and
outputs this as unpacked XML

## Unpack

The unpacking functions converts any input to an unpacked representation
and outputs this as packed XML

## Compare

The comparison function reads two sets of DMRS representations (created
using the same test set but possibly different grammars) and compares
the DMRS semantic structure.

Two sentences are considered equal if all parses in the sentence are
equal to at least one parse in the opposing sentence. This is similar to
a surjective relation except allows for spurious ambiguity (a single
sentence contains two or more equal parses). Also, if two sentences are
not equal they may be considered 'partially equal' (some but not all
parses map) or 'not equal' (no parse in either sentence matches a parse
in the other). Two parses are considered equal if there is a bijective
equality mapping between their respective sets of nodes and links. In
other words if two parses contain the same number of links and nodes,
and every node and link in the one parse matches a node or link in the
second parse then they are considered to be equal. The inclusion of
‘sortinfo’ is optional.

The output format of this function is as follows :

\[sentence no.\] \[match status\] – \[number of parses in A\] & \[number
of parses in A\] parses – \[number of parses that match\] - \[a list of
matches with the format ‘(ID number from A : ID numbers in B that
match)’\]

## Similarity

The similarity algorithm identifies node and link commonalities and
outputs them to a file. Nodes and links are considered equal if they are
equal in all their fields except for ID numbers. The inclusion of
'sortinfo' is optional.

The output format of this function is a dmrs-pair list. This is very
similar to the standard unpacked DMRS format except nodes contain two ID
numbers, one for each of the nodes that match, and links contain two
sets of node ID links, representing the nodes connected by the
respective matching links. The output XML specification can be found on
the source code hosting downloads page.

<http://cstitproject.googlecode.com/files/xml%20descriptions.zip>

In the case where multiple nodes or links in one set match one or
multiple nodes or links in the other, then every combination of nodes
and links are output.

## Duplicates

The duplication tool analyses a single set of DMRS outputs for duplicate
nodes and links. When a duplicate expression is found the sentence ID
and parse ID it belongs to are output. The inclusion of 'sortinfo' is
optional.

The output is a simple ID pair list. If multiple duplication occurs in a
file the ID numbers will be output several times.

Last update: 2010-06-01 by anonymous [[edit](https://github.com/delph-in/docs/wiki/RmrsDmrsComparison/_edit)]{% endraw %}