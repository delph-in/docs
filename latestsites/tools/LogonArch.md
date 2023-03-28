{% raw %}# Background

Linux distributions differ, particularly so in the selection of tools
and libraries pre-installed in standard configurations. This page
provides Arch Linux-specific information related to installing and
operating the LOGON infrastructure (for general installation guidelines,
please see the [LogonInstallation](https://delph-in.github.io/docs/tools/LogonInstallation) page). The
information on this page is user-provided documentation. As you extend
or revise the page, please take care to spell out (a) the specific
problem to be addressed, including observable symptoms; (b) the exact
platform (32- or 64-bit) and version of the distribution affected; and
(c) the exact procedure to be applied for fixing the problem.

### General Note

Arch Linux is very much a do-it-yourself distribution, and after
installation you will be presented with a very basic system. Therefore,
necessary packages may vary widely from one user to another. In general,
packages available from the standard repositories are very up-to-date,
so most issues will likely be with library version compatibility.

# 32-bit Compatibility Libraries

In my system, I run the full Gnome3 environment (including GDM,
gnome-shell, gtk3 libraries, etc). LOGON wasn't the first thing I
installed, so there may be other dependencies already fulfilled (and
thus not listed here), but I only had trouble with **libjpeg** and
**libpng**.

### libjpeg.so.62

I had libjpeg8 installed, but LOGON was expecting version 6
(specifically libjpeg.so.62). You can find version 6 in the AUR
(<https://aur.archlinux.org/packages/lib32-libjpeg6/>), but I had
success simply symlinking the version 8 binary (note, my version was
8.0.2, but your exact version may differ):

sudo ln -s /lib/libjpeg.so.8.0.2 /lib/libjpeg.so.62

### libpng12.so.0

The symlinking technique did not work with libpng, but luckily the right
version was in the standard repositories:

sudo pacman -S libpng12

Last update: 2013-03-09 by MichaelGoodman [[edit](https://github.com/delph-in/docs/wiki/LogonArch/_edit)]{% endraw %}