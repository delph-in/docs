{% raw %}# Cathedral and the Bazaar (cb)

- \- URL: <http://catb.org/~esr/writings/cathedral-bazaar/>

This is an early essay on Open Source by Eric Raymond. It is about 800
sentences, which is small, but there are more essays if we want more
data. There are several good translations (not all linked to the main
page).
[Wikipedia](http://en.wikipedia.org/wiki/The_Cathedral_and_the_Bazaar)
also has a number of links to different translations: C (see on the
left) (AF). It is freely available, but I (FCB) checked with the author
anyway as a matter of courtesy and he was enthusiastic about us using
it. There will be some clean up work involved in getting the
translations aligned (there are several versions of the essay).

It was proposed (by FrancisBond) and accepted (by
everyone) at the Kyoto Summit (2008) that we use this as a multilingual
shared test suite to enable us to compare parses across different
grammars. This page describes the steps we are taking to prepare the
translations of the essays as a corpus. As the data becomes available,
we will also link it to this pages.

Contents

1. [Cathedral and the Bazaar (cb)](https://delph-in.github.io/docs/grammars/MatrixMrsCatb#Cathedral_and_the_Bazaar_.28cb.29)
2. [The Cathedral and the Bazaar in different
languages](https://delph-in.github.io/docs/grammars/MatrixMrsCatb#The_Cathedral_and_the_Bazaar_in_different_languages)
3. [Timeline](https://delph-in.github.io/docs/grammars/MatrixMrsCatb#Timeline)
4. [Formatting Guidelines](https://delph-in.github.io/docs/grammars/MatrixMrsCatb#Formatting_Guidelines)
   1. [Profile Name](https://delph-in.github.io/docs/grammars/MatrixMrsCatb#Profile_Name)
   2. [Markup](https://delph-in.github.io/docs/grammars/MatrixMrsCatb#Markup)
   3. [Structure](https://delph-in.github.io/docs/grammars/MatrixMrsCatb#Structure)
   4. [Quotations](https://delph-in.github.io/docs/grammars/MatrixMrsCatb#Quotations)
   5. [Typos](https://delph-in.github.io/docs/grammars/MatrixMrsCatb#Typos)
   6. [Sentence Numbering](https://delph-in.github.io/docs/grammars/MatrixMrsCatb#Sentence_Numbering)

# The Cathedral and the Bazaar in different languages

|                          |             |                                                                                        |             |                                                                      |                                                                                                |
|--------------------------|:-----------:|----------------------------------------------------------------------------------------|-------------|----------------------------------------------------------------------|------------------------------------------------------------------------------------------------|
| **Language**             | **Grammar** | **Web**                                                                                | **Version** | **Profile**                                                          | **Item**                                                                                       |
| Catalan (ca)             |             | [ca](http://www.danielclemente.com/apuntes/asai/recensio/catb.html)                    | ?           |                                                                      |                                                                                                |
| Chinese (zh) traditional |             | [zh](http://www.linux.org.tw/CLDP/OLD/doc/Cathedral-Bazaar.html) (big5)                | 1.42        |                                                                      |                                                                                                |
| Chinese (zh) simplified  |             | [zh](http://www.angeloliu.org/read-37.html)                                            | ?           |                                                                      |                                                                                                |
| English (en)             |     ERG     | [en](http://www.catb.org/~esr/writings/cathedral-bazaar/cathedral-bazaar/)             | 1.57        | [catb.en.txt](http://svn.emmtee.net/tags/handon/nict/cb/english.txt) | [catb.en.item](http://svn.emmtee.net/tags/handon/lingo/lkb/src/tsdb/skeletons/english/cb/item) |
| French (fr)              | Grenouille  | [fr](http://www.linux-france.org/article/these/cathedrale-bazar/cathedrale-bazar.html) | 1.4         |                                                                      |                                                                                                |
| German (de)              |     GG      | [de](http://gnuwin.epfl.ch/articles/de/Kathedrale/)                                    | 1.45        |                                                                      |                                                                                                |
| Greek, Modern (el)       |    MGRG     | [el](http://howto.hellug.gr/howto/pub/html/cathedral-bazaar.html)                      | ?           |                                                                      |                                                                                                |
| Japanese (ja)            |    Jacy     | [ja](http://cruel.org/freeware/cathedral.html)                                         | 1.40        |                                                                      |                                                                                                |
| Korean (ko)              |     KRG     | [ko](http://wiki.kldp.org/wiki.php/DocbookSgml/Cathedral-Bazaar-TRANS)                 | 1.32        |                                                                      |                                                                                                |
| Norwegian (no)           |  Norsource  | NTNU                                                                                   |             |                                                                      |                                                                                                |
| Portuguese (pt)          |   LXgram    | [pt](http://www.geocities.com/CollegePark/Union/3590/pt-cathedral-bazaar.html)         | 1.42        |                                                                      |                                                                                                |
| Spanish (es)             |     SRG     | [es](http://es.tldp.org/Otros/catedral-bazar/cathedral-es-paper-13.html)               | 1.28        |                                                                      |                                                                                                |
| Swedish (sv)             |             | [sv](http://home.swipnet.se/swi/KatB-se.html)                                          | 1.51        |                                                                      |                                                                                                |
| Thai (th)                |             | [th](http://linux.thai.net/~thep/catb/cathedral-bazaar/index.html)                     | ?           |                                                                      |                                                                                                |

At NiCT we also have a 201 sentence aligned subset of
en,ko,zh,de,pt,it,fr which we use for MT testing. Sugita Sho used it to
compare various MT systems [「機械翻訳の精度分析」 "An Analysis of
Machine Translation
Precision"](http://www.is.oit.ac.jp/~koda/server/~sugita/).

# Timeline

This is the timeline agreed on at the Kyoto Summit, moved back a month
to fit with the current reality.

- 0 Prepare and release partially filled skeletons (2008-09: FCB) 1
Make profiles for all languages (by the end of 2008-10)
  - align and correct translations
  - translate remaining text (if the original translation is
incomplete)
  - feedback translations to the official translators
  - segment if necessary
  - link the profile in the table above
  - add the profile to your grammar (e.g., jacy/tsdb/skeletons/cb)
  - NiCT will also link as n(n-1) parallel corpora
  
  2 Treebank profile (by the end of 2009-03)
  - translate
  - treebank
  - share the treebank to allow for comparisons
  - include it with your grammar (e.g., jacy/gold/cb)
  
  3 Compare treebanks at the next DELPH-IN summit (2009-??)

# Formatting Guidelines

Treebanking this text leads to several interesting issues with text
cleansing: italics, embedded quotations, list numbers and so forth. In
this section we will discuss what we have done in non-straightforward
cases.

Note that we are not treating this as a corpus for testing the
robustness of our systems to raw text, but rather as a set of sentences
for comparing the semantic representations across languages. Therefore,
we will try to make the input text as easy to parse as possible. In our
corpus all markup is removed and obvious infelicities (typos,
mispellings, bad translations) should be corrected. If and when we want
to look at robustness issues, we will choose a new text (possibly the
next essay in this series).

For the profile, we will use the [itsdb text file
format](https://delph-in.github.io/docs/tools/ItsdbReference), which can be automatically converted into
[\[incr tsdb()\]](http://www.delph-in.net/itsdb) bitext profiles.

## Profile Name

We will call the input file **cb-xx.txt**, where xx is the iso 639
language code. The resulting profile should contain **cb-xx/item**. If
we distribute just the item file then please call it **cb-xx.item**.

## Markup

We have removed all markup (hyperlinks, italics, paragraph boundaries,
...). These can be added in when we have more of a handle on how to deal
with them.

Examples:

- *Perhaps this is not only the future of
**&lt;emphasis&gt;open-source&lt;/emphasis&gt;** software.*
  
  - → *Perhaps this is not only the future of **open-source**
software.*
- *Other examples are legion, as a visit to
**&lt;ulink url="http://freshmeat.net/"&gt;Freshmeat&lt;/ulink&gt;**
on any given day will quickly prove.*
  
  - → *Other examples are legion, as a visit to **Freshmeat** on any
given day will quickly prove.*

## Structure

Mark headers as headers (with a preceding + in the text profile, as XP
in the item file):

- *+The Cathedral and the Bazaar*

Keep list item numbers in the first sentence in the list item.

- *6. Treating your users as co-developers is your least-hassle route
to rapid code improvement and effective debugging.*

## Quotations

- If a quotation spans multiple sentences, split at the first period:

<!-- -->


    [18200] ``Somebody finds the problem,'' he says, ``and somebody else understands it.
    [18300] And I'll go on record as saying that finding it is the bigger challenge.''

- Note that this means we expect to have sentences with unbalanced
punctuation.

## Typos

We should correct obvious typos in the profile, and also send them
upstream to the maintainer of the essay/translation.

- *the costs of duplicated work tend to scale **sub-qadratically**
with team size*
  
  - → *the costs of duplicated work tend to scale
**sub-quadratically** with team size*

Anything that is not clearly in error should be left as is.

## Sentence Numbering

- The original English text has been numbered in intervals of 10,
starting from 1010. There are 769 sentences.

<!-- -->


    [1010] +The Cathedral and the Bazaar
    ...
    [8690] Finally, Linus Torvalds's comments were helpful and his early endorsement very encouraging.

- Translated text should be aligned with the English, but does not
have to have the same number.
- If the sentence is a one-to-one mapping, then please mark the
English (source) sentence as a comment

<!-- -->


    ;; [1010] +The Cathedral and the Bazaar
    [10] +伽藍 と バザール ;; en/1010

The commented out English sentence is just there to aid the translator
and to help non-native speakers who are interested in your language
follow it.

The **en/1010** is there so that we can produce texts aligned between
different languages. We should be able to align each language with
English (e.g. in this case ja/10 with en/1010), and then use English as
a pivot to align other languages. Note that this will appear in the item
file as a comment.

- If the mapping is not one to one, then please don't add the number
in the comment.

<!-- -->


    ;; [1290] Chance handed me a perfect way to test my theory, in the form of an open-source project that I could consciously try to run in the bazaar style.
    [290] そしてその頃まったくの偶然から、自分の理論を試してみる完璧な機会がやってきた。
    [300] 意識的にバザール方式で運営できるようなフリーソフトプロジェクトという形で。

- or even:

<!-- -->


    ;;[1480] So I went out on the Internet and found one.
    ;;[1490] Actually, I found three or four.
    [500] そこでネットで探してみると、3 つか 4 つ見つかった。

Having many misaligned sentences makes cross language comparison just
that much harder, ...

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/MatrixMrsCatb/_edit)]{% endraw %}