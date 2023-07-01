{% raw %}## Project Summary

### Hypothesis

SMT results can be improved by 1) tagging the bilingual training corpus
using NE-Taggers on both sides of the corpus and then 2) substituting a
NE-TAG token in for words that can be easily translated via a bilingual
dictionary later on. Next 3) train on the specially crafted corpus and
4) when it is time to test the system, pre-process the test set corpus
on the source side (putting in NE-TAG) and then translate, afterward (5)
use a bilingual dictionary to translate the tokens that were tagged
during pre-processing.

Last update: 2008-11-28 by DarrenAppling [[edit](https://github.com/delph-in/docs/wiki/NE_Tagging_For_Improving_SMT/_edit)]{% endraw %}