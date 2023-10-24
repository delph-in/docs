{% raw %}The ***Linguistic Type Database*** processes grammars and treebanks to
make online documentation for grammars made with the [LKB](https://delph-in.github.io/docs/tools/LkbTop).

The code and documentation can mainly be found on github:
<https://github.com/fcbond/ltdb>

The **Linguistic Type Database** (LTDB, née Lextype DB), describes
instances and types of the grammar with frequency information from the
treebank if it exists.

Contents

1. [Sample In Line Documentation](https://delph-in.github.io/docs/garage/LkbLtdb#Sample_In_Line_Documentation)
   1. [Examples](https://delph-in.github.io/docs/garage/LkbLtdb#Examples)
   2. [Names](https://delph-in.github.io/docs/garage/LkbLtdb#Names)
2. [Integration with FFTB and
delphin-viz](https://delph-in.github.io/docs/garage/LkbLtdb#Integration_with_FFTB_and_delphin-viz)
3. [Installation](https://delph-in.github.io/docs/garage/LkbLtdb#Installation)
   1. [Setting up your server](https://delph-in.github.io/docs/garage/LkbLtdb#Setting_up_your_server)
   2. [Tool Support](https://delph-in.github.io/docs/garage/LkbLtdb#Tool_Support)
4. [References](https://delph-in.github.io/docs/garage/LkbLtdb#References)
5. [To Do](https://delph-in.github.io/docs/garage/LkbLtdb#To_Do)

The minimal Linguistic Type Database offers the following:

- a web interface to types and instances (rules, lexical items and
roots)q in a DELPH-IN grammar, including examples from the lexicon.
- in-line documentation from the tdl file (if any)
  - human readable name (if any)
  - description (in Restructured text)
  - example sentences (positive and negative)
- links to treebanks
  - words, rules and lexical types in context
  - grammar rules (including number of children (**arity**) and
position of head (**head**))
  - adds the information from the [Grammar Catalogue
Metadata](/GrammarCatalogue#GeneratingMetadata)
- approximate match for type lookup
- dependency on [PyDelphin](https://github.com/delph-in/pydelphin)

The LTDB has been updated by Francis Bond, Luis Morgado da Costa and
Michael Wayne Goodman, using
[PyDelphin](https://github.com/delph-in/pydelphin) and visualization
from [delphin-viz](https://github.com/delph-in/delphin-viz). The
software was originally written by ChikaraHashimoto
and FrancisBond in perl, and used the html output
provided by StephanOepen.

## Sample In Line Documentation

    n_-_c_le := n_intr_lex_entry
    """
    Intransitive count noun (icn)
    <ex>The dog barked.
    """.
    
    case-p-lex-np-kara := case-p-lex-np &
    """
    <name lang='ja'>承名詞受身主格助詞</name>
    名詞の直後について、受身文の主格（実際にその行為を行うもの）を表す助詞「から」。
    <ex>子供 が 親 から たしなめ られる
    <ex>親戚 から 怒ら れる
    <nex>友人 から 自転車 を 買う
    (07-03-30)間接受身でも使えるようにすべき。(lkb::do-parse-tty "親戚 から 怒ら れる")
    (07-03-30)「〜」はこの type でよいのか？（格として取ることがないため）
    (07-03-30) postp-lex の後につく type も必要。(lkb::do-parse-tty "子供 が 親 とか から たしなめ られる")
    """
                            [SYNSEM.LOCAL.CAT.HEAD.CASE kara-case].

Comments should appear inside the TDL doc-strings. They should
be written in
[reStructuredText](http://docutils.sourceforge.net/rst.html). There are
two special things recognized.

### Examples

    <ex>A good example of this type
    <nex>A bad example of this type
    <mex>A good example of this type, but which is ungrammatical, which we parse through robust or mal-rules or constructions.

Ideally parses of positive examples should contain the type in question,
while parses of negative examples should not (although they may be
grammatical under other circumstances). It is assumed the the example is
finished by a newline. We show both &lt;nex&gt; with an asterisk (∗) and
&lt;mex&gt; with a circled asterisk (⊛) in the human readable
documentation. Neither is accompanied by an Obelisk.

### Names

    case-p-lex-np-ga := case-p-lex-np &
    """<name lang='ja'>承名詞主格助詞
    名詞の直後について、主格を表す助詞「が」。この type によってその名詞は各種用言・助動詞
    の主語(ARG1)となることができる。受動態・可能態では、見た目は主格だが、
    実際の行為の目的格(ARG2)となる。
    <ex>犬 が 走る
    <ex>バナナ が 猿 に 食べ られる
    <ex>犬 に 芸 が できる か
    <nex>彼 は 帰っ た が
    """
                            [SYNSEM.LOCAL.CAT.HEAD.CASE ga].

It is assumed that the name is finished by a newline.

## Integration with FFTB and delphin-viz

If you shift-click on a rule or lexical entry in the [Full Forest
TreeBanker](https://delph-in.github.io/docs/tools/FftbTop)'s unary rules it will take you to the ltdb defined
in assets/render.js:

    var ltdburl = "https://lr.soh.ntu.edu.sg/~bond/cgi-bin/ERG_mo/search.cgi?typ="

## Installation

The code can be found on github: <https://github.com/fcbond/ltdb>

### Flask branch installation instructions (use this unless you know what you are doing)

- Checkout the flask branch and switch to it
- Run `./deploy.sh`
- Check that the database works: copy the local address from the terminal output and open it in the browser (Firefox recommended). You should be able to then use the ERG and the PorGram databases which come with the repository.
- Move any treebanks you would like to include under `your/grammar/tsdb/gold/`
- If you want to build your own database: create a virtual environment, activate it, and install `pydelphin`
- Build your database: navigate to `scripts` and run `python3 grm2db.py your/grammar/METADATA` (you should have a `METADATA file`; model it on the PorGram one, for example)
- The database gets saved under `/tmp/some-temporary-filename`. You should copy or move it from there to `web/db/` (where the other grammars are).
- Now if you refresh your browser window, you should be able to see your database under the options.

### Main branch installation instructions (may be outdated?..)

There is a README file that describes how to build the database. The
code makes certain assumptions:

- gold trees are under tsdb/gold

### Setting up your server

To enable CGI in user directories, add the following lines to the
appropriate Apache configuration file. That could be
/etc/apache2/httpd.conf, or more correctly, the appropriate file in
/etc/apache2/site-enabled/.

    <Directory /home/*/public_html/cgi-bin/>
       Options ExecCGI
       SetHandler cgi-script
    </Directory>

### Tool Support

As of 2018-11-4, docstrings are supported by the latest
[LKB-FOS](https://delph-in.github.io/docs/tools/LkbFos) and PyDelphin, PET and ACE, with support
in the LOGON LKB promised soon.

Currently, the LKB does NOT support doc-strings in instances (such as
rules, roots and lexical entries) only in types. LTDB and ACE supports
these, but recommends you wait for the LKB to support them.

## References

- Chikara Hashimoto, Francis Bond, and Dan Flickinger (2007)
  - *[The lextype DB: A web-based framework for collaborative
multilingual grammar and treebank
development](http://www2.nict.go.jp/x/x161/en/member/bond/pubs/2007-IWIC-lextypedb.pdf)*.
In The First International Workshop on Intercultural
Collaboration (IWIC-2007), pages 44–58, Kyoto.
  
  Chikara Hashimoto, Francis Bond, and Melanie Siegel (2007)
  - *[Semi-automatic documentation of an implemented linguistic
grammar augmented with a
treebank](http://www2.nict.go.jp/x/x161/en/member/bond/pubs/2007-LRE-lextypedb.pdf)*.
Language Resources and Evaluation. (Special issue on Asian
language technology)
  
  Chikara Hashimoto, Francis Bond, Takaaki Tanaka, and Melanie
Siegel (2005)
  - *[Integration of a lexical type database with a linguistically
interpreted
corpus](http://www2.nict.go.jp/x/x161/en/member/bond/pubs/2005-linc-lextypedb.pdf)*.
In 6th International Workshop on Linguistically Interpreted
Corpora (LINC-2005), 31--40, Cheju, Korea.

## To Do

- finish the documentation
  - add screenshots
  - link to some running Lexical Type Databases (like
[this](https://delph-in.github.io/docs/grammars/JacyLexTypes))

Last update: 2023-10-23 by Olga Zamaraeva [[edit](https://github.com/delph-in/docs/wiki/LkbLtdb/_edit)]{% endraw %}