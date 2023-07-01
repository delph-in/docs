{% raw %}# Page Status

This page presents user-supplied information, hence may be inaccurate in
some details, or not necessarily reflect use patterns anticipated by the
original LOGON developers. The functionality documented here may still
change. This page was initiated by EmilyBender; please
feel free to make additions or corrections as you see fit. However,
before revising this page, one should be reasonably confident of the
information given being correct.

# Sample On-Line Demos

For several of the LOGON language pairs there are MT demonstrators;
furthermore, there exist on-line demonstrators for several of the
DELPH-IN grammars, viz.

- [Norwegian–English Translation](http://noen.emmtee.net/) (combining
NorGram and the ERG)
- [German–English Translation](http://deen.emmtee.net/) (combining GG
and the ERG)
- [English Parsing and Generation](http://erg.emmtee.net/) (using the
ERG)
- [German Parsing and Generation](http://gg.delph-in.net/) (using GG)
- [Japanese Parsing and Generation](http://jacy.delph-in.net/) (using
JaCY)
- [Spanish Parsing](http://srg.delph-in.net/) (using the SRG)
- [Hausa Parsing and Generation](http://hag.delph-in.net/) (using HAG)

# Running a Web Demo

The script www, found in the root directory of the LOGON distribution
(the value of the environment variable $LOGONROOT), creates
web-accessible demos of parsing, generation, or translation systems. The
script as distributed contains appropriate customization for all
grammars distributed with the standard LOGON tree, for example:

      cd $LOGONROOT
      ./www --binary --erg --port 8888

The above should result in an on-line web demo at port 8888 of your web
server. Note, however, that many firewalls block access to user ports,
so at least for external access you may have to talk to the IT crowd.

The main web demo page is at the /logon subpath, so if you ran the above
command on your local machine, the demo would be at
<http://127.0.0.1:8888/logon> and the [web API](https://delph-in.github.io/docs/erg/ErgApi) would be at
<http://127.0.0.1:8888/rest/0.9/parse>

# Adding a Grammar

Assuming you want to create an on-line web demo for a grammar for which
there is no pre-defined support in the LOGON tree, the following steps
should allow you to customize the www script (and related files)
appropriately. Say your grammar was called *language*:

- add a command line option and startup code to the www script; Note
that you can set the value of \*www-title\* to a descriptive string,
for example
  
        (setf tsdb::*www-title* "UW Language LOGON On-Line Demonstrator")
- create two additional files for each grammar:
  - lingo/lkb/src/tsdb/html/language.html: HTML boilerplate with
information about the grammar;
  - lingo/lkb/src/tsdb/js/language.js: collection of sample
sentences (in JavaScript).
- make sure there are appropriate cpu definitions, i.e. either adding
to
  
  dot.tsdbrc in $LOGONROOT or (preferably) using a command like push()
in the per-user .tsdbrc to augment the list of pre-defined cpus. If
your cpu definition requires a load file language.lisp, create that
too.

# Exporting Example Inputs from \[incr tsdb()\]

The file language.js can be created from an existing [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) profile, using the profile
database to select those examples that you want to be accessible (from
the *Sample* button) in the on-line web demo.

First, select the [\[incr tsdb()\]](http://www.delph-in.net/itsdb)
profile you want to work from in the [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) podium. Then, in the Common
Lisp buffer (in the tsdb package), do something like the following:

      (loop
          for item in (analyze *tsdb-data*
                       :condition "readings > 0 && readings < 10 && i-length < 10")
          do (let ((i-id (get-field :i-id item))
                   (i-input (get-field :i-input item))
                   (readings (get-field :readings item)))
               (format
                t
                "  { id: ~a, item: \"~a\", readings: ~a},~%" 
                i-id i-input readings)))

The condition string should be customized to select the examples you
want for the sample data file. The format string matches what is
required by the JavaScript syntax of language.js.

# Other Observations

A few other quirks we noted setting this up at UW:

- The user starting the demo has to have write (not just read)
permission on the grammar. (At UW, we have a separate user for this
web process, which means we end up making the grammar group
writable.)
- There of course has to be a \~/tmp/ directory; the standard LOGON
configuration (see the [LogonInstallation](https://delph-in.github.io/docs/tools/LogonInstallation) page)
should have seen to this.
- The PVM daemon pvmd3 has to be running (I would expect the [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) machinery to take care of
starting PVM, if necessary. *oe*, 08/11/30)

Some other tips for troubleshooting:

- If you get an error about an undefined function
WITH-COMPILATION-UNIT, make sure you use the --binary option
- If the grammar loads but the server fails to receive requests, you
might try stopping the server and restarting before digging deeper
- If you do not provide the --port option, the default port depends on
the grammar used; read the $LOGONROOT/www script to find out which
is used by your selected grammar

# LaTeX Style Files

The LaTeX export from these demonstrators assumes a set of [custom
macros](http://svn.emmtee.net/ltg/tex/mrs.sty) for MRS formatting
(mrs.sty), and further the standard LaTeX package
[qtree.sty](http://www.ctan.org/tex-archive/macros/latex/contrib/qtree/),
for the syntax trees. Note that mrs.sty assumes relsize.sty has been
loaded, and qtree.sty requires pict2e.sty (which it will load
automatically).

Last update: 2019-03-26 by MichaelGoodman [[edit](https://github.com/delph-in/docs/wiki/LogonOnline/_edit)]{% endraw %}