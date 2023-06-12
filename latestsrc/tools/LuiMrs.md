{% raw %}# Overview

Display of MRS structures (Minimal Recursion Semantics; see the
[RmrsTop](https://delph-in.github.io/docs/tools/RmrsTop) pages) in LUI supports various views, viz. (a)
*simple*, (b) *indexed*, and (c) *dependency* formats. All three views
display the exact same object but vary in the amount of information
provided (and accordingly the compactness of display). Furthermore,
display of scope-resolved form(s) of an MRS is supported by calling back
into the LKB built-in MRS display code (on select platforms). The
following sections briefly comment on each of the three native LUI views
for MRSs.

# Simple MRS Display

The *simple* view on an MRS is closely related to browsing a feature
structure, in fact using the [LuiAvm](https://delph-in.github.io/docs/tools/LuiAvm) widget for display
purposes.

- <img src="http://www.delph-in.net/lui/simple.png" title="http://www.delph-in.net/lui/simple.png" class="external_image" alt="http://www.delph-in.net/lui/simple.png" />


MRS variables are represented as node re-entrancies, and the AVM widget
facilities for highlighting and \`chasing' of re-entrancies can be used
to follow linking across EPs. Nodes representing variables are shown
collapsed by default, and the standard AVM mouse bindings (left-click on
the variable name) work to expand MRS variables, in order to display
variable properties.

Since *simple* MRS display re-uses the standard AVM widget, it inherits
all of its pop-up menues. Note that, in some cases, menu commands like
*Type Hierarchy* or *Show Source* will be available but have no
meaningful semantics, viz. where the \`type' label shown in the AVM
widget actually corresponds to a simple string in the MRS.

# Indexed MRS Display

The *indexed* MRS view assumes order-coding for argument positions;
thus, elementary predications look somewhat more like a traditional,
logical-form representation, and display requires quite a bit less
screen real estate.

- <img src="http://www.delph-in.net/lui/indexed.png" title="http://www.delph-in.net/lui/indexed.png" class="external_image" alt="http://www.delph-in.net/lui/indexed.png" />


Compactness in *indexed* view is further increased by reducing the
display of variable properties to just the values, i.e. omitting the
names of properties themselves. The assumption here is that property
values like past or sg can easily be interpreted. Furthermore, variable
properties are only shown on the first occurence (with respect to the
linear rendering of the display) of each variable.

The *indexed* MRS browser uses the LUI extended text widget, and
elements corresponding to logical variables are mouse-sensitive: mousing
over variables will highlight all occurences of the same variable.

# Elementary Dependency Display

- <img src="http://www.delph-in.net/lui/dependencies.png" title="http://www.delph-in.net/lui/dependencies.png" class="external_image" alt="http://www.delph-in.net/lui/dependencies.png" />


Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/LuiMrs/_edit)]{% endraw %}