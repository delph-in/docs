{% raw %}# Grammar Engineering Frequently Asked Questions

## What non-alphanumeric chacters are allowed in a string parsed by the LKB and how do I change that?

The alphanumeric characters which will be stripped by the preprocessor
are defined in the file lkb/globals.lsp. You can change that list by
editing the file. Note, however, that certain characters are meaningful
in tdl and therefore can't be used as part of lexical entries.

Note that if you're using a non-latin writing system, and you want to
have the punctuation stripped from your input, you'll need to add your
punctuation characters to the list in lkb/globals.lsp.

## Related topics

- [What non-alphanumeric characters are allowed to be part of a string
parsed by the LKB, and how can I change that?](https://delph-in.github.io/docs/matrix/GeFaqNonAlpha)

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqNonAlpha/_edit)]{% endraw %}