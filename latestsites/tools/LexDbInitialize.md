{% raw %}# HOW TO set up LexDB for use

Note: this page has been reconfigured so it contains the information
which is general between single and multi user mode. You should read
this after looking at [LkbLexDbMultiUser](https://delph-in.github.io/docs/tools/LkbLexDbMultiUser) or
[LkbLexDbSingleUser](https://delph-in.github.io/docs/tools/LkbLexDbSingleUser).

- Obtain lexicon in LexDB dump format
- Set LKB lexicon to LexDB

## Obtaining a lexicon in LexDB dump format

**Either**

- you have an existing grammar for which these are provided; **or**
- you must convert an existing .tdl lexicon to LexDB dump format:
  
  - Run the LKB.
  - Load the grammar with the existing .tdl lexicon file(s) in
normal manner.
  - Connect to the skeletal LexDB:
(lkb::initialize-lexdb :dbname "erg")
  - Evaluate (lkb::export-lexicon) to create LexDB dump files. (You
will be asked to provide values for certain meta-level database
fields.)
  - The dump files (.rev, .dfn, .fld, .meta) will be created in your
"LKB temp" directory. Any entries which could not be exported
(eg. their structure could not be fully described using the
mapping in the .dfn field mapping file) will appear in a
corresponding .skip file (which can be treated as a standard TDL
lexicon file).
  - (Note: If the grammar contains more than one lexicon each will
be dumped separately.

## HOW TO set LKB lexicon to LexDB

The LexDB functions as an alternative to the textual lexicon.tdl file.
The lexical database functionality is configured via the LKB user
parameter \*lexdb-params\* (*LKB menu-&gt;Options-&gt;Set Options*).

Specify the name of the lexical database we will connect to and whether
we want to use single or multi user mode.

((:dbname "erg") (:type :multi-user)) 

**or**

((:dbname "erg") (:type :single-user)) 

In addition to :dbname and :type, the following may also be set:

- :user - username for database server login - default is your shell
login
- :port - port of database server - defaults to PGPORT
- :host - specify a non-local host
- :table - specify active mode (see dfn table) - default is value of
:dbname
- Edit the script file to replace call of form

{{{ (read-cached-lex-if-available

- (list
  - (lkb-pathname (parent-directory) "lexicon.tdl")
  
  ))}}}

with the following

{{{ ;; optionally, use a lexical database;

- ;; to activate the DB set \*lexdb-params\* (see globals.lsp) (if
\*lexdb-params\*
  - (load-lexdb-from-script) (read-cached-lex-if-available
    - (list
      - (lkb-pathname (parent-directory) "lexicon.tdl") )))}}}

<!-- -->


- Load the grammar using modified script file.
- Note: if you ever want to stop using the Lex DB, simply change the
value of \*lexdb-params\* to NIL before loading the grammar.

## Debug

If you are getting the following error, comment out
(index-for-generator) in grammar/lkb/script.

{{{(LexDB) (postgres) ERROR: relation "semi\_pred" does not exist Error:
Attempt to throw to the non-existent tag :SQL-ERROR

- \[condition type: CONTROL-ERROR\]}}}

Or, create the semi tables with the following two commands:

{{{(lkb::new-lex-key-table lkb::\*lexicon\*) (lkb::new-semi
lkb::\*lexicon\*)}}}

Last update: 2009-04-10 by AnnCopestake [[edit](https://github.com/delph-in/docs/wiki/LexDbInitialize/_edit)]{% endraw %}