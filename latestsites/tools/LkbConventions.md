{% raw %}This page contains some vain attempts to document and thus maybe
eventually standardize some of the conventions used when writing
grammars.

# \*grammar-version\*

Information about the version of the grammar is kept in a string called
\*grammar-version\*, defined in a file usually called Version.lsp. This
is read in the lkb/script and pet/flop.set, as well as external
utilities that care about the grammar version, such as the lextype-db.
It is conventionally of the form "name (version)", where version is
normally some kind of date.

Examples:

    (defparameter *grammar-version* "ERG (2020)")
    (defparameter *grammar-version* "ERG-dict (2020)")
    (defparameter *grammar-version* "Jacy (2007-10-10)")
    (defparameter *grammar-version* "NorSource (Jan-06)")
    (defparameter *grammar-version* "NoEn (27-aug-04)")
    (defparameter *grammar-version* "GG (Jul-2006)")
    (defparameter *grammar-version* "pseudo-japanese (Matrix-10-2006)")

Suggested convention

- file name should be Version.lsp in the grammar top directory
- name should be a short form of the grammar name
- if you have subgrammars, then call them GRAMMAR-SUB, e.g. ERG-Singlish or ERG-mal
- version should ideally be the
[iso-8601](http://www.cl.cam.ac.uk/~mgk25/iso-time.html) date
- the ltdb will complain and refuse to produce anything if you have an underscore in the name (FCB 2022)

Last update: 2022-11-27 by Francis Bond [[edit](https://github.com/delph-in/docs/wiki/LkbConventions/_edit)]{% endraw %}