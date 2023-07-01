{% raw %}# Indonesian POS Tagger

INDRA makes use of the [Indonesian POS
Tagger](http://bahasa.cs.ui.ac.id/postag/tagger) (Rashel et al., 2014),
a tool developed by a team from the Faculty of Computer Science of the
University of Indonesia, for POS tagging in Indonesian. This tool is not
included in the INDRA repository, and users are responsible for
downloading, installing, and setting up the tool.

Indonesian POS Tagger is based on the [Indonesian Morphological Analyzer
(MorphInd)](http://septinalarasati.com/work/morphind/) (Larasati et al.,
2011), a tool which handles both morphological analysis and
lemmatization for a given surface word form.

## Specifications

0\. Unix Operating System

1\. Install Perl

2\. If your machine does not have java, install java.

    $ sudo apt-get install default-jre

3\. Download [foma](https://code.google.com/p/foma/)

Please make sure foma was registered in your PATH environment variable.

4\. Download [Indonesian Morphological Analyzer
(MorphInd)](http://septinalarasati.com/work/morphind/)

Please make sure to put it in morphind folder.

## java

The version of java and javac have to be the same in order to run the
Indonesian POS Tagger.

    $ java -version
    java version "1.7.0_80"
    
    $ javac -version
    javac 1.7.0_80

If not, you have to svn up the logon.

    $ cd ~/logon
    $ svn up
    $ rm -f bin/java
    $ rm -f bin/chasen
    $ rm -f naist/bin/linux.x86.32/chasen
    $ svn cleanup *

If it does not work, delete the logon tree and reinstall. Note that
before deleting the logon tree, your own data such as tsdb have to be
stored.

    $ rm -rf logon
    $ svn co http://svn.emmtee.net/trunk logon

This takes a couple of hours, then remove the java in logon.

    $rm -f logon/bin/java

Reset up the FFTB for INDRA (see [IndraTreebanking](https://delph-in.github.io/docs/tools/IndraTreebanking)).

Last update: 2015-07-06 by DavidMoeljadi [[edit](https://github.com/delph-in/docs/wiki/IndraPreprocessing/_edit)]{% endraw %}