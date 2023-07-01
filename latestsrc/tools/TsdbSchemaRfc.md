{% raw %}# TSDB Schema Descriptions

[TSDB](https://delph-in.github.io/docs/tools/TsdbTop) is the file-based relational database used to store
[test suites](https://delph-in.github.io/docs/tools/ItsdbProfile) of sentences with related information used
by tools such as [\[incr tsdb()\]](http://www.delph-in.net/itsdb),
[art](http://sweaglesw.org/linguistics/libtsdb/art), and
PyDelphin. The schema description of a TSDB database
(colloquially called a "relations file") describe the tables and columns
in the database. Below is an example of a partial TSDB schema:

    set:
      s-id :integer :key
      p-id :integer :key :partial
      s-author :string
      s-date :date
    
    item-phenomenon:
      ip-id :integer :key
      i-id :integer :key
      p-id :integer :key
      ip-author :string
      ip-date :date
    
    item-set:
      i-id :integer :key :partial
      s-id :integer :key
      polarity :integer

The table names are set, item-phenomenon, and item-set and following it
are the column names, their datatypes, and other flags. It would
translate straighforwardly to the following SQL schema:

```
   1 CREATE TABLE "set" (
   2   "s-id" INTEGER,
   3   "p-id" INTEGER,
   4   "s-author" TEXT,
   5   "s-date" DATETIME
   6 )
   7 
   8 CREATE TABLE "item-phenomenon" (
   9   "ip-id" INTEGER,
  10   "i-id" INTEGER,
  11   "p-id" INTEGER,
  12   "ip-author" TEXT,
  13   "ip-date" DATETIME
  14 )
  15 
  16 CREATE TABLE "item-set" (
  17   "i-id" INTEGER,
  18   "s-id" INTEGER,
  19   "polarity" INTEGER
  20 )
```

Note that the :key constraint in the TSDB schema does not translate
directly to the SQL notion of a "primary key", but rather that it is a
column that may be used by other tables for the purpose of joins
(source: [TSNLP User Manual (Volume
2)](http://www.delph-in.net/tsnlp/ftp/manual/volume2.ps.gz), p27).

## TSDB Schema Syntax

The following syntax of TSDB schemas is mostly inferred from the [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) Lisp code (except for
comments).

```
   1 Schema     := (Table | EOL)*
   2 
   3 # Each table schema is followed by at least one blank line
   4 Table      := WS* TableName ":" EOL Column* Newline+
   5 TableName  := /[^:]+/
   6 
   7 # Only the column name is required
   8 Column     := WS* Name (WS+ (Flag|DataType))* EOL
   9 ColumnName := /[^ ]+/
  10 DataType   := ":integer" | ":string" | ":date" | ":position"
  11 Flag       := ":key" | ":unique"
  12 
  13 # Whitespace, etc.
  14 Comment    := "#" /.*/
  15 WS         := /[\s\t]/
  16 EOL        := WS* Comment? NewLine
  17 NewLine    := /\n/
```

Note that the datatype :position and flag :unique do not appear in any
current profiles but the flag :partial does. None of these, however,
appear to have any effect.

## Proposed Extension

In order to make the schema descriptions correspond more directly to SQL
databases, I propose the following variations:

- restrict table and column names to be /\[a-zA-Z-\]/; specifically I
want to rule out dot (.), colon (:), and spaces in the names so it
doesn't interfere with other parts of the syntax (such as
[TSQL](https://delph-in.github.io/docs/tools/TsqlRfc)), and to prevent a source of SQL injection when
dynamically creating an SQL database (since table and column names
cannot be parameterized, only literal values)
- fix the position of the datatype to be immediately after the column
name and make it required; this is just following convention
- :primary indicates a primary key used to ensure unique rows. If
multiple fields in a table use :primary, it is a [candidate
key](https://en.wikipedia.org/wiki/Candidate_key) (also called a
"composite key"). :primary implies :key. I think this is what
:partial is meant to convey but it is not actually used in this way.
- :foreign(...) specifies that the column values are primary keys of
another table, where ... is the column specifier. If ... is just a
table name (e.g., :foreign(item), then it is the column of the same
name in that table. Otherwise it is a table and column name (e.g.,
:foreign(item.i-id)). :foreign implies :key
- remove :position, :unique, and :partial from the spec (or make it
clear what they do)
- add :float (or :real) datatype

It would look like this (assuming I interpreted the constraints in the
original file correctly)

    set:
      s-id :integer :primary
      p-id :integer :foreign(phenomenon)
      s-author :string
      s-date :date
    
    item-phenomenon:
      ip-id :integer :primary
      i-id :integer :foreign(item)
      p-id :integer :foreign(phenomenon)
      ip-author :string
      ip-date :date
    
    item-set:
      i-id :integer :primary :foreign(item)
      s-id :integer :primary :foreign(set)
      polarity :integer

This would correspond to the following SQL:

```
   1 CREATE TABLE set (
   2   "s-id" INTEGER,
   3   "p-id" INTEGER,
   4   "s-author" TEXT,
   5   "s-date" DATETIME,
   6   FOREIGN KEY ("p-id") REFERENCES phenomenon ("p-id"),
   7   PRIMARY KEY ("s-id")
   8 );
   9 CREATE TABLE "item-phenomenon" (
  10   "ip-id" INTEGER,
  11   "i-id" INTEGER,
  12   "p-id" INTEGER,
  13   "ip-author" TEXT,
  14   "ip-date" DATETIME,
  15   FOREIGN KEY ("i-id") REFERENCES item ("i-id"),
  16   FOREIGN KEY ("p-id") REFERENCES phenomenon ("p-id"),
  17   PRIMARY KEY ("ip-id")
  18 );
  19 CREATE TABLE "item-set" (
  20   "i-id" INTEGER,
  21   "s-id" INTEGER,
  22   "polarity" INTEGER,
  23   FOREIGN KEY ("i-id") REFERENCES item ("i-id"),
  24   FOREIGN KEY ("s-id") REFERENCES "set" ("s-id"),
  25   PRIMARY KEY ("i-id", "s-id")
  26 );
```

And here is the updated syntax description:

```
   1 Schema   := (Table | EOL)*
   2 
   3 # Each table schema is followed by at least one blank line
   4 Table    := WS* Name ":" EOL Column* Newline+
   5 
   6 # Column name and datatype are required
   7 Column   := WS* Name WS+ DataType (WS+ Flag)* EOL
   8 DataType := ":integer" | ":string" | ":date" | ":float"
   9 Flag     := ":key"
  10           | ":primary"
  11           | ":foreign" WS* "(" WS* QName WS* ")"
  12 
  13 QName    := Name ("." Name)?
  14 Name     := /[a-zA-Z-]+/
  15 
  16 # Whitespace, etc.
  17 Comment  := "#" /.*/
  18 WS       := /[\s\t]/
  19 EOL      := WS* Comment? NewLine
  20 NewLine  := /\n/
```

Last update: 2019-06-04 by MichaelGoodman [[edit](https://github.com/delph-in/docs/wiki/TsdbSchemaRfc/_edit)]{% endraw %}