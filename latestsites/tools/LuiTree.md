{% raw %}# LUI Constituent Trees

Grammars often produce numerous tree structures for any input parsing or
generation request. When a parse is performed, LUI displays a summary
containing one tree per reading assigned by the grammar. The summary
view looks like this:

- <img src="http://www.delph-in.net/lui/trees.png" title="http://www.delph-in.net/lui/trees.png" class="external_image" alt="http://www.delph-in.net/lui/trees.png" />


Depending on personal preferences, the summary view of the trees may be
too small for intensive work. Clicking on a tree's background pulls that
tree out into its own window, and enlarges it:

- <img src="http://www.delph-in.net/lui/tree.png" title="http://www.delph-in.net/lui/tree.png" class="external_image" alt="http://www.delph-in.net/lui/tree.png" />


Nodes in trees highlight when the user mouses over them, indicating that
the mouse buttons are active. The nodes in the summary and detail views
function identically; the only difference is size. Left-clicking on a
tree node brings up the associated AVM; right-clicking requests a
popup-menu with the following choices:

|                 |                                                                                                    |
|-----------------|----------------------------------------------------------------------------------------------------|
| **Menu Item**   | Description                                                                                        |
| *Full AVM*      | Brings up the AVM associated to this node, before the grammar's restrictor has been applied.       |
| *Local AVM*     | Brings up the AVM associated to this node, after the grammar's restrictor has been applied.        |
| *Chart Edges*   | Highlights the edges used in or built on this node in a parse chart browser.                       |
| *Partial Chart* | Opens a parse chart browser containing only those edges used in or built on this node.             |
| *Generate*      | Attempts to generate sentences using the grammar whose semantics match those of the selected node. |
| *Rephrase*      | Same as *Generate*, but also applies transfer rules to the semantics (?).                          |
| *Simple MRS*    | Opens an MRS browser for the *simple* view of the semantics of this node.                          |
| *Indexed MRS*   | Opens an MRS browser for the *indexed* view of the semantics of this node.                         |
| *Scoped MRS*    | Opens an MRS browser for the *scoped* view of the semantics of this node.                          |
| *Dependencies*  | Displays the dependencies view of the semantics of this node.                                      |

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/LuiTree/_edit)]{% endraw %}