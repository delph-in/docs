{% raw %}# Tuning parameters to make the ERG and ACE parse the way you want them to

This page lists some of the most useful knobs that can be used to adjust
[ACE](https://delph-in.github.io/docs/tools/AceTop)'s processing, and gives suggestions for how to set them
for different use cases, especially with the [ERG](https://delph-in.github.io/docs/erg/ErgTop).

The three competing desiderata of precision, robustness and efficiency
each demand some sacrifices from the other two. The primary control
levels are:

|                          |             |                                                                                                                 |
|--------------------------|-------------|-----------------------------------------------------------------------------------------------------------------|
| **Parameter**            | **Default** | **Description**                                                                                                 |
| --timeout=X              | none        | Number of seconds to try a given input before giving up.                                                        |
| --max-chart-megabytes=X  | 1200        | Number of megabytes of RAM to expend on building a forest before giving up.                                     |
| --max-unpack-megabytes=X | 1500        | Number of megabytes of RAM to expend on unpacking a forest before giving up, including RAM spend on the forest. |
| --ubertagging=X          | none        | Enables UT. Lexical hypotheses of probability lower than X are discarded.                                       |
| --pcfg=X                 | none        | Enables PCFG-guided robustness. X is the path to a PCFG model.                                                  |

## Precision

Maximize resource limits, avoid ubertagging and robustness measures. The
default settings are good as long as inputs are not too long. For
complex data, try increasing the RAM limits. To avoid receiving
low-ranked results from partially complete forests, make the chart and
unpack megabytes identical. For example:

- ace ... --max-chart-megabytes=8000 --max-unpack-megabytes=8000

## Robustness

Maximize resource limits, setting the unpack megabytes somewhat higher
than the chart megabytes.

- ace ... --max-chart-megabytes=8000 --max-unpack-megabytes=8500

Consider enabling PCFG-based guidance.

- ace ... --pcfg=..../erg-2018/etc/all-treebanks-gp0-2018.pcfg
  - OR
  
  gunzip ..../erg-2018/etc/ww-gp2-2018.pcfg.gz ace ...
--pcfg=..../erg-2018/etc/ww-gp2-2018.pcfg

If resources are not unlimited, enable UT. A threshold of 0.00001
typically doesn't sacrifice too much coverage or precision but reduces
resource consumption considerably.

- ace ... --ut=0.00001

The above measures can be used separately or in combination. See below
for a discussion of additional strategies.

## Efficiency

Set aggressive resource limits and a higher UT threshold. If PCFG
guidance is used, use the smaller (all-treebanks-gp0-2018.pcfg) model.

- ace ... --ut=0.01 --timeout=10
  - OR
  
  ace ... --ut=0.01 --timeout=10
--pcfg=..../erg-2018/etc/all-treebanks-gp0-2018.pcfg

## Additional Robustness Measures

There are a few additional techniques available for increasing coverage
at the expense of efficiency and precision. These may be of use to some
users.

#### Mal-rules

Compile the grammar using erg-2018/ace/config-educ.tdl instead of
erg-2018/ace/config.tdl. This enables a collection of additional rules
which allow the grammar to natively analyse a variety of mildly
ungrammatical structures such as subject-verb number mismatch and
missing determiners.

- ace -G erg-2018.dat -g ..../erg-2018/ace/config-educ.tdl

Last update: 2022-08-23 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/AceErgTuning/_edit)]{% endraw %}