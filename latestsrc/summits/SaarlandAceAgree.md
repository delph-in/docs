{% raw %}Tutorial on Ace and Agree from [SaarlandTop](https://delph-in.github.io/docs/summits/SaarlandTop) 2013

## ACE

For most people: go to the ACE website and download ACE from one of the
links there (rather than checking it out from subversion

Liling: ACE is not on the FrontPage

Woodley: someone should add that with a link to [AceTop](https://delph-in.github.io/docs/tools/AceTop)

You need some kind of linux on your machine to use ACE, but Glenn's
software may be more interesting for Windows users since it works on
Windows directly

ACE only works on 64 bit.

Precompiled grammars (ERG 1212/1111) are available for download on the
website.

Options -1Tf

1: only one result

T: no derivation tree: only MRS

Options are documented on the wiki:

<http://moin.delph-in.net/AceOptions>

command:

parse sentence and print the mrs

$ ace-0.9.16/ace -g erg-1212-x86-64-0.9.16.dat -1Tf

(on Mac sentences should be written in the file)

generate from mrs

$ ./ace -g &lt;grammar.dat&gt; -e \[input.mrs\]

parse sentence and pipe the result mrs to the generator

$ ace-0.9.16/ace -g erg-1212-x86-64-0.9.16.dat -1Tf \| ace-0.9.16/ace -g
erg-1212-x86-64-0.9.16.dat -e

COMPILING grammar

$ ./ace -G &lt;compiled\_grammar\_file.dat&gt; -g &lt;path to
erg/ace/config.tdl&gt;

e.g.

$ ./ace -G erg.dat -g \~/logon/ling/terg/ace/config.tdl

file ace/config.tdl contains the grammar confgiurations (matrix-based
grammars might share a lot of these configurations)

ACE working with \[incr tsdb()\]

use the cpu defintion :terg+tnt/ace in $LOGONROOT/dot.tsdbrc

&lt;CL prompt&gt; : (tsdb :cpu :terg+tnt/ace :file t)

Call Common LISP prompt in LOGON tree:

cd $LOGONROOT

logon --tty

Options required for ACE CPU in $LOGONROOT/dot.tsdbrc:

:options (list "-t" "-g" "erg.dat")

Instead of "erg.dat" you can use other grammar.

* * *

To parse with ACE that is incorporated into the LOGON tree

1\) Make sure CPU (tsdb :cpu :terg+tnt/ace :file t) is defined in the
file $LOGONROOT/dot.tsdbrc

If not, update your LOGON tree:

cd $LOGONROOT

make update

2\) Check that the following command works:

cd $LOGONROOT

answer --terg

If it does not, you will have to compile the grammar:

answer --terg --compile

Now the command should work:

answer --terg

3\) Parse with ACE

$LOGONROOT/parse --terg+tnt/ace --count 4 csli

The profile is in
$LOGONROOT/lingo/lkb/src/tsdb/home/erg/trunk/csli/13-08-01/ace/

File "result" contains both derivation tree and MRS for each sentence.

To browse only MRS, execute:

tsdb -home . -query 'select mrs'

============================================================

\~/ace-0.9.16$ ace -g erg-1212-x86-64-0.9.16.dat -1Tf

The program 'ace' is currently not installed. You can install it by
typing:

sudo apt-get install libace-perl

If you see the above error, DO NOT install libace-perl, use "$ ./ace "
to invoke the compiled binary in and not from the global environment,
e.g.

\~/ace-0.9.16$ ./ace -g erg-1212-x86-64-0.9.16.dat -1Tf "this is a foo
bar sentence."

\~/ace-0.9.16$ echo "this is a foo bar sentence." \| ./ace -g
erg-1212-x86-64-0.9.16.dat -1Tf

If anyone is interested to call ACE from python scripts, see:

<http://en.wikipedia.org/wiki/User:Alvations/NLTK_cheatsheet#Getting_HPSG_parses_from_ACE>

* * *

ACE has some options in generation that PET does not support, e.g. idiom
check in ERG

You are not going to win in memory usage if you use ACE instead of PET.

ACE does not have GUI but it can talk to [LkbLui](https://delph-in.github.io/docs/tools/LkbLui)
(<http://moin.delph-in.net/LkbLui>), e.g. you can bring up chart
browser.

## AGREE

Prerequisites - .NET 4.5 (Windows)

<http://www.agree-grammar.com>

Currently, only an ERG demonstration console program is available on
that site. I will be demonstrating a WPF (graphical) client and I can
give you these binaries if you want to be an early adopter

Agree Concepts - Three object types:

Functor - Monad - Identity

Last update: 2023-06-30 by Glenn Slayden [[edit](https://github.com/delph-in/docs/wiki/SaarlandAceAgree/_edit)]{% endraw %}