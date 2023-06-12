{% raw %}You can install ACE from an official pre-built binary (recommended), or
from the source code (to get unreleased features or bug fixes, to
compile for another system architecture, etc.).

# Installing pre-built binaries

First download ACE from its [home
page](http://sweaglesw.org/linguistics/ace/).

When you download ACE, you can typically expand the archive by simply
double clicking on it.

When you download the corresponding ERG image, you might not be able to
automatically extract that if your system isn't configured to recognize
the bz2 extension.

In this case, open the Terminal application (use the Search (looking
glass icon in the upper right corner) option to find it).

Note where you put the ERG bz2 file. Let's say it is on your Desktop.
Navigate to that directory, i.e., in the Terminal, type:

    cd ~/Desktop

Then call the proper utility directly to expand the archive:

    bunzip2 erg-1212-osx-0.9.22.dat.bz2

Now hopefully you have the ERG image to test ACE on.

Navigate to the directory that you put ACE in:

    cd ~/Desktop/ace-0.9-22

Now you can start ACE:

    ./ace -g ~/Desktop/erg-1212-osx-0.9.22.dat

You should add ace to your path, so you can run it from anywhere.

You may also want to install [yzlui](https://delph-in.github.io/docs/tools/AceLui) for a graphical interface
which allows interactive unification.

# Compiling and installing from source

These are instructions on how to configure a build environment for
compiling the ACE software from source. For using ACE to compile grammar
images, see [AceUse](https://delph-in.github.io/docs/tools/AceUse).

### Dependencies

Before you can compile ACE, you will need to satisfy some dependencies.
Some of these should be available from your package manager. E.g., on
Ubuntu Linux, use the following commands:

    sudo apt install build-essential libboost-regex-dev

Next compile and install REPP by downloading
[repp-0.2.2.tar.gz](http://sweaglesw.com/linguistics/repp-0.2.2.tar.gz)
and extracting it, then by executing the following commands from the
extracted directory:

    ./configure && make all
    sudo make install

If you want [\[incr tsdb()\]](http://www.delph-in.net/itsdb) support,
download the LOGON distribution (see
[LogonInstallation](https://delph-in.github.io/docs/tools/LogonInstallation)) and make sure the LOGONROOT
environment variable is set. If you don't want [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) support, inspect ACE's Makefile
(after checkout out the code; see below) and comment out the lines it
says to comment out.

### Building ace

With the dependencies satisfied you can now build ACE. First check out
the repository. Read-only access is available via SVN:

    svn co http://sweaglesw.org/svn/ace/trunk ace

Enter the ace/ directory and run the following command:

    make all

The binary should be available as ace in the current directory. It can
be used as is, but if you want to install this binary so it is available
system-wide as the ace command, run the following command:

    sudo make install

It's a good idea to only install official releases, and if you compile
(e.g., to experiment with new features or to fix a bug), just call the
compiled binary with its full path. This way you won't be surprised if
you forget which version is being used (note that the version given by
ace -V won't change until a new release is generated, but the
compilation timestamp will).

### Troubleshooting

#### Missing itsdb.h

You might see the following:

    itsdb.c:10:10: fatal error: itsdb.h: No such file or directory
       10 | #include <itsdb.h>
          |          ^~~~~~~~~
    compilation terminated.
    make: *** [<builtin>: itsdb.o] Error 1

You have a few choices here. First, you comment out the following two
lines from ACE's Makefile:

    DELPHIN_CFLAGS=-isystem ${LOGONROOT}/lingo/lkb/include -DTSDB
    DELPHIN_LIBS=-L ${LOGONROOT}/lingo/lkb/lib/linux.x86.64 -Wl,-Bstatic -litsdb -lpvm3 -Wl,-Bdynamic

Doing so, however, means you lose [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) support with ACE. Second, you
can ensure you have the Logon distribution checked out (see
[LogonInstallation](https://delph-in.github.io/docs/tools/LogonInstallation)) and the LOGONROOT environment
variable appropriately set. If you don't already have the whole LOGON
tree on your computer, this may be too much for just some library files.
The third option is to only download those files and copy them to the
appropriate directories:

```
   1 $ mkdir itsdb_libraries
   2 $ pushd itsdb_libraries
   3 $ wget http://lingo.delph-in.net/latest/itsdb_libraries.tgz
   4 $ tar xf itsdb_libraries.tgz
   5 $ sudo cp include/* /usr/local/include/
   6 $ sudo cp lib/linux.x86.64/* /usr/local/lib/
   7 $ popd
```

#### libutil.a not compiled with -fPIC

You may see an error like the following at the linking stage of
compilation:

        /usr/bin/ld: /usr/lib/gcc/x86_64-linux-gnu/6/../../../x86_64-linux-gnu/libutil.a(login_tty.o): relocation R_X86_64_PC32 against symbol `setsid@@GLIBC_2.2.5' can not be used when making a shared object; recompile with -fPIC
        /usr/bin/ld: final link failed: Bad value
        collect2: error: ld returned 1 exit status
        Makefile:43: recipe for target 'ace' failed
        make: *** [ace] Error 1

If so, try changing the following line in the Makefile:

    POST_LIBS=-Wl,-Bstatic -lutil -Wl,-Bdynamic

to this:

    POST_LIBS=-Wl,-Bdynamic -lutil
    \

# Installing from Package Managers

## Homebrew on macOS

ACE can be installed via [Homebrew](https://brew.sh) on macOS using the
following command:

    brew install delph-in/delphin/ace

See <https://github.com/delph-in/homebrew-delphin> for the Homebrew tap.

Last update: 2021-06-12 by T.J. Trimble [[edit](https://github.com/delph-in/docs/wiki/AceInstall/_edit)]{% endraw %}