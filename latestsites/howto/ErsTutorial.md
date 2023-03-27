{% raw %}# Slides

This page gives information for the ERS tutorials at LREC and
[NAACL](http://naacl.org/naacl-hlt-2016/t1.html) 2016.

- [Final version of
slides](http://faculty.washington.edu/ebender/papers/ERS-tutorial.pdf)
(from NAACL)

# English Resource Semantics: Getting Started

This page describes how to get the support software for the ERS tutorial
onto your computer. We recommend tutorial attendees start with the
[VirtualBox](/VirtualBox) appliance, to reduce variability for hands-on
portions of the tutorial.

## VirtualBox Appliance

Here are the steps to get started with the VirtualBox appliance:

1. Install the VirtualBox installer, either from
<http://virtualbox.org> or from the tutorial USB key. You may be
prompted to (automatically) install drivers or be warned that
Microsoft has not tested the software.
2. Obtain the tutorial appliance OVA file, either from [here
(64-bit)](http://uakari.ling.washington.edu/knoppixlkb/naacl/naacl_appliance_v2-x86_64.ova)
or [here
(32-bit)](http://uakari.ling.washington.edu/knoppixlkb/naacl/naacl_appliance_v2-i686.ova)
or from the tutorial USB key.
3. Launch VirtualBox and choose "Import Appliance..." from the File
menu.
4. Select the .ova file and follow the onscreen instructions; default
options are fine. You will need at least 2GB of additional RAM
beyond what your OS and other running programs require, and 8GB of
hard disk space.
5. Select the new virtual machine and start it up.

#### Running the parser interactively

1. In the terminal window in [VirtualBox](/VirtualBox), start the
parser:  ace -g erg/erg-1214.dat -1l 
2. Type a simple test sentence, and hit Enter: *Most fierce dogs chase
cats.*
3. A separate parse tree window pops up.
4. Right-click within the parse tree window, and choose “Indexed MRS”
to see a compressed view of the ERS.
5. Alternatively, to get the ERS as a string written to the terminal,
start the parser without LUI:  ace -g erg/erg-1214.dat -1Tf 
6. Type a simple test sentence and hit Enter: *Most fierce dogs chase
cats.*

### Known issues

Windows users who have Hyper-V/Hypervision will have to uninstall it (or
maybe just disable it) to run the VM (coreinfo.exe may be useful in
checking what is happening - see also <http://superuser.com/a/768845>).
If you obtain an error about USB 2.0 support, install the
[VirtualBox](/VirtualBox) extensions (just download and launch the
extensions, no need to reimport the appliance). If you get an error
about 64-bit mode, you may need to enable virtualization in the BIOS of
your laptop (a symptom of this is that the Acceleration Tab is greyed
out in Settings / System in [VirtualBox](/VirtualBox)).

## Other Options

If you use Linux or MacOS X, you can install the ACE parser/generator
and the English Resource Grammar natively on your machine (i.e. without
using VirtualBox); however, file names and support software may not be
configured as assumed for the tutorial. The [ACE
homepage](http://sweaglesw.org/linguistics/ace/) has the relevant links
and some instructions; you may also find [AceTop](https://delph-in.github.io/docs/tools/AceTop) (in particular
[AceInstall](https://delph-in.github.io/docs/tools/AceInstall) and [AceLui](https://delph-in.github.io/docs/tools/AceLui)) useful.

Serious users will also find the so-called LOGON tree of interest. This
collection of software includes tools for grammar engineering,
converting between output formats, inspecting and annotating treebanks,
parsing and generating, and more. See [ErgProcessing](https://delph-in.github.io/docs/erg/ErgProcessing) and
[LogonTop](https://delph-in.github.io/docs/tools/LogonTop) (especially [LogonInstallation](https://delph-in.github.io/docs/tools/LogonInstallation))
for instructions and more details.

## Acknowledgements

The above instructions for setting up VirtualBox are largely inspired by
[these
instructions](http://depts.washington.edu/uwcl/twiki/bin/view.cgi/Main/KnoppixLKBVboxApp)
for KnoppixLKB. Our thanks go to David Brodbeck for his assistance in
preparing the tutorial VirtualBox appliance.

Last update: 2021-05-10 by Alexandre Rademaker [[edit](https://github.com/delph-in/docs/wiki/ErsTutorial/_edit)]{% endraw %}