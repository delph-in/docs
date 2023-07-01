{% raw %}Specs for the anticipated behavior of ICONS in generation, from the
point of view of those using them for information structure:

## Original set of specs (by Emily and Sanghoun)

The behavior we would like to see is partially documented in the files
eng.txt and jpn.txt (in this
[tarball](http://faculty.washington.edu/ebender/ICONS-test.tgz), along
with grammars), which associate input sentences (for parsing) with the
realizations the generator currently finds. Among those, we have marked
the ones we would like to not see.

In general, the idea is that for any given pair of indices, if there is
an ICONS element in the MRS associated with a realization that
realization is valid iff:

- There is no ICONS element associated with the same pair of indices
in the input; or
- Any ICONS element associated with the same pair of indices in the
input is compatible in its type with the ICONS element in the
candidate realization.

(I'm not sure as I type this what to do about cases where there are
multiple ICONS elements for the same pair of indices. As far as
information structure is concerned, we wouldn't expect to have more than
one. Of course, if we're putting other stuff into ICONS, then there
might be ICONS constraints of different types. All of the above would
then be only applicable to subtypes of info-str.)

## Initial follow up during ACE development

Emily: I see that the condition you describe could be summarized as "the
input ICONS list and the realization's ICONS list are unifiable", under
a reasonable extension of the term.

Then Woodley did some magic, and ACE now treats ICONS the way we would
like them to be treated. Woodley, can you reconstruct what further
decisions you had to make to operationalize the specs above?

Woodley: In answer to your question, what I did in ACE is fairly
straightforward. To begin with, I made ICONS processing optional,
enabled by the "enable-icons := yes." configuration parameter (and a
couple of accompanying settings), which is off by default. When ICONS
processing is on, all MRSes (extracted from feature structures, parsed
from strings/files, or formatted for output) have an additional ICONS
list. It follows the form of the HCONS list in just about every way,
except that we expect a richer hierarchy for the constraints types.

The post-generation subsumption test generally verifies that a candidate
realization's MRS contains all of the information specified on the input
MRS (and possibly more). For HCONS, at least in ACE, that means ensuring
that there is at least one unique realized HCONS element that is
compatible with each input HCONS element. I used almost exactly the same
algorithm to test ICONS compatibility -- i.e. I look for an injective
mapping from the input ICONS list to the realization's ICONS list, such
that (1) variable identities are compatible, (2) variable properties are
subsumed, and (3) the constraint's type is subsumed. If, after
satisfying all of the input ICONS elements, there are leftover
realization ICONS elements, I don't currently consider that grounds for
rejecting the result. This allows inputs with empty ICONS lists to still
generate, for instance.

Last update: 2013-08-05 by GlennSlayden [[edit](https://github.com/delph-in/docs/wiki/IconsSpecs/_edit)]{% endraw %}