{% raw %}# Japanese English Statistical Machine Translation

**Disclaimer:** This page is for notes and discussion of work in
progress on SMT between Japanese and English. It is unlikely to be
understandable or useful to anyone outside the project.

Results (no MERT):

|                                       |                                                                                                                 |     |             |             |             |              |            |          |
|---------------------------------------|-----------------------------------------------------------------------------------------------------------------|-----|-------------|-------------|-------------|--------------|------------|----------|
| Model                                 | Factors                                                                                                         |     | Test 1 BLEU | Test 2 BLEU | Test 3 BLEU | Average BLEU | Time taken | Comments |
| Mecab; No Punctuation)                | surface--&gt;surface                                                                                            | JE  | 19.76       | 19.36       | 20.44       | 19.85        | JST data   |          |
| Mecab; Punctuation)                   | surface--&gt;surface                                                                                            | JE  | 21.11       | 21.39       | 21.84       | 21.45        |            |          |
| Mecab Tokenization & Chasen POS)      | surface--&gt;surface pos--&gt;pos                                                                               | JE  | 19.14       | 19.56       | 20.14       | 19.58        |            |          |
| Juman No Punctuation)                 | surface--&gt;surface pos--&gt;pos                                                                               | JE  | 18.98       | 17.55       | 17.66       | 18.71        |            |          |
| Juman & Punctuation, Lemmas too)      | surface--&gt;surface pos--&gt;pos lemma,pos--&gt;lemma lemma,pos--&gt;surface                                   | JE  | 20.72       | 21.44       | 21.72       | 21.29        |            |          |
| Mecab Punctuation, POS, Lemmas, Morph | t2:surface--&gt;surface, t0:lemma--&gt;lemma, g1:lemma--&gt;pos, t1: morph--&gt;pos, g2: pos,lemma--&gt;surface | JE  | 19.68       | 19.87       | 19.59       | 19.71        |            |          |

Next:

|              |     |             |             |             |              |            |          |
|--------------|-----|-------------|-------------|-------------|--------------|------------|----------|
| Model        |     | Test 1 BLEU | Test 2 BLEU | Test 3 BLEU | Average BLEU | Time taken | Comments |
| 1            | EJ  |             |             |             |              |            | JST data |
| 2            | EJ  |             |             |             |              |            |          |
| 3 (Mecab)    | EJ  | 24.67       |             |             |              |            |          |
| 4 (Juman)    | EJ  |             |             |             |              |            |          |
| 3 (reversed) | EJ  |             |             |             |              |            |          |

- [JST data](http://feast.atr.jp/nonverbal/) 100,000 sentence pairs

Eric's systems:

|                        |                                                                                     |         |      |          |           |         |                                                                               |             |
|------------------------|-------------------------------------------------------------------------------------|---------|------|----------|-----------|---------|-------------------------------------------------------------------------------|-------------|
| Model                  | Factors                                                                             | Corpus  | Pair | pre-MERT | BLEU      | 2nd Run | Comments                                                                      | Time        |
| punctuation; lowercase | none                                                                                | IWSLT06 | JE   |          | --        | --      | tokenization: Mecab; Moses baseline script                                    |             |
| punctuation; lowercase | none                                                                                | Tanaka  | JE   |          | 14.39     | 17.69   | tokenization: Mecab; Moses baseline script                                    |             |
| punctuation; lowercase | surface-&gt;surface+pos                                                             | Tanaka  | JE   | 11.39    | **19.06** | 17.75   | EN factors: tree tagger                                                       | &lt; 24 hrs |
| punctuation; lowercase | t: surface-&gt;surface; g: surface-&gt;pos                                          | Tanaka  | JE   | 11.39    | 17.89     | --      | EN factors: tree tagger                                                       | 11 hrs      |
| punctuation; lowercase | t: lemma-&gt;lemma; g: lemma-&gt;pos; t: morph-&gt;pos g: lemma+pos-&gt;surface     | Tanaka  | JE   |          | 18.67     | --      | JA factors: Mecab, morph == pos; EN factors: tree tagger                      |             |
| punctuation; lowercase | t: lemma-&gt;lemma; g: lemma-&gt;pos; t: morph-&gt;pos g: lemma+pos-&gt;surface     | Tanaka  | JE   |          | 9.66      | --      | JA factors: Mecab, morph == morph form, type; EN factors: tree tagger, morpha |             |
| punctuation; lowercase | t: lemma-&gt;lemma; g: lemma-&gt;pos; t: pos+morph-&gt;pos g: lemma+pos-&gt;surface | Tanaka  | JE   |          | 6.91      | --      | JA factors: Mecab, morph == morph form, type; EN factors: tree tagger, morpha |             |
| punctuation; lowercase | none                                                                                | Tanaka  | EJ   |          | **26.87** | --      | tokenization: Moses baseline script; Mecab                                    |             |
| punctuation; lowercase | surface-&gt;surface+pos                                                             | Tanaka  | EJ   |          | 26.10     | --      | JA factors: Mecab                                                             |             |

## Models Under Construction

Model 1: (Lowercase English, No Punctuation; Mecab Tokenized Japanese,
POS from [MeCab](/MeCab) (is it really chasen??) & no punctuation)
sentence.lc.np.pose.en sentence.np.tokm.posm.ja

Model 2: (Lowercase English; Punctuation; Mecab Tokenized Japanese, POS
from [MeCab](/MeCab) (is it really chasen??) & Punctuation)
sentence.lc.p.pose.en sentence.p.tokm.posm.ja

Model 3: (Lowercase English, No Punctuation; Mecab Tokenized Japanese,
POS fromChasen & no punctuation) sentence.lc.np.pose.en
sentence.np.tokc.posm.ja

Model 4: (Lowercase English, No Punctuation; Juman Tokenized Japanese,
POS from Juman & no punctuation) sentence.lc.np.pose.en
sentence.np.tokj.posm.ja

Model 5: (Lowercase English, No Punctuation; lemmatized in both
languages & no punctuation) sentence.lc.np.dicm.pose.en
sentence.np.tokj.dicj.posm.ja

Model 6: (best of 1-5 + NE) do NE on both languages and add as a factor
Francis\|n\|name-B Bond\|n\|name-M was\|v\|O here\|n\|O (or
here\|n\|place-B, depending on your tagger)

- Sort of inspired by work at ATR *Introducing Translation Dictionary
Into Phrase-based SMT*.
- Which NE? Try [Sekine's](http://nlp.cs.nyu.edu/ene)

Model 7: (best of 1-5 + NE variant) do NE on both languages and filter
out NEs that don't align in preprocessing. e.g: compare the results
(maybe taking only the intersection) then you can ge better results, as
the cues must be different in the two languages.

lc = lowercase np = no punctuation p = punctuation tokc = Chasen
Tokenized tokj = Juman Tokenized tokm = Mecab Tokenized dicj = Root Form
from Juman dicm = Root Form from MORPH English Morphological Tagger pose
= POS Adawati Maximum Entropy Tagger posc = POS Chasen posj = POS Juman
posm = POS [MeCab](/MeCab) en = english ja = japanese

Sample File Names: sentences.lc.p.pose.en sentences.p.tokm.posm.ja

## Other Ideas

- Use French from <http://wwwcyg.utc.fr/tatoeba/> to cross align on
Tanaka Corpus
- Parse and generate both sides and train off the expanded corpus.
- Reverse the Japanese (suggested by Jason Katz-Brown)

## Data Sources

## Other Experiments

[NE\_Tagging\_For\_Improving\_SMT](https://delph-in.github.io/docs/garage/NE_Tagging_For_Improving_SMT)

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/MtJaenSmt/_edit)]{% endraw %}