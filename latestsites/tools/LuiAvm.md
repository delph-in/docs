{% raw %}# LUI Feature Structures

The LUI feature structure (aka AVM) widget is maybe the most developed
of the existing LUI browsers. It attempts to provide a high-performance
viewer that facilitates efficient navigation, even for large AVMs.
Following is an example of the LUI rendering of a feature structure:

- <img src="http://www.delph-in.net/lui/avm.png" title="http://www.delph-in.net/lui/avm.png" class="external_image" alt="http://www.delph-in.net/lui/avm.png" />


Feature structure representations of lists are displayed in a more
conventional form, using angle brackets. For this convenience to work,
LUI needs to know about the list-related attributes and types (e.g.
FIRST, REST, list, null, et al.) from the underlying grammar. These can
be configured by means of the .luirc file; see the [LuiRc](https://delph-in.github.io/docs/tools/LuiRc) pages.

The AVM browser allows imploding and exploding sub-structures. Left
clicking on type names (in the top left corner of each sub-AVM) will
toggle the display state of that sub-structure, i.e. implode on first
click and explode again subsequently.

When the mouse is moved over a reentrancy tag, the tags on all other
locations reentrant to that tag are highlighted, to facilitate
visualization of coreferencing. Type names and reentrancy tags have
contextual menus accessible by right-clicking (or control-clicking) on
them. The menus allow you to perform various tasks relating to the
corresponding structures.

The type popup menu mostly contains accessors for information about the
type.

|                          |                                                                                         |
|--------------------------|-----------------------------------------------------------------------------------------|
| **Item**                 | **Description**                                                                         |
| *Collapse / Expand*      | Toggles the display of information contained inside the structure whose type you click. |
| *Banish / Reveal Hidden* | Toggles display of hidden information inside the structure.                             |
| *Type Hierarchy*         | Opens a new browser for the type subhierarchy dominated by the selected type.           |
| *Type Definition*        | Opens a new browser showing the grammar's definition of the type.                       |
| *Expanded Type*          | Opens a new browser showing the fully expanded AVM for the type.                        |
| *Show Source*            | Displays the grammar source code for the type in Emacs.                                 |

The reentrancy tag popup menu contains navigational helpers.

|                   |                                                                                                     |
|-------------------|-----------------------------------------------------------------------------------------------------|
| **Item**          | **Description**                                                                                     |
| *Find Next*       | Recenters the display around the next occurance of the selected tag.                                |
| *Find Previous*   | Recenters the display around the previous occurance of the selected tag.                            |
| *Find Definition* | Recenters the display around the occurance of the tag which show type and substructure information. |

# Interactive Unification

The LUI AVM browser supports interactive unification (for debugging
purposes), and if the AVM being browsed contains unification failure
information, then there are a few more interesting options to explore.
For more information see the [LuiUnification](https://delph-in.github.io/docs/tools/LuiUnification) page.

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/LuiAvm/_edit)]{% endraw %}