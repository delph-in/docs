{% raw %}# Feature Requests for the Full Forest Treebanker

Possible ways to make the [Full Forest Treebanker](https://delph-in.github.io/docs/tools/FftbTop) even better.

- Show the probability mass of choices (WP)
- If the string you have seen before is in the treebank (as a
constituent), show what choices were made before (FCB)
- Show the input sentence when you show the MRS (LM)
- Treebank remotely (FCB), sort of solved with nginx
- Include the ltdb url as a command line argument (FCB)
- **OR** Read the location of the ltdb from the grammar
  
  - means adding some metadata to ACE
  - ltdburl, license, contact, url, grammar name?
- Use ltdb for all types (FCB) *new assets file sent to Woodley*
- Fix the 'Is A Constituent' method or remove it from the tool (FCB)
- Better handling for items with no parse (some subset of the
following):
  - Show which items have parses in the list
  - Include a next/prev button on the error page for items with no
parse.
  - Skip to the next item with a parse when accept or reject is
selected.
- show the well-formedness
  - what is the correct thing to do for an ungrammatical sentence
with no parse?
- Memory leak over time
- Bad behavior on items with lexical gaps
- Show DMRS instead or with the MRS,for ease of assessing how good the parse is (OZ)

## Done

- Include the port as a command line argument (FCB)

Last update: 2023-06-06 by Olga Zamaraeva [[edit](https://github.com/delph-in/docs/wiki/FftbWishlist/_edit)]{% endraw %}