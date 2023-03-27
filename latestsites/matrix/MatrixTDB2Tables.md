{% raw %}# Documentation for MatrixTDB tables

Some brief notes about the tables in MatrixTDB2, what they are for, and
what is stored in each of the columns.

Note that we discuss MatrixTDB as the system, but the current database
on the MySQL server on capuchin being used by the system is MatrixTDB2,
not MatrixTDB. MatrixTDB (the database) still exists, but is no longer
being used.

## Overview of tables

First, what they are for, in alphabetical order:

|                       |                                                                                                                                                                                                                                                                                                                                                     |
|-----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| extr\_source\_profile | not used in MatrixTDB2                                                                                                                                                                                                                                                                                                                              |
| extract\_profile\_run | not used in MatrixTDB2                                                                                                                                                                                                                                                                                                                              |
| extract\_result       | not used in MatrixTDB2                                                                                                                                                                                                                                                                                                                              |
| extract\_results      | not used in MatrixTDB2                                                                                                                                                                                                                                                                                                                              |
| feat\_grp             | Puts combinations of features that are used in filters together. Every feature/value combination found in filters and imported choices files (language types) is entered as a singleton group (group with just one feature/value combo). Every 'and' group of feature/value combos in filters is entered as a group, i.e. with a common fg\_grp\_id |
| filter                | Filter repository whose purpose is to match the names of the filters in s\_filters.py to the IDs used as foreign keys in fltr\_feat\_grp.                                                                                                                                                                                                           |
| fltr\_feat\_grp       | Intersection table that matches filters up to the feature groups to which they apply. Used in combination with lt\_feat\_grp to get the filters that apply to a language type                                                                                                                                                                       |
| fltr\_mrs             | For all filters, lists the mrs tags (aka semantic equivalence classes) that they apply to.                                                                                                                                                                                                                                                          |
| grammar               | not used in MatrixTDB2                                                                                                                                                                                                                                                                                                                              |
| harv\_str             | Stores the harvester strings given when importing a source profile                                                                                                                                                                                                                                                                                  |
| item                  | Mirrors the item file in a \[incr\_tsdb()\] profile with the addition of i\_osp\_id which is a foreign key to orig\_source\_profile.osp\_orig\_src\_prof\_id                                                                                                                                                                                        |
| lt                    | A repository of language types that have been imported, either by importing source profiles or separately                                                                                                                                                                                                                                           |
| lt\_feat\_grp         | Intersection table that matches language types up with the feature groups they have. Used in combination with fltr\_feat\_grp to find filters that are relevant to a language type                                                                                                                                                                  |
| mrs                   | Stores the mrs semantics for each of the mrs tags imported                                                                                                                                                                                                                                                                                          |
| orig\_source\_profile | Stores import information about the source profiles                                                                                                                                                                                                                                                                                                 |
| parse                 | Mirrors the item file in a \[incr\_tsdb()\] profile with the addition of p\_osp\_id which is a foreign key to orig\_source\_profile.osp\_orig\_src\_prof\_id                                                                                                                                                                                        |
| res\_fltr             | Obsolete intersection table that stores the 'result' of applying a universal filter to the 'result' in a \[incr\_tsdb()\] profile. Was only being used to track at most the first fail found for a given result, now not being used at all since we run through universal filters before even adding to item\_tsdb, parse, result tables            |
| res\_sfltr            | Intersection table that stores the 'result' of applying a specific filter to the 'result' in a \[incr\_tsdb()\] profile. Currently only used to store fails, not passes or does-not-applys                                                                                                                                                          |
| result                | Mirrors the result file in the source profile with the addition of the r\_osp\_id which is a foreign key to orig\_source\_profile.osp\_orig\_src\_prof\_id and r\_esp\_id which is NULL                                                                                                                                                             |
| seed\_str             | Stores the seed strings which are the harvester strings after having gone through stringmods stored in a canonical form: words, prefixes, suffixes, with all three of those being in alphabetical order                                                                                                                                             |
| sp\_item              | Mirrors the item file in the source profile with the addition of the spi\_osp\_id which is a foreign key to orig\_source\_profile.osp\_orig\_src\_prof\_id                                                                                                                                                                                          |
| sp\_parse             | Mirrors the parse file in the source profile with the addition of the spp\_osp\_id which is a foreign key to orig\_source\_profile.osp\_orig\_src\_prof\_id.                                                                                                                                                                                        |
| sp\_result            | Mirrors the result file in the source profile with the addition of the spr\_osp\_id which is a foreign key to orig\_source\_profile.osp\_orig\_src\_prof\_id.                                                                                                                                                                                       |
| str\_lst              | Intersection table that maps seed strings to mrs tags                                                                                                                                                                                                                                                                                               |

## Documentation of columns

Next, for each table, some documentation of the columns. Note that these
are grouped by function.

### Tables used to store source profile information

These tables are updated by import\_from\_itsdb.py and used by
add\_permutes.py.

#### orig\_source\_profile

Stores import information about the source profiles

    +----------------------+------------------+------+-----+-------------------+----------------+
    | Field                | Type             | Null | Key | Default           | Extra          |
    +----------------------+------------------+------+-----+-------------------+----------------+
    | osp_orig_src_prof_id | int(10) unsigned | NO   | PRI | NULL              | auto_increment | 
    | osp_developer_name   | char(24)         | YES  |     | NULL              |                | 
    | osp_prod_date        | timestamp        | NO   |     | CURRENT_TIMESTAMP |                | 
    | osp_orig_lt_id       | int(11)          | YES  |     | NULL              |                | 
    | osp_comment          | varchar(1000)    | NO   |     |                   |                | 
    +----------------------+------------------+------+-----+-------------------+----------------+

|                          |                                                      |
|--------------------------|------------------------------------------------------|
| osp\_orig\_src\_prof\_id | Primary key                                          |
| osp\_developer\_name     | The developer who imported the source profile        |
| osp\_prod\_date          | The date the profile was imported                    |
| osp\_orig\_ld\_id        | he ID of the language type that produced the profile |
| osp\_comment             | A user-entered description of the source profile     |

#### harv\_str

Stores the harvester strings given when importing a source profile.
Harvester strings serve a dual purpose: They are parsed with a harvester
grammar in order to get the mrs for the semantic equivalence class they
represent, and they are also used by the constructor function as the
starting point for creating the strings for that equivalence class.

    +----------------+--------------+------+-----+---------+----------------+
    | Field          | Type         | Null | Key | Default | Extra          |
    +----------------+--------------+------+-----+---------+----------------+
    | hs_id          | int(11)      | NO   | PRI | NULL    | auto_increment | 
    | hs_string      | varchar(100) | NO   | MUL |         |                | 
    | hs_mrs_tag     | char(20)     | NO   | MUL |         |                | 
    | hs_init_osp_id | int(11)      | NO   |     |         |                | 
    | hs_cur_osp_id  | int(11)      | NO   | MUL |         |                | 
    +----------------+--------------+------+-----+---------+----------------+

|                   |                                                                                                                      |
|-------------------|----------------------------------------------------------------------------------------------------------------------|
| hs\_id            | Primary key                                                                                                          |
| hs\_string        | The harvester string                                                                                                 |
| hs\_mrs\_tag      | The mrs tag that labels the sem. equiv. class                                                                        |
| hs\_init\_osp\_id | The initial original source profile this string/tag combo was imported as a part of                                  |
| hs\_cur\_osp\_id  | The most recent original source profile this string/tag combo was imported as a part of (this is how we update mrss) |

#### mrs

The filters (and parts of the constructor function) are sensistive to
the semantic equivalence class of the items they apply to. We use mrs
tags to identify the equivalence classes instead of the actual mrss for
two reasons 1) they're much easier to manipulate (and store) and 2) this
should help when we get to irreducibly ambiguous harvester strings.

Because the actual mrs values will change over time, we allow multiple
rows in this table per mrs tag. The field mrs\_current flags only one
row per mrs tag as the one to use in test suites for the current system.
Previous mrs as preserved in case we need to create test suites
corresponding to an older state of the system.

    +-------------+---------------+------+-----+---------+----------------+
    | Field       | Type          | Null | Key | Default | Extra          |
    +-------------+---------------+------+-----+---------+----------------+
    | mrs_id      | int(11)       | NO   | PRI | NULL    | auto_increment | 
    | mrs_tag     | char(20)      | YES  | MUL | NULL    |                | 
    | mrs_value   | varchar(1000) | YES  | MUL | NULL    |                | 
    | mrs_date    | datetime      | YES  |     | NULL    |                | 
    | mrs_osp_id  | int(11)       | YES  |     | NULL    |                | 
    | mrs_current | tinyint(4)    | YES  |     | 1       |                | 
    +-------------+---------------+------+-----+---------+----------------+

|              |                                                                            |
|--------------|----------------------------------------------------------------------------|
| mrs\_id      | Primary key                                                                |
| mrs\_tag     | Mrs semantic tag                                                           |
| mrs\_vale    | The hairy mrs semantics produced in the source profile by \[incr\_tsdb()\] |
| mrs\_date    | NULL                                                                       |
| mrs\_osp\_id | The ID of the original source profile the mrs was imported from            |
| mrs\_current | 1 if this value of the tag is the current one                              |

#### sp\_item

Mirrors the item file in the source profile with the addition of the
spi\_osp\_id which is a foreign key to
orig\_source\_profile.osp\_orig\_src\_prof\_id. sp\_item stands for
\`source profile: item' In \[incr tsdb()\], the item file contains the
input items, along with information about their well-formedness, length,
and other characteristics.

Here are the columns:

    +----------------+------------------+------+-----+---------+----------------+
    | Field          | Type             | Null | Key | Default | Extra          |
    +----------------+------------------+------+-----+---------+----------------+
    | spi_id         | int(10) unsigned | NO   | PRI | NULL    | auto_increment | 
    | spi_origin     | char(20)         | YES  |     |         |                | 
    | spi_register   | char(20)         | YES  |     |         |                | 
    | spi_format     | char(20)         | YES  |     |         |                | 
    | spi_difficulty | int(4)           | YES  |     | -1      |                | 
    | spi_category   | char(20)         | YES  |     |         |                | 
    | spi_input      | varchar(512)     | YES  |     |         |                | 
    | spi_wf         | int(4)           | YES  |     | 1       |                | 
    | spi_length     | int(4)           | YES  |     | -1      |                | 
    | spi_comment    | varchar(256)     | YES  |     |         |                | 
    | spi_author     | char(50)         | YES  |     |         |                | 
    | spi_date       | char(10)         | YES  |     |         |                | 
    | spi_osp_id     | int(11)          | NO   |     |         |                | 
    +----------------+------------------+------+-----+---------+----------------+

Most of these are not of interest here (and will likely soon be
suppressed). We have meaningful data in the following columns:

|              |                                                                               |
|--------------|-------------------------------------------------------------------------------|
| spi\_id      | the item id                                                                   |
| spi\_input   | the actual input string                                                       |
| spi\_length  | the number of words in the input string                                       |
| spi\_author  | the author of the item as recorded by \[incr tsdb()\]                         |
| spi\_osp\_id | the ID of the original source profile the item came from (not an itsdb field) |

#### sp\_parse

Mirrors the parse file in the source profile with the addition of the
spp\_osp\_id which is a foreign key to
orig\_source\_profile.osp\_orig\_src\_prof\_id. sp\_parse stands for
\`source profile: parse' and corresponds to the \[incr tsdb()\] parse
file. The parse file contains information about the processing of each
item in a given test run. For our purposes (constructing gold standard
profiles for comparison), most of this data is not useful. Instead,
parse serves to link item and result, and we may end up dispensing with
it and creating it on the fly on export.

Here are the columns:

    +------------------+------------------+------+-----+---------+----------------+
    | Field            | Type             | Null | Key | Default | Extra          |
    +------------------+------------------+------+-----+---------+----------------+
    | spp_parse_id     | int(10) unsigned | NO   | PRI | NULL    | auto_increment | 
    | spp_run_id       | int(11)          | YES  |     | -1      |                | 
    | spp_i_id         | int(11)          | NO   |     |         |                | 
    | spp_readings     | int(11)          | YES  |     | -1      |                | 
    | spp_first        | int(11)          | YES  |     | -1      |                | 
    | spp_total        | int(11)          | YES  |     | -1      |                | 
    | spp_tcpu         | int(11)          | YES  |     | -1      |                | 
    | spp_tgc          | int(11)          | YES  |     | -1      |                | 
    | spp_treal        | int(11)          | YES  |     | -1      |                | 
    | spp_words        | int(11)          | YES  |     | -1      |                | 
    | spp_l_stasks     | int(11)          | YES  |     | -1      |                | 
    | spp_ctasks       | int(11)          | YES  |     | -1      |                | 
    | spp_ftasks       | int(11)          | YES  |     | -1      |                | 
    | spp_etasks       | int(11)          | YES  |     | -1      |                | 
    | spp_stasks       | int(11)          | YES  |     | -1      |                | 
    | spp_aedges       | int(11)          | YES  |     | -1      |                | 
    | spp_pedges       | int(11)          | YES  |     | -1      |                | 
    | spp_raedges      | int(11)          | YES  |     | -1      |                | 
    | spp_rpedges      | int(11)          | YES  |     | -1      |                | 
    | spp_unifications | int(11)          | YES  |     | -1      |                | 
    | spp_copies       | int(11)          | YES  |     | -1      |                | 
    | spp_conses       | int(11)          | YES  |     | -1      |                | 
    | spp_symbols      | int(11)          | YES  |     | -1      |                | 
    | spp_others       | int(11)          | YES  |     | -1      |                | 
    | spp_gcs          | int(11)          | YES  |     | -1      |                | 
    | spp_i_load       | int(11)          | YES  |     | -1      |                | 
    | spp_a_load       | int(11)          | YES  |     | -1      |                | 
    | spp_date         | char(22)         | YES  |     |         |                | 
    | spp_error        | varchar(1000)    | YES  |     |         |                | 
    | spp_comment      | varchar(1000)    | YES  |     |         |                | 
    | spp_osp_id       | int(11)          | NO   |     |         |                | 
    +------------------+------------------+------+-----+---------+----------------+

The only ones we are actively using are as follows:

|                |                                                          |
|----------------|----------------------------------------------------------|
| spp\_parse\_id | id for this row, linked by sp\_result                    |
| spp\_i\_id     | pointer to item used as input to the parse               |
| spp\_osp\_id   | id of original source profile this information came from |

#### sp\_result

Mirrors the result file in the source profile with the addition of the
spr\_osp\_id which is a foreign key to
orig\_source\_profile.osp\_orig\_src\_prof\_id. sp\_result stands for
\`source profile: result' and corresponds to the \[incr tsdb()\] result
file. The result file contains information about the result of
processing of each item in a given test run, including the derivation
and the output MRS. Again, there are many columns we are not using
(which are in there initially to mirror the \[incr tsdb()\] tables). The
ones we are using are glossed below:

    +----------------+------------------+------+-----+---------+----------------+
    | Field          | Type             | Null | Key | Default | Extra          |
    +----------------+------------------+------+-----+---------+----------------+
    | spr_parse_id   | int(11)          | NO   | MUL |         |                | 
    | spr_result_id  | int(10) unsigned | NO   | PRI | NULL    | auto_increment | 
    | spr_time       | int(11)          | YES  |     | -1      |                | 
    | spr_ctasks     | int(11)          | YES  |     | -1      |                | 
    | spr_ftasks     | int(11)          | YES  |     | -1      |                | 
    | spr_etasks     | int(11)          | YES  |     | -1      |                | 
    | spr_stasks     | int(11)          | YES  |     | -1      |                | 
    | spr_size       | int(11)          | YES  |     | -1      |                | 
    | spr_aedges     | int(11)          | YES  |     | -1      |                | 
    | spr_pedges     | int(11)          | YES  |     | -1      |                | 
    | spr_derivation | varchar(1000)    | YES  |     |         |                | 
    | spr_surface    | varchar(1000)    | YES  |     |         |                | 
    | spr_tree       | varchar(1000)    | YES  |     |         |                | 
    | spr_mrs        | varchar(1000)    | YES  |     |         |                | 
    | spr_flags      | varchar(24)      | YES  |     |         |                | 
    | spr_wf         | tinyint(4)       | YES  |     | 1       |                | 
    | spr_osp_id     | int(11)          | NO   |     |         |                | 
    +----------------+------------------+------+-----+---------+----------------+

|                 |                                                                                                         |
|-----------------|---------------------------------------------------------------------------------------------------------|
| spr\_parse\_id  | pointer to row in sp\_parse table and through it, row in sp\_item                                       |
| spr\_result\_id | id for this result                                                                                      |
| spr\_mrs        | tag corresponding to actual mrs value to be found in the mrs table; itsdb would have an actual mrs here |
| spr\_wf         | ?                                                                                                       |
| spr\_osp\_id    | id of original source profile this information came from                                                |

### Tables for storing master item list

After we import items, we then run add\_permutes to make a master list
of derived items on the basis of the imported ones. We store these
derived items in the tables item\_tsdb, parse, result, which are
parallel to sp\_item, sp\_parse, and sp\_result.

Note: add\_permutes only adds those items to item\_tsdb/parse/result
that pass all universal filters.

#### seed\_str

Stores the seed strings which are the harvester strings after having
gone through stringmods stored in a canonical form: words, prefixes,
suffixes, with all three of those being in alphabetical order.

    +----------------+--------------+------+-----+---------+----------------+
    | Field          | Type         | Null | Key | Default | Extra          |
    +----------------+--------------+------+-----+---------+----------------+
    | seed_id        | int(11)      | NO   | PRI | NULL    | auto_increment | 
    | seed_str_value | varchar(100) | YES  |     | NULL    |                | 
    +----------------+--------------+------+-----+---------+----------------+

|                  |                                |
|------------------|--------------------------------|
| seed\_id         | Primary key                    |
| seed\_str\_value | Seed string in normalized form |

#### str\_lst

Intersection table that maps seed strings to mrs tags.

    +--------------+------------------+------+-----+---------+----------------+
    | Field        | Type             | Null | Key | Default | Extra          |
    +--------------+------------------+------+-----+---------+----------------+
    | sl_id        | int(11)          | NO   | PRI | NULL    | auto_increment | 
    | sl_mrs_tag   | char(20)         | YES  |     | NULL    |                | 
    | sl_seed_type | char(2)          | YES  |     | NULL    |                | 
    | sl_seed_id   | int(10) unsigned | YES  |     | NULL    |                | 
    +--------------+------------------+------+-----+---------+----------------+

|                |                                                                                                                 |
|----------------|-----------------------------------------------------------------------------------------------------------------|
| sl\_id         | Primary key                                                                                                     |
| sl\_mrs\_tag   | The semantic mrs tag this seed string belongs to. Can serve as a foreign key to mrs.mrs\_tag and result.r\_mrs. |
| sl\_seed\_type | intended to indicate seed/harv status; currently NULL                                                           |
| sl\_seed\_id   | Foreign key to seed\_str.seed\_id                                                                               |

#### item

Mirrors the item file in a \[incr\_tsdb()\] profile with the addition of
i\_osp\_id which is a foreign key to
orig\_source\_profile.osp\_orig\_src\_prof\_id.

    +--------------+------------------+------+-----+---------+----------------+
    | Field        | Type             | Null | Key | Default | Extra          |
    +--------------+------------------+------+-----+---------+----------------+
    | i_id         | int(10) unsigned | NO   | PRI | NULL    | auto_increment | 
    | i_origin     | char(20)         | YES  |     |         |                | 
    | i_register   | char(20)         | YES  |     |         |                | 
    | i_format     | char(20)         | YES  |     |         |                | 
    | i_difficulty | int(4)           | YES  |     | -1      |                | 
    | i_category   | char(20)         | YES  |     |         |                | 
    | i_input      | varchar(512)     | YES  | MUL |         |                | 
    | i_wf         | int(4)           | YES  |     | 1       |                | 
    | i_length     | int(4)           | YES  |     | -1      |                | 
    | i_comment    | varchar(256)     | YES  |     |         |                | 
    | i_author     | char(50)         | YES  |     |         |                | 
    | i_date       | char(10)         | YES  |     |         |                | 
    | i_osp_id     | int(11)          | NO   |     |         |                | 
    +--------------+------------------+------+-----+---------+----------------+

|            |                                                                                   |
|------------|-----------------------------------------------------------------------------------|
| i\_id      | Primary key                                                                       |
| i\_input   | string, as created by add\_permutes.py                                            |
| i\_length  | length of string in words                                                         |
| i\_author  | records add\_permutes.py as the author of the item                                |
| i\_osp\_id | original source profile that the harvester string the item is based on comes from |

#### parse

Mirrors the item file in a \[incr\_tsdb()\] profile with the addition of
p\_osp\_id which is a foreign key to
orig\_source\_profile.osp\_orig\_src\_prof\_id.

     +----------------+------------------+------+-----+---------+----------------+
    | Field          | Type             | Null | Key | Default | Extra          |
    +----------------+------------------+------+-----+---------+----------------+
    | p_parse_id     | int(10) unsigned | NO   | PRI | NULL    | auto_increment | 
    | p_run_id       | int(11)          | YES  |     | -1      |                | 
    | p_i_id         | int(11)          | NO   | MUL |         |                | 
    | p_readings     | int(11)          | YES  |     | -1      |                | 
    | p_first        | int(11)          | YES  |     | -1      |                | 
    | p_total        | int(11)          | YES  |     | -1      |                | 
    | p_tcpu         | int(11)          | YES  |     | -1      |                | 
    | p_tgc          | int(11)          | YES  |     | -1      |                | 
    | p_treal        | int(11)          | YES  |     | -1      |                | 
    | p_words        | int(11)          | YES  |     | -1      |                | 
    | p_l_stasks     | int(11)          | YES  |     | -1      |                | 
    | p_ctasks       | int(11)          | YES  |     | -1      |                | 
    | p_ftasks       | int(11)          | YES  |     | -1      |                | 
    | p_etasks       | int(11)          | YES  |     | -1      |                | 
    | p_stasks       | int(11)          | YES  |     | -1      |                | 
    | p_aedges       | int(11)          | YES  |     | -1      |                | 
    | p_pedges       | int(11)          | YES  |     | -1      |                | 
    | p_raedges      | int(11)          | YES  |     | -1      |                | 
    | p_rpedges      | int(11)          | YES  |     | -1      |                | 
    | p_unifications | int(11)          | YES  |     | -1      |                | 
    | p_copies       | int(11)          | YES  |     | -1      |                | 
    | p_conses       | int(11)          | YES  |     | -1      |                | 
    | p_symbols      | int(11)          | YES  |     | -1      |                | 
    | p_others       | int(11)          | YES  |     | -1      |                | 
    | p_gcs          | int(11)          | YES  |     | -1      |                | 
    | p_i_load       | int(11)          | YES  |     | -1      |                | 
    | p_a_load       | int(11)          | YES  |     | -1      |                | 
    | p_date         | char(22)         | YES  |     |         |                | 
    | p_error        | varchar(1000)    | YES  |     |         |                | 
    | p_comment      | varchar(1000)    | YES  |     |         |                | 
    | p_osp_id       | int(11)          | NO   |     |         |                | 
    +----------------+------------------+------+-----+---------+----------------+

|              |                                                                                     |
|--------------|-------------------------------------------------------------------------------------|
| p\_parse\_id | Primary key                                                                         |
| p\_i\_id     | id of the input item this parse corresponds to. As of now they are always the same. |
| p\_osp\_id   | original source profile that the harvester string the item is based on comes from   |

#### result

Mirrors the result file in the source profile with the addition of the
r\_osp\_id which is a foreign key to
orig\_source\_profile.osp\_orig\_src\_prof\_id and r\_esp\_id which is
NULL

    +--------------+------------------+------+-----+---------+----------------+
    | Field        | Type             | Null | Key | Default | Extra          |
    +--------------+------------------+------+-----+---------+----------------+
    | r_parse_id   | int(11)          | NO   | MUL |         |                | 
    | r_result_id  | int(10) unsigned | NO   | PRI | NULL    | auto_increment | 
    | r_time       | int(11)          | YES  |     | -1      |                | 
    | r_ctasks     | int(11)          | YES  |     | -1      |                | 
    | r_ftasks     | int(11)          | YES  |     | -1      |                | 
    | r_etasks     | int(11)          | YES  |     | -1      |                | 
    | r_stasks     | int(11)          | YES  |     | -1      |                | 
    | r_size       | int(11)          | YES  |     | -1      |                | 
    | r_aedges     | int(11)          | YES  |     | -1      |                | 
    | r_pedges     | int(11)          | YES  |     | -1      |                | 
    | r_derivation | varchar(1000)    | YES  |     |         |                | 
    | r_surface    | varchar(1000)    | YES  |     |         |                | 
    | r_tree       | varchar(1000)    | YES  |     |         |                | 
    | r_mrs        | varchar(1000)    | YES  | MUL |         |                | 
    | r_flags      | varchar(24)      | YES  |     |         |                | 
    | r_wf         | tinyint(4)       | YES  |     | 1       |                | 
    | r_osp_id     | int(11)          | NO   |     |         |                | 
    | r_esp_id     | int(11)          | YES  |     | NULL    |                | 
    +--------------+------------------+------+-----+---------+----------------+

|               |                                                                                                                       |
|---------------|-----------------------------------------------------------------------------------------------------------------------|
| r\_parse\_id  | parse row this result corresponds to. As of now, the IDs are always the same.                                         |
| r\_result\_id | id for this result. As of now, the result, parse, and item IDs are always the same                                    |
| r\_mrs        | mrs tag corresponding to mrs\_value in mrs                                                                            |
| r\_wf         | 1 if this result passes all universal filters, 0 if it fails at least one; filled in by stored procedure in MatrixTDB |
| r\_osp\_id    | original source profile that the harvester item the result is based on comes from                                     |
| r\_esp\_id    | NULL. Originally intended to be most recent profile this has been exported to?                                        |

### Tables for language types and filters

These tables are used by sql\_lg\_type (to import language types),
run\_specific\_filters (to run the master items through specific filters
and record their pass/fail results), and generate\_s\_profile (to
generate a validation \[incr\_tsdb()\] profile).

#### feat\_grp

This table stores groups of features referred to elsewhere. There are
singleton groups (containing just one feature) and larger groups. The
largest groups (whole language types) aren't stored here, but rather in
lt\_feat\_grp (see below). The non-singleton groups which are stored
here are the conjunctions referred to by filters.

    +-----------+----------+------+-----+---------+----------------+
    | Field     | Type     | Null | Key | Default | Extra          |
    +-----------+----------+------+-----+---------+----------------+
    | fg_id     | int(11)  | NO   | PRI | NULL    | auto_increment | 
    | fg_grp_id | int(11)  | YES  | MUL | NULL    |                | 
    | fg_feat   | char(20) | YES  | MUL | NULL    |                | 
    | fg_value  | char(20) | YES  |     | NULL    |                | 
    +-----------+----------+------+-----+---------+----------------+

|             |                             |
|-------------|-----------------------------|
| fg\_id      | Primary key                 |
| fg\_grp\_id | the ID of the feature group |
| fg\_feat    | feature name                |
| fg\_value   | feature value               |

#### filter

Filter repository whose purpose is to match the names of the filters in
s\_filters.py to the IDs used as foreign keys in fltr\_feat\_grp.

    +-------------+-----------+------+-----+---------+----------------+
    | Field       | Type      | Null | Key | Default | Extra          |
    +-------------+-----------+------+-----+---------+----------------+
    | filter_id   | int(11)   | NO   | PRI | NULL    | auto_increment | 
    | filter_name | char(100) | YES  |     | NULL    |                | 
    | filter_type | char(2)   | YES  |     | s       |                | 
    +-------------+-----------+------+-----+---------+----------------+

|              |                                                                                                                                                                                                                                 |
|--------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| filter\_id   | Primary key                                                                                                                                                                                                                     |
| filter\_name | The name member of the filter in s\_filters.py                                                                                                                                                                                  |
| filter\_type | Either 'u' for universal or 's' for specific. Now we're just using 's' since add\_permutes only enters those items that pass all universal filters and we're skipping run\_u\_filters.py which used this table for 'u' filters. |

#### fltr\_feat\_grp

Intersection table that stores the feature groups that each specific
filter cares about. These feature groups are the specification of the
language types that the filter applies to. Used in combination with
lt\_feat\_grp to get the filters thatapply to a language type

    +-------------+---------+------+-----+---------+----------------+
    | Field       | Type    | Null | Key | Default | Extra          |
    +-------------+---------+------+-----+---------+----------------+
    | ffg_id      | int(11) | NO   | PRI | NULL    | auto_increment | 
    | ffg_fltr_id | int(11) | YES  | MUL | NULL    |                | 
    | ffg_grp_id  | int(11) | YES  | MUL | NULL    |                | 
    +-------------+---------+------+-----+---------+----------------+

|               |                                        |
|---------------|----------------------------------------|
| ffg\_id       | Primary key                            |
| ffg\_fltr\_id | A foreign key to filter.filter\_id     |
| ffg\_grp\_id  | A foreign key to feat\_grp.fg\_grp\_id |

#### fltr\_mrs

NOTE: Not used in MatrixTDB2.

Each filter has some set of semantic equivalence classes that it applies
to. This table seems to have been intended to record that information.
Note that there can be multiple rows with for any given filter (i.e.,
with the same fm\_fltr\_id).

    +------------+----------+------+-----+---------+----------------+
    | Field      | Type     | Null | Key | Default | Extra          |
    +------------+----------+------+-----+---------+----------------+
    | fm_id      | int(11)  | NO   | PRI | NULL    | auto_increment | 
    | fm_fltr_id | int(11)  | YES  |     | NULL    |                | 
    | fm_mrs_tag | char(20) | YES  |     | NULL    |                | 
    | fm_value   | int(11)  | YES  |     | NULL    |                | 
    +------------+----------+------+-----+---------+----------------+

|              |                                       |
|--------------|---------------------------------------|
| fm\_id       | row id                                |
| fm\_fltr\_id | filter id, points to filter           |
| fm\_mrs\_tag | mrs tag, indicating equivalence class |
| fm\_value    | whether or not the filter applies?    |

NOTE: There is no data in this table right now. The filters are defined
as filter objects in the python code, and they each contain as list of
mrs tags they apply to. This information could be stored in the DB, for
reference, I supposed, but it isn't currently.

#### lt

This table stores language types that we have worked with.

    +------------+---------------+------+-----+---------+----------------+
    | Field      | Type          | Null | Key | Default | Extra          |
    +------------+---------------+------+-----+---------+----------------+
    | lt_id      | int(11)       | NO   | PRI | NULL    | auto_increment | 
    | lt_origin  | char(2)       | YES  |     | NULL    |                | 
    | lt_comment | varchar(1000) | YES  |     | NULL    |                | 
    +------------+---------------+------+-----+---------+----------------+

|             |                                                                                                |
|-------------|------------------------------------------------------------------------------------------------|
| lt\_id      | Primary key                                                                                    |
| lt\_origin  | Either 'r' or 'p'. Indicates whether the language type was purpose-built or randomly-generated |
| lt\_comment | A user-entered comment about what the language type is                                         |

#### lt\_feat\_grp

Intersection table that matches language types up with the feature
groups they have. This table stores pointers from language types to the
feature groups they comprise. On the one hand, it points to all the
singleton group (feature-value pairs) that define the lt. On the other
hand, it also points to the larger groups that are consistent with the
lt definition. We update this table through create\_or\_update\_lt() in
sql\_lg\_types.py and update\_all\_lts\_in\_lfg() in
run\_specific\_filters.py. We use it to find the filters that are
appropriate for a given lt. Used in combination with fltr\_feat\_grp to
find filters that are relevant to a language type.

    +------------+---------+------+-----+---------+----------------+
    | Field      | Type    | Null | Key | Default | Extra          |
    +------------+---------+------+-----+---------+----------------+
    | lfg_id     | int(11) | NO   | PRI | NULL    | auto_increment | 
    | lfg_lt_id  | int(11) | YES  | MUL | NULL    |                | 
    | lfg_grp_id | int(11) | YES  | MUL | NULL    |                | 
    +------------+---------+------+-----+---------+----------------+

|              |                                        |
|--------------|----------------------------------------|
| lfg\_id      | Primary key                            |
| lfg\_lt\_id  | Foreign key to lt.lt\_id               |
| lfg\_grp\_id | A foreign key to feat\_grp.fg\_grp\_id |

One final note on this set of tables: If you are debugging the system
and trying to figure out why a given string was not grammatical, you
will want to know what specific filters it failed. The way to do this is
to run the query that generate\_s\_profile runs when determine which
strings fail filters specific to the relevant language type. This query,
in a slightly different from from that used by genereate\_s\_profile,
is:

- SELECT filter\_name FROM filter
  - INNER JOIN res\_sfltr ON filter\_id = rsf\_sfltr\_id
  
  INNER JOIN fltr\_feat\_grp ON rsf\_sfltr\_id = ffg\_fltr\_id
  - INNER JOIN lt\_feat\_grp ON ffg\_grp\_id = lfg\_grp\_id
  
  WHERE rsf\_value = 0
  - AND lfg\_lt\_id = \[lt\_id\] AND rsf\_res\_id = \[result\_id\]

where lt\_id is the lt\_id of the language type you are generating the
profile for and result\_id is the id of the result you are wondering
about. Be sure you find the ID that matches item\_tsdb.i\_input (the
string) and r.r\_mrs (the semantic tag) you're wondering about. This
will get you a list of all specific filters that the item failed. If the
item didn't fail any specific filters and still isn't appearing as a
grammatical item in your profile it probably failed a universal filter
(in which case you won't even have a result id for it.)

### Tables for running filters

These tables are used by run\_u\_filters (no longer used) and
run\_specific\_filters to record the results or running filters on
string/mrs combos.

#### res\_fltr

NOTE: No longer used since add\_permutes just puts in those items that
pass all universal filters.

This table records the results of each universal filter on each item
(row from result, actually) that it applies to. Now rows are created in
this table for filter/result combinations where the filter does not
apply to that result.

Might get renamed to res\_ufltr for clarity.

    +------------+---------+------+-----+---------+----------------+
    | Field      | Type    | Null | Key | Default | Extra          |
    +------------+---------+------+-----+---------+----------------+
    | rf_id      | int(11) | NO   | PRI | NULL    | auto_increment | 
    | rf_res_id  | int(11) | YES  | MUL | NULL    |                | 
    | rf_fltr_id | int(11) | YES  |     | NULL    |                | 
    | rf_value   | int(4)  | YES  |     | NULL    |                | 
    +------------+---------+------+-----+---------+----------------+

|              |                                                                                                   |
|--------------|---------------------------------------------------------------------------------------------------|
| rf\_id       | Primary key                                                                                       |
| rf\_res\_id  | Foreign key to result.r\_result\_id, parse.p\_parse\_id, and item\_tsdb.i\_id                     |
| rf\_fltr\_id | Foreign key to filter.filter\_id                                                                  |
| rf\_value    | The 'result' of applying the filter to the 'result'. 0 for fail, 1 for pass, 2 for does-not-apply |

#### res\_sfltr

Intersection table that stores the 'result' of applying a specific
filter to the 'result' in a \[incr\_tsdb()\] profile. Currently only
used to store fails, not passes or does-not-applys.

    +--------------+---------+------+-----+---------+----------------+
    | Field        | Type    | Null | Key | Default | Extra          |
    +--------------+---------+------+-----+---------+----------------+
    | rsf_id       | int(11) | NO   | PRI | NULL    | auto_increment | 
    | rsf_res_id   | int(11) | YES  | MUL | NULL    |                | 
    | rsf_sfltr_id | int(11) | YES  | MUL | NULL    |                | 
    | rsf_value    | int(4)  | YES  |     | NULL    |                | 
    +--------------+---------+------+-----+---------+----------------+

|                |                                                                                                   |
|----------------|---------------------------------------------------------------------------------------------------|
| rsf\_id        | row id                                                                                            |
| rsf\_res\_id   | Foreign key to result.r\_result\_id, parse.p\_parse\_id, and item\_tsdb.i\_id                     |
| rsf\_sfltr\_id | Foreign key to filter.filter\_id                                                                  |
| rsf\_value     | The 'result' of applying the filter to the 'result'. 0 for fail, 1 for pass, 2 for does-not-apply |

### Ancillary tables

Last update: 2009-09-17 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/MatrixTDB2Tables/_edit)]{% endraw %}