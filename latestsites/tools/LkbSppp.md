{% raw %}# Overview

The *Simple PreProcessor Protocol* (SPPP) provides a way of hooking up
to an external tokenizer and morphological analyzer; optionally, SPPP
also allows inclusion of part of speech (PoS) information in the
preprocessor output, but as of March 2005 back-end support to take
advantage of PoS assignments on input tokens (e.g. in the treatment of
unknown words) is lacking. SPPP assumes that the preprocessor runs as an
external process to the LKB that communicates with its caller through
its standard input and output channels. Communication is in XML, using a
designated control character for synchronization, and *always* in UTF-8
encoding (in other words, the *encoding* value in the XML document
header is hard-wired for communication in both directions). SPPP allows
ambiguous preprocessing output, for example alternative morphological
analyses for one token. All references to LKB-internal parameters and
functions in the following are within the lkb package, i.e. users need
to make sure they are setting things up in the right package (aka
namespace).

For hooking up external tokenizers and morphological analyzers, you may
also be intrested in SMAF (see [SmafTop](https://delph-in.github.io/docs/tools/SmafTop)).

# XML Examples

Below is an example of the SPPP representation that might be returned
from the preprocessor for the input *kim sleeps.* (and assuming the
inflectional rules as found in the [ERG](http://www.delph-in.net/erg/)).
The top-level XML document is a segment object that contains a sequence
of token entities. Each token encodes the string that is its surface
form and the character start and end ranges (from and to, respectively)
corresponding to it; character ranges are zero-based, counting
characters (not bytes) in the original input string. Preprocessing
results are keyed off individual tokens in the form of one or more
analysis entities embedded in tokens. Where appropriate, an analysis can
embed one or more rule entities corresponding to orthographemic rules.

      <?xml version="1.0" encoding="utf-8"?>
      <segment>
        <token form="kim" from="0" to="3">
          <analysis stem="kim"/>
        </token>
        <token form="sleeps." from="4" to="11">
          <analysis stem="sleep">
            <rule id="plur_noun_infl_rule" form="sleeps"/>
            <rule id="punct_period_rule" form="sleeps."/>
          </analysis>
          <analysis stem="sleep">
            <rule id="third_sg_fin_verb_infl_rule" form="sleeps"/>
            <rule id="punct_period_rule" form="sleeps."/>
          </analysis>
        </token>
      </segment>
      ^L

Each analysis needs to supply at least one bit of information, viz. the
*stem* resulting from morphological analysis. Where zero morphology
suggests that the *stem* and *form* values are identical, nothing else
is required. For morphologically more interesting cases, the rule
elements embedded in each analysis encode a chain of one more
orthographemic operations that relate the analysis *stem* and token
(surface) *form*. Each rule element needs to provide the rule identifier
(the name of a lexical rule in the LKB) and the corresponding
intermediate form. In the example above, one of the analyses is to
derive the surface form sleeps. from the underlying stem sleep by virtue
of chaining the *punct\_period\_rule* and
*third\_sg\_fin\_verb\_infl\_rule* lexical rules.

Other, optional attributes of the analysis entity are *probability* and
*tag* to encode PoS tagger output, but in the current LKB back-end
processing these remain unused.

# SPPP Configuration

To enable SPPP-based preprocessing for the LKB, you will need to provide
a binary of the preprocessor that the LKB can invoke as an external
process. For each sentence being analyzed in the LKB, the system will
send an XML document to the standard input of the preprocessor,
terminate the input with a formfeed character (\`^L' or ASCII code
0x0c), and then wait for the preprocessor output to be printed on the
standard output of the external binary. Again, to allow synchronization
between the two processes, the LKB will look for another formfeed
character to terminate the XML document returned by the preprocessor.
Following is an example input

      <?xml version="1.0" encoding="utf-8"?>
      <text>kim sleeps</text>
      ^L

Note that the formfeed characters sent to the preprocessor input and
required following its output are, strictly speaking, not part of the
XML itself. They rather serve to simplify the protocol, in that each
side of the SPPP protocol can rely on a formfeed to mark the end of a
turn. Also, remember that SPPP communication is hard-wired to UTF-8,
i.e. in generating XML output for a preprocessor, the external binary
will need to make sure to use the UTF-8 encoding on its standard output
stream.

Assuming a suitable preprocessor binary is available, its location in
the file system needs to be declared to the LKB. Assuming the binary was
called sppp and added to the platform-specific LKB binary directory,
then the following would point the LKB to it:

      (setf *sppp-application* (namestring (merge-pathnames bin-dir "sppp")))

Alternatively, users could make sure to have the binary directory in
their shell search path (and then just specify the name of the
executable file itself, without directory information), or just use a
fully-qualified, valid path name, e.g.

      (setf *sppp-application* "/usr/local/bin/sppp")

Once the external preprocessing binary is know to the LKB, the function
call

      (initialize-sppp)

will activate external preprocessing. Try parsing a sentence and observe
the results. Typically, the setting of \*sppp-application\* could be
done as part of the globals.lsp in an LKB grammar, and calling
initialize-sppp() might be done in the grammar load script. To stop
using SPPP (and go back to the default LKB-internal processing), use the
function shutdown-sppp().

# SPPP Debugging

Given the asynchronous communication, it can be tedious to debug the
initial creation of an SPPP interface. Once the communication works, it
will likely be very stable, but getting both sides of the protocol to
cooperate can be a bit tricky at first. Following are a few suggestions
for debugging the initial SPPP set-up, in the unlikely event that it did
not just work out of the box.

There is a sample shell script to implement a *fake* external
preprocessor for the ERG. The script is called sppp and resides in the
lkb/src/glue/ sub-directory of the DELPH-IN tree (assuming your
installation includes source code for the LKB; see the
[LkbInstallation](https://delph-in.github.io/docs/tools/LkbInstallation) pages). Maybe start out by loading
the ERG and making sure you understand the SPPP basics by activating the
fake SPPP script; note that, no matter what input you parse, this script
will always return the example XML shown above as the preprocessor
output.

Once you know that the LKB is actually calling your own external binary,
make sure the formfeed-based synchronization works. It may be worth
augmenting your own binary with some code to log its activity to a
separate file (note that logging must not occur on standard output, as
that will be read by the LKB as preprocessor results). On the LKB side,
try calling something like

      (sppp "kim sleeps.")

Should the sppp() call not return, then most likely the preprocessor is
not including a trailing formfeed to terminate its output. In case the
function does return but reports errors, e.g. problems parsing the XML,
then inspect the value of the global variable \*sppp-input-buffer\* to
confirm the output from the external process actually adheres to the
SPPP protocol. Should everything else fail, consult the source code in
sppp.lsp, which is in the same directory as the fake sppp script.

# SPPP DTD

(inferred from the above example - UlrichSchaefer):

      <!ELEMENT segment ( token )* >
    
      <!ELEMENT token ( analysis )* >
      <!ATTLIST token form CDATA #REQUIRED 
                      from NMTOKEN #REQUIRED
                      to NMTOKEN #REQUIRED >
    
      <!ELEMENT analysis ( rule )* >
      <!ATTLIST analysis stem CDATA #REQUIRED
                         probability NMTOKEN #IMPLIED
                         pos NMTOKEN #IMPLIED >
                
      <!ELEMENT rule EMPTY >
      <!ATTLIST rule id NMTOKEN #REQUIRED
                     form CDATA #REQUIRED >

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/LkbSppp/_edit)]{% endraw %}