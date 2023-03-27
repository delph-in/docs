{% raw %}# Background

Work in progress: definition of the Grammar Markup Language (GML). The
current official version is GML 1.0 (see below).

# General Syntax

To not steal 'common' characters, GML utilizes three graphic characters,
the left and right floor symbols and the broken vertical bar. The left
and right delimiters always need to be paired with a one-character
‘element’ name, e.g. ‘/’ for italics. To not only allow nesting but
partially overlapping spans (as we expect might be seen in HTML or LaTeX
sources, for example), there is both an opening and matching closing
tag; both carry their name, e.g

      ⌊/text/⌋

These can be embedded in GML text, using the following escape
conventions

      ⌊⌋⌋
      ⌊⌊⌋
      ⌊¦⌋

These conventions mean that there cannot be empty tags, nor can there be
no content between the opening or closing bracket (⌊ and ⌋) and the
separator (¦).

What about self closing tags (for instance images)? The following should
work okay:

      ⌊✎⌋?

# (Outdated) List of Element Types (in GML 0.9)

|                                        |                                                                     |                                                                                                       |                                                                                                |
|----------------------------------------|---------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------|
| **Name**                               | **GML markup**                                                      | **Comment**                                                                                           | **Mediawiki markup**                                                                           |
| Document                               | ⌊document¦title¦document⌋                                           | root node                                                                                             |                                                                                                |
| Heading                                | ⌊=¦text¦=⌋                                                          | level attribute                                                                                       | = level1 =, == level2 ==, ... or &lt;h1&gt;level1&lt;/h1&gt;, &lt;h2&gt;level2&lt;/h2&gt;, ... |
| Link                                   | ⌊&gt;¦text¦&gt;⌋                                                    | do we need different types? optional target attribute?                                                | \[\[target\|text\]\], &lt;a&gt;text&lt;/a&gt;, or a URL                                        |
| Template                               | ⌊x¦text¦template-name¦par1¦par2¦x⌋                                  |                                                                                                       | {{name\|arg1\|arg2}}                                                                           |
| Source code                            | ⌊ƒ¦text¦ƒ⌋                                                          |                                                                                                       | &lt;code&gt;public static void main&lt;/code&gt;                                               |
| List                                   | ⌊1¦⌊\#¦item1¦\#⌋⌊\#¦item2¦\#⌋¦1⌋ and ⌊•¦⌊\#¦foo¦\#⌋⌊\#¦bar¦\#⌋¦•⌋ ? | numbered and unnumbered; do we need parameters?                                                       | &lt;ul&gt;...&lt;/ul&gt; or &lt;ol&gt;...&lt;/ol&gt;                                           |
| List item                              | ⌊\#¦item¦\#⌋                                                        |                                                                                                       | &lt;li&gt;item&lt;/li&gt; or \# item or \* item                                                |
| Bold                                   | ⌊\*¦text¦\*⌋                                                        |                                                                                                       | &lt;b&gt;text&lt;/b&gt;, '''text''', &lt;strong&gt;text&lt;/strong&gt;                         |
| Strike through                         | ⌊-¦text¦-⌋                                                          |                                                                                                       | &lt;del&gt;text&lt;/del&gt;, &lt;strike&gt;text&lt;/strike&gt;                                 |
| Tele-typed                             | ⌊t¦text¦t⌋                                                          |                                                                                                       | &lt;tt&gt;text&lt;/tt&gt;                                                                      |
| Quote                                  | ⌊"¦text¦"⌋                                                          |                                                                                                       | &lt;blockqute&gt;text&lt;/blockquote&gt;                                                       |
| Abbreviation                           | ⌊.¦text¦extended term¦.⌋                                            |                                                                                                       | &lt;abbr title="extended term"&gt;text&lt;/abbr&gt;                                            |
| Italics                                | ⌊/¦text¦/⌋                                                          |                                                                                                       | &lt;i&gt;text&lt;/i&gt; ''text''                                                               |
| Underline                              | ⌊\_¦text¦\_⌋                                                        |                                                                                                       | &lt;u&gt;text&lt;/u&gt; or &lt;ins&gt;text&lt;/ins&gt;                                         |
| Superscript                            | ⌊^¦text¦^⌋                                                          |                                                                                                       | &lt;sup&gt;text&lt;/sup&gt;                                                                    |
| Subscript                              | ⌊,¦text¦,⌋                                                          |                                                                                                       | &lt;sub&gt;text&lt;/sub&gt;                                                                    |
| Small text                             | ⌊↓¦text¦↓⌋ ?                                                        |                                                                                                       | &lt;small&gt;text&lt;/small&gt;                                                                |
| Big text                               | ⌊↑¦text¦↑⌋ ?                                                        |                                                                                                       | &lt;big&gt;text&lt;/big&gt;                                                                    |
| Paragraph                              | ⌊p¦text¦p⌋                                                          | &lt;p&gt;text&lt;/p&gt; or double newline                                                             |                                                                                                |
| Definiton term                         | ⌊:¦term¦:⌋                                                          | The term is not obligatory in mediawiki, the definition-description (:) is often used to indent text. | ;term or &lt;dt&gt;term&lt;/dt&gt;                                                             |
| Definition Description (indented text) | ⌊⇥¦description¦⇥⌋                                                   |                                                                                                       | :description                                                                                   |
| Variable                               | ⌊ƒ¦text¦ƒ⌋                                                          | Merge with source code ?                                                                              | &lt;var&gt;text&lt;/var&gt;                                                                    |
| Math                                   | ⌊ƒ¦text¦ƒ⌋                                                          | Merge with source code ?                                                                              | &lt;math&gt;LaTeX&lt;/math&gt;                                                                 |
| Citation                               | ⌊'¦text¦'⌋                                                          |                                                                                                       | &lt;cite&gt;text&lt;/cite&gt;                                                                  |
| Image                                  | ⌊i⌋                                                                 | what about captions?                                                                                  | \[\[File:image.jpg\]\]                                                                         |
| Preformatted text                      | ⌊pre¦text¦pre⌋                                                      |                                                                                                       | &lt;pre&gt;text&lt;/pre&gt;, &lt;poem&gt;text&lt;/poem&gt; or a line starting with whitespace  |
| Div                                    | ⌊p¦text¦p⌋                                                          | Merge with Paragraph?                                                                                 | &lt;div&gt;text&lt;/div&gt;                                                                    |

[List of mediawiki markup](http://folk.uio.no/larsjsol/elements.ods)

For tags observed in collected html, see in
[WeSearch/DataCollection](https://delph-in.github.io/docs/garage/WeSearch_DataCollection) (the only elements I
can see are missing are those related to tables - which won't be
included as they're outside of the scope of linguistic relevance?
([XHTML spec](http://www.w3schools.com/tags/default.asp).)

# Towards GML 1.0

One-letter element name (preferably staying away form ‘regular’ ASCII
characters, except where following established conventions, e.g. ⌊/ ...
/⌋); One committee member is concerned about scalability (seeing the
limited range of available characters in Unicode). No need for middle
delimiter following or preceding element names, except in conjunction
with attributes (which stick to the closing tag).

paragraph and sentence boundaries are not marked up using GML elements,
but rather through single (sentence boundary) and double newlines
(pargraph), somewhat like in LaTeX (if you will).

Redefined elements:

- bold ∗
- document δ
- paragraph ¶ (not used)
- math ×
- code ◊ (including var)
- teletype τ
- abbreviation µ
- cite ⌊&lt;Solberg, 2012&lt;⌋
- pre π
- img ✎
- template λ
- linebreak ⌊↵⌋ (not used)

|                                        |                                           |                                                                                                       |                                                                                                           |
|----------------------------------------|-------------------------------------------|-------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| **Name**                               | **GML markup**                            | **Comment**                                                                                           | **Mediawiki markup**                                                                                      |
| Document                               | ⌊δtitleδ⌋                                 | root node                                                                                             |                                                                                                           |
| Heading                                | ⌊=text¦2=⌋                                | level attribute                                                                                       | = level1 =, == level2 ==, ... or &lt;h1&gt;level1&lt;/h1&gt;, &lt;h2&gt;level2&lt;/h2&gt;, ...            |
| Link                                   | ⌊&gt;text&gt;⌋                            |                                                                                                       | \[\[target\|text\]\], &lt;a&gt;text&lt;/a&gt;, or a URL                                                   |
| Template                               | ⌊λexpanded-text¦par1¦par2¦template-nameλ⌋ |                                                                                                       | {{template-name\|par1\|par2}}                                                                             |
| Source code                            | ⌊◊text◊⌋                                  |                                                                                                       | &lt;code&gt;public static void main&lt;/code&gt; or &lt;var&gt;n&lt;/var&gt; &lt;kbd&gt;ls -l&lt;/kbd&gt; |
| Numbered List                          | ⌊➊⌊\#item1\#⌋⌊\#item2\#⌋➊⌋                |                                                                                                       | &lt;ol&gt;...&lt;/ol&gt;                                                                                  |
| Unnumbered list                        | ⌊•⌊\#foo\#⌋⌊\#bar\#⌋•⌋                    |                                                                                                       | &lt;ul&gt;...&lt;/ul&gt;                                                                                  |
| List item                              | ⌊\#item\#⌋                                |                                                                                                       | &lt;li&gt;item&lt;/li&gt; or \# item (numbered) or \* item (unnumbered)                                   |
| Bold                                   | ⌊∗text∗⌋                                  |                                                                                                       | &lt;b&gt;text&lt;/b&gt;, '''text''', &lt;strong&gt;text&lt;/strong&gt;                                    |
| Strike through                         | ⌊-text-⌋                                  |                                                                                                       | &lt;del&gt;text&lt;/del&gt;, &lt;strike&gt;text&lt;/strike&gt;                                            |
| Tele-typed                             | ⌊τtextτ⌋                                  |                                                                                                       | &lt;tt&gt;text&lt;/tt&gt;                                                                                 |
| Quote                                  | ⌊"text"⌋                                  |                                                                                                       | &lt;blockqute&gt;text&lt;/blockquote&gt;                                                                  |
| Abbreviation                           | ⌊µtext¦extended term (optional)µ⌋         |                                                                                                       | &lt;abbr title="extended term"&gt;text&lt;/abbr&gt; or &lt;acronym&gt;WDC&lt;/acronym&gt;                 |
| Italics                                | ⌊/text/⌋                                  |                                                                                                       | &lt;i&gt;text&lt;/i&gt; ''text''                                                                          |
| Underline                              | ⌊\_text\_⌋                                |                                                                                                       | &lt;u&gt;text&lt;/u&gt; or &lt;ins&gt;text&lt;/ins&gt;                                                    |
| Superscript                            | ⌊^text^⌋                                  |                                                                                                       | &lt;sup&gt;text&lt;/sup&gt;                                                                               |
| Subscript                              | ⌊,text,⌋                                  |                                                                                                       | &lt;sub&gt;text&lt;/sub&gt;                                                                               |
| Small text                             | ⌊↓text↓⌋                                  |                                                                                                       | &lt;small&gt;text&lt;/small&gt;                                                                           |
| Big text                               | ⌊↑text↑⌋                                  |                                                                                                       | &lt;big&gt;text&lt;/big&gt;                                                                               |
| Definiton term                         | ⌊:term:⌋                                  | The term is not obligatory in mediawiki, the definition-description (:) is often used to indent text. | ;term or &lt;dt&gt;term&lt;/dt&gt;                                                                        |
| Definition Description (indented text) | ⌊⇥description⇥⌋                           |                                                                                                       | :description                                                                                              |
| Math                                   | ⌊×text×⌋                                  |                                                                                                       | &lt;math&gt;LaTeX&lt;/math&gt;                                                                            |
| Citation                               | ⌊&lt;text&lt;⌋                            |                                                                                                       | &lt;cite&gt;text&lt;/cite&gt;                                                                             |
| Image                                  | ⌊✎⌋                                       |                                                                                                       | \[\[File:image.jpg\]\]                                                                                    |
| Preformatted text                      | ⌊πtextπ⌋                                  |                                                                                                       | &lt;pre&gt;text&lt;/pre&gt;, &lt;poem&gt;text&lt;/poem&gt; or a line starting with whitespace             |

# Revision History

GML has evolved through three revisions so far (as of February 2013): A
first and incomplete version 0.1 was presented in Ytrestøl et al.
(2010); a greatly extended version was developed in [Solberg
(2012)](https://www.duo.uio.no/handle/10852/34914), and shortly after
moderately refined (for increased readability) as the current version
1.0 (documented above).

Last update: 2020-07-16 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/ErgGml/_edit)]{% endraw %}