{% raw %}# Matrix Regression Testing Setup

This page describes setting up a the Grammar Matrix Regression Testing
suite on a Mac (\~ Mac OS 10.12) (See [MatrixDevTop](https://delph-in.github.io/docs/matrix/MatrixDevTop),
[MatrixRegressionTesting](https://delph-in.github.io/docs/matrix/MatrixRegressionTesting)). This page is under
development and should not be considered useable. For instructions on
the stable setup for Ubuntu, see
[MatrixRegressionTestingSetup](https://delph-in.github.io/docs/matrix/MatrixRegressionTestingSetup)

## Mac setup instructions (under development)

NOTE: This probably won't work and may not be needed

1\) Get necessary additions for the LOGON tree (including 32-bit
compatibility modules):

    sudo dpkg --add-architecture i386
    sudo apt-get update
    sudo apt-get install libjpeg62 libx11-6:i386 libxext6:i386 libfontconfig1:i386
    sudo apt-get install libxpm4 libxt6 libxmu6 libxft2 libjpeg62 libpng12-0
    sudo apt-get install subversion
    sudo apt-get install emacs
    sudo apt-get install gcc

2\) Download [ACE](http://sweaglesw.org/linguistics/ace/)
([AceTop](https://delph-in.github.io/docs/tools/AceTop))

3\) Download the matrix:

    cd ~/delphin/
    svn co svn://lemur.ling.washington.edu/shared/matrix/(trunk|branches/my_branch)

4\) reload .bash\_profile, using either source \~/.bash\_profile,
quitting and re-opening the terminal, or logging out and back in.

5\) Download the latest ISO table from SIL to your Grammar Matrix root
directory (e.g. \~/delphin/matrix/trunk/ )

    wget http://www-01.sil.org/iso639-3/iso-639-3_20120206.tab -O iso.tab

6\) You should now be able to run the regression tests
([MatrixRegressionTesting](https://delph-in.github.io/docs/matrix/MatrixRegressionTesting)):

    cd ~/delphin/matrix/trunk/
    python matrix.py -C gmcs/ r

Last update: 2017-09-17 by TJTrimble [[edit](https://github.com/delph-in/docs/wiki/MatrixRegressionTestingSetupMac/_edit)]{% endraw %}