{% raw %}# Overview

This page provides an in-depth discussion of the so-called *PET Input
Chart* (PIC) input mode for the cheap parser. PIC is an XML-based
generalization of the older YY input mode (see the [PetInput](https://delph-in.github.io/docs/garage/PetInput)
page for background). However, PIC too has its limitations and issues,
including its (apparent) incompatibility with the [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) profiler, see below. Where YY
input mode is sufficient, it may still be the most versatile and widely
supported option.

XML input mode is very similar to YY input mode. It allows you to
specify only simple tokens that get analysed internally by \\cheap or to
put all kinds of preprocessing information \\cheap can handle into the
input directly, namely POS, morphology, lexicon lookup and
multi-component entries.

It extends the YY mode in that it allows to have structured input tokens
to provide a means to encode, say, named entities resulting from base
tokens. It also allows to specify modifications to feature structures
(coming from lexicon entries).

It is called with -tok=pic\_counts and can be used in combination with
-default-les (see the [PetInput](https://delph-in.github.io/docs/garage/PetInput) page for details) to trigger
unknown words with POS tags, much like in YY mode.

# Examples

A typical way of calling it, with xml input and the best ranked xml rmrs
output) would be:

      cat input.xml | cheap -tok=pic_counts -default-les -packing -mrs=rmrx -results=1 grammar.grm

A simple example input is given below:

    <?xml version="1.0" encoding="utf-8" standalone="no" ?>
    <!DOCTYPE pet-input-chart
     SYSTEM "/use/local/lib/xml/pic.dtd">
    <pet-input-chart>
    <!-- This FAQ is short -->
      <w id="W1" cstart="1" cend="5">
        <surface>This</surface>
        <pos tag="DD1" prio = "1.0" />
      </w>
      <w id="W2" cstart="7" cend="9">
        <surface>FAQ</surface>
        <pos tag="NP1" prio = "1.0" />
      </w>
       <w id="W2" cstart="7" cend="9" constant="yes">
        <surface>FAQ</surface>
        <typeinfo id="n_-_pn_le" baseform="no" prio="1.0">
          <stem>$genericname</stem>
          <fsmod path="SYNSEM.LKEYS.KEYREL.CARG" value="F.A.Q."/>
          </typeinfo>
      </w>
      <w id="W3" cstart="11" cend="12">
        <surface>is</surface>
        <pos tag="BE" prio = "1.0" />
      </w>
      <w id="W4" cstart="14" cend="18">
        <surface>short</surface>
        <pos tag="JJ" prio = "1.0" />
      </w>
     </pet-input-chart>

*Note:* the two empty lines at the end of the input file appear
necessary when piping data into PET using the above command. This is
possibly the reason why folks have not succeeded in recording PIC inputs
in [\[incr tsdb()\]](http://www.delph-in.net/itsdb) profiles and sending
them to PET via the [\[incr tsdb()\]](http://www.delph-in.net/itsdb)
API: trailing newlines are truncated in this mode of operation. Someone
should look into this more ...

The input is broken up into tokens &lt;w&gt;...&lt;/w&gt;, which must
have unique **id**s. Each token gives its start (cstart) and end (cend)
(inclusive) character position. It can also include a pos element, with
the tag and confidence (priority).

It also allows more detailed specifications (named entities, modified
feature structures, ...).

You can only enter a single pet-input-chart in a stream, and it must
start with the XML declaration and finish with at least two empty lines.
Alternatively, you can give the name of a file consisting of a single
pet-input-chart, or a list of such filenames, one on each line.

The example given below illustrates most of the available features.
Tokens **W0** and **W1** are not analysed at all by **cheap** because
the (boolean) **constant** attribute is **yes**.

- The default value of this attribute is {\\tt no}, which means that

the token **W3** will be analysed by all of the activated preprocessing
modules in **cheap**.

    <?xml version="1.0" encoding="ISO-8859-1" standalone="no" ?>
    <!DOCTYPE pet-input-chart
      SYSTEM "/path/to/src/pet/doc/pic.dtd">
    <pet-input-chart>
      <w id="W0" cstart="1" cend="3" constant="yes">
        <surface>Kim</surface>
      </w>
      <w id="W1" cstart="5" cend="9" constant="yes">
        <surface>Novak</surface>
      </w>
      <ne id="NE0" prio="1.0">
        <ref dtr="W0">
        <ref dtr="W1">
        <pos tag="PN" prio="1.0">
        <typeinfo id="TNE0" baseform="no">
          <stem>$generic_name</stem>
          <fsmod path="SYNSEM.LOCAL.HEAD.FORM" value="Kim Novak"/>
        </typeinfo>
      </ne>
      <w id="W2" cstart="11" cend="16" constant="yes">
        <surface>sleeps</surface>
        <pos tag="VVFIN" prio="7.80000e-1"/>
        <pos tag="NN" prio="2.30000e-2"/>
        <typeinfo id="W1A1">
          <stem>sleep</stem>
          <infl name="$third_sg_fin_verb_infl_rule"/>
        </typeinfo>
        <typeinfo id="W1A2">
          <stem>sleep</stem>
          <infl name="$plur_noun_infl_rule"/>
        </typeinfo>
      </w>
      <w id="W3" cstart="18" cend="22">
        <surface>badly</surface>
        <pos tag="ADV" prio="1.00000e+1"/>
      </w>
    </pet-input-chart>

Token **NE0** is an example of a complex token referencing a sequence of
two base tokens. Its **typeinfo** directly gives the HPSG type name
whose feature structure should be used as lexical item in **cheap**.
While in YY mode this was triggered by a leading special character, in
XML the attribute **baseform** decides if the string enclosed by the
**&lt;stem&gt;** tag is to be interpreted as lexical base form or as
type name. The default value of **baseform** is **yes**. In this token,
the surface string is unified into the feature structure under path
**SYNSEM.LOCAL.HEAD.FORM**, which is specified with the
**&lt;fsmod&gt;** tag. The value of an **&lt;fsmod&gt;** may be an
arbitrary string. **cheap** will add a dynamic symbol if the string is
not a known type or symbol name.

Every **&lt;typeinfo&gt;** tag potentially generates a lexical item (if
it leads to a valid lexical feature structure). Thus, there will be two
readings for the token **W2** (*sleeps*), whereas internal analysis of
the surface form has been inhibited. This need not be necessarily so. It
is possible to provide external analyses and have a **&lt;w&gt;** token
also being analysed internally if the **constant** flag is omitted or
set to **no**.

The XML tag **&lt;surface&gt;** encloses the surface string,
**&lt;pos&gt;** and **&lt;path&gt;** tags are analogous to YY mode;
multiple **&lt;infl&gt;** rules in a **&lt;typeinfo&gt;** will have to
be considered from first to last.

XML input mode can be used in two different ways, either by specifying a
file name containing the XML data (preferably with correct XML header
and DTD or DTD URL specification) or by giving the XML data directly.

If the XML data is put directly into the standard input, it *must* start
with a valid XML header **&lt;?xml version="1.0" ... ?&gt;** with no
leading whitespace, because recognition of the header triggers the
reading of XML from standard input. The end of the data is marked by an
empty line (two consecutive newline characters), therefore, the data
itself, including an eventually given DTD, may not contain empty lines.

# PIC (pet-input-chart) DTD

This is the pic.dtd from the [Heart of Gold](https://delph-in.github.io/docs/garage/HeartofgoldTop).

    <!ELEMENT pet-input-chart ( w | ne )* >
      <!-- base input token -->
      <!ELEMENT w ( surface, path*, pos*, typeinfo* ) >
      <!ATTLIST w         id ID      #REQUIRED
                      cstart NMTOKEN #REQUIRED
                        cend NMTOKEN #REQUIRED
                        prio CDATA   #IMPLIED
                    constant (yes | no) "no" >
      <!-- constant "yes" means: do not analyse, i.e., if the tag contains
           no typeinfo, no lexical item will be build by the token -->
     
      <!-- The surface string -->
      <!ELEMENT surface ( #PCDATA ) >
    
      <!-- numbers that encode valid paths through the input graph (optional) -->
      <!ELEMENT path EMPTY >
      <!ATTLIST path     num NMTOKEN #REQUIRED >
     
      <!-- every typeinfo generates a lexical token -->
      <!ELEMENT typeinfo ( stem, infl*, fsmod* ) >
      <!ATTLIST typeinfo   id ID     #REQUIRED
                         prio CDATA  #IMPLIED
                     baseform (yes | no) "yes" >
      <!-- Baseform yes: lexical base form; no: type name -->
    
      <!-- lexical base form or type name -->
      <!ELEMENT stem ( #PCDATA ) >
    
      <!-- type name of an inflection rule-->
      <!ELEMENT infl  EMPTY >
      <!ATTLIST infl    name CDATA   #REQUIRED >
    
      <!-- put type value under path into the lexical feature structure -->
      <!ELEMENT fsmod  EMPTY >
      <!ATTLIST fsmod   path CDATA   #REQUIRED
                       value CDATA   #REQUIRED >
    
      <!-- part-of-speech tags with priorities -->
      <!ELEMENT pos  EMPTY >
      <!ATTLIST pos      tag CDATA   #REQUIRED
                        prio CDATA   #IMPLIED >
    
      <!-- structured input items, mostly to encode named entities -->
      <!ELEMENT ne  ( ref+, pos*, typeinfo+ )  >
      <!ATTLIST ne        id ID      #REQUIRED
                        prio CDATA   #IMPLIED >
     
      <!-- reference to a base token -->
      <!ELEMENT ref  EMPTY >
      <!ATTLIST ref      dtr IDREF   #REQUIRED >

# Encoding issues

By default the XML parser used with cheap (libxerces) can handle
iso-8859-1 and utf-8. To get other encodings, such as euc-jp, you need
to link the xml parser against the icu libraries.

For **debian** and derivatives this means:

    apt-get install sudo apt-get install libxercesicu25 icu

rather than:

    apt-get install sudo apt-get install libxerces25 

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/PetInputChart/_edit)]{% endraw %}