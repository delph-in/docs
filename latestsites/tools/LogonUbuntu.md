{% raw %}# Background

Linux distributions differ, particularly so in the selection of tools
and libraries pre-installed in standard configurations. This page
provides Ubuntu-specific information related to installing and operating
the LOGON infrastructure (for general installation guidelines, please
see the [LogonInstallation](https://delph-in.github.io/docs/tools/LogonInstallation) page). The information on
this page is user-provided documentation. As you extend or revise the
page, please take care to spell out (a) the specific problem to be
addressed, including observable symptoms; (b) the exact platform (32- or
64-bit) and version of the distribution affected; and (c) the exact
procedure to be applied for fixing the problem.

# 32-Bit Compatibility Libraries

As recommended in [LogonInstallation](https://delph-in.github.io/docs/tools/LogonInstallation), you'll want
32-bit libraries on 64-bit systems.

In recent Ubuntu's (such as 14.04) you should do:

    sudo dpkg --add-architecture i386
    sudo apt update
    sudo apt install libjpeg62 libx11-6:i386 libxext6:i386 libfontconfig1:i386

For older versions, try:

      sudo apt-get install ia32-libs

As well as the libraries, LOGON components such as [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) may complain about missing
libraries. Installing the following packages solved the problem at least
on one jaunty system (please add more if you find problems from running
other components):

      sudo apt-get install libxpm4 libxt6 libxmu6 libxft2 libjpeg62 libpng12-0

On Precise Pangolin (12.04) you may only need libjpeg62.

Possibly also see [LogonDebian](https://delph-in.github.io/docs/tools/LogonDebian)

Last update: 2016-10-07 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/LogonUbuntu/_edit)]{% endraw %}