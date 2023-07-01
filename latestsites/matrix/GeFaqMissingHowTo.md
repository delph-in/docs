{% raw %}# Grammar Engineering Frequently Asked Questions

## How can I tell if an edge is missing in the parse chart?

If a sentence that you believe should parse isn't parsing, or if it is
parsing, but it's not getting the parse you expect, then there are
probably edges missing from your parse chart. (If not, see [this
FAQ](https://delph-in.github.io/docs/matrix/GeFaqRootFail).)

To find out if this is the case, and to find out which edge is missing,
first you must try to parse a sentence, and then [display the parse
chart](https://delph-in.github.io/docs/matrix/GeFaqShowChart).

Along the left hand side of the parse chart are the word forms from the
input sentence. In the next column are the lexical edges built for each
of the words. In the next column are the edges built from those edges
(by the application of lexical rules or or phrase structure rules), etc.

Each edge in the chart is labeled with the portion of the string it
spans (e.g., 0-2, meaning the first two words; the numbers label the
spaces around the words), a unique edge identifier (in square brackets)
and the name of the lexical type or lexical or grammar rule which
licensed the edge.

If you click on a word form, all edges which dominate that word form
will be highlighted. If you click on another word form, all edges which
dominate both word forms will be highlighted, etc. This can be useful
for determining which edges (if any) are missing. You can also click on
an edge and select 'Highlight nodes' from the pop-up menu. This will
highlight all descendants and ancestors of that edge.

* * *

### Related topics

- [How do I get the LKB to show me the parse chart?](https://delph-in.github.io/docs/matrix/GeFaqShowChart)
- [Looking at the parse chart, it seems that I do have an edge that
spans the whole chart (accounts for all the words), but the LKB
still says no parses found. What might be going on?](https://delph-in.github.io/docs/matrix/GeFaqRootFail)

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqMissingHowTo/_edit)]{% endraw %}