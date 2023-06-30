{% raw %}    <?xml version="1.0" encoding="UTF-8"?>
    
    <!-- DTD for SAF (benjamin.waldron cl.cam.ac.uk)  -->
            
    <!ELEMENT saf   (olac? , fsm ) >
    <!ATTLIST saf   addressing CDATA #REQUIRED
                    document CDATA #REQUIRED >
    
    <!ELEMENT fsm   (annot*)>
    <!ATTLIST fsm   initial IDREF #IMPLIED
                    final IDREF #IMPLIED>
    
    <!ELEMENT annot (slot|fs|rmrs)* >
    <!ATTLIST annot id ID #REQUIRED
                    from CDATA #IMPLIED
                    to CDATA #IMPLIED
                    source CDATA #IMPLIED
                    target CDATA #IMPLIED
                    value CDATA #IMPLIED
                    type CDATA #REQUIRED
                    deps IDREFS #IMPLIED >
    
    
    <!ELEMENT slot (#PCDATA) >
    <!ATTLIST slot name CDATA #REQUIRED >
    
    <!ELEMENT fs (f*) >
    <!ATTLIST fs type CDATA #IMPLIED>
    <!ELEMENT f (#PCDATA|fs)* >
    <!ATTLIST f name CDATA #REQUIRED>
    
    <!ENTITY % rmrs SYSTEM "rmrs.dtd">
    <!-- rmrs -->
    
    <!--!ELEMENT olac:olac (dc:creator?,created?,dc:identifier)-->
    
    <!-- it's too tedious to specify all possible permutations in a DTD, so use ANY instead! -->
    <!ELEMENT olac:olac ANY> 
    
    <!ATTLIST olac:olac
        xmlns:olac CDATA #FIXED "http://www.language-archives.org/OLAC/1.0/"
        xmlns:dc CDATA #FIXED "http://purl.org/dc/elements/1.1/"
    >
    
    <!ELEMENT created (#PCDATA)>
    
    <!--
    THE FOLLOWING IS A TAKEN FROM...
    
         DTD for the OLAC Metadata Set, version 1.0
         Gary Simons and Steven Bird, 8 April 2003
         
         The definitive definition for an OLAC metadata record is the XML schema
         at:  http://www.language-archives.org/OLAC/1.0/olac.xsd
         
         This DTD is offerred for the convenience of users who need to use DTD-based 
         software.  However, since schemas have more functionality than DTDs, validation
         with this DTD does not guarantee that the document is valid with respect to the schema.
    
    -->
        
    <!ENTITY % attributes  
       "xml:lang CDATA #IMPLIED
        xsi:type CDATA #IMPLIED
        olac:code CDATA #IMPLIED"
     >
    
    <!ELEMENT dc:creator (#PCDATA)>
    <!ATTLIST dc:creator
            %attributes;
    >
    
    <!ELEMENT dc:description (#PCDATA)>
    <!ATTLIST dc:description
            %attributes;
    >
    
    <!ELEMENT dc:identifier (#PCDATA)>
    <!ATTLIST dc:identifier
            %attributes;
    >
    <!ELEMENT dc:language (#PCDATA)>
    <!ATTLIST dc:language
            %attributes;
    >

Last update: 2009-01-23 by BenjaminWaldron [[edit](https://github.com/delph-in/docs/wiki/SafDtd/_edit)]{% endraw %}