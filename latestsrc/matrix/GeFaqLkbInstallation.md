{% raw %}# Grammar Engineering Frequently Asked Questions

## I want to install the LKB on my local machine, what should I do?

The LKB can downloaded from the [DELPH-IN
website](http://www.delph-in.net/), for Linux. While there once were
versions which ran on Windows and Mac (to varying degrees), the current
system (with full functionality) is only available for Linux. Our
current advise to non-Linux users is to install
[VirtualBox](/VirtualBox) and then
[Knoppix+LKB](http://depts.washington.edu/uwcl/twiki/bin/view.cgi/Main/KnoppixLKB)
as a [VirtualBox
appliance](http://depts.washington.edu/uwcl/twiki/bin/view.cgi/Main/KnoppixLKB)
with the DELPH-IN software pre-installed which is maintained by UW.

Some other/older solutions noted below:

* * *

### Option 1: Install Ubuntu (or another Linux distribution)

This gives you a full Linux installation, and may be the best choice if
you want to learn Linux or plan to do a lot of linguistics work on your
machine. There is far more linguistics software for Linux than for any
other operating system.

Mayo Kudo and Emily Bender have put together a guide to installing
[Ubuntu and
LKB](http://depts.washington.edu/uwcl/twiki/bin/view.cgi/Main/UbuntuLKB).

#### Advantages

- Gives you a full Linux installation to work with.
- Fast, stable, and well-supported.
- Works on PCs and Intel Macs (including under Parallels).

#### Disadvantages

- Requires repartitioning your hard disk (unless running under
Parallels)
- Switching between Linux and Windows requires a reboot.

* * *

### Option 2: Install andLinux

andLinux is a special Linux version that runs in parallel with Windows.
For step-by-step instructions on installing it and getting LKB running,
see [this
tutorial](http://depts.washington.edu/uwcl/twiki/bin/view.cgi/Main/AndLinuxLKB).

#### Advantages

- No need to repartition.
- Linux LKB can be run alongside Windows applications.

#### Disadvantages

- Beta-test software; does not always install cleanly.
- Requires a lot of RAM, since you're running Windows and Linux
alongside each other.
- Requires Windows.

* * *

### Option 3: Knoppix+LKB

[Knoppix+LKB](http://depts.washington.edu/uwcl/twiki/bin/view.cgi/Main/KnoppixLKB)
is a bootable CD with Emacs and LKB pre-installed. It can be booted
directly from the CD, installed [manually under
VirtualBox](http://depts.washington.edu/uwcl/twiki/bin/view.cgi/Main/KnoppixLKBVirtualBox),
or run as a [VirtualBox
appliance](http://depts.washington.edu/uwcl/twiki/bin/view.cgi/Main/KnoppixLKB).

#### Advantages:

- No partitioning or installation required.
- LKB is pre-installed -- just boot and go.
- Works on PCs and Intel Macs.

#### Disadvantages:

- Limited hardware support. Laptop touchpad mice and wireless network
adapters seem to be the main sore points, although support for these
has improved markedly in recent versions.
- Slower than a "real" Linux installation, due to the relatively
sluggish speed of a CD drive compared to a hard disk.
- Can't install your own software.

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqLkbInstallation/_edit)]{% endraw %}