{% raw %}Trollet is a wrapper around LKB aiming for better multilingual support
and a cleaner, more logical interface. For a short summary on some
issues with multilingual grammar development with LKB and how Trollet
can help, see <http://lingua.bash.info/trollet/trollet.pdf>.

# Installation

To start the program type trollet. Trollet will determine what LKB
binary to start by examining some environment variables in the following
order:

1. If TROLLET\_LISP is set, it is used as the binary to start
(non-standard
   
   - LKB setups)
2. If DELPHINHOME is set (i.e. LKB was installed according to the
recommen-
   
   - dations), $DELPHINHOME/bin/lkb is started
3. If nothing is set, try to start lkb (i.e. lkb is in your path)

If your installation is non-standard you can set the environment
variable TROLLET\_LISP to the full path to the LKB binary (e.g.
/home/username/delphin/bin/lkb) or to Allegro in case you use LKB from
source. To do that you need to add
export TROLLET\_LISP=/full/path/here/lkb to your .bash\_profile file.

## On Ubuntu Linux (should also work on other Debian-based distributions):

Add this to your /etc/apt/sources.list:

deb http://lingua.bash.info/feisty/trollet binary/ *(if you have Ubuntu
Feisty)*\
deb http://lingua.bash.info/edgy/trollet binary/ *(if you have Ubuntu
Edgy)*\
deb http://lingua.bash.info/dapper/trollet binary/ *(if you have Ubuntu
Dapper)*\
deb http://lingua.bash.info/breezy/trollet binary/ *(if you have Ubuntu
Breezy)*

Alternatively you can use the Synaptic package manager: go to
System/Administration/Synaptic package manager; then choose
Settings/Repositories, Add, Custom and paste one of the above lines in
the box.

Then you need to update the package list and install the package called
**trollet** (either via Synaptic or by typing
apt-get update && apt-get install trollet in the shell). If you have
updates enabled you will get automatic updates for Trollet too.

Once you have it installed you can start it either via the menu
(Applications/Development/Trollet) or by typing trollet in the shell.

You can install LKB the same way too (package **lkb**) (*note: the
current lkb package in the repository is old and using it is not
recommended*). The updated version of LUI is provided by package
**lkb-yzlui**. This is experimental and it works, but I haven't tested
all the LKB (and helper programs') features out there. Hopefully I will
release updates regularly.

## On other Linux distributions:

Open <http://lingua.bash.info/trollet/> and get the latest version
(normally in a file called trollet-NNN.tar.bz2, where NNN is the version
number). You can unpack that file anywhere and you'll get a directory
called trollet-NNN. Run the trollet file in that directory (e.g. type
./trollet from within the directory).

Most probably you will need to install the Perl modules Gtk2 and
IPC::Run (available standardly in most newer Linux distributions). Ask
the local Linux/Perl guru if you need help.

# The updated LUI

(to be integrated with the rest of the LUI stuff once I have more time)

You can get a Linux binary of the updated LUI from
<http://lingua.bash.info/trollet/> (the file is called **yzlui**). You
have to put that file in $DELPHINHOME/lkb/bin/linux.x86.32/ and make it
executable (e.g. chmod +x $DELPHINHOME/lkb/bin/linux.x86.32/yzlui). This
will overwrite your old LUI binary so you might want to rename it to
yzlui.old first.

Ubuntu users: If you choose to install the **lkb** and **lkb-yzlui**
packages mentioned above you don't need to install the LUI binary
manually.

Trollet will use LUI by default, though you can turn it off by saying
(lui-shutdown).

See [LkbLui](https://delph-in.github.io/docs/tools/LkbLui) for more info.

Last update: 2015-08-06 by TuanAnhLe [[edit](https://github.com/delph-in/docs/wiki/LkbTrollet/_edit)]{% endraw %}