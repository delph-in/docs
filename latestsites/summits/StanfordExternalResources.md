{% raw %}# Connecting DELPH-IN Artifacts with External Resources

(Note: this session had no scribe, so I'm summarizing based on memory)

The point of this session was to brainstorm how we can link our
resources to non-DELPH-IN resources, e.g., [FrameNet](/FrameNet) or
Propbank. There has been a theme of how to make our tools and resources
more available, accessible, and understandable to people outside of our
group, and this falls in line with that theme. Furthermore, we have our
own lexical resources, such as the large and richly informative lexica
provided by our grammars, but they are not intended to be used for
extragrammatic applications, so we might consider them underutilized.
Some non-DELPH-IN lexical resources, such as [FrameNet](/FrameNet),
Propbank, [WordNet](/WordNet), etc. are documented and usable for a
variety of applications. Perhaps by associating our lexical entries (and
possibly other ontological information, like [SEM-I](https://delph-in.github.io/docs/tools/SemiRfc)
properties, [parts of speech](https://delph-in.github.io/docs/tools/RmrsPos), etc.), there could be some
benefits:

- Our lexica could supplement other resources (in quantity or quality
of lexical information)
- Our grammars can be made more understandable to others, and possibly
more amenable to integration into projects that already use the
external resources
- We could utilize the external resources for our own gain, e.g. WSD
for MT, etc.

## Embedding WordNet senses in predicates

We brought up how the [surface
predicates](/PredicateRfc#Surface_and_Abstract_Predicates) (aka
[RealPreds](/RealPreds)) have a sense field that we could exploit. For
instance, if it were possible to linked our existing lemma+pos+sense
triples to [WordNet](/WordNet) senses, we could later apply WSD to
further specify the sense. For example:

|                        |                                                                                            |
|------------------------|--------------------------------------------------------------------------------------------|
| \*\*predicate\*\*      | \*\*sense\*\*                                                                              |
| \_chair\_n\_1          | default, unspecific sense                                                                  |
| \_chair\_n\_03001627-n | [WordNet](/WordNet) sense of "a seat for one person, with a support for the back"          |
| \_chair\_n\_10468962-n | [WordNet](/WordNet) sense of "the officer who presides at the meetings of an organization" |

This idea is initially appealing, but the default sense would often be
linked very high up (e.g. the sense for "object" or "entity" and not
interestingly different across predicates).

I wondered if sense disambiguation, if it could be done during the
parsing process, could help to refine the parse selection process. Glenn
pointed out (as the sole developer of a parser/generator in the room)
that such an application would probably be more trouble than it was
worth, and would probably do little more than explode the parse chart
with spurious, subtly different trees. So we generally agreed that any
such alternations to the sense field should be done as a post-operation,
if at all. In some serializations of MRS (e.g. \[JSON, or maybe XML)
Alternatively, we could maintain the sense linking as a stand-off
annotation. E.g., an MRS object would remain as it is now, but it might
be accompanied by an additional structure that maps the predicates to
the senses. In MRS, intrinsic variables would not be sufficient (as they
are not unique per EP), so this could be done by matching from a tuple
of (predicate, Lnk span (cfrom/cto)). In DMRS, the nodeid of each
predication would be unique and could be used instead.

## Linking to FrameNet

We did not get far into a discussion about linking to
[FrameNet](/FrameNet), but it would not only involve linking our
predicates to [FrameNet](/FrameNet) senses, but also each predicate's
core argument inventory (e.g. ARG1, ARG2, etc.) to the roles in each
frame (to be complete, maybe also linking non-core roles in the frame to
adjunct subgraphs in MRS, perhaps with [MRS
fingerprints](/ErgSemantics#Semantic_Fingerprints)). Such an annotation
project would be a significant undertaking, so it might be beneficial to
first do some exploratory exercises. For example, to initially link ERG
predicates to [FrameNet](/FrameNet) senses, then compare the EP arity
with the number of roles in the associated frame. It might also be
useful to do SRL using MRS role names and see if the sentence
annotations structurally resemble those from [FrameNet](/FrameNet) (if
so, it might be feasible to automatically associate predicate+ROLE to
frame+ROLE).

## Note to attendees

(if you attended this session and remember more details, please feel
free to edit the page; thanks!)

Last update: 2016-07-06 by MichaelGoodman [[edit](https://github.com/delph-in/docs/wiki/StanfordExternalResources/_edit)]{% endraw %}