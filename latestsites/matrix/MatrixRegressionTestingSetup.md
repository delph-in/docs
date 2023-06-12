{% raw %}# Matrix Regression Testing Setup

NB: This set up is needed to run the classic regression testing system.
Consider using the newer, pydelphin-based regression testing script
which does not require you to set up a VM (you can just run tests
locally on your Linux or Mac). [Read this](https://delph-in.github.io/docs/matrix/MatrixRegressionTesting)
before proceeding with the below setup.

This page describes setting up a fresh [VirtualBox](/VirtualBox) virtual
machine to do Grammar Matrix Regression Testing (See
[MatrixDevTop](https://delph-in.github.io/docs/matrix/MatrixDevTop),
[MatrixRegressionTesting](https://delph-in.github.io/docs/matrix/MatrixRegressionTesting)). The basic
requirements to run the regression tests are:

- Ubuntu 12.04+
- emacs23+
- gcc
- The Grammar Matrix ([MatrixTop](https://delph-in.github.io/docs/matrix/MatrixTop))
- LOGON ([LogonTop](https://delph-in.github.io/docs/tools/LogonTop))
- ACE ([AceTop](https://delph-in.github.io/docs/tools/AceTop))

This page is current as of 02-10-16 - CMC

For experimental regression testing on Mac, see
[MatrixRegressionTestingSetupMac](https://delph-in.github.io/docs/matrix/MatrixRegressionTestingSetupMac)

## Setting up a VirtualBox virtual machine

This section describes setting up a VirtualBox virtual machine to run
the regression tests. Much of it is also applicable to running Ubuntu
natively.

1\) Install [VirtualBox](https://www.virtualbox.org)

2\) Download a 64 bit version of Ubuntu 12.04+ (12.04 and 14.04 are good
choices, downloadable [here](http://releases.ubuntu.com); or you can try
the latest version [here](http://www.ubuntu.com/download/desktop), in
which case make sure to update your [VirtualBox](/VirtualBox) as well.)

3\) Create an Ubuntu VirtualBox machine. Give it as much memory as you
can, and you’ll need \~20GB of storage space to get the right software
and run the regression tests. Once you have it ready, it is also
advisable to increase the GPU RAM available to the VM (usually you can
max this out). ([Windows
instructions](http://www.wikihow.com/Install-Ubuntu-on-VirtualBox), [Mac
instructions](http://www.tuaw.com/2013/09/06/running-linux-on-your-mac-2013-edition))

4\) Install the VirtualBox Guest Additions:
(<https://help.ubuntu.com/community/VirtualBox/GuestAdditions>)

    sudo apt-get update
    sudo apt-get install virtualbox-guest-x11 # This may not work anymore. Try using a different method in the above link.

5\) Restart you Virtual Machine.

6\) Get necessary additions for the LOGON tree (including 32-bit
compatibility modules). (libpng12-0 can be downloaded here:
<https://packages.ubuntu.com/xenial/i386/libpng12-0/download>):

    sudo dpkg --add-architecture i386
    sudo apt-get update
    sudo apt-get install libjpeg62 libx11-6:i386 libxext6:i386 libfontconfig1:i386
    sudo apt-get install libxpm4 libxt6 libxmu6 libxft2 libjpeg62 libpng12-0 # This may not work anymore. Try downloading and installing libpng12-0 from the above link.
    sudo apt-get install subversion
    sudo apt-get install emacs
    sudo apt-get install gcc

7\) Note: before performing the following step, open emacs normally (not
with sudo). If the first time emacs is opened is with sudo, it does not
work normally for the normal user. After you've opened emacs normally,
you can open it with sudo and perform the next step.

A bug in the current system causes regression tests to fail when running
a certain number of tests consecutively, about 260. To avoid this bug,
the user limit can be increased to allow for more files to be open at
the same time. In Ubuntu, the limit can be changed by appending the
following to this file: /etc/security/limits.conf

    * soft nofile 40000
    * hard nofile 40000

Logout and login to initiate this change.

8\) Download the LOGON tree (typically into \~/delphin/):

    cd ~/delphin/
    svn checkout http://svn.emmtee.net/trunk logon

9\) Download [ACE](http://sweaglesw.org/linguistics/ace/)
([AceTop](https://delph-in.github.io/docs/tools/AceTop))

10\) Download the matrix:

    cd ~/delphin/
    svn co svn://lemur.ling.washington.edu/shared/matrix/(trunk|branches/my_branch)

11\) Set the proper variables in \~/.bashrc (Make sure to customize the
variable values to the location where these packages are actually stored
on your system, and the proper branch if applicable) (also, make sure to
reload your \~/.bashrc by either logging out/in, restarting your
terminal, or source \~/.bashrc:

    export ACEROOT=~/delphin/ace/ # directory containing ACE binary
    export DELPHINHOME=~/delphin # installation location for DELPHIN stuff
    export LUI=yzlui # Set yzlui to be the default LUI for the LKB
    # include LOGON-specific settings
    export LOGONROOT=~/delphin/logon # installation location for LOGON
    if [ -f ${LOGONROOT}/dot.bashrc ]; then
        . ${LOGONROOT}/dot.bashrc
    fi
    # Add ACE to PATH # Not necessary, but nice
    export PATH=$PATH:$ACEROOT

12\) reload .bashrc, using either source \~/.bashrc, quitting and
re-opening the terminal, or logging out and back in.

13\) Add the following to \~/.emacs to configure emacs:

    ;;; include LOGON-specific settings
    (if (getenv "LOGONROOT")
      (let ((logon (substitute-in-file-name "$LOGONROOT")))
       (if (file-exists-p (format "%s/dot.emacs" logon))
        (load (format "%s/dot.emacs" logon) nil t t))))

14\) Download the latest ISO table from SIL to your Grammar Matrix root
directory (e.g. \~/delphin/matrix/trunk/ )

    wget http://www-01.sil.org/iso639-3/iso-639-3_20120206.tab -O iso.tab

15\) You should now be able to run the regression tests
([MatrixRegressionTesting](https://delph-in.github.io/docs/matrix/MatrixRegressionTesting)):

    cd ~/delphin/matrix/trunk/
    python matrix.py r

By default, this will run the regression tests using the customization
system under the current directory (\~/delphin/matrix/trunk/gmcs in this
example). You can also override the default to use a different
customization system installation, either by using the -C argument (e.g.
python matrix.py -C gmcs/ r) or by setting the CUSTOMIZATIONROOT
environment variable.

Last update: 2019-10-17 by KristenHowell [[edit](https://github.com/delph-in/docs/wiki/MatrixRegressionTestingSetup/_edit)]{% endraw %}