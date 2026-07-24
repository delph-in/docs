{% raw %}**SIG Scribe Notes: Chasing the Matrix, Updating existing grammars to learn from new Matrix libraries**

Francis: There will be changes as the Matrix gets better. We want those improvements (new libraries, documentation, etc.) to be back-propagated. It may be nice to incorporate the analysis of light verbs, for example, into older grammars.

EMB: Taking the KRG as an example, the issue I can see with updating to the current matrix.tdl is that all the append features will be different. You will have to go find all those features and update them.
Most changes are in language specific files, but occasionally we change matrix.tdl. Here are the options: you can make a new choices file, output that, compare that to your original grammar, and make any necessary changes. Or the other option is you can retrofit the light verb library to fit with your grammar.

Guy: Is there a change log somewhere?

EMB: Depends on how the GitLog was imported.

Guy: You can always do a diff but is there a real changes file?

EMB: No.

Francis: Most of the changes I’ve seen are in the docstrings.

EMB: The easier thing would be to remove the docstring, then diff the files.

Dan: The brute force effort is not impossible, but tedious. You can write yourself little search programs to help with that. Coordination had rather a large effect. I don’t remember why it was hard, but it was seismic. I think now there is a certain elegant stability and stateliness to the grammar. It’s worth the effort to go through and make the changes to your own grammar.

EMB: The other thing I would recommend is putting in the new matrix.tdl and going through that first, then looking at light verbs and trying to just make the changes you need.

Dan: For the KRG, it would be nice if you can see which derivation trees can no longer be built, since there have since been changes that tightened up overgeneration. You are not changing the derivations. 

EMB: I’m happy to be responsive on the discussion board to help with this.
…
EMB: When doing grammar development, usually we are removing a constraint to matrix.tdl, not adding. This suggests to me that this is a software that someone could develop. It could read in two versions of matrix.tdl and compare the read-in TDL, rather than just doing flat diff on files. I’m also put in mind of Antske’s “spring cleaning” stuff. What is the ideal move to make now?

Francis: I dont think it's worth spending time going back. Maybe an explanation showing the changes in each version that says when there is a big change (like Emerson Turing types) that lets you know that we expect you will need to change your grammar– if you want to keep using the Matrix.

Dan: Thinking of KRG, for example, one change may be removing a constraint that doesn’t apply across all languages, but if it applies to your KRG, you would have to put that back in.

EMB: If someone went through and took all the comments and turned them into a change log… I could get a CLMS student to do that as a project.

Francis: I think people would only want to change their grammar if there is a major change in the Matrix.

EMB: I suspect it might be easier to just go change by change, than take that big jump, if there were 15 small changes then one big change. What do we need to put in so that you can find those points to change in your own files?

Francis: On GitHub, I don’t know off the top of my head, but something like “show me those points where the file has changed.” Having a Matrix specific version number would be helpful. Or, if everything was in GitHub I could just go back in history. Can we still get stuff from LOGON svn?

Dan: I think so, I don’t know. They are slowly dying.

EMB: So Sanghoun, does the KRG have your information structure stuff in it?

Sanghoun: No.

Dan: I think it would be really good to put that in there. This would be good to be documented in its process, if you could keep notes about what you did, for those that are working on other grammars, like John, and may want to do the same in the future.

EMB: There's two parts: the general process and specific things you had to do to make that update. ICONS is going to be a non-issue. HCONS is different, if you add a handle constraint, the Emerson Turing types impact the feature path.

Francis: I just checked and there are 20 places where we have HCONS in the KRG. In most of these places we would have to change C-CONT as well.

EMB: It would be a day’s work and a good way to reacquaint yourself with the grammar.

Emily L: So if we made a grammar before Tara’s library, how would we check if Tara’s version is better? 

EMB: Say you have light verbs and want to see if Tara’s analysis would work better.
If you have a recent choices file, you can make a new file in the customization system, don’t worry about the changes you made by hand, and parse some simple sentences to see which analysis you want.

Francis: There is no choices file in the KRG.

Dan: Maybe in the SV history?

EMB: Then it's a manual process of importing those changes. Everyone in 567 had to do this at some point. It’s more work if the grammars were created farther apart in time.

Francis: You can do this on Git. Make a branch with new analysis and a branch with the old analysis. Run them both over the same testsuite and look at the results.

EMB: Antske Fokkens’s CLIMB lets you keep both versions alive while you decide.

Luis: I recently heard that she put it on GitHub but I haven’t found it yet

EMB: My homework here is to advise Keren to put a version number on matrix.tdl when she finishes her changes, and maybe look for a CLMS student who wants to take the comments in matrix.tdl to a change log.

Guy: I’m not hearing any strong arguments for multiple change logs, so just one?

EMB: So I suggest we start with these 2 libraries (Tara’s light verbs and Keren’s action nominals), then later fill in past history.

Francis: So we start with version 1.0. Then  2.0 added ICONS, 3.0 added Emerson Turing, 3.1 for smaller changes, and 4.0 would be the next big change.

EMB: I want to include morphotactics as a major change.
…
EMB: Just for the record I still hate GitHub.

Guy: As an alternative to having a single change log, we can put it in the Release tab of GitHub where each release can be numbered with comments. Is that okay with Francis?

Francis: Yes.

EMB: Speaking of the ERG, Is it the DELPH-IN vis demo Liz has been visiting the 2018 version? Can we have a more recent version?

Dan: There is soon to be a 2023 and 2024 version when privacy restrictions at University of Oslo have been resolved.

Dan: Olga knows how to put a release together for the SRG. I need a little of that magic to write a release for the ERG.

Guy: You can add big files to the release on GitHub, which is crucial.

EMB: Francis and Olga, you still have accounts on Patas that I can resurrect. I can put you and Brandon in touch. You will email me?

Francis: Yes. I will email you both.

EMB: I want to go on record saying that when all the AI hype started I was minding my own business doing grammar engineering. There would have been a time when I could just jump on to this project immediately.


Last update: 2024-07-05 by carlycrowther8 [[edit](https://github.com/delph-in/docs/wiki/OlomoucMatrixDrivenUpdating/_edit)]{% endraw %}