{% raw %}MatrixTDB is the regression test facility for the Grammar Matrix and the
Matrix customization system. It allows us to create gold standard tsdb++
profiles on demand for language types defined in choices files.

## High Level Overview

There are three main things you might want to do with MatrixTDB: put
data in or get data out. Add new strings, add a language type, extract a
profile for a language type. These three high-level tasks break down
into smaller sub-tasks. The breakdown into sub-tasks is displayed here,
while the Detailed Processes section of this page breaks each of those
down into smaller tasks.

### Adding New Strings Breakdown

- Create a source profile
- Import the source profile
- Add permutes
- Run specific filters

### Adding A Language Type Breakdown

- (Actually this just breaks down to one sub-task: adding a language
type

### Extracting a Profile Breakdown

- Import the language type
- Generate a profile
- Evaluate the profile using \[incr\_tsdb()\]

## Detailed Processes

This section describes step-by-step instructions on how to perform
various tasks and sub-tasks with MatrixTDB.

### Database Dump

If you're not sure of the effect of what you are about to do, you may
want to make a dump of the database so that the data can be quickly
restored if what you do doesn't go the way you want. To do this:

- Run the following command:
  - $ mysqldump -h capuchin.ling.washington.u -u username -p
--result-file=resultfile dbname
  
  <!-- -->

  
  - The arguments are as folows:
    - username - your username for the database
    - resultfile - the name of the file you want to dump the
backup to.
    - dbname - the name of the database on capuchin to backup.
Currently MatrixTDB2 is the database we are using.

Note: This won't actually back up the data per se, but it will create a
(very large) file full of SQL statements that can be used to restore the
database to its state at the time of the dump.

### Restore From Database Dump

If you want to revert the database to a previous point:

- Log in to the database
- Issue the following command:
  - mysql&gt; source filename
  
  <!-- -->

  
  - where filename is the name of the file with the dump you want to
revert to.

### Create A Source Profile

Source profiles (sometimes also called 'original source profiles') are
what are used to bring the big, hairy mrs semantics into the database.
To create one:

- Create a flat file with one harvester string per line
- Start LKB and load the grammar you want to use to create the mrs
semantics to import
- Start \[incr\_tsdb()\] and process all the items in that file

### Import A Source Profile

Source profiles (sometimes also called 'original source profiles') are
what are used to bring the big, hairy mrs semantics into the database.
When you have a \[incr\_tsdb()\] profile that was created by processing
a flat file of items you can use that to import a source profile into
the database. To do so:

- Create a file that has each harvester string in your profile on a
line preceded by its mrs tag and a '@' E.g., wo1@n1 iv
- Run the following command:
  - $ python import\_from\_itsdb.py itsdbDir harvMrsFilename
choicesFilename
  
  <!-- -->

  
  - The arguments are as follows:
    - itsdbDir - the absolute directory of your \[incr\_tsdb()\]
directory. Be sure to end it in a '/'
    - harvMrsFilename - the name of the file you created above
with mrs tags and harvester strings
    - choicesFilename - the choices file of the grammar you used
to create the profile
- The system will prompt for a username and password to the database
- The system may ask you if the tags you're adding really are new or
if you want to replace the existing tags with the new semantics you
are importing. Answer appropriately. If the system indicates you are
changing some semantics, make sure that is what you want to do.
- The system will also ask you for a description of the source
profile. It can be up to 1000 characters.
- The system will import the profile and, if the choices file you used
represents a language type not already in the database, will create
a language type for that, too. It will return the osp\_id which you
will need to add permutes and run specific filters and the language
type, which you will need to add permutes run specific filters

### Add Permutes

At this point you will have imported a profile with its harvester
strings. But a harvester string just yields to potentially millions of
other possible strings with the same semantics. Specifically, each
harvester string gives rise to seed strings which are then permuted and
added to the database as string to be run through specific filters.
(Earlier versions of MatrixTDB added all permutations which were run
through universal filters and then specific filters, but more recently
only those string/semantic tag combos that pass all universal filters
are being added to the database.) Seed strings are stored in a canonical
form: words in alphabetic order followed by prefixes in alphabetic order
followed by suffixes in alphabetic order. Permutations are then every
possible permutation of the words with every possible permutation of
prefixes and suffixes on every word in every one of those permutations.
Seed strings are generated from harvester strings by the stringmods in
stringmod.py. Here is how to generate all the permutations for an
imported original source profile:

- Make sure stringmods is updated to meet your needs (optional)
- Create a condor file. A template is in the repository named
addPerms.cmd
  - change ospID to be the ID of the source profile you want to
create permutes for
  - change username to be your username to the MatrixTDB database
  - change password to be your password to the MatrixTDB database
- Submit your command file to condor with the following line:
  - $ condor\_submit addPerms.cmd
- The process may take many hours depending on how many strings you
have and how long they are. Two ways to monitor the progress are to
check the count of records in the result table or to check the
.warning file from time to time.

### Run Specific Filters

At this point you will have inserted every permutation that passes all
universal filters for your source profile into the item\_tsdb, parse,
and result tables. At this point we need to record how the string/mrs
combos fare when run through specific filters so that we can generate
profiles for language types based on the the results of those runs
through filters. Here's how:

- Make sure s\_filters.py has the filters in it specific to the
phenomena you are concerned with (optional)
- Create a condor file. A template is in the repository named
runSFltrs.cmd
  - change ospID to be the ID of the source profile you want to
create permutes for
  - change username to be your username to the MatrixTDB database
  - change password to be your password to the MatrixTDB database
- Submit your command file to condor with the following line:
  - $ condor\_submit runSFltrs.cmd
- The process may take a few hours depending on how many permutations
passed all universal filters in this OSP. Two ways to monitor the
progress are to check the count of records in the res\_sfltr table
or to check the .warning file from time to time.

### Import A Language Type

- Create a choices file from the customization system
- Run the following command:
  - $ python sql\_lg\_type.py filename
  
  <!-- -->

  
  - where filename is the full path and filename of the choices file
you downloaded
- You will be prompted for the username and password to the database.
- If the language type already exists, it will return its ID.
- If the language type does not already exist, the system will ask if
the language type is randomly created or purpose-built. Answer r or
p as appropriate. Unless you're just testing phenomena coverage of
MatrixTDB itself, yours is probably purpose-built.
- The system will prompt you for a short comment describing your
language type. You can enter the name of the language or the
phenomena you're testing (e.g., v-final), or whatever you feel is
appropriate
- The system will then create a language type in the database and give
you an lt\_id (language type ID) that you can use to generate a
\[incr\_tsdb()\] profile for validation

### Generate A Profile

- Make sure you have a language type ID that you want to generate the
profile for. You can get the ID by querying the lt table or by
importing a language type(see: HOW TO IMPORT A LANGUAGE TYPE)
- Run the following command:
  - $ python generate\_s\_profile.py lt\_id dbroot profilename
  
  <!-- -->

  
  - where the three arguments are:
    - lt\_id - the language type ID you are generating the profile
for
    - dbroot - the absolute path where you want the profile
created
    - profilename - the name of the profile to create
- You will be prompted for the username and password to the database.
- The system will generate two profiles in dbroot: \[profilename\] and
\[profilename\]gold. The gold version should be processed in
\[incr\_tsdb()\] and used as the gold standard

### Evaluate A Generated Profile In \[incr\_tsdb()\]

- Start LKB and load the grammar that corresponds to the language type
you generated the profile for
- Start \[incr\_tsdb()\] and set the dbroot to the directory where you
generate the profile
- Process all the items in the gold profile to create the gold
standard
- Set the gold profile to be the gold standard
- Set readings and mrs to be the things compared in the intersection
- Select the non-gold profile you are evaluating.
- Run Compare-&gt;Detail.
- If MatrixTDB output is good, the only differences you see should be
that items with -1 readings in the gold should have 0 readings in
MatrixTDB.
- You can remove readings from the intersection and if MatrixTDB is
right there will be no differences in Compare-&gt;Detail.

### Write A Stringmod

In stringmod.py, the subclasses of the [StringMod](/StringMod) class
define ways in which a harvester string can be modified to create a seed
string. All the stringmod instantiations that are applied to harvester
strings are defined in the string\_mods list near the end of the file.
To create a new stringmod, you need to instantiate a new
[StringMod](/StringMod) subclass and put it in that string\_mods list.
Note that every possible combination of the string\_mods list is run to
create seeds from harvester strings. For example, there is a mod that
adds the word p-nom and another that adds the word p-acc. If these were
the only two modifications, each harvester string would result in four
seed strings: one with p-nom, one with p-acc, one with both, and one
with neither.)

To create a new instance of a [StringMod](/StringMod) subclass, you need
to determine the subclass to instantiate as well as how to set the
member values. Here is an overview of the subclasses:

[StringModAddWord](/StringModAddWord) - adds a word to the string
[StringModAddAff](/StringModAddAff) - adds an affix to the string (both
as a prefix and in another string as an affix)
[StringModDropWord](/StringModDropWord) - removes a word from a string
if present [StringModChangeWord](/StringModChangeWord) - changes a word
in a string to another word. Not currently used.

Once you've chosen the subclass to instantiate, call its constructor in
the string\_mods list, settings its arguments as appropriate:
mrs\_id\_list - a list of mrs\_tags to which this stringmod applies.
Common groupings of these tags are defined in g.py. word1 - for
[AddWord](/AddWord), [AddAff](/AddAff), or [DropWord](/DropWord), this
is the word to add, the affix to add, or the word to drop. For
[ChangeWord](/ChangeWord) it is the word to change. word2 - for
[ChangeWord](/ChangeWord) only, this is the word to replace word1 with

### Write A Filter

When you write a filter, first consider whether it is a universal filter
or a specific filter. A universal filter is something that can rule out
a string regardless of language type. A specific filter is something
that can rule out a string but is dependent on language type. For
example, ruling out any sentence where the subject or object follows the
verb in an sov language type.

To create a new filter, you need to create a new instance of a Filter
subclass in either u\_filters.filter\_list or s\_filters.filter\_list.

To create a new instance of a Filter subclass, you need to determine the
subclass to instantiate as well as how to set the member values. Here is
an overview of the subclasses and how they interact with their re1 and
re2 regular expression members. These classes are defined in filters.py:
[FalseFilter](/FalseFilter) - always returns fail
[MatchFilter](/MatchFilter) - passes strings that contain re1, fails all
others [NotMatchFilter](/NotMatchFilter) - fails strings that contain
re1, passes all others [IfFilter](/IfFilter) - fails strings that
contain re1 but not re2, passes all others [IfNotFilter](/IfNotFilter) -
fails strings that contain both re1 and re2, passes all others
[OrFilter](/OrFilter) - passes strings that contain either re1, re2, or
both, fails all others other existing subclasses have been deprecated
due to redundancies and should not be used, though more may be created
later

After setting the Filter subclass and the regular expression members re1
and re2, if appropriate, set the other members of the Filter:

name - Just make sure it's unique among all filters

mrs\_id\_list - This is a list of the mrs tags that this filter should
apply to. For example, a filter that ensures that neg appears as a
prefix or a suffix if inflectional negation is obligatroy would only
apply to sentences with negative semantics. You can either create your
own list of strings that are mrs tags or use one of the many lists
created in g.py.

comment - Describe what the Filter does

fv - Only relevant to specific filters. The 'fv' stands for
'feature/value' and this is a formatted list of features and values that
have to be set in a language type for a filter to be relevant to that
language type. It has many aspects to it:

- length - The list can either be of length one or three or more. If
it is of length one it should be one feature/value pair. If it is of
length three or more, its first element must be 'and' or 'or' and
the later elements must be feature/value pairs or lists that must be
formatted in the same ways that a root fv list must be.
- feature/value pairs - With its combination of ands, ors, and
feature/value pairs encapsulated in lists, the fv list corresponds
to a set of feature/value pairs that must be present for a filter to
apply. The feature value pairs are encoded as strings in the form
'feature:value'. For example, the fv list \['or',
'word-order:svo','word-order:sov','word-order:vso'\] means that the
filter applies if the word-order feature in the language type is set
to svo, sov, or vso.
- features with no value - Sometimes a feature/value pair appears with
no value listed. In these cases, this is interpreted as meaning that
that feature must not be set to any value. For example, the fv list
\['or', 'q-inv:', 'q-inv-verb:main'\] means that the filter applies
if either the q-inv-verb feature is set to main or the q-inv feature
is absent in the choices file
- regex matches - With iterator features now in choices files, writing
filters becomes more complicated because the developer cannot rely
on a given feature being named in a particular way. For example, we
never know what number the slot for negation will be placed in. To
address this, filters now also apply if the feature/value pairs is a
regular expression match with the choices file/language type. For
example the feature/value pair
verb-slot\[1-9\]\_morph\[1-9\]\_feat\[1-9\]\_name:negation would
apply if any feature whose name matches the range-filled regular
expression before the colon has a value of negation
  - groups and backreferences - The regex matches go further.
Sometimes it's not enough just to match one feature to a regex
but we want to be sure that there are corresponding features
that work together to ensure a certain phenomenon. To this end
the system also recognizes groups and backreferences with a
given filter. Groups are indicated by sets of parentheses in
regular expressions and backreferences are escaped integers
where the integer refers to the groups in the order they appear,
beginning at 1. For example, in the fv list \['and',
'verb-slot(\[1-9\])\_morph\[1-9\]\_feat\[1-9\]\_name:negation',
'verb-slot\\\\1\_order:before'\], the backreference \\\\1
matches when the number that actually appears there matches the
number that actually appears after verb-slot in the prior
feature. This fv list means that the filter applies when there
is morphological negation that comes before the verb.

## Definitions

item - Almost always used to mean a string representing a sentence.
Sometimes used specifically to mean the item file in a profile or its
MatrixTDB table counterpart, item\_tsdb.

item/parse/result - A phrase used to mean a pairing of a sentence and
meaning

profile - Refers to a \[incr\_tsdb()\] profile

result - Has two meanings. The first relates to the result file in a
\[incr\_tsdb()\] profile and means the string/mrs pair that is a
sentence and its meaning. The second meaning is the answer received
(e.g., pass, fail) of running the first definition of a result through a
filter.

source profile - Specifically refers to a profile that was created by
processing a list of items in order to get the mrs semantics into
MatrixTDB

Last update: 2009-09-17 by anonymous [[edit](https://github.com/delph-in/docs/wiki/MatrixTDBProcedures/_edit)]{% endraw %}