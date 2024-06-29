{% raw %}# The Fully Open Source version of the LKB

The Fully Open Source version of the
[LKB system](https://github.com/delph-in/docs/wiki/LkbTop)
('LKB-FOS' for short) is based on the 'classic' version of the LKB that
was developed for many years in Franz Allegro Common Lisp – but with
the major difference that it is not dependent on any proprietary
compilers, runtime environments or code libraries. The source code is in
the DELPH-IN public repository
<http://svn.delph-in.net/lkb/branches/fos/>. For convenience,
precompiled binaries for macOS and Linux can be downloaded from
[lkb\_fos.tgz](http://users.sussex.ac.uk/~johnca/lkb_fos.tgz) \[89.6
MB\]. A Windows binary may be available at some point in the future.

LKB-FOS has been developed using the tools and libraries *SBCL*,
*McCLIM* and *SLIME* (replacing Franz Allegro CL, CLIM and ELI
respectively). See the following sections for installation and usage
instructions.

## Contents

1. [Installation](https://delph-in.github.io/docs/tools/LkbFos#Installation)
2. [Features and Enhancements](https://delph-in.github.io/docs/tools/LkbFos#Features-and-Enhancements)
3. [Practical Hints and Tips](https://delph-in.github.io/docs/tools/LkbFos#Practical-Hints-and-Tips)
   1. [Text Entry](https://delph-in.github.io/docs/tools/LkbFos#Text-Entry)
   2. [Fonts](https://delph-in.github.io/docs/tools/LkbFos#Fonts)
   3. [Interface Size](https://delph-in.github.io/docs/tools/LkbFos#Interface-Size)
   4. [Copying Text](https://delph-in.github.io/docs/tools/LkbFos#Copying-Text)
4. [Problems](https://delph-in.github.io/docs/tools/LkbFos#Problems)

## Installation

To install LKB-FOS:

1. Create a top-level directory to hold the DELPH-IN software and resources. Good
choices for this directory are ~/delphin on Linux or ~/Documents/delphin on macOS.
So that DELPH-IN software can find the associated resources, set the environment
variable DELPHINHOME to this directory; you can do this with a command such as
`export DELPHINHOME=~/delphin`. Also add this command to your shell initialization
file. On Linux this file is ~/.bashrc if you are using the default, *bash* shell.
On macOS, for DELPHINHOME to be correctly set when you start the LKB via emacs or
by double clicking, you should set this variable in your ~/.bash_profile file,
not in ~/.bashrc.
2. The LKB needs a writable directory to store its temporary files. On Linux,
this is ~/tmp/, and on macOS ~/Documents/tmp/. Create this directory if it does
not already exist.
3. Download the LKB-FOS binary archive (link above) and unpack the files inside
your directory $DELPHINHOME, which will create a new directory $DELPHINHOME/lkb\_fos.
If you use this precompiled binary version of LKB-FOS, you do not need to install
SBCL, McCLIM or SLIME.
4. In order to use [\[incr tsdb()\]](https://delph-in.github.io/docs/tools/ItsdbTop)
functionality (only on Linux at present), the environment variable
LD\_LIBRARY\_PATH must include the LKB-FOS shared library directory
$DELPHINHOME/lkb\_fos/lib/linux.x86.64. The following Unix command
should accomplish this (it can go in your \~/.bash\_profile file or
\~/.profile file, as appropriate).
   
   `export LD_LIBRARY_PATH=$DELPHINHOME/lkb_fos/lib/linux.x86.64:$LD_LIBRARY_PATH`
5. [macOS only] LKB-FOS requires the open source application *XQuartz*; if you
don't already have *XQuartz*, download it from <https://www.xquartz.org>
and install it.\
[Linux only] LKB-FOS used to require the Unix application *xclip*, but no
longer does.

The LKB-FOS binary for Linux is lkb.linux\_x86\_64.

The LKB-FOS binary for macOS Intel architecture is lkb.darwin\_x86\_64, and for macOS
on Apple silicon it is lkb.darwin\_arm64. You can run the appropriate binary by typing
its name in the *Terminal* application or in an *xterm* hosted by *XQuartz*.
Alternatively, to start the LKB without going through the Unix command line,
you can just double click the LKB.app application – if that gives an error message
then check the 'Problems' section below. *Aquamacs* http://aquamacs.org works well
for running LKB-FOS as a process inside *emacs*.

To run LKB-FOS inside *emacs*, put the following block of lines in the
file \~/.emacs in your home directory.

    (let ((root (or (getenv "DELPHINHOME") "~/delphin")))
      (load (format "%s/lkb_fos/emacs/dot.emacs" root) nil t t))

Then, when *emacs* has started up, the following keystrokes will start
LKB-FOS: `Meta-x lkb RET`

## Features and Enhancements

Porting the LKB to an open source foundation has inspired further
efforts to overhaul the code base. In addition, the use of a
different underlying Lisp system (SBCL with McCLIM rather than Allegro
CL and its native CLIM implementation) gives advantages in the areas of
speed of processing, multilingual support, and visual appearance.
Improved features include:

- Dialogs: these have been reimplemented to improve their appearance,
and a user-friendly file selector dialog has been added.
- Parser local ambiguity packing: this was previously turned off by
default, resulting in even moderately long or ambiguous sentences
over-running the chart edge limit. A couple of minor
packing/unpacking issues have been resolved and packing is now
turned on by default. To revert to the previous behaviour, execute
`(setq *chart-packing-p* nil)`
- Multilingual support: SBCL has excellent support for Unicode and
McCLIM works well for Unicode output, so LKB-FOS can work with
grammars using any language script.
- Chart mapping: LKB-FOS includes support for token mapping,
lexical filtering, and post-generation mapping rules.
- YY input mode: linguistic preprocessors may be interfaced via
DELPH-IN YY format.

Experienced LKB users might notice further refinements:

- Responsive window resizing (file selector dialogs and parse trees
windows reformat their contents when they are resized).
- More informative window titles, able to display any Unicode
character.
- Info line in tree windows, showing details of the currently selected
tree or tree node.
- Type hierarchy display that includes a target type's ancestors as
well as descendants, can be zoomed in and out, can show
type constraints, and also docstrings on types in 'tooltips' windows.
- Much faster GLB computation for large type hierarchies.
- Major speed improvements in the user interface, and also in parsing
and generation.
- Bug fixes and enhancements, as suggested in [LkbBugs](https://delph-in.github.io/docs/tools/LkbBugs) and
[LkbWishlist](https://delph-in.github.io/docs/tools/LkbWishlist).
- Support for the revised DELPH-IN TDL format, as specified in TdlRfc.
- A new handy command 'Evaluate Lisp expression...' in the Lkb Top
Advanced menu.

LKB-FOS supports the Linguistic User Interface (LUI): see the
[LkbLui](https://delph-in.github.io/docs/tools/LkbLui) pages for information on installing and using the LUI.
Execute the Lisp expressions `(lui-initialize)` and `(lui-shutdown)` to
enable and disable it, respectively; alternatively set the environment
variable LUI. The LUI executable is expected to be on the user's PATH.

On Linux, LKB-FOS includes [\[incr tsdb()\]](https://delph-in.github.io/docs/tools/ItsdbTop). To open the
'podium' window, execute the Lisp expression `(tsdb:tsdb :podium)`.

Refer to the README file for a detailed, up-to-date list of bug fixes
and new features.

## Practical Hints and Tips

### Text Entry

Text fields in dialogs respond to the standard CUA keyboard commands
(Ctrl-C, Ctrl-X, Ctrl-V for copy/cut/paste) and Ctrl-A for select all.
At present there is no undo command. The mouse maybe used to reposition
the cursor and to make a selection by dragging. However, double-,
triple- and shift-click gestures are not recognised.

### Fonts

For interactive input, on macOS the *Input Sources* menu can be used to
switch between language scripts, and the *Keyboard Viewer* provides
convenient multilingual text entry. For output, the LKB requires a
Unicode-compatible font. There is no font substitution: all characters
to be displayed have to be in the selected sans-serif and monospace
fonts.

Suitable Unicode fonts are DejaVu Sans (attractive, and covering many
language scripts), Code2000 (less attractive, but with even better
coverage), or WenQuanYi Zen Hei (reasonably attractive, with full CJK
coverage). (On macOS, these are not standard fonts so you will have to
download them yourself - put them in /opt/X11/share/fonts/TTF/ - having
first installed *XQuartz*). To select DejaVu Sans, use the following
Unix command:

    cat > ~/.fonts.conf <<!
    <?xml version="1.0"?>
    <fontconfig>
     <dir>/opt/X11/share/fonts/TTF</dir>
     <alias>
     <family>sans-serif</family>
     <prefer>
     <family>DejaVu Sans</family>
     <family>Code2000</family>
     <family>WenQuanYi Zen Hei</family>
     </prefer>
     </alias>
     <alias>
     <family>monospace</family>
     <prefer>
     <family>DejaVu Sans Mono</family>
     <family>Code2000</family>
     <family>WenQuanYi Zen Hei</family>
     </prefer>
     </alias>
    </fontconfig>
    !

You can verify that DejaVu Sans is selected by running the Unix commands

    fc-match sans
    fc-match mono

The output of these commands should be

    DejaVuSans.ttf: "DejaVu Sans" "Book"
    DejaVuSansMono.ttf: "DejaVu Sans Mono" "Book"

You can then start up the LKB and it will use these fonts. Note that if
you want to input or output non-ASCII characters, you should make sure
you are using a Unicode *locale* such as en\_US.UTF-8.

### Interface Size

If you are using the LKB on a high-DPI display, you might want to
increase the size of text in menus and in dialog buttons and labels. You
can do this by putting the following in your \~/.lkbrc file:

    (setq mcclim-truetype::*dpi* 96)

The default value is 72. You can experiment with different values, depending
on your display and personal preference.

### Copying Text

To copy from a 'text-like' window such as Lkb Top or Scoped MRS, shift-drag
across the text (or alternatively shift-left-click at one end of the text and
shift-right-click at the other end). On macOS, you will then need to type
Command-C – or select Copy from the XQuartz Edit menu – to get the text into
the system clipboard. On Linux, the highlighted text goes straight into the
clipboard; to paste it, click the middle mouse button.

## Problems

In macOS 10.12 and upwards, the 'App Translocation' security feature
might prevent LKB.app from working properly the first time it is launched. To
fix this, drag LKB.app to the Desktop and then back again. You may also
need to authorise it in the General tab of Security & Privacy in
System Preferences. These two steps should be enough to allow it to run.

Unanticipated errors may cause the LKB graphical interface to become
unresponsive. This is because the underlying Lisp system is expecting
the user to enter the debugger for that thread. If you are running the
LKB inside *emacs*, a debugger buffer should open automatically.
Otherwise, to enter the debugger manually, execute
`(sb-thread:release-foreground)` at the Lisp prompt. You can then type
backtrace to inspect the context of the error, and Ctrl-D to kill the
thread. The interface should then start responding again.

If you see a message like the following

    error finding frame source: Bogus form-number: the source file has probably changed too much to
    cope with.

this means that there was a previous error, and the error handler was
not able to locate the LKB source code file containing the function that
signalled that error (perhaps because you are running a precompiled
binary). Ignore this error and look back in the system output for the
original error message, e.g.

    Syntax error at line 25204, character 2: In X_-_BRIDGE_LE, expected a documentation string after
    double quote character, but did not find two further double quotes
    Ignoring (part of) entry for X_-_BRIDGE_LE

If you encounter an unexpected problem using LKB-FOS, please check
[DELPH-IN Discourse](https://delphinqa.ling.washington.edu/about) to see if
a solution has already been posted there; if it hasn't then create a new topic.


Last update: 2024-06-28 by John Carroll [[edit](https://github.com/delph-in/docs/wiki/LkbFos/_edit)]{% endraw %}