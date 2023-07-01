{% raw %}# Grammar Engineering Frequently Asked Questions

## Looking at the parse chart, it seems that I do have an edge that spans the whole chart (accounts for all the words), but the LKB still says no parses found. What might be going on?

If you have an edge that spans the whole input string, but the LKB still
says "no parses found", the problem probably lies with the root
condition. There are two subcases:

- Your root condition is correct, and your spanning edge is
inconsistent with it. For example, say your root condition requires
that the the SUBJ value be empty, but your spanning edge has a
non-empty SUBJ value. (This could come up if you were working on
sentences with null or pro-dropped subjects. If your optional
subject rule wasn't firing, you would have an edge for the whole
string (verb plus object, say), but it would not be an acceptable
complete parse.
- Another possibility is that there is a syntax error in your root
condition. In this case, the grammar will still load, but the root
condition won't be loaded. (There is an error printed to the LKB top
window, but it probably scrolled off the top.) If there is no root
condition loaded, nothing will parse. (If you have multiple root
conditions and one has a syntax error in it, then only sentences
with parses matching error-free root conditions will parse.)
- Yet a third possibility is that you have two (or more) entries with
the identifier root. In this case, only the last one is retained by
the system.

* * *

### Related topics

- [How do I tell if I have an edge that spans the whole
chart?](https://delph-in.github.io/docs/matrix/GeFaqSpanningEdge)
- [How do I define multiple different root
conditions?](/GeFaqMultipleRoot)
- [In which files does order matter?](https://delph-in.github.io/docs/matrix/GeFaqOrderMatters)

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqRootFail/_edit)]{% endraw %}