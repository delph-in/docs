{% raw %}# Background

The Penn Treebank was a game-changing resource because of the kind of
feature extraction (including parser-based) that it enabled. In opening
up new areas of NLP research, it has also opened up new horizons: those
applications that are now imaginable but beyond the reach of current
technology. We propose to extend that reach by creating an annotated
data source that is much larger, more diverse in genre, and more deeply
and consistently annotated than what is currently available. In
particular, we plan to (mostly automatically) annotate the entire Open
American National Corpus (16 million words) with syntactic and semantic
representations produced by the English Resource Grammar (Flickinger
2000). This will also include the Manually Annotated Sub-Corpus, such
that our annotations (in this case all manually verified) will be
interoperable (through GrAF) with other annotations being produced over
those 90,000 words.

# June 2011 meeting

We plan to apply for NSF (CRI) funding for this effort. As part of the
preparation for that proposal, we are organizing a “Birds of a Feather”
meeting in Portland OR on June 19, 2011. The goal of this meeting will
be to gather input from the community on how the proposed resource could
be used to further NLP research. This input will also allow us to shape
the resource so that it is maximally useful.

The meeting will be informal, and consist primarily of discussions. We
are interested to learn from participants about the following:

## Questions

- When have syntactic and semantic features not panned out in
experiments you’ve done? What were the applications you were
targeting? What genres of text? What kind of features?
- What applications or tasks have you thought about but held back from
because of insufficiently precise/deep linguistic feature
extraction?
- What other kinds of applications or tasks would you like to work on,
if only there were richer data sources over which to train feature
extractors?

## Agenda

\[Tentative schedule\]

|             |                                                                                         |
|-------------|-----------------------------------------------------------------------------------------|
| 10:30-10:35 | Go grab some coffee                                                                     |
| 10:35-10:45 | Welcome & Intro (Emily and Dan)                                                         |
| 10:45-12:30 | Participant presentations (5-10 min each, addressing the questions above)               |
|             | Tracy King                                                                              |
|             | James Curran                                                                            |
|             | [Eva Hajičová](http://faculty.washington.edu/ebender/BoaF/ACL-Portland-Anotace-DEF.pdf) |
|             | Chris Callison-Burch                                                                    |
|             | Sameer Pradhan                                                                          |
|             | Julia Hockenmeier                                                                       |
|             | Francis Bond                                                                            |
|             | [Fei Xia](http://faculty.washington.edu/ebender/BoaF/fxia.pdf)                          |
|             | Mark Steedman                                                                           |
| 12:30-1:30  | *Lunch* (on your own)                                                                   |
| 1:30-2:00   | Presentation of proposed annotation project                                             |
| 2:00-3:30   | Small group brain-storming                                                              |
| 3:30-4:00   | *Coffee break*                                                                          |
| 4:00-5:00   | Small group brain-storming                                                              |
| 5:00-5:30   | Report-back and wrap-up                                                                 |

## Sample Annotations

We are providing sample annotations for the following eight sentences,
as a starting point for the discussion.

- [Guide to the
annotations](http://faculty.washington.edu/ebender/BoaF-annotations/guide.txt)
- Simple *tough*-adjective sentences:
  
  - [Original copies are very hard to
find.](http://faculty.washington.edu/ebender/BoaF-annotations/s1.txt)
  - [She is easy to get along
with.](http://faculty.washington.edu/ebender/BoaF-annotations/s2.txt)
(*Gap is inside PP complement.*)
- *tough*-adjective sentences, non-gapped variant.
  
  - [It is very hard to find original
copies.](http://faculty.washington.edu/ebender/BoaF-annotations/s3.txt)
  - [It is easy to get along with
her.](http://faculty.washington.edu/ebender/BoaF-annotations/s4.txt)
- Longer sentence with coordination and *tough*-adjective:
  
  - [Contact lenses come in small, light packages that are easy to
ship through the mail and they require frequent replacement by
the
user.](http://faculty.washington.edu/ebender/BoaF-annotations/s5.txt)
  - [Contact lenses come in small, light packages that are easy to
ship through the
mail.](http://faculty.washington.edu/ebender/BoaF-annotations/s6.txt)
(*Shortened variant.*)
- Examples highlight scope of negation with respect to auxiliaries:
  - [Wikipedia articles must not contain original
research.](http://faculty.washington.edu/ebender/BoaF-annotations/s7.txt)
  - [Wikipedia articles can not contain original
research.](http://faculty.washington.edu/ebender/BoaF-annotations/s8.txt)
- [All annotations + guide in one
file.](http://faculty.washington.edu/ebender/BoaF-annotations/all.txt)

## Discussion summary

Please visit the
[BirdsofaFeather2011Summary](https://delph-in.github.io/docs/summits/BirdsofaFeather2011Summary) page.

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/BirdsofaFeather2011/_edit)]{% endraw %}