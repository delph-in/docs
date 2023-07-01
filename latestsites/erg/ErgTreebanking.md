{% raw %}Some notes on Treebanking with the [ERG](https://delph-in.github.io/docs/erg/ErgTop). Possibly may evolve
into a guide.

- Reference:
  - @inproceedings{Nakov:2005:SES:1706543.1706547, author = {Nakov,
Preslav and Hearst, Marti}, title = {Search engine statistics
beyond the n-gram: application to noun compound bracketing},
- Assign binary bracketing in all nominal compounds (no ternary+
structures)
- If intuitions are clear, bracket compounds pair-wise accordingly.
  - Examples: \|aluminum \[towel rack\]\| vs. \|\[cotton towel\]
rack\|
- If intuitions are not clear, bracket as follows:
  - Bracket nouns pair-wise with lowest attachment from left to
right
  - Attach adjectives at the highest available point:
    - \|\[\[N1 N2\] N3\] N4\|
    - \|A1 \[\[\[N2 N3\] N4\] N5\]\|
    - \|\[\[N1 N2\] N3\] \[A4 N5\]\|
    - \|A1 [N2 N3\] \[A4 \[\[N5 N6\]
N7](/N2%20N3%5D%20%5BA4%20%5B%5BN5%20N6%5D%20N7)\|

## Notes from Dan

- [notes on rule distinctions](https://delph-in.github.io/docs/erg/ErgTreebankingRules)
- [general guidelines](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines)
- [heuristics for treebanking with bridges](https://delph-in.github.io/docs/erg/ErgTreebankingBridges)

Last update: 2014-12-11 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/ErgTreebanking/_edit)]{% endraw %}