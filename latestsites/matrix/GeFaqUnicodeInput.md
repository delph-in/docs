{% raw %}# Grammar Engineering Frequently Asked Questions

## How can I input strings from non-ascii character sets?

The LKB is unicode enabled, but the parse input dialogue box does not
allow non-ascii input. That leaves two options:

1. Batch parsing. test.items and other files used as input to the batch
parser can be in unicode.
2. Interacting with the LKB through the tty interface in emacs:
   - Go to the \*common-lisp\* buffer.
   - Make sure you're in the LKB package, by typing :pa lkb at the
lisp prompt.
   - Then type:
(do-parse-tty "\[your string, in any character set\]").

For more on input methods for non-ascii character sets in emacs, see the
emacs documentation on MULE.

## Related topics

- [What non-alphanumeric characters are allowed to be part of a string
parsed by the LKB, and how can I change that?](https://delph-in.github.io/docs/matrix/GeFaqNonAlpha)

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqUnicodeInput/_edit)]{% endraw %}