{% raw %}Notes from [Galicia Summit](https://github.com/delph-in/docs/wiki/GaliciaSchedule) discussion of tuning a grammar to improve parsing efficiency.

Scribe: John

Dan: Presents his [slides](https://github.com/delph-in/docs/blob/main/summits/2023/Efficiency.pdf?raw=true). Also discusses use of the new LKB-FOS functions - outlined by John in his presentation on Monday - which display counts of chart entries in each cell, and print reasons for subsumption failure between two passive edges (meaning that they could not straightforwardly be packed). He also shows LUI parse chart for a short sentence, and interactively inspects a chart cell containing multiple applications of the same rule (abbreviated as HMSN) - which might indicate overgeneration.

Dan: It might be useful to have a tool that counts how many edges from e.g. HMSN occur in the chart. Or the number from each rule.

John: Also perhaps compare counts from parsing with packing to parsing without. 

Berthold: Or compare the distribution of rules counts for a suspicious sentence to the distribution over a whole corpus.

John: large numbers of active edges can also be a problem, as in a recent version of the SRG. In this case, many rules had the wrong daughter assigned as the 'key'.

Dan: How about a utility to parse a corpus repeatedly with each rule having its key daughter flipped in turn? And then choose the assignment for each rule with the smaller number of active edges.

Woodley: It would be enough to compare numbers of active edges between two runs with all key daughters flipped.

Berthold: There is an option in the Pet parser to switch rule daughter ordering between l-r and r-l that might be useful here. See -key=n in https://github.com/delph-in/docs/wiki/PetOptions (it might also be necessary to disable hyper-active parsing)

Petter: Generating from a parse then inspecting the generation chart can be informative.

Dan: In this case, the grammarian would parse a sentence that exhibits a particular phenomenon and then generate from one of the analyses. ACE has a powerful generation chart inspector, but it is somewhat difficult to control. The LKB generation chart display is less informative.

John: The discussion so far has used the term *overgeneration*; however, particularly in the context of generation, *overacceptance* is also an issue. With overgeneration, there are parses with the wrong structure (and therefore unwanted edges in the chart). With overacceptance, the generator outputs incorrect sentences (which also contain unwanted chart edges).

Dan: Although coverage of resource grammars such as the ERG is now quite impressive, performance is still an issue. The DELPH-IN parsers have improved a lot over the years, but most recent progress has been incremental. There have been no large jumps in speed since generalisation packing was added to ACE. It's time now for grammarians to take up the baton and refine their grammars so they can be processed more efficiently.

Woodley: It might be possible to make the parse chart more compact by packing edges with different spans. E.g. with the sentence "The cat chased the mouse under the table", "mouse" and "mouse under the table" could potentially be packed since they behave the same with respect to combination with "the" and "chased". Unfortunately, experiments with an implementation have not led to sigificant improvements in performance.

Last update: 2023-06-29 by John Carroll [[edit](https://github.com/delph-in/docs/wiki/GaliciaGrammarEfficiency/_edit)]{% endraw %}