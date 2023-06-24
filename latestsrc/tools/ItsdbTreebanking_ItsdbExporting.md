{% raw %}# Page Status

This page presents user-supplied information, hence could be inaccurate
in some details, or not necessarily reflect use patterns anticipated by
the [\[incr tsdb()\]](http://www.delph-in.net/itsdb) developers. This
page was initiated by FrancisBond; please feel free to
make additions or corrections as you see fit. However, before revising
this page, one should be reasonably confident of the information given
being correct.

# Exporting Trees

You can output treebanked data in other formats with *Trees \| Export*.
This outputs the data as one gzipped file per item.

If you set the switch to thinning normalize, the system only outputs
results for selected (active) trees (*Trees \| Export \| Thinning
Export* or (setf tsdb::\*redwoods-thinning-export-p\* t)).

Possible output formats are listed below (partially):

- **derivation**---derivation tree: primary, labeled in terms of
grammar-internal identifiers;
- **tree**---phrase structure tree: derived, labeled using a set of
abbreviatory symbols;
- **avm**---attibute value matrix: derived, the full HPSG sign,
including all daughters;
- **mrs**---MRS: meaning representation, raw;
- **indexed**---MRS: indexed;
- **prolog**---MRS: prolog style;
- **mrx**---MRS: formatted with XML;
- **rmrs**---Robust MRS: meaning representation as RMRS;
- **rmrx**---Robust MRS: formatted with XML;
- **eds**---dependencies: derived, elementary dependency relations
(reduced form of MRS);
  
  - print all relations with
(setf mrs::\*eds-include-vacuous-relations-p\* t)
- **triples** ---dependency triples: PRED ARG1 PRED
- **dmrx**---Dependency MRS: formatted with XML;
- **all**---All the representations.

You can set what information gets output in '.tsdbrc'
([ItsdbCustomization](https://delph-in.github.io/docs/tools/ItsdbCustomization)).

    (setf tsdb::*redwoods-export-values* '(:derivation :tree :mrs :prolog))

**Note:** Some of these data structures may require reconstruction. In
this case you need to have the same version of the grammar loaded (in
the LKB) that was used to parse the profile.

**Note:** To get the cfrom/cto working in xml and dependencies you need
to set lkb::\*characterize-p\* to non-null before you export.

    (setf lkb::*characterize-p* t)

Exporting can be memory intensive. Use a batch instead for large
profiles. There is an example described in [RedwoodsTop](https://delph-in.github.io/docs/garage/RedwoodsTop).

# Thinning the treebanks

A profile which has treebanking decisions can be normalized (or "thinned") such that only a single (chosen) derivation remains.

Set the [incr tsdb()] database root to the location of the treebank to be thinned. Then under Tree/Switches, select Thinning Normalize. Then, under Tree, choose Normalize, and enter the name of the new, thinned, profile. The tool will create the new profile in the database root directory and it will appear in the database list.

Last update: 2023-06-23 by Olga Zamaraeva [[edit](https://github.com/delph-in/docs/wiki/ItsdbTreebanking_ItsdbExporting/_edit)]{% endraw %}