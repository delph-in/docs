{% raw %}# Overview

The *Feature Structure Chart* (FSC) format is an XML-based input format
for the cheap parser (see the [PetInput](https://delph-in.github.io/docs/garage/PetInput) page for background).
It is well suited as a replacement for scenarios where PIC
([PetInputChart](https://delph-in.github.io/docs/garage/PetInputChart)) or SMAF ([SmafTop](https://delph-in.github.io/docs/tools/SmafTop)) are used.

An FSC document describes the initial chart of the parser, which is a
lattice of tokens. Vertices in the lattice represent token boundaries
and edges represent tokens. Tokens are only described by feature
structures, which can be arbitrarily structured, though. The only
requirement for successful processing is that the types for these
feature structures are all defined and that the grammar knows where to
retrieve the form of a token (defined in the settings).

If the grammar is set up to unify token feature structures into the
feature structure of words (as, e.g., the ERG), it is possible to
"inject" annotations of external tools into the parser. Combined with
chart mapping and the unknown word handling mechanism on top of token
feature structures (see [PetInput](https://delph-in.github.io/docs/garage/PetInput)), it is thus possible to
trigger the instantiation of generic lexical entries upon external
annotation and shape the search space of the parser. The FSC format is
at present the only format that allows the user to provide external
annotation beyond part-of-speech tags.

# Example

Example call:

      cat input.fsc | cheap -tok=fsc -default-les=all -cm -packing -mrs -results=1 english.grm

Example file:

    <?xml version='1.0' encoding='utf-8'?>
    <fsc version="1.0">
      <chart id="fsc-test">
        <text>The dog chases the orc.</text>
        <lattice init="v0" final="v6">
          <edge source="v0" target="v1">
            <fs type="token">
              <f name="+FORM"><str>The</str></f>
              <f name="+FROM"><str>0</str></f>
              <f name="+TO"><str>3</str></f>
              <f name="+TNT">
                <fs type="tnt">
                  <f name="+TAGS" org="list"><str>DT</str></f>
                  <f name="+PRBS" org="list"><str>1.000000e+00</str></f>
                </fs>
              </f>
            </fs>
          </edge>
          <edge source="v1" target="v2">
            <fs type="token">
              <f name="+FORM"><str>dog</str></f>
              <f name="+FROM"><str>4</str></f>
              <f name="+TO"><str>7</str></f>
              <f name="+TNT">
                <fs type="tnt">
                  <f name="+TAGS" org="list"><str>NN</str></f>
                  <f name="+PRBS" org="list"><str>1.000000e+00</str></f>
                </fs>
              </f>
            </fs>
          </edge>
          <edge source="v2" target="v3">
            <fs type="token">
              <f name="+FORM"><str>chases</str></f>
              <f name="+FROM"><str>8</str></f>
              <f name="+TO"><str>14</str></f>
              <f name="+TNT">
                <fs type="tnt">
                  <f name="+TAGS" org="list"><str>VBZ</str><str>NNS</str></f>
                  <f name="+PRBS" org="list"><str>8.039033e-01</str><str>1.960967e-01</str></f>
                </fs>
              </f>
            </fs>
          </edge>
          <edge source="v3" target="v4">
            <fs type="token">
              <f name="+FORM"><str>the</str></f>
              <f name="+FROM"><str>15</str></f>
              <f name="+TO"><str>18</str></f>
              <f name="+TNT">
                <fs type="tnt">
                  <f name="+TAGS" org="list"><str>DT</str></f>
                  <f name="+PRBS" org="list"><str>1.000000e+00</str></f>
                </fs>
              </f>
            </fs>
          </edge>
          <edge source="v4" target="v5">
            <fs type="token">
              <f name="+FORM"><str>orc</str></f>
              <f name="+FROM"><str>19</str></f>
              <f name="+TO"><str>22</str></f>
              <f name="+TNT">
                <fs type="tnt">
                  <f name="+TAGS" org="list"><str>JJ</str><str>NN</str></f>
                  <f name="+PRBS" org="list"><str>5.297595e-01</str><str>4.702405e-01</str></f>
                </fs>
              </f>
            </fs>
          </edge>
          <edge source="v5" target="v6">
            <fs type="token">
              <f name="+FORM"><str>.</str></f>
              <f name="+FROM"><str>22</str></f>
              <f name="+TO"><str>23</str></f>
              <f name="+TNT">
                <fs type="tnt">
                  <f name="+TAGS" org="list"><str>.</str></f>
                  <f name="+PRBS" org="list"><str>1.0</str></f>
                </fs>
              </f>
            </fs>
          </edge>
        </lattice>
      </chart>
    </fsc>

# DTD

This is the fsc.dtd:

    <!ELEMENT fsc ( chart ) >
    <!ATTLIST fsc version NMTOKEN #REQUIRED >
    
    <!ELEMENT chart ( text, lattice ) >
    <!ATTLIST chart id CDATA #REQUIRED >
    
    <!ELEMENT text ( #PCDATA ) >
    
    <!ELEMENT lattice ( edge* ) >
    <!ATTLIST lattice final CDATA #REQUIRED >
    <!ATTLIST lattice init CDATA #REQUIRED >
    
    <!ELEMENT edge ( fs ) >
    <!ATTLIST edge source CDATA #REQUIRED >
    <!ATTLIST edge target CDATA #REQUIRED >
    
    <!ELEMENT fs ( f* ) >
    <!ATTLIST fs type CDATA #REQUIRED >
    
    <!ELEMENT f ( fs | str )* >
    <!ATTLIST f name CDATA #REQUIRED >
    <!ATTLIST f org ( list ) #IMPLIED >
    
    <!ELEMENT str ( #PCDATA ) >

# Integration

## \[incr tsdb()\]

FSC combines well with [\[incr tsdb()\]](http://www.delph-in.net/itsdb),
as long as the convention "one line = one item" is respected. For
displaying the correct text during parsing and treebanking with [\[incr
tsdb()\]](http://www.delph-in.net/itsdb), the following function should
be defined:

    (defun fsc-read-input (string)
      (let* ((string (string-trim '(#\space #\newline) string))
             (xml (ignore-errors (s-xml:parse-xml-string string)))
             (text (second (assoc :|text| (rest (first (rest xml)))))))
            (or text string)))

This function should be used as a reader in the CPU definition for
parsing:

           (make-cpu 
            :host (short-site-name)
            :spawn cheap
            :options (list "-t" "-tsdb" "-tok=fsc" "-packing"
                           "-cm" "-default-les=all"
                           "-memlimit=1024" "-timeout=60"
                           (format nil "~a/lingo/erg/english.grm" root))
            :reader "tsdb::fsc-read-input"
            :class :erg+fsc :grammar erg :name "pet"
            :task '(:parse)  :flags '(:generics t)
            :wait wait :quantum quantum)

The function should also be called before treebanking:

    (setf (gethash :i-input *statistics-readers*) #'fsc-read-input)

## Heart of Gold

The Heart of Gold ([HeartofgoldTop](https://delph-in.github.io/docs/garage/HeartofgoldTop)) can be used to
synthesize token feature structures from several modules. There are
currently sessions defined for the ERG that combine jTok, TnT, and
optionally SProUT output into FSC documents.

# Encoding issues

By default the XML parser used with cheap (libxerces) can handle
iso-8859-1 and utf-8. To get other encodings, such as euc-jp, you need
to link the xml parser against the icu libraries.

For **debian** and derivatives this means:

    apt-get install sudo apt-get install libxercesicu25 icu

rather than:

    apt-get install sudo apt-get install libxerces25 

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/PetInputFsc/_edit)]{% endraw %}