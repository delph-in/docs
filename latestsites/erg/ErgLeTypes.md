{% raw %}# ERG Lexical Types

Each lexical entry in the ERG is assigned to exactly one (leaf) lexical
type, which determines most of its properties. These leaf types
themselves inherit their properties from the full hierarchy of types
defined in the ERG, but only the leaf types and those identified in the
SEM-I (semantic interface) should be relevant for external applications.

## Names of types

All leaf types have names consisting of three or four fields, as
follows, each separated by an underscore:

|                |             |                        |      |
|----------------|-------------|------------------------|------|
| Part-of-Speech | Complements | (optional) Annotations | "le" |

The Part-of-Speech field identifies the broad lexical category,
distinguishing e.g. verbs from nouns. Current values in this field
include only the following:

|     |                |
|-----|----------------|
| v   | verb           |
| n   | noun           |
| aj  | adjective      |
| av  | adverb         |
| p   | preposition    |
| pp  | prep phrase    |
| d   | determiner     |
| c   | conjunction    |
| cm  | complementizer |
| x   | miscellaneous  |
| pt  | punctuation    |

The second field identifies the ordered sequence of complements which
this type selects for, with each complement identified by a category
abbreviation drawn from the following inventory, and with a hyphen used
to separate multiple complement identifiers. Lexical types that do not
select for any complements indicate this with a single hyphen in this
field. Complements marked with an asterisk ("\*") are optional, but note
that for brevity not all optional complements are so marked. The order
of complements is taken to be the unmarked order.

|        |                                                                |
|--------|----------------------------------------------------------------|
| np     | noun phrase, no longer obligatorily awaiting a specifier       |
| vp     | verb phrase, not yet subject-saturated                         |
| cp     | sentential complement, with or without an overt complementizer |
| pp     | prepositional phrase, complement-saturated                     |
| ap     | adjective phrase                                               |
| prd    | predicative phrase, including VP, AP, PP                       |
| p      | particle, semantically empty                                   |
| it     | expletive "it"                                                 |
| nb     | nominal phrase, not yet specifier-saturated                    |
| adv    | adverb phrase                                                  |
| vpslnp | verb phrase containing an NP gap                               |
| xp     | underspecified category                                        |

The third field, which is optional, provides annotations of the
finer-grained distinctions among types with the same part-of-speech and
complement selection. These annotations are briefly illuminated in the
middle field of the table of all types below.

The last field is always simply the suffix "le" to avoid name space
conflicts, and to support regular-expression searches within the grammar
source files.

As an example, the lexical type name "v\_np-cp\_q\_le" indicates that
verbs of this type select for two obligatory complements (a noun phrase
and a sentential complement), and the "q" annotation in the third field
is a mnemonic that the sentential complement must be an embedded
question. As a second example, the type name "aj\_pp-vp\_i-it\_le" is
for adjectives like "tough" which select for two complements (a
prepositional phrase and a verb phrase) as well as an expletive "it"
subject.

Documentation on each lexical type for the most recent stable version of
the ERG (currently "1214"), along with examples from manually-annotated
treebanks, can be found
[here.](http://compling.hss.ntu.edu.sg/ltdb/cgi/ERG_1214/ltypes.cgi)

Last update: 2015-08-25 by DanFlickinger [[edit](https://github.com/delph-in/docs/wiki/ErgLeTypes/_edit)]{% endraw %}