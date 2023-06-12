{% raw %}# Background

To provide a programmatic interface to the [ERG on-line
demonstrator](http://erg.delph-in.net/), a sub-set of its functionality
is available via a
[RESTful](https://en.wikipedia.org/wiki/Representational_state_transfer)
(HTTP-based) application program interface (API). Through this
interface, parsing requests can be submitted anonymously to a server at
the [University of
Oslo](http://www.mn.uio.no/ifi/english/research/groups/ltg/), and
processing results will be returned in machine-readable form to the
requester.

This service is still under development and has not been broadly tested.
The following terse sections aim to provide minimal documentation to
users who might want to obtain ERG parses without creating their own
installation of the DELPH-IN software stack. Michael Goodman and
NedLetcher have contributed substantially to the design
and testing of the interface; StephanOepen maintains the
server-side implementation based on the LKB and [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) environments.

# A First Example

In a nutshell, the API is accessed through HTTP GET requests to the
following base URI: http://erg.delph-in.net/rest/0.9/parse. There is one
required parameter, named input, to provide a string for the parser to
analyze. The HTTP response will be of type application/json and will
contain some high-level statistics about the parsing process (e.g. the
number of distinct readings and overall parsing time), as well as an
array of *result* structures. At present, three perspectives on each
parsing result are available (with more in the making): its *derivation*
tree (e.g. the full recipe for deriving this analysis; see the
[ItsdbDerivations](https://delph-in.github.io/docs/tools/ItsdbDerivations) page), an underspecified
logical-form meaning representation in *Minimal Recursion Semantics*
(MRS; see the [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) page for background), and a
simplification of the semantics as an *Elementary Dependency Structure*
(EDS; see the [EdsTop](https://delph-in.github.io/docs/tools/EdsTop) page for background).

For example, the query
<http://erg.delph-in.net/rest/0.9/parse?derivation=json&input=Abrams%20arrived.>
will request the on-line service to parse the string *Abrams arrived.*
Note how some special characters, including whitespace, in the input
need to be
[percent-encoded](https://en.wikipedia.org/wiki/Percent-encoding). The
JSON document returned for this query will include the following pieces
of information:

      {"readings": 1, "tcpu": 0.05,
       "results":
       [{"result-id": 0,
         "derivation": { … }}]}

# Parameterizing the Parser

- analyses: *integer* (default 100)
- results: *integer* (default: 1) [Usage
Example](http://erg.delph-in.net/rest/0.9/parse?results=2&input=Abrams%20ate%20pizza%20with%20tuna.)
- time (tbd)
- roots (tbd)
- generics: all (default) or null
- tokens: json or yy (default: none)
- derivation: json, udf, or null (default)
- mrs: json, simple, latex, or null (default)
- eds: json, native, amr, latex, or null (default)
- dm: sdp, latex, or null (default)
- properties: json (default) or null [Usage
Example](http://erg.delph-in.net/rest/0.9/parse?properties=null&input=Abrams%20arrived.)
- filter: *regular expression* (default: none) [Usage
Example](http://erg.delph-in.net/rest/0.9/parse?filter=%5E%5B%5E_%5D.%2A_q%24%7C%5Efocus_d%24%7C%5Eparg_d%24&input=Pizza,%20Abrams%20ate.)

# Usage Example in Python

The following code snippets exemplify how to connect to the RESTful
parsing service with Python and using only the standard library:

```
   1 >>> from urllib.parse import quote
   2 >>> from urllib.request import urlopen
   3 >>> # for Python 2.6--2.7 replace the above with: from urllib import quote, urlopen
   4 >>> import json
   5 >>> base = "http://erg.delph-in.net/rest/0.9/parse"
   6 >>> input = quote("Have her report on my desk!")
   7 >>> fd = urlopen("%s?nresults=2&input=%s" % (base, input))
   8 >>> item = json.load(fd)
   9 >>> eds = item["results"][0]["eds"]
  10 >>> eds["nodes"][eds["top"]]["label"]
  11 '_have_v_cause'
```

[PyDelphin](https://delph-in.github.io/docs/tools/PyDelphinTop) provides a slightly smoother experience for
Python:

```
   1 >>> from delphin.interfaces import rest
   2 >>> response = rest.parse('Have her report on my desk!', params={'eds':'json'})
   3 >>> item = response.result(0)
   4 >>> # you may access the JSON structure directly, as above
   5 >>> eds = item["eds"]
   6 >>> eds["nodes"][eds["top"]]["label"]
   7 '_have_v_cause'
   8 >>> # or you may have PyDelphin interpret the structure
   9 >>> eds = item.eds()
  10 >>> str(eds.node(eds.top).pred)
  11 '_have_v_cause'
```

# Implementations

- The server based on the LKB and [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) is in the [LOGON](https://delph-in.github.io/docs/tools/LogonTop)
tree. See [LogonOnline](https://delph-in.github.io/docs/tools/LogonOnline) for more information.
- [Bottlenose](https://github.com/delph-in/bottlenose) is a WSGI
application based on [PyDelphin](https://delph-in.github.io/docs/tools/PyDelphinTop) and [ACE](https://delph-in.github.io/docs/tools/AceTop).
- [PyDelphin](https://delph-in.github.io/docs/tools/PyDelphinTop) includes a client compatible with either of
the above servers. See the
[documentation](https://pydelphin.readthedocs.io/en/latest/api/delphin.interfaces.rest.html)
for more information.

# Known Limitations

As of Easter 2016, there are still a few necessary pieces missing in the
interface, including

1. error reporting in case of parse failures (e.g. due to resource
limitations or lexical gaps);
2. more control over resource usage (and sensible ceilings) and the
choice of grammar start symbols; and
3. inclusion of additional information from the [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) result structure.

Once these basic additions are in place, it would be nice if user uptake
were to call for bandwidth limitation mechanisms (which will be easy to
enforce in the proxy server). More contentfully, one could also
speculate about providing additional methods, for example POST-ing a
structure (like an MRS or EDS) for conversion to additional output
views, querying the SEM-I, or of course invoking sentence realization.

Last update: 2022-09-14 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/ErgApi/_edit)]{% endraw %}