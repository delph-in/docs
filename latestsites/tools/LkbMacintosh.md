{% raw %}# Running the LKB on macOS

There are three recommended ways of running the LKB on macOS: the first
is to use 'LKB-FOS' (the fully open source version of the LKB); the
other two involve running a Linux version of the LKB in a virtual
machine.

LKB-FOS is based on the version of the LKB that has been developed over
the past several years in Allegro CL on Linux. There are currently
pre-built native binaries of LKB-FOS for macOS and Linux. See
[LkbFos](https://delph-in.github.io/docs/tools/LkbFos) for more information and installation instructions.

An alternative approach is to run a Linux version of the LKB in a
virtual machine. The most convenient way to to this is with
[Ubuntu+LKB](https://wiki.ling.washington.edu/bin/view.cgi/Main/KnoppixLKB),
a [VirtualBox](http://www.virtualbox.org/) appliance based on Ubuntu
Linux.

If you want to run the full [LOGON](http://www.emmtee.net/) software
infrastructure, including the LKB, [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) and associated tools, you
should use a different virtual machine approach. This is based on
*Docker*. Since Docker VMs are minimal and headless, the graphical
display needs to be redirected to an X11 server (*XQuartz*) on your
macOS machine. Lluís Padró has kindly created a Linux image with all
LOGON requirements (which are basically *emacs*, plus some X11 and
rendering libraries) and a script that takes care of the needed display
redirections and volume mappings. The
[download](http://www.cs.upc.edu/~padro/docker-logon.tgz) contains the
Linux image, the dockerfile to re-create it (not needed, but helpful if
you want to re-create the image yourself), the script to launch the VM,
and a README explaining it all. Although this approach works quite well,
note that the VM session often does not survive if the machine running
it goes to sleep.

An updated version of the Docker-based approach created by Lluís Padró
is available [here](https://github.com/arademaker/docker-logon), this
version is maintained by [AlexandreRademaker](https://delph-in.github.io/docs/garage/AlexandreRademaker).

Last update: 2019-01-29 by AlexandreRademaker [[edit](https://github.com/delph-in/docs/wiki/LkbMacintosh/_edit)]{% endraw %}