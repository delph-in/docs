{% raw %}# New and revived features in the LKB FOS

We started off by looking through the
[slides](http://www.delph-in.net/2020/lkb-tutorial.pdf).

They show the differences between versions.

[LKB-FOS](https://delph-in.github.io/docs/tools/LkbFos), [Classic LKB](https://delph-in.github.io/docs/tools/LkbTop) (as corresponding to Ann's
book), [LKB in the LOGON Environment](https://delph-in.github.io/docs/tools/LogonTop)

OE: I think of [\[incr tsdb()\]](http://www.delph-in.net/itsdb) as
separate from LKB

OE: many clarifications of what could and could not run

- probably not worth running SVMs, external MT system interface
- PVM is perhaps the most useful

LOGON includes broad range of external binaries, but Linux only (e.g.,
tadm/evaluate)

<http://tadm.sourceforge.net/>

FCB: do the non-FOS LKBs allow docstrings?

JC: No, I prefer not to port stuff back to Classic LKB

OE: let's discuss reducing variation across different branches of the
code.

OE: there has been very little work on LKB in the last ten years, i
believe, except for MRS manipulation and conversion maybe; there have
been more changes to [\[incr tsdb()\]](http://www.delph-in.net/itsdb), I
would like to keep them uniform across different LKB versions. I would
like LKB\_fos to become the new trunk!

JC: music to my ears!

Back to the slides, ...

Issues

- Unhappy code (CLIM, of course, FCB)
- tsdb/swish++ only runs with linux
- Wayland is not supported by MacOS, this may cause issues in the
future

OE: tcl/tk is very customized, so swish++ may be hard to recompile

JC: shall we discuss bugs or future plans?

FCB: I have no bugs, ... does anyone?

BC: There seem to be some differences in generation between Classic and
FOS lkb.

JC: send me the grammar and I will fix it!

BC: I had to used different equivalent-checks to generate for German.

BC: and a third: I had to disable a probably cyclable rule?

JC: I try not to change behaviours between the versions, so send me the
evidence and I will have a look. I did fix something with triggers,
which should be in the latest version.

BC: I still have the problem with the latest version.

BC: In the chart, lexical rules with open agendas are in the chart, it
would be good to suppress them.

JC: I will look at the ltdb interface code.

JC: I can try to do a small number of features of rst for showing the
docstrings, but the support for rst in common lisp only has html and
LaTeX output not McCLIM.

FCB: Thank you.

OE: There may be changes in the LOGON LKB not in the Classic version,
and maybe some of these should be put back into the trunk. It would be
good to look at these together.

JC: shares mail to developers from OE proposing to retire the Classic
LKB.

FCB: so we would have a unified code base with different switches for
allegro/sbcl

OE: yes

JC: I would like to have a small binary, not necessarily a full
repository

FCB: as long as the code is available (and linked to) then that should
be fine

AR: will the source be kept up-to-date?

JC: yes, for every binary release I update the source in the svn

AR: have you considered moving to github so that people can contribute
to development versions?

JC: so far I am pretty much the only developer, and I am used to svn, so
I would prefer to stick to svn.

OE: If fos and trunk get merged (in svn) it will be easier to show work
in development. This may make it easy to show incremental changes so
others (like AR) can see changes. We would need to do this to cooperate
on merging anyway.

JC: I only do svn commit, not update normally \[all laugh\]

JC: is everyone happy with the development plans

All: yes

FCB: click/select in editable text fields not working is unpopular with
students

JC: I would like to wait for McCLIM to fix this.

Luis: I can't input unicode in the text windows

JC: ClX doesn't support the FEPs, this is under discussion, but not
really solved. Input is a problem in general.

JC: If you set the font right (as documented on the wiki), then you
should be able to see the trees. I am working on using a different font
for meta-text and the linguistic language.

Luis: Chinese input is an issue for our colleagues in Shanghai, who
prefer not to use emacs.

OE: CLIM and LUI use different fonts, so you need to set them for both.

Some discussion of individual bugs, with suggestions to use the
LD\_LIBRARY path. Fixes are now in the wiki page.

BC: Any idea of timings for some of the new features?

JC: Over the next year. I will probably go:

- chart mapping
- unified grammar configuration
- grandparenting
- Windows

JC: I will discuss chart mapping with OE

FCB: If you could add a little documentation as it did this, it would be
great!

OE: I use the pet debugging mode

Last update: 2020-07-22 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/VirtualLkbFos/_edit)]{% endraw %}