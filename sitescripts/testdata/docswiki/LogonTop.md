# Overview

The LOGON infrastructure (and source tree) is a collection of software,
grammars, and other linguistic resources to facilitate experimentation
with transfer-based machine translation (MT), or other experimentation
with 'deep' parsing or generation. To a large degree, the LOGON tree
packages resources that exist independently, specifically the core of
the open-source [DELPH-IN](http://www.delph-in.net) toolchain and
several of the DELPH-IN grammars. These include, among others, the
[LKB](http://www.delph-in.net/lkb), [PET](http://www.delph-in.net/pet)
(see the [LogonPet](LogonPet) page), and [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) software systems, and the
[LinGO ERG](http://www.delph-in.net/erg),
[GG](http://www.delph-in.net/gg), [JaCY](http://www.delph-in.net/jacy),
and [SRG](http://www.delph-in.net/srg) broad-coverage grammars for
English, German, Japanese, and Spanish, respectively. Additionally, the
tree includes pre-compiled versions of other packages, for example
[ChaSen](http://chasen.aist-nara.ac.jp/chasen/distribution.html.en) (for
Japanese pre-processing), the CMU Language Modeling Toolkit
([SLM](http://www.speech.cs.cmu.edu/SLM_info.html)),
[FreeLing](http://garraf.epsevg.upc.es/freeling/) (Spanish
pre-processing), [TADM](http://tadm.sourceforge.net/) (for MaxEnt
experimentation), [TnT](http://www.coli.uni-saarland.de/~thorsten/tnt/)
(for English PoS tagging), and
[UTool](http://www.coli.uni-saarland.de/projects/chorus/utool/) (for MRS
manipulation).

The LOGON tree was originally developed by the Norwegian
[LOGON](http://www.emmtee.net) and
[HandOn](http://www.emmtee.net/index.php?page=7) research projects,
working on quality-oriented translation from Norwegian to English. For
Norwegian analysis, these projects employed (an extended version of) the
[Oslo-Bergen
Tagger](http://maximos.aksis.uib.no/Aksis-wiki/Oslo-Bergen_Tagger) (OBT)
and the [NorGram](http://www.hf.uib.no/i/LiLi/SLF/Dyvik/norgram/) LFG
implementation. Both resources are released under open-source licenses
as part of the LOGON tree. However, to actually run the
Norwegian–English instantiation of the system (dubbed NoEn), the
proprietary [XLE](http://www2.parc.com/isl/groups/nltt/xle/) LFG system
and a commercially licensed bilingual dictionary (dubbed KF) are
required, which cannot be part of the freely available LOGON
distribution. Please see the [LogonExtras](LogonExtras) page for
instructions on how to install proprietary add-ons to the LOGON tree,
e.g. for sites holding valid XLE and KF licenses. To see the
Norwegian–English LOGON system at work, there is an [on-line
interface](http://noen.emmtee.net) to the MT demonstrator.

In subsequent collaborations between the original LOGON developers and
DELPH-IN researchers in Germany, Japan, and the USA, additional language
pairs were added. As of late 2008, these include German–English and
Japanese–English (and, albeit lesser developed, the inverse directions
of translation), as well as a battery of 'baby' MT systems built from a
collection of smaller grammars based on the LinGO [Grammar
Matrix](http://www.delph-in.net/matrix). In a sense, the LOGON tree
functions similar to a GNU/Linux distribution: it combines a complex set
of individual components, aiming to provide ease of installation and a
certain degree of uniformity, inter-operability, and quality assurance.
The system is available exclusively for GNU/Linux (on 32-bit or 64-bit
x86 architectures). As of November 2008, all system development and
distribution is through the [SubVersion](http://subversion.tigris.org/)
(SVN) revision management system. Please see the
[LogonInstallation](LogonInstallation) page for details. Regrettably,
only a very limited amount of documentation is available, a property
that the LOGON tree shares with a number of the core DELPH-IN resources.
The [LogonReports](LogonReports) page summarizes the documentation
misery as of late 2008.

# Table of Contents

Following is a list of topics for which at least some documentation
exists. Feel free to add additional materials, but please make sure to
create adequate wiki names for new pages, typically prefixed with
*Logon* where they pertain to specifics of the LOGON infrastructure.

-   [LogonInstallation](LogonInstallation): System Requirements,
    Download and Installation Notes

-   [LogonProcessing](LogonProcessing): Documentation of Various Batch
    Processing Facilities

-   [LogonModeling](LogonModeling): Information on Training and Applying
    Various Statistical Models

-   [LogonOnline](LogonOnline): Instructions on Creating On-Line,
    Web-Accessible Demonstrators

-   [LogonTransfer](LogonTransfer): Some Notes on Using the MRS Rewrite
    System (Semantic Transfer)

-   [LogonIdiosyncrasies](LogonIdiosyncrasies): Details of Non-Standard
    Defaults and LOGON Functionality

-   [LogonWishlist](LogonWishlist): Feature Requests Contributed by
    LOGON Co-Developers and Users

# Background Materials

Further information on the LOGON software and consortium can be found at
the [project web site](http://www.emmtee.net/); the following
publication provides an overview of most of the core pieces:

-   Stephan Oepen, Erik Velldal, Jan Tore Lønning, Paul Meurer, Victoria
    Rosén, and Dan Flickinger (2007).

    [Towards hybrid quality-oriented machine translation. On linguistics
    and probabilities in
    MT](http://share.emmtee.net/pub/bscw.cgi/d64459/tmi07.pdf). In
    *Proceedings of the 10th International Conference on Theoretical and
    Methodological Issues in Machine Translation*, pp.144–153. Skövde,
    Sweden.

-   Stephan Oepen, Helge Dyvik, Jan Tore Lønning, Erik Velldal, Dorothee
    Beermann, John Carroll, Dan Flickinger, Lars Hellan, Janne Bondi
    Johannessen, Paul Meurer, Torbjørn Nordgård, and Victoria Rosén
    (2004).

    [Som å kapp-ete med trollet? Towards MRS-based Norwegian-English
    Machine
    Translation](http://share.emmtee.net/pub/bscw.cgi/d23044/tmi04.pdf).
    In *Proceedings of the 10th International Conference on Theoretical
    and Methodological Issues in Machine Translation*, pp. 11–20.
    Baltimore, MD.

The first paper discussing the use of Minimal Recursion Semantics in
machine translation is:

-   Ann Copestake, Dan Flickinger, Rob Malouf, Susanne Riehemann and
    Ivan Sag (1995).

    [Translation using Minimal Recursion
    Semantics](http://www.cl.cam.ac.uk/~aac10/papers/tmi95.ps.gz). In
    *Proceedings of The Sixth International Conference on Theoretical
    and Methodological Issues in Machine Translation*, pp. 15–32.
    Leuven, Belgium.

An example of the extension of the LOGON machinery to a new language
pair can be seen in

-   Francis Bond, Stephan Oepen, Melanie Siegel, Ann Copestake, and Dan
    Flickinger (2005).

    [Open source machine translation with
    DELPH-IN](http://www2.nict.go.jp/x/x161/en/member/bond/pubs/2005-summit-osmt.pdf).
    In *Open-Source Machine Translation: Workshop at MT Summit X*, pp
    15–22. Phuket, Thailand.

For additional information, there is an archived [mailing
list](http://lists.emmtee.net/mailman/listinfo/logon) for the LOGON
tree. For additional questions, please feel free to contact Stephan
Oepen (oe *at* ifi.uio.no), the technical manager for the original
Norwegian LOGON consortium.
