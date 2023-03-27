{% raw %}# New and revived features in the LKB FOS

Notes from session 2 of the LKB+FOS SIG. We again started off by
reviewing the [slides](http://www.delph-in.net/2020/lkb-tutorial.pdf).

They show the differences between versions.

[LKB-FOS](https://delph-in.github.io/docs/tools/LkbFos), [Classic LKB](https://delph-in.github.io/docs/tools/LkbTop), [LOGON LKB](https://delph-in.github.io/docs/tools/LogonTop)

WP: "Random" unpacking
((setq \*unpacking-scoring-hook\* (constantly 0.0))) isn't really
random, right?

JC: No, it gives an arbitrary - but fixed - order.
\#(lambda (&rest x) (random 1.0)) for example would give random
ordering.

PX: Is there a configuration file for the control parameters?

JC: Yes, you can put them in .lkbrc

EMB: One of the problems we have with Ubuntu+LKB is you can't paste
non-ASCII. Is this fixed in LKB-FOS?

JC: You can paste Unicode characters, but font may not support them in
which case they would show up as boxes (aka “tofu”). It's not easy to
change the font, because X11 wasn't designed with this in mind. The more
difficult problem is typing them; none of the Linux input methods work.
With macOS you can do some things with the keyboard widget, but not
other input methods.

Glenn: Was able to enter and paste using Trollet; still supported?

JC: Started integrating Trollet, but turned out to be more difficult
than expected (it's a brittle socket interface). Hopeful that the McCLIM
developers will be adding input method support, but not there at the
moment.

JC: Trollet integration probably needs a week or so of work, but I see
it as a dead-end so not very keen to put the effort in.

EMB: Any reason not to have the next version of the Ubuntu+LKB VM to be
LKB-FOS?

JC: I'd be very pleased. OE is keen to simplify the versions that are
maintained. Ideally to merge LKB-FOS into the same codebase

EMB: I'll be aiming for that by the next iteration of Grammar
Engineering class, which is next January.

WP: Can you use the Mac clickable-app version?

EMB: Yes, but I have to accommodate Windows users and it's helpful for
debugging to be able to see exactly what the students are seeing.

JC: Windows version seems to be widely wanted, but difficult to work on
right now.

DF: I think it's worth adding to the list of differences that only the
LKB+FOS really supports TDL docstrings. It would make life much better
to shift to LKB+FOS as "the" version of LKB.

DF: I have a list of patches that I’ve had to apply for the ERG, how to
determine which are still needed?

JC: Once OE and I have merged codebases then we'll have a clearer idea
of what patches are now extraneous.

WP: Feature request: not bad thing to continue efficiency quest to
ultimately surpass ACE so I don't have to do anything.
:slightly\_smiling\_face:

Last update: 2020-07-28 by JohnCarroll [[edit](https://github.com/delph-in/docs/wiki/VirtualLkbFos2/_edit)]{% endraw %}