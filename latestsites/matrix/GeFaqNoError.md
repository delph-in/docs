{% raw %}# Grammar Engineering Frequently Asked Questions

## I don't think I'm getting any error messages. Does that mean I don't have any errors?

No, not necessarily. There are two things to note in this regard:

- Not all of the errors cause the LKB to stop loading. If your grammar
is not behaving as expected, you should always scroll up in the LKB
top window to see if any error messages have gone by.
- The LKB can only check for well-formedness of your grammar. It can't
check to see whether it is linguistically correct. For this you need
to try parsing sentences (both one at a time and in batch test mode)
and seeing what happens. If a sentence that you think should parse
isn't parsing, try interactive unification.

* * *

### Related topics

- [How do I do interactive unification?](https://delph-in.github.io/docs/matrix/GeFaqInteractiveUnify)
- [When I look at the parse chart, I don't see an edge that I'm
expecting to be there. How do I find out why it's
missing?](https://delph-in.github.io/docs/matrix/GeFaqMissingEdge)
- [How can I tell if an edge is missing in the parse
chart?](https://delph-in.github.io/docs/matrix/GeFaqMissingHowTo)

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqNoError/_edit)]{% endraw %}