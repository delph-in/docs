{% raw %}## HOW TO create initial .fld file

Modify the example file in lkb/lexdb/example.fld to fit your needs. A
sample file is shown below:

    type TEXT
    orthography TEXT
    keyrel TEXT
    altkey TEXT
    alt2key TEXT
    keytag TEXT
    altkeytag TEXT
    compkey TEXT
    ocompkey TEXT
    pronunciation TEXT
    complete TEXT
    semclasses TEXT
    preferences TEXT
    classifier TEXT
    selectrest TEXT
    jlink TEXT
    comments TEXT
    exemplars TEXT
    usages TEXT
    lang TEXT
    country TEXT
    dialect TEXT
    domains TEXT
    genres TEXT
    register TEXT
    confidence real DEFAULT 1
    source TEXT

Note: This text is injected verbatim inside a CREATE TABLE statement as
part of the initialization script. If the script spits out an error you
may need to double quote certain field names (for example, case must be
quoted when used as a field name: "case").

## UNDERSTANDING the FLD table

This table provides field definitions for the rev table.

The rev table is built by taking the following built-in field
definitions

            name TEXT NOT NULL,
            userid TEXT DEFAULT user NOT NULL,
            modstamp TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
            dead INTEGER DEFAULT 'f' NOT NULL

and defining further fields using the contents of the .fld file provided
to the install-lexdb initialization script. We store these user-defined
field definitinos in the table fld for later reference. \[NOTE: since
field order in rev is critical, whilst entries in the fld table are
conceptually *unordered*, this approach is not strictly correct. FIX
ME\]

## HOW TO create initial .dfn file

Modify the example file in lkb/lexdb/example.dfn to fit your needs.

## UNDERSTANDING the DFN table

Lexical entries in the database are stored as a collection of field
values. These field values must be mapped to AVMs before use in a
processing environment. We achieve this by providing a mapping from
fields to TDL structure, allowing the existing machinery (which works on
the TDL notation) to take over.

For example, we map the following entry from the database

               NAME: bombard_v1                                         
             USERID: danf
           MODSTAMP: 2003-11-01 00:00:00+00
               DEAD: f                                                  
               TYPE: v_np_trans_le                                      
        ORTHOGRAPHY: bombard                                            
             KEYREL: "_bombard_v_rel"                                   
             ALTKEY:                                                    
            ALT2KEY:                                                    
             KEYTAG:                                                    
          ALTKEYTAG:                                                    
            COMPKEY:                                                    
           OCOMPKEY:                                                    
      PRONUNCIATION: con                                                
           COMPLETE:                                                    
         SEMCLASSES:                                                    
        PREFERENCES:                                                    
         CLASSIFIER:                                                    
         SELECTREST:                                                    
              JLINK:                                                    
           COMMENTS:                                                    
          EXEMPLARS:                                                    
             USAGES:                                                    
               LANG: EN                                                 
            COUNTRY: US                                                 
            DIALECT:                                                    
            DOMAINS:                                                    
             GENRES:                                                    
           REGISTER:                                                    
         CONFIDENCE: 1                                                  
             SOURCE: LinGO                                              

to the following TDL entry

    bombard_v1 := v_np_trans_le &
     [ STEM < "bombard" >,
       SYNSEM [ LKEYS.KEYREL.PRED "_bombard_v_rel",
                PHON.ONSET con ] ].

by means of the following field mappings:

     mode | slot  |     field     |              path              |    type
    ------+-------+---------------+--------------------------------+-------------
     erg  | id    | name          |                                | symbol
     erg  | orth  | orthography   |                                | string-list
     erg  | unifs | alt2key       | (synsem lkeys alt2keyrel pred) | mixed
     erg  | unifs | altkey        | (synsem lkeys altkeyrel pred)  | mixed
     erg  | unifs | altkeytag     | (synsem lkeys altkeyrel carg)  | string
     erg  | unifs | compkey       | (synsem lkeys --compkey)       | symbol
     erg  | unifs | keyrel        | (synsem lkeys keyrel pred)     | mixed
     erg  | unifs | keytag        | (synsem lkeys keyrel carg)     | string
     erg  | unifs | ocompkey      | (synsem lkeys --ocompkey)      | symbol
     erg  | unifs | orthography   | (stem)                         | string-fs
     erg  | unifs | pronunciation | (synsem phon onset)            | symbol
     erg  | unifs | type          | nil                            | symbol

The mode should be set to the name of the lexical database in use. slot
takes values id, orth, and unifs (these relate to internal LKB
structures). The id and orth lines above should not be changed. Each
unifs line define a mapping to a certain TDL substructure. These
mappings are determined by the remaining fields: field specifies the
database field involved in the mapping; path defines the TDL path set by
the mapping; type determines the mapping from database field value to
TDL substructure.

Possible values of type:

- sym: eg. sym 'value' -&gt; VALUE
- str: eg. str '"value"' -&gt; "value"
- mixed: eg. mixed '"value"' -&gt; "value"; mixed 'value' -&gt; VALUE
- str-rawlst: str-rawlst 'one two' -&gt; ("one" "two")
- str-lst:

<!-- -->


          str-lst 'one two' ->
    
    [ FIRST "one",
      REST.FIRST "two",
      REST.REST *NULL* ]

- for which the TDL shorthand is &lt; "one", "two" &gt;

<!-- -->


- str-dlst:

<!-- -->


          str-dlst 'one two' ->
    [ LIST.FIRST "one",
      LIST.REST.FIRST "two",
      LIST.REST.REST #1,
      LAST #1 ]

- for which the TDL shorthand is &lt;! "one", "two" !&gt;

<!-- -->


- lst:

<!-- -->


          (lst NODE1 NODE2) 'one * "two"' ->
    
    [ FIRST.NODE1.NODE2 ONE,
      REST.FIRST.NODE1.NODE2 *TOP*,
      REST.REST.FIRST.NODE1.NODE2 "two",
      REST.REST.REST *NULL* ]

- for which the TDL shorthand is
&lt; \[NODE1.NODE2 ONE\], \[\], \[NODE1.NODE2 "two"\] &gt;

<!-- -->


- dlst:

<!-- -->


          (lst NODE1 NODE2) 'one * "two"' ->
    
    [ LIST.FIRST.NODE1.NODE2 ONE,
      LIST.REST.FIRST.NODE1.NODE2 *TOP*,
      LIST.REST.REST.FIRST.NODE1.NODE2 "two",
      LIST.REST.REST.REST #1,
      LAST #1 ]

- for which the TDL shorthand is
&lt;! \[NODE1.NODE2 ONE\], \[NODE1.NODE2 TWO\] !&gt;

<!-- -->


- lst-t: as lst, but format is (lst-t TOP-MARKER PATH) where
(lst-t '\* PATH) is equivalent to (lst PATH)
- dlst-t: as dlst, but format is (dlst-t TOP-MARKER PATH) where
(dlst-t '\* PATH) is equivalent to (dlst PATH)

(The following type names are obsolete: symbol, string, string-list,
string-fs, string-diff-fs, mixed-fs, mixed-diff-fs.)

Last update: 2005-11-16 by BenjaminWaldron [[edit](https://github.com/delph-in/docs/wiki/LexDbFieldMappings/_edit)]{% endraw %}