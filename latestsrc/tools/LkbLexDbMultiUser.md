{% raw %}# MULTI USER LexDB

- First, set up psql. This is discussed in
[LexDbPsqlInitialize](https://delph-in.github.io/docs/tools/LexDbPsqlInitialize).
- The next steps are to initialize a database, populate it with
lexicon entries and finally to tell the LKB to use this when you
load a grammar. The database initialization described here is for
multi user mode. The subsequent steps are similar for single user
and multi user mode and are described in
[LexDbInitialize](https://delph-in.github.io/docs/tools/LexDbInitialize).

## HOW TO initialise LexDB

You must create a new database to hold the LexDB. The LexDB-specific
database structures must then be initialized. For the purpose of these
instructions assume the LexDB will be called erg with LexDB config files
\~/erg/lexdb.\*; if you do not yet have a .fld and a .dfn file you must
create these before proceeding (see
[LexDbFieldMappings](https://delph-in.github.io/docs/tools/LexDbFieldMappings)); you also need a .rev file
with which to populate the database.

- At shell prompt (M$ Windows users will need Cygwin):

<!-- -->


     $ cd lkb/lexdb
     $ bash install-lexdb.sh erg ~/erg lexdb

(Note: The encoding for the lexical database will be set to UNICODE.)

- You can view the field mappings in the field **dfn** just to make
sure:

<!-- -->


    user@localhost:~/lkb/lexdb$ psql erg
    Welcome to psql 8.3.5, the PostgreSQL interactive terminal.
    
    Type:  \copyright for distribution terms
           \h for help with SQL commands
           \? for help with psql commands
           \g or terminate with semicolon to execute query
           \q to quit
    
    erg=> select * from dfn;
     slot  |     field     |              path              |    type
    -------+---------------+--------------------------------+------------
     id    | name          |                                | sym
     orth  | orthography   |                                | str-rawlst
     unifs | alt2key       | (synsem lkeys alt2keyrel pred) | mixed
     unifs | altkey        | (synsem lkeys altkeyrel pred)  | mixed
     unifs | altkeytag     | (synsem lkeys altkeyrel carg)  | str
     unifs | compkey       | (synsem lkeys --compkey)       | sym
     unifs | keyrel        | (synsem lkeys keyrel pred)     | mixed
     unifs | keytag        | (synsem lkeys keyrel carg)     | str
     unifs | ocompkey      | (synsem lkeys --ocompkey)      | sym
     unifs | orthography   | (stem)                         | str-lst
     unifs | pronunciation | (synsem phon onset)            | sym
     unifs | dialect       | (dialect)                      | sym
     unifs | type          | nil                            | sym
    (13 rows)

## HOW TO create skeletal (empty) LexDB

As above, but use an empty .rev file. This can be created with a shell
command such as the following:

    echo '' > lexdb.rev

## HOW TO get the LKB to use the Lex DB

See [LexDbInitialize](https://delph-in.github.io/docs/tools/LexDbInitialize)

Last update: 2009-04-10 by AnnCopestake [[edit](https://github.com/delph-in/docs/wiki/LkbLexDbMultiUser/_edit)]{% endraw %}