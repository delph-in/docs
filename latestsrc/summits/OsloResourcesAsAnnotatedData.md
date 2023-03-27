{% raw %}Mike: Background - [NeuGen](/NeuGen) results for AMR which benefit from
paired training. Konstas & Goodman experimented with MRS and Redwoods,
adding accommodation of NER handling and compressed variable properties,
among other steps.

The MRS approach achieved higher BLEU score, but not directly
comparable: more MRS gold data, MRS compositional, MRS has no coref
resolution, parsing/generation much more closely constrained with MRS
than with AMR

Pitching DELPH-IN resources is more difficult, partly because the
metrics for evaluation are not designed for us, and because we lack full
robustness, etc, so we have to add caveats and hedges.

Why not push DELPH-IN resources as annotated data, rather than as
parsing methodology, following the recent success of SDP
(<http://sdp.delph-in.net>)?

Is such a shift useful? If so, what could be done for support? E.g.
package scripts for inspection, transformation; simpler train/dev/test
split; compatibility with external tools (NER, tokenization); decrease
learning curve of data

Stephan: Very sympathetic. Extreme simplification to bilexical
dependencies has been successful for bringing in consumers. Semantics is
currently trendy, a good opportunity for us. Caution on MRS/AMR
comparison: parsing/generation much more closely constrained with MRS
than with AMR. Better support for aligning tokenization.

Francis: Good that people are using the data. Our experiments with
generation were sometimes awkward (system crashes, etc). People want to
produce more data in new genres, so should recommend preferred
configuration for parsing new text. What are the best parameters for
parsing with the ERG, JACY, etc.? These recommendations will need to be
maintained by the grammarians as the grammar changes. We want to enable
the best possible comparisons.

Woodley: I'm sympathetic to proposal; good to produce training data. But
I'm not in favor of focusing only on being an annotated data production
house. It would be better to extend our range of "products" rather than
shifting focus.

Mike: We have to deal with lack of full coverage: our solution seems
incomplete. We want to accommodate people not interested in linguistics.

Emily: We might lead with the data, but want to also promote the
grammars that give rise to these annotations. The buzz at this year's
ACL: we need more linguistics.

Stephan: What are our DELPH-IN goals? Let's promote what we do well
(output representations) perhaps as a means to draw people in. Gateway
drug.

Olga: This is part of a bigger question about the quality of academic
software: what should be the priority of these usability desiderata,
competing with demands on time of PhD students and researchers? We do
reach academic goals more quickly if we maximize reuse of resources. So
how much time should PhD students spend on packaging? Probably more
(except for Mike).

Emily: We need richer documentation on the wiki for how to get started
and get best results with our resources.

Francis: Liling suggests a large-scale repository for open-access data
where we can register: Zenodo. Or maybe Github.

Stephan: But Github is not open-source.

Francis: Okay, but we may want to associate our resources with ISBN for
citations, and Zenodo would enable this.

Stephan: We did this for SDP effort, putting the data in an LDC
(Linguistic Data Consoritium) repository (because some of the resources
were not open-source), plus open-source subset in [LinDat](/LinDat) for
stable repository. It helps to have side-by-side DELPH-IN resources with
those from other platforms.

Luis: We should add a convenient \`front door' to invite people in, less
overwhelming than DELPH-IN wiki. Fewer options, but the right ones, at
least to start. Say, the top ten things needed to get started.

Chris: More curation is needed to expose the significant expertise and
resources lurking in the DELPH-IN wiki.

Stephan: We should continue to foster internal communication on our
wiki, but add more effort for the "shop window" for external
communication. See the SDP web page: downloaded 30 times this year, and
getting relatively wide use. MRSs are there, but not foregrounded; a
simpler representation is easier to start with.

Emily: Also have www.delph-in.net web pages, more external-facing, but
we need to update them for current work/results. We should add links to
quick-start guides.

Berthold: I have used ERG for teaching; it would be nice to also have a
French grammar. It's desirable to get requests for richer linguistic
views of parse trees via the web demo, including feature structures. We
could expose more information depth for some users.

Luis: An AVM display on the web demos would be useful for linguists
(including students). What level of detail?

Berthold: There are consumers who want more like what we offer for
analyses.

Mike: This discussion is more focused on non-linguist consumers.

Berthold: Yes, but we should also give attention to the linguists.

Guy: Two different forms of packaging, one for linguists, one for
engineers.

Luis: For proselytizing, we should focus on new linguists, not on
generative grammarians ("old linguists").

Mike: The goal of pyDelphin is to minimize dependencies on processing
engines, so consumers can focus on using the data. The platform will
also support requests from Windows.

Ping: Linguists tend to formulate analyses of phenomena in a particular
theory, so it can be hard to communicate our analyses across those
frameworks (e.g. "subject-verb agreement" vs "spec-head agreement").

Lars: It has been difficult to attract typologists and descriptive
linguists without special effort.

Berthold: But there is some openness.

Stephan: Where are these new linguists? Exposure to HPSG? We did teach
GE at ESSLLI.

Emily: And we did a tutorial at HPSG this summer. Slides on the web.

Francis: The goal of external accessibility is important. Packaging is
importnat. Grammars should be easier to use. We need different tasks to
invite linguists vs. engineers. Our grammars should be easier to use.

Last update: 2017-08-23 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/OsloResourcesAsAnnotatedData/_edit)]{% endraw %}