{% raw %}# Overview

As is documented in the LOGON EAMT 2005 article (Oepen, et al., 2005),
batch fan-out is a central facility in development, regression testing,
and end-to-end evaluation. Internally, batch fan-out mode deploys \[incr
tsdb()\] facilities in a layered fashion, i.e. the top layer is
comprised of one or more \[incr tsdb()\] clients that perform
translation, and each client internally uses \[incr tsdb()\] to
decompose itself into the trinity of parsing, transfer, and generation.
\[incr tsdb()\] failure detection and roll-over apply at both layers,
i.e. as a component terminates unexpectedly, it will be automatically
restarted. Depending on the value of the \[incr tsdb()\] parameter
\*process-client-retries\* (default: 0), the item that caused failure
may or may not be re-scheduled for processing, until the maximum number
of retries is exhausted. Likewise, all standard \[incr tsdb()\] options
for distributed and parallel processing apply to bach fan-out.

In the standard LOGON set-up, the \[incr tsdb()\] cpu definition that
instantiates the top-level Norwegian–English translation client is
termed :logon. Thus, a command like

      (tsdb:tsdb :cpu :logon :file t)

will create the four interconnected processes needed for batch
translation, i.e. one parsing, transfer, and generation client each,
plus the top-level controller. Once loaded, the client will register
itself; e.g.

      wait-for-clients(): `ps.titan.uio.no' registered as tid <40044> [1:40].

In order to run batch fan-out from the \[incr tsdb()\] podium, toggle
*Process \| Switches* to *Translation* and then execute one of the
processing commands, e.g. *Process \| All Items*. Fan-out depth, in this
mode, is controlled by the value of *Process \| Variables \| Analyses
Limit*, where a value of, say, 20 would restrict fan-out at each level
to at most twenty hypotheses that are pursued in downstream processing
(see the --limit command line option to the batch script).

A streamlined way of running \[incr tsdb()\] batch fan-out is by means
of the LOGON batch script. The script resides in the top-level LOGON
directory $LOGONROOT and is invoked from a command shell, e.g.

      $LOGONROOT/batch vei

The fan-out batch script requires a functional LOGON installation (see
separate instructions: [LogonInstallation](https://delph-in.github.io/docs/tools/LogonInstallation)) and will
first load up the \[incr tsdb()\] environment and then configure one or
more translation clients. As a result of running the batch script, a new
\[incr tsdb()\] profile will be stored in the \[incr tsdb()\] profile
repository, and a fan-out log file will be generated in the user home
directory. For the example command above, the profile will be called
logon/vei/05-09-26 (assuming the current date was 26-sep-05), with its
corresponding log file logon.vei.05-09-26.fan.

As of LOGON 0.5 (knut), the default behaviour of the batch script
changed slightly: as batch is using \[incr tsdb()\] facilities
internally, it assumes that by default the intention is to process an
\[incr tsdb()\] skeleton. Thus, the command in the above example will
operate on the *vei* skeleton (for which there is no ASCII fan-out input
file, actually). To obtain the alternate way of provding input to the
batch script, viz. process an input file in textual fan-out input format
(see below), do the following:

      $LOGONROOT/batch --ascii $LOGONROOT/ntnu/data/mrs.txt

There will be more to say on the batch script, but a few (new) options
may be relevant immediately: --count *n* will parallelize processing and
start-up *n* full instantiations of the LOGON pipeline; --limit *n* will
prune the fan-out space to at most *n* alternatives that, at each stage
(i.e post-analysis and -transfer) get passed on downstream; and --suffix
*string* will append *suffix* to the name for the newly created profile,
e.g. when more than one run per day needs to be recorded. There actually
is a default value for the --limit option of (currently) 5. Thus, in
order to get full fan-out (if you really think you have the cpu cycles
:-), use --limit 0. As of March 2006, the --count option is disabled due
to issues in robust client restarts with parallelization (LOGON PR
itsdb/323).

Note that option processing to the batch script is not very robust;
hence, please make sure you get the option syntax exactly right.

# Fan-Out Textual Input

When using the --ascii option to the LOGON batch script or the \[incr
tsdb()\] *File \| Import \| Bi-Text Items* command, processing will
first construct the target profile from a textual fan-out input file,
essentially a sentence-aligned bi-text.

Following is a sample input file to the batch script in --ascii mode:

      Vi skal møte Ask på mandag.
      Vi shall meet Abrams on Monday.
      We should meet Abrams on Monday.
    
      Ta båt til Ortnevik.
      Take the boat to Ortnevik.
      Take a boat to Ortnevik.
    
      Tar du båten til Ortnevik, kan du gå stien samme dagen.
      If you take the boat to Ortnevik, you can walk the path the same day.
      If you take the boat to Ortnevik, you can walk the path on the same day.

The file format is a sequence of blocks; each block has the Norwegian
input on the first line, followed by zero or more lines with reference
translations. Blocks are separated from each other by two consecutive
newlines. Since we are running this on Unix, it is important to produce
Unix-style linebreaks, i.e. either create the file in a Unix environment
itself or make sure the linebreaks are ^L (linefeed) and not ^M
(carriage return). The character encoding of ASCII fan-out input files
needs to match the default coding system of the translation system; for
all current configurations, this is UTF-8. Incidentally, LOGON should
obtain reasonable coverage on the above sample file and stellar BLEU
scores.

# Fan-Out Log File Format

Running the batch script, whether in --ascii or default mode will create
a fan-out log file, providing detailed information about processing
results. For each of the Norwegian sentences from the input file, there
will be one block of lines like these:

      [14:24:29] (10) |Vi skal møte Ask på mandag.| --- 8 (2.45|0.00:2.41 s) <:> () [0].
      |
      |-[3.28] # 0 {0.09} --- 2 (0.06|0.00:0.00 s) <:14> (832.9K 22.6M = 23.4M) [0].
      | |
      | |-[7.28] # 0 {-2583.76} --- 1 (0.88|0.00:0.88 s) <83:1194> {3674:1155} (7.1M 553.0M = 560.1M) [0].
      | |   |We should meet Abrams on Monday.| {-53.87|-55.97|0.00|-4.60|-4.44} <1.00>
      | |
      | |-[8.16] # 1 {-2696.24} --- 1 (0.79|0.00:0.79 s) <83:1194> {3674:1155} (6.5M 505.7M = 512.2M) [0].
      | |   |We must meet Abrams on Monday.| {-53.34|-56.58|0.00|-5.45|-5.36} <0.49>
      |
      |-[8.31] # 1 {0.04} --- 2 (0.06|0.00:0.00 s) <:14> (815.2K 22.4M = 23.2M) [0].
      | |
      | |-[10.32] # 0 {-2583.76} --- 1 (0.78|0.00:0.78 s) <83:1194> {3674:1155} (6.5M 711.0M = 717.6M) [0].
      | |   |We should meet Abrams on Monday.| {-53.87|-55.97|0.00|-4.60|-4.44} <1.00>
      | |
      | |-[11.13] # 1 {-2696.24} --- 1 (0.79|0.00:0.78 s) <83:1194> {3674:1155} (6.5M 720.0M = 726.5M) [0].
      | |   |We must meet Abrams on Monday.| {-53.34|-56.58|0.00|-5.45|-5.36} <0.49>
      |
      |-[11.21] # 2 {0.00} --- 1 (0.04|0.00:0.00 s) <:10> (582.4K 15.2M = 15.8M) [0].
      | |
      | |-[13.21] # 0 {-2583.76} --- 1 (0.78|0.00:0.78 s) <83:1194> {3674:1155} (6.5M 720.3M = 726.8M) [0].
      | |   |We should meet Abrams on Monday.| {-53.87|-55.97|0.00|-4.60|-4.44} <1.00>
      |
      |-[13.31] # 3 {-0.04} --- 2 (0.06|0.00:0.00 s) <:14> (819.5K 22.6M = 23.4M) [0].
      | |
      | |-[13.86] # 0 {-2523.60} --- 1 (0.53|0.00:0.52 s) <75:708> {2151:692} (5.1M 461.1M = 466.3M) [0].
      | |   |We should meet Abrams on Monday.| {-53.87|-57.16|1.60|-4.60|-4.44} <1.00>
      | |
      | |-[14.69] # 1 {-2633.46} --- 1 (0.52|0.00:0.51 s) <75:708> {2151:692} (5.1M 460.8M = 466.0M) [0].
      | |   |We must meet Abrams on Monday.| {-53.34|-57.90|1.60|-5.45|-5.36} <0.49>
      |
      |-[14.77] # 4 {-0.05} --- 1 (0.03|0.00:0.00 s) <:10> (580.8K 15.2M = 15.7M) [0].
      | |
      | |-[16.77] # 0 {-2583.76} --- 1 (0.79|0.00:0.79 s) <83:1194> {3674:1155} (6.5M 720.3M = 726.8M) [0].
      | |   |We should meet Abrams on Monday.| {-53.87|-55.97|0.00|-4.60|-4.44} <1.00>
      |
      |< |Vi skal møte Ask på mandag.| (10) --- 8 x 8 x 8 = 2 [8]
      |@ |We should meet Abrams on Monday.|
      |@ |Vi shall meet Abrams on Monday.|
      |> |We should meet Abrams on Monday.| {0.62} <1.00> (0:0:0).
      |> |We must meet Abrams on Monday.| {0.55} <0.49> (0:1:0).
      |= 1:0 of 1 {100.0+0.0}; 1:0 of 1:0 {100.0 0.0}; 1:0 of 1:0 {100.0 0.0} @ 1 of 1 {100.0} <1.00 1.00|1.00 1.00>.

The first line is the input sentence, followed by three hyphens (---)
and the number of readings returned by the analysis grammar. The
remaining numbers on that line are timing and memory measures; see the
\[incr tsdb()\] manual. Subsequent lines show results from running each
output, in turn, through downstream components, using tree-like
\`branch' lines and indentation to indicate the flow of control. The
third line states that the first parsing output (\# 0) had 2 transfer
outputs, of which (in turn) the first gave rise to one generator output.
Upon successfull completion of generation, all realizations are
presented, one per line, each followed by various probabilistic scores
and, where applicable, a sentence-level BLEU score against the reference
translation(s). For each new branch, the initial number in square
brackets is the elapsed real time since the start of translating this
sentence, i.e. at time \[8.31\] we started transfer for the second (of a
total of eight) parsing results.

Once all combinatorics has been explored for one input, there follows a
block of summary lines. The first (prefixed by \|&lt; repeats the
Norwegian input string, followed by two numbers (2 \[8\] in this case):
there were a total of 8 translations output from all branches, of which
2 are actually distinct strings. Next, prefixed by \`\|@' follow(s) the
reference translation(s); note that it is legitimate to use the \`batch'
script without reference translations, in which case this block in the
fan-out log file will be supressed. Next follow, one per line, the
various unique translation candidates, ordered by their combined,
end-to-end re-ranker score; each such candidate is followed by its
combined score (in braces), sentence-level BLEU score (in angle
brackets), and (in parentheses) an index into the branching process in
terms of parse, transfer, and realization output identifiers. Finally,
the last line in the example above (prefixed by \|=) is a running,
accumulated coverage summary on the current input file:

      |= 1:0 of 1 {100.0+0.0}; 1:0 of 1:0 {100.0 0.0}; 1:0 of 1:0 {100.0 0.0} @ 1 of 1 {100.0} <1.00 1.00|1.00 1.00>.

All *i*:*j* pairs of numbers are in terms of full vs. fragmented
analyses, i.e. at this point (translating item \# 1 from *sample.txt*),
there were 1 full and 0 fragmented parser outputs for an analysis
coverage of 100%. following are transfer and generation coverage, each
relative to the number of available inputs (full or fragmented) to that
component. The final number, following the @ sign, is accumulated
end-to-end coverage, aka (in some sense) the product of the three
individual coverage numbers, or, in other words, the number of inputs
that went all the way through the system successfully.

# BLEU Scores

The BLEU scoring script is integrated in the fan-out batch script (and
in CVS). In the fan-out log, BLEU scores are printed in angle brackets,
e.g.

      |We must meet Abrams on Monday.| {-53.34|-56.58|0.00|-5.45|-5.36} <0.49>

Additionally, the running summary lines include the average
document-level BLEU score, once averaged over all inputs, once averaged
over only those for which the system produced one or more outputs, e.g.

      |= 3:0 of 3 {100.0+0.0}; 3:0 of 3:0 {100.0 0.0}; 3:0 of 3:0 {100.0 0.0} @ 3 of 3 {100.0} <0.94 0.94|1.00 1.00>.

Here, the first pair of numbers is for the top-ranked system outputs,
i.e. taking into account the end-to-end re-ranker performance. As in our
sample session all three outputs succeed end-to-end (i.e. produce at
least one output), the document-level and output-level averages are
identical, 0.94 in this case. Finally, the second pair of BLEU scores
assumes an oracle ranker, i.e. for each input will score the output with
the maximal sentence-level BLEU value; in our current example, for all
three inputs there was at least one translation that exactly matched one
of the reference translations, hence the oracle BLEU averages are 1.0,
both when computed for the entire document and when averaged only for
inputs that actually succeeded (again, these were all in this tiny
example).

# Post-Processing of Output

The format used for printing candidate translations in fan-out log files
preserves some debugging information that is useful for analysis
purposes but should be eliminated when extracting translations for
evaluation, i.e. for the purpose of human judgments. Specifically,
output strings can include fragment boundaries (\|\|), omission marks
(...), and unknown word delimiters (/ ... /). For example:

      |> |Hallingskarvet and Finse || /1:50/ || 000| {0.88} <0.00> (0:0:0).

or

      |> |... || On || There may be a little chilly one || At this time of the year| {0.69} <0.00> (0:3:5).

Post-processing of system outputs amounts to removing these marks. The
LOGON tree includes a script to perform this task (and others). For
example, assuming the two sample outputs above occured in a fan-out log
file named logon.mark.07-11-18.fan, the following command can be used to
(a) extract translations with debug information stripped and (b)
suppress intermediate processing information, e.g. eliminate the
detailed presentation of each fan-out branch and only show the summary
lines:

      $LOGONROOT/summarize -o all logon.mark.07-11-18.fan

The result for the two examples assumed here will be:

      |> |Hallingskarvet and Finse 1:50 000| {0.88} <0.00> (0:0:0).

and

      |> |... On There may be a little chilly one At this time of the year| {0.69} <0.00> (0:3:5).

Note that, by default, the summarize script will only show results for
input blocks that actually succeeded in end-to-end translation. To ask
for outputs of all blocks, including those without any translations, add
the --all command-line option to the example invocation above. Finally,
note the all argument to the -o option in our example, which requests
that for each block all unique translations that were computed be
included in the summary. To limit output to only a subset of n-best
translations, replace all with the desired *n*, for example to only show
the top-ranked five translations for each input block (and to also
include blocks that failed), use:

      $LOGONROOT/summarize --all -o 5 logon.mark.07-11-18.fan

# Resource Consumption

The LOGON demonstrator is comprised of three heavy-duty components. The
parser, transfer component, and generator, each, will at times grow to
multiple gigabytes in process size. The system will likely fail
miserably when computing resources, specifically main memory, are
insufficient. The current (January 2007) release of the LOGON software
should run on sufficiently modern x86 Linux installations with either
32- or 64-bit kernels (always using 32-bit mode, though). A
site-specific Lisp license file is required (see the installation
instructions). We would recommend against running the system on machines
with less than, say, six gbytes of main memory. In order to use
parallelization of batch processing (e.g. using the --count switch to
the batch script), twelve or more gbytes of RAM and at least two cpus
should be available.

Last update: 2008-11-30 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/LogonProcessing_BatchTranslation/_edit)]{% endraw %}