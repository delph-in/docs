{% raw %}# TSQL: Test Suite Query Language

TSQL is a query language for selecting data from [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) test suites partially described
in [TSNLP User Manual (Volume
2)](http://www.delph-in.net/tsnlp/ftp/manual/volume2.ps.gz).

TSQL is generally used for selecting rows or columns of data from test
suites themselves, although it also has faculties for inspecting or
setting [\[incr tsdb()\]](http://www.delph-in.net/itsdb) variables and
for inserting data into test suites. Some examples of select queries
include:

Find the item IDs and grammatical sentences that didn't parse:

    select i-id i-input where i-wf = 1 and readings = 0

Pair input sentences with their MRS outputs:

    select i-input mrs

Find sentences with fewer than 10 words:

    select i-input where i-length < 10

## TSQL Syntax

```
   1 Query        := ( Info | Set | Retrieve | Insert ) ( '.' | $ )
   2 Info         := 'info' ( 'all' | 'relations' | Relation | TsdbConstant | TsdbVariable )
   3 Set          := 'set' TsdbVariable ( Integer | String | ':on' | ':off' )
   4 Retrieve     := ( 'retrieve' | 'select' ) SelectBody
   5 SelectBody   := ( Attribute+ | '*' )
   6                 [ 'from' Relation+ ]
   7                 [ 'where' Disjunction ]
   8                 [ 'report' FormatString ]
   9 Insert       := 'insert' 'into' Relation [ Attribute+ ]
  10                          'values' ( Integer | String | DateTime )+
  11 
  12 TsdbConstant := 'home'
  13               | 'tsdb_home'
  14               | 'relations-file'
  15               | 'tsdb_relations_file'
  16               | 'data-path'
  17               | 'tsdb_data_path'
  18 TsdbVariable := 'result-path'
  19               | 'tsdb_result_path'
  20               | 'result-prefix'
  21               | 'tsdb_result_prefix'
  22               | 'max-results'
  23               | 'tsdb_max_results'
  24               | 'uniquely-project'
  25               | 'tsdb_uniquely_project'
  26 
  27 Relation     := Identifier
  28 Attribute    := Identifier
  29 
  30 Disjunction  := Conjunction ( '|' | '||' | 'or'  Conjunction )*
  31 Conjunction  := Condition ( '&' | '&&' | 'and' Condition)*
  32 Condition    := Attribute ( '=' | '==' | '!=' | '~' | '!~' ) String
  33               | Attribute ( '=' | '==' | '!=' | '<' | '>' | '<=' | '>=' ) ( Integer | DateTime )
  34               | ( '!' | 'not' ) Condition
  35               | '(' Disjunction ')'
  36 
  37 FormatString := String
  38 
  39 Integer      := /[+-]?[0-9]+/
  40 Digit        := /[0-9]+]
  41 
  42 String       := /"([^"\\]|\\.)*"/"
  43               | /'([^'\\]|\\.)*'/
  44 
  45 DateTime     := Date [ ( Time | '(' Time ')' ) ]
  46               | [ ':' ] 'today'
  47               | [ ':' ] 'now'
  48 Date         := FullYear Month [ '-' Day ]
  49               | [ Day '-' ] Month '-' Year
  50 FullYear     := Digit Digit Digit Digit
  51 Year         := [ Digit Digit ] Digit Digit
  52 Month        := [ Digit ] Digit
  53               | MonthName
  54 MonthName    := 'jan' | 'feb' | 'mar' | 'apr' | 'may' | 'jun'
  55               | 'jul' | 'aug' | 'sep' | 'oct' | 'nov' | 'dec'
  56 Day          := [ Digit ] Digit
  57 Time         := Digit Digit ':' Digit Digit [ ':' Digit Digit ]
  58 
  59 Identifier   := Character ( Character | Digit | '-' | '_' )+
  60 Character    := /[a-zA-Z]+/
```

### Notes on the Syntax

Different publications and implementations have some differences in the
syntax. Some of those differences are listed here, excepting obvious
bugs in the BNFs, as well as some general notes about the query
language.

#### Case Sensitivity

Some literals in the syntax (e.g., select, info, or from) are
case-insensitive, but relation (table) names, attributes (column names),
and some other literals (e.g., all, relations, tsdb\_home, etc.) are
case-sensitive. The names of months in dates are case-insensitive.

#### Date Formats

The TSNLP version of TSQL does not define or accept YYYY-MM-DD dates,
nor does it define MonthName forms (although it appears to accept them).
Note that MonthName may be locale-dependent.

#### Report Formatting

FormatString does not appear to be defined or even described anywhere in
prior literature. From my experiments, it seems to be a [printf
string](https://en.wikipedia.org/wiki/Printf_format_string) with format
specifiers (%s, %d, or %i) used to insert column values (though it does
not appear to matter which is used; e.g., %d could be used for a :string
value, etc.). For instance, a query like:

    select i-id i-input i-date

...could use up to three format specifiers (any more *may* trigger an
error), such as:

    report "ID=%s,Input=%s,Date=%s"

If fewer than three format specifiers are used, the remaining data is
output in [\[incr tsdb()\]](http://www.delph-in.net/itsdb) table format.

#### Order of Operations in Conditions

The TSNLP definition of TSQL syntax does not specify an order of
operations for boolean operations on conditions. In the BNF above, I
specifically scoped disjunctions over conjunctions, which seems to
follow the behaviour of LOGON's tsdb -query utility. Thus, the following
query would match items with i-id = 10 whether or not its i-input
matched \[Dd\]og:

    select i-input where i-id = 10 or i-id = 20 and i-input ~ "[Dd]og"

Parentheses can be used to override this order:

    select i-input where (i-id = 10 or i-id = 20) and i-input ~ "[Dd]og"

## Implementation Differences

The [PyDelphin](https://github.com/delph-in/pydelphin/) implementation
of TSQL as of 2018-10-05 only includes select queries without report
clauses. It differs from the LOGON tsdb -query utility in some ways:

- select \* requires a from clause
- select \* from item result does not also include columns from parse
(the "intervening" table joined in order to join item and result)
- select \* from item where readings &gt; 0 does not include columns
from parse (where readings is defined)

PyDelphin also adds a couple features:

- Attributes in the projection (column list) and where clause of the
query may optionally use qualified names to specify both the table
and column (e.g., result.parse-id)
- Multiple where clauses may be used which act as a conjunction scoped
over disjunctions. Thus, the following is the same as the
parenthesized form in the "Order of Operations in Conditions"
section above.
  
  -      select i-input where i-id = 10 or i-id = 20 where i-input ~ "[Dd]og"

Multiple where clauses are useful for assembling queries. A user may add
an additional global constraint by appending a new where clause without
having to worry about altering the order of operations of existing
conditions.

## Feature Requests

1\. adding support for left/right/inner joins. See
<https://github.com/delph-in/pydelphin/issues/321>.

Last update: 2020-11-04 by AlexandreRademaker [[edit](https://github.com/delph-in/docs/wiki/TsqlRfc/_edit)]{% endraw %}