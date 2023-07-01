{% raw %}# Overview

The *Linguistic User Interface* (LUI) is an ongoing project to build a visualization tool for the most common object types in constraint-based grammars, i.e. trees, feature structures, MRSs, charts, et al. While the LKB comes with built-in browsers for all of these, the current use of the CLIM (Common-Lisp Interface Manager) toolkit in the LKB severely limits portability and ease of use (and programmatic extension). Thus, portability and royalty-free delivery are among the primary motivations for the LUI project; at the same time, LUI attempts to 'conservatively' improve over the existing LKB tools, for example in terms of layout options, scalability, user parameterization, display efficiency. While preserving all existing LKB display functionality, LUI adds some new facilities, including drag-and-drop interactive unification, display of, and navigation through multiple feature structure incompatibilities, and creation of screen dumps in (for now) PostScript or LaTeX formats.

The standard implementation of LUI is an application of the [YZ Windows](http://yz-windows.sourceforge.net/) API, developed mainly by Woodley Packard, who is also the main LUI developer (with LKB-side support by Stephan Oepen. An alternate LUI binary compiled with Pango (which gives better font support for various international character sets) is available (albeit in binary only) as part of [Trollet](https://delph-in.github.io/docs/tools/LkbTrollet), developed by Pavel Mihaylov; see below.

# LUI Documentation at a Glance

- [LuiUi](https://delph-in.github.io/docs/tools/LuiUi)
- [LuiTree](https://delph-in.github.io/docs/tools/LuiTree)
- [LuiAvm](https://delph-in.github.io/docs/tools/LuiAvm)
- [LuiUnification](https://delph-in.github.io/docs/tools/LuiUnification)
- [LuiMrs](https://delph-in.github.io/docs/tools/LuiMrs)
- [LuiRc](https://delph-in.github.io/docs/tools/LuiRc)
- [AceLui](https://delph-in.github.io/docs/tools/AceLui)

# Existing LUI Browsers

LUI currently provides browsers for four types of linguistic structures, viz. constituent trees ([LuiTree](https://delph-in.github.io/docs/tools/LuiTree)), feature structures
([LuiAvm](https://delph-in.github.io/docs/tools/LuiAvm)), MRSs ([LuiMrs](https://delph-in.github.io/docs/tools/LuiMrs)), and parse charts ([LuiChart](https://delph-in.github.io/docs/tools/LuiChart)). For other types of linguistic objects, a LUI-enabled LKB session will just fall back on the default, built-in display methods from the LKB.

LUI browsers exhibit certain common interface characteristics, described on the [LuiUi](https://delph-in.github.io/docs/tools/LuiUi) page. [LuiUi](https://delph-in.github.io/docs/tools/LuiUi) a introductory keyboard shortcut list.

# Obtaining and Running LUI

Recent LUI binaries for [Linux(x86 64-bit
mode)](http://sweaglesw.org/linguistics/yzlui.x86-64) and [Mac OS
X](http://sweaglesw.org/linguistics/yzlui-for-osx.tar.gz) are available,
intructions in [AceLui](https://delph-in.github.io/docs/tools/AceLui) and on the readme file at
<http://sweaglesw.org/linguistics/maclui/>.

You can also get binaries through a full release such as
[LOGON](https://delph-in.github.io/docs/tools/LogonTop) or the [LinGO LKB CVS repository](https://delph-in.github.io/docs/tools/LkbInstallation)
(since August 2005). During an initial testing phase, LUI support is
*not* turned on by default. There are multiple ways of activating LUI,
e.g. (a) manually within a running LKB session, (b) from within the
\`.lkbrc' user-specific LKB configuration file, or (c) by means of a
shell environment variable. You can customize LUI by means of a per-user
.luirc file ([LuiRc](https://delph-in.github.io/docs/tools/LuiRc)).

The yzlui source code is publicly available at:

<http://svn.delph-in.net/lui/>

It depends on the YZ framework as said above.

### Activating (or Deactivating) LUI Support

To enable LUI during an LKB session, at the Common-Lisp prompt evaluate
the command

      (lui-initialize)

Activating LUI for a running LKB session means switching graphical
display to LUI widgets for the supported types of linguistic objects
(see above). Once LUI has been initialized, parse trees, AVMs, et al.
should all be displayed using LUI widgets.

Conversely, to disable LUI for the current LKB session, evaluate

      (lui-shutdown)

For debugging purposes or comparison to the LKB built-in display (on
platforms that support built-in graphics for the LKB), it is possible to
toggle between LUI-enabled mode and no-LUI mode frequently within a
single session.

### Turning on LUI by Default

One option for requesting LUI activation at LKB start-up is to place a
call to lui-initialize() (see above) into the file .lkbrc in a user home
directory. The .lkbrc file is a user-specific configuration file that is
read when the LKB starts up.

The recommended option, however, is to set (and export) a shell variable
LUI to a positive value, e.g. (in your user-specific .bashrc file):

      export LUI=yzlui

Note that for shells other than bash(1) (or the MacOS environment), the
syntax of setting environment variables may differ. Finally, setting the
value of the LUI environment variable to a positive integer will cause
the LKB to activate LUI support but wait for an external (typically
remote) LUI to connect to the port named by its numeric value (see
below).

### Alternate LUI Implementations

The LUI design foresees the option of having alternate implementation of
the LUI functionality and protocol. For exampke,
PavelMihaylov has adapted the original LUI source code
to use the Pango
font rendering engine, for better international character support. Each
alternate implementation should define its own application name, say
pangolui instead of yzlui. Accordingly, the 'pangolui' binary should
read the user configuration files .pangoluirc and .luirc (and a
corresponding file name for its log file). The general idea here is to
put configuration options that are specific to a token LUI
implementation into .yzluirc or .pangoluirc (for example font selection
commands), and use the general .luirc for configuration options that
should apply to any LUI implementation.

Although as of February 2008 no source code is availabe, Pavel
distributes [alternate LUI binaries](http://lingua.bash.info/trollet/)
for Linx (x86, 32- and 64-bit). Currently, these binaries do *not* yet
define their own application name, thus (somewhat sloppily) read
.yzluirc (rather than .pangoluirc) and .luirc. The recommended way of
installing these binaries is as pangolui in the platform-specific binary
directory of the LKB tree, for example lkb/bin/linux.x86.32/ on a
32-bit, Linux (x86) installation. To activate an alternate binary, use
the LUI shell variable, e.g.

      export LUI=pangolui

One can also specify the binary name when you (re)start the lui:

      (lui-initialize :lui "pangolui")

**Note** One cannot specify an absolute path using either method, only
the binary name. Hence, alternate LUI binaries need to be installed into
the correct, platform-specific LKB binary directory.

### LUI Remote Mode

LUI can also run in remote mode, communicating with an LKB session on a
different machine. This mode of operation may be attractive for people
running the LKB (or, in principle, another linguistic processor with LUI
support) across a network with noticeable latency; the YZ widget library
is somewhat more sensitive to network latency than, say, X11. First, the
LKB host must be told to accept connections. This is accomplished by a
command like:

      (lui-initialize :port 4001)

Then, LUI must be launched with a special command line option. The
executable lives in the lkb/bin/linux.x86.32/yzlui location inside the
DELPH-IN top-level source directory (for Linux, x86, 32-bit) or the
bin/macos.ppc.32/yzlui.app/Contents/MacOS/yzlui location for Mac OS X. A
remote connection is established by launching a LUI process (manually)
from a shell, and directing it to talk to a running LKB session and the
numeric port used as the argument to the lui-initialize() call.
Assumming the LKB session runs on host cypriot.stanford.edu, say, the
following might work:

      $DELPHINHOME/lkb/bin/linux.x86.32/yzlui -c cypriot.stanford.edu:4001

# Testing and Bug Reporting

The first public LUI release is in August 2005. For a few months prior
to the release date, the new tools have only been tested by one active
LKB grammarian (our thanks go to DanFlickinger).
Unexpected behavior may comprise a bug. LUI maintains a log file
describing your session in the file `/tmp/yzlui.debug.username` (where
*username* corresponds to your own user id). Please report bugs to the
DELPH-IN *developers* mailing list and always attach a corresponding LUI
log file from the `/tmp/` directory.

Please add wishlist requests to [LuiWishlist](https://delph-in.github.io/docs/tools/LuiWishlist).

# Comparison with CLIM

- Interactive unification is easier with LUI (drag and drop)
- LUI currently lacks the following functionality
  - Show Hierarchy
  - Show Generation Chart
  - Parse Input Window

# Trouble Shooting

On Ubuntu 10.04, LUI currently will not run (2010-09) on a default install. The solution is to install nscd (the Network services Cache Daemon) and enable the hosts cache:

    sudo apt-get install nscd

open /etc/nscd.conf with your $EDITOR, find the following line:

    # enable-cache hosts no

Change "no" to "yes", save and exit the editor, then restart

    sudo service nscd restart

LUI should then run fine. Thanks to Stephan Oepen for finding the fix at http://bugs.launchpad.net/ubuntu/+source/eglibc/+bug/574726

Last update: 2022-04-08 by Alexandre Rademaker [[edit](https://github.com/delph-in/docs/wiki/LkbLui/_edit)]{% endraw %}