{% raw %}# LUI Chart Browser

Parsing systems typically use a *chart* as an organizational device to
keep track of partial analyses of input sentences. An analysis of a
constituent in an input is referred to as an *edge*, and the chart
consists of a collection of edges, typically organized according to
length and string location.

### Layout and Philosophy

The layout of the chart browser is clean and intuitive. The parse chart
is displayed as a stack of rows, one for each constituent ("edge")
length considered. The top row corresponds to edges spanning the entire
sentence (say of length N), consisting of only a single cell. The next
row contains edges spanning N-1 tokens, and is broken into two cells;
the left cell contains edges starting at the beginning of the input, and
the right cell contains edges aligned with the end of the input. The
chart extends downwards in a similar fashion, with shorter edges on each
row, terminating in the bottom row with edges of length 1, and a cell
for each starting string position.

- <img src="http://www.delph-in.net/lui/chart.png" title="http://www.delph-in.net/lui/chart.png" class="external_image" alt="http://www.delph-in.net/lui/chart.png" />


The parent/child relationship between edges is not immediately visible
in the display; charts tend to be rather large even without adding
criss-crossing lines all over the screen, and with lines showing all
relationships, parse charts would be much too large. This crucial
information is, however, less than a click away! When the user moves the
mouse pointer over an edge in the chart, LUI hilights all of its
descendents and parents (see the screenshot). This makes it easy to see
the internal structure of the chart, while maintaining a tidy view.

### Menu Description

Numerous other options are available. Left-clicking on an edge summons a
new browser containing the AVM for that edge, and right-clicking offers
a menu of several more advanced choices:

|                  |                                                                                                             |
|------------------|-------------------------------------------------------------------------------------------------------------|
| **Menu Item**    | **Description**                                                                                             |
| *Local AVM*      | Shows the AVM for the edge.                                                                                 |
| *Parse Tree*     | Requests a tree display with the selected edge as the root, and the edges used to build it as its children. |
| *Linked Edges*   | Locks the mouse-over highlighting until the next click.                                                     |
| *Nuclear Family* | Highlights immediate parents and children until until the next click.                                       |
| *Filter*         | Removes all edges built on this edge from the chart, until unfiltered.                                      |
| *Unfilter*       | Inverse of *Filter*, above.                                                                                 |
| *Filter Others*  | Applies the *Filter* command to all other edges in the same cell as this edge.                              |
| *Restrict*       | Filters all edges not related to this edge by a (transitively closed) parent-of or child-of relationship.   |
| *Grammar Entry*  | Summons the TDL source for the grammar rule or lexical entry of this edge in Emacs.                         |

Right-clicking on the surface forms at the bottom of the chart offers a
list of the lexemes in the chart which represent it. Selecting one of
the lexemes filters the others, and selecting *All Lexemes* reverses
this.

Right-clicking on the background of the chart offers two additional
options. *Reset Filters* clears all filtering action, resulting in a
chart with all of the edges visible. *Fork Browser* opens a new chart
browser window containing the same filtering settings as the source
window, which can be manipulated independantly.

# Interactive Unification

Like the [LuiAvm](https://delph-in.github.io/docs/tools/LuiAvm) browser, the chart browser support interactive
unification, i.e. dragging a chart edge and dropping it onto a feature
(sub-)structure in another LUI window to request unification of the two
structures with failure recording. See the
[LuiUnification](https://delph-in.github.io/docs/tools/LuiUnification) page for details.

Last update: 2013-07-02 by WoodleyPackard [[edit](https://github.com/delph-in/docs/wiki/LuiChart/_edit)]{% endraw %}