{% raw %}Initial notes without much attempt at formatting:

What reasons for not propagating changes so far?

- Lack of confidence in value of proposed solution -&gt; any solution
(esp associated with a test suite) is of interest, since we have
difficulty getting to relevant data to explore, plus can benefit
from input on the space of possible solutions.
- Don't want to flood the inbox, but then it's never clear when the
right moment is to ask the question (unless there's a clear stopping
point). -&gt; Intermediate feedback is useful for UI improvement,
and even if the analysis changes later, if we can see the later
version of the grammar, we can figure that out.

Suggestion from Mike: Maybe make matrix.tdl non-writeable by default?

Yi: On the contrary, maybe encourage people to make changes, but make
those changes accessible to us.

EB: \[Opened mouth to speak\]

oe: You're scribing. Allowing people to edit matrix.tdl would be one way
of getting feedback. How about providing a file called patches.tdl
loaded without generating redefinition warnings. Provide grammars as svn
branches (git?).

Glenn: svn diff easily says what the changes are, can update to matrix
changes, can easily see grammars to offer assistance.

Mike: Grammars aren't matrix branches, but they're own repositories.
Make matrix-core a separate repository (in git), keep rest of
customization system in svn.

Francis: One issue with git is making sure that we can still pull the
information back. Also worry about grammar engineers not knowing how to
use git.

EB: Everyone should learn how to use version control.

Yi: Could also provide information on download page.

Antske: What about the MRS testsuite/grammar phenomena question?

EB: If we provide standardized files that are compliant with extraction
scripts to get the phenomena from the MRS testsuite, plus an MRS
testsuite skeleton skeleton that users could fill in with translations.
Likewise, we'll know the git/svn URLs to pull the information from for
the phenomena table/database. Will have to be careful to ask permission
to use/publish first.

EB: Also need to worry about technical details to make sure that
multiple iterations through the customization system don't lead to
multiple git repositories.

oe: His linux doesn't have git, does have svn.

EB: KNOPPIX+LKB could, but then there's the problem of KNOPPIX use cases
without persistent data. So maybe it's better to somehow offer git
hosted at UW????

Antske: How to get more discussion on the matrix mailing list?

EB: If we have access to the grammars, then we could presumably
proactively start discussion as well, possibly starting a
vicious<sup>H</sup>H^H virtuous circle.

Last update: 2010-07-04 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/ParisMatrixInteraction/_edit)]{% endraw %}