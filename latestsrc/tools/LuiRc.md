{% raw %}# LUI User Configuration File

LUI checks for a file named .luirc in your home directory on startup. If
such a file exists, LUI reads one parameter per line from it. The syntax
for the parameters is parameter param-name param-value. Blank lines are
ignored, as are comments, i.e. lines starting with \#, ;, /, or %.

Parameter values have one of several types, including symbol, string,
integer, font, and color. Symbols are sequences of alphanumeric
characters, and strings are the same bracketed by double quotes ("). A
color is either the English name of a common color (e.g. red, blue,
green) or a description of the form \#C\[red green blue\], where red,
green, and blue are each integers from 0 to 65535. A font is a tuple of
the form \#F\[family size style color\], where style is one of roman,
italics, bold, or bold-italics.

Some parameters take lists as their values. The syntax is a
space-delimited sequence of values, bracketed by \[ and \], for example
\[one two three\].

### Parameter Reference

|                             |                 |                                                                                     |
|-----------------------------|-----------------|-------------------------------------------------------------------------------------|
| **Parameter Name**          | **Type**        | **Description**                                                                     |
| LIST-TYPE                   | Symbol          | Which AVM type is displayed as length-unspecified lists (e.g. \*LIST\*).            |
| EMPTY-LIST-TYPE             | Symbol          | Which AVM type is displayed as the empty list (e.g. \*NULL\*).                      |
| NON-EMPTY-LIST-TYPE         | Symbol          | Which AVM type is displayed as a non-empty list (e.g. \*CONS\*).                    |
| LIST-HEAD                   | Symbol          | Feature name for the first element of a list (e.g. CAR or FIRST).                   |
| LIST-TAIL                   | Symbol          | Feature name for the rest of a list (e.g. CDR or REST).                             |
| AVM-HIDDEN-FEATURES         | List of symbols | Features whose display is normally supressed.                                       |
| AVM-COLLAPSED-FEATURES      | List of symbols | Features whose values should be initially collapsed.                                |
| AVM-HIDDEN-TYPES            | List of symbols | Types of sub-AVMs to not display.                                                   |
| AVM-COLLAPSED-TYPES         | List of symbols | Types of sub-AVMs to initially collapse.                                            |
| AVM-CENTER-FEATURES         | 1 or 0          | Whether to vertically center feature names on their values.                         |
| AVM-MARGINS                 | Integer         | How many pixels of margin to leave in the AVM browser.                              |
| AVM-STRUCTURE-BRACKET-COLOR | Color           | What color to use for the \[ and \] in AVM rendering.                               |
| AVM-LIST-BRACKET-COLOR      | Color           | What color to use for the &lt; and &gt; in AVM list rendering.                      |
| AVM-TAG-BOX-COLOR           | Color           | What color to use for the box around coreference tags in AVM rendering.             |
| AVM-TYPE-FONT               | Font            | Used to display type names in AVMs.                                                 |
| AVM-FEATURE-FONT            | Font            | Used to display feature names in AVMs.                                              |
| AVM-ATTRIBUTE-FONT          | Font            | Alias for AVM-FEATURE-FONT.                                                         |
| AVM-TAG-FONT                | Font            | Used to display coreference tags in AVMs.                                           |
| AVM-PATH-FONT               | Font            | Used to display the moused-over feature path in the AVM browser.                    |
| AVM-BAR-FONT                | Font            | Alias for AVM-PATH-FONT.                                                            |
| CHART-EDGE-FONT             | Font            | Used to display edge identifiers in the chart browser.                              |
| CHART-WORD-FONT             | Font            | Used to display the orthographies at the bottom of the chart browser.               |
| CHART-BAR-FONT              | Font            | Used to display information about the moused-over edge in the chart browser.        |
| TEXT-LEADING                | Integer         | How many pixels of leading (extra vertical space) to add in the text browser.       |
| TEXT-HIGHLIGHT-COLOR        | Color           | What color to highlight moused-over active elements in the text browser.            |
| TEXT-PLAIN-FONT             | Font            | Used as the default font for passive elements in the text browser.                  |
| TEXT-ACTIVE-FONT            | Font            | Used as the default font for clickable elements in text browser.                    |
| TREE-SUMMARY-NODE-FONT      | Font            | Used to display tree nodes in the tree summary browser.                             |
| TREE-DETAIL-NODE-FONT       | Font            | Same, for the tree detail browser.                                                  |
| TREE-SUMMARY-SURFACE-FONT   | Font            | Used to display orthographies in the tree summary browser.                          |
| TREE-DETAIL-SURFACE-FONT    | Font            | Same, for the tree detail browser.                                                  |
| TREE-SUMMARY-BAR-FONT       | Font            | Used to display information about the moused-over node in the tree summary browser. |
| TREE-DETAIL-BAR-FONT        | Font            | Same, for the tree detail browser.                                                  |

### Sample .luirc File

    #
    # sample user-specific LUI configuration file (install as `~/.luirc').
    #
    
    #
    # the feature structure browser
    #
    parameter avm-center-features 1
    parameter avm-margins 2
    parameter avm-hidden-features [INSTLOC WLINK CFROM CTO]
    parameter avm-collapsed-features [ARGS]
    parameter avm-hidden-types []
    parameter avm-collapsed-types [non_local]
    parameter avm-bar-font #F[Helvetica 12 roman black]
    parameter avm-type-font #F[Helvetica 12 bold blue]
    parameter avm-feature-font #F[Helvetica 12 roman black]
    parameter avm-tag-font #F[Helvetica 12 roman green]
    parameter avm-structure-bracket-color #C[8448 9448 33792]
    parameter avm-list-bracket-color #C[8448 9448 33792]
    parameter avm-tag-box-color green
    
    #
    # the summary browser for trees, showing all trees in a single window
    #
    parameter tree-summary-bar-font #F[Helvetica 10 roman black]
    parameter tree-summary-node-font #F[Helvetica 10 roman black]
    parameter tree-summary-surface-font #F[Helvetica 10 italic black]
    
    #
    # the detailed tree browser, showing one single tree at a time
    #
    parameter tree-detail-bar-font #F[Helvetica 14 roman black]
    parameter tree-detail-node-font #F[Helvetica 14 roman black]
    parameter tree-detail-surface-font #F[Helvetica 14 italic black]
    
    #
    # the chart browser
    #
    parameter chart-bar-font #F[Helvetica 12 roman black]
    parameter chart-word-font #F[Helvetica 12 roman black]
    parameter chart-edge-font #F[Helvetica 12 roman black]
    
    #
    # the text browser
    #
    parameter text-plain-font #F[Helvetica 14 roman black]
    parameter text-active-font #F[Helvetica 14 roman black]
    parameter text-leading 4
    parameter text-highlight-color green

### Sample .luirc for displaying Japanese

This is a minimal set of changes that allows lui to display Japanese
characters. It assumes that x has the sazanami fonts available
<http://sourceforge.jp/projects/efont/files/>. If you don't then either
(i) install them or (ii) find another font and use that instead. You can
check what fonts you have with xlsfonts. To find those that can display
Japanese you can do xlsfonts \*jis\*, although lui actually uses the
**iso10646-1** encoding.

Note that the multi-byte display still isn't super beautiful, blame it
on X.

    #
    # LUI configuration file (install as `~/.luirc').
    # example for showing Japanese (assuming you have the sazanami fonts)
    # http://sourceforge.jp/projects/efont/files/
    
    #
    # the feature structure browser
    #
    # this makes the avm hard to read but shows the ORTH
    # parameter avm-feature-font #F[sazanami 12 roman black]
    
    #
    # the summary browser for trees, showing all trees in a single window
    #
    parameter tree-summary-surface-font #F[sazanami 12 roman black]
    
    #
    # the detailed tree browser, showing one single tree at a time
    #
    parameter tree-detail-surface-font #F[sazanami 12 roman black]
    
    #
    # the chart browser
    #
    parameter chart-bar-font #F[sazanami 12 roman black]
    parameter chart-word-font #F[sazanami 12 roman black]
    #
    # the text browser
    #
    parameter text-plain-font #F[sazanami 12 roman black]
    parameter text-active-font #F[sazanami 12 roman black]

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/LuiRc/_edit)]{% endraw %}