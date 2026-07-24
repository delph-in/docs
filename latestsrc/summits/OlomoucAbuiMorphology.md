{% raw %}*Scribe: Emily*

Sander: Indonesian does something similar, "You shot someone by they couldn't be shot"

František: Indonesian frequently has verbs that don't encode the resulting state; need another verb to indicate. Abui does it with a prefix.

Francis: If you lose so much moving to FLEx, why did you move?

František: ToolBox no longer supported.

Luis: ToolBox data files are text-based -- if those files exist and the annotations exist, should be able to move it over. I think a little bit of effort but worth it to get it out.

František: Yes, we have the ToolBox data in Xigt even.

EMB: Xigt and FLEx are both XML, should be possible to write the XSLT, but I don't think the AGG project has that XSLT code (yet).

Olga: In Russians you can also string those prefixes to add more and more, maybe arbitrarily many, in order to weaken the severity of the event. "I blunted the knife" (completely) "I pref-blunted the knife" (not quite) "I pref2-pref-blunted the knife" (I sort of started blunting the knife). Similar in Abui?

František: Shows Czech example for psát -- concentric circles of possible affixes added and added. I think Abui is like this, not a template. Like in the visual interface to Abui. Not a set of slots, but pathways to get to a complete verb.

EMB: One option other than getting a person to enumerate or getting things out of a corpus is building an FST. There's a nice implementation of that in FOMA (reimplementation of XFST; see also book by Beesley and Karttunen documenting the formalism). Idea is to have an FST give all the combinations the template would suggest and then you could check against the corpus for which ones are there.

Guy: Might be able to do some inference with the Bayesian system.

František: Could imagine taking FST that gives all things the template would predict, and then use the Bayesian system to filter and then check against the corpus.

Francis: Can also add some weights to the FST, to rank things. 

Sander: What about processing constraints? E.g. Dutch speakers can put 5 verbs in a cluster, but we don't like it and we don't like each other for doing it.

František: There's a steady stream of data coming in. Would like something we can rerun automatically each time there is new data coming in. Also comparing data from other people and younger people.

EMB: Among the 40,000 people are there some who are still using the language at home with young kids?

František: Yes in the mountains especially.

Guy: Could you say more about how you're using the Bayesian network for elicitation -- looking at points of most uncertainty from the model?

František: Learn relationships between the markers (if one, then the other) or lack of relationships. If I do elicitation and want to take shortcuts, ask only one of each closely related pair.

Guy: Are you picking manually?

František: Yes. Using an online system -- choose which questions to expose to speakers.

EMB: In that case, are you possibly missing interesting counterexamples, by believing the system about which prefixes tend to occur with the same verb?

František: Efficiency of collecting data about new verbs.

Guy: Trained on the corpus?

František: No: Trained on all verbs we know something about -- the data about inflectional possibility.

Luis: These classes are not linguistic classes, just clusters? I want to reask what Emily was asking. If the system says "I know that this verb won't do X because Y" -- why bother asking? Because that would be the interesting class. Back to question of what are you asking this for? I think it's important to try to create linguistic classes.

František: We are three corners away from that still. One day might have a neat system that will make sense semantically as well.

Guy: Understanding check ... I'm getting confused between whether the data is type level or token level? The big table is type level. Is it possible or impossible. But the corpus?

Francis: Still type level (seen or not seen).

Guy: This table doesn't have anything about prefix co-occurrence. So what are the nodes in the Bayesian network about?

František: Inflectional possibilities.

Guy: So not trained on the corpus. Because you don't have any frequency information. Bayesian network is trained across all the verbs together?

František: Right. And if we had frequency by using FST to search corpus, that could be added here.

Guy: How was the Bayesian network trained?

Francis: Folks at the Czech Academy of Sciences do that part.

Guy: More immediate suggestion: when deciding which questions to ask speakers, could be very error prone, because large Bayesian networks can be hard to interpret manually. Even small networks can give non-intuitive effects about how features impact each other. Suggest using something related to active learning. Query the model about where the most uncertainty is. The place with the most uncertainty is where I want the most information. Can be ranked automatically.

Luis: Goes back to the idea that you want to ask Abui speakers with an app.

EMB: Then the reordering of questions can happen automatically, and still conserve speaker time.

Guy: Ask the folks who did the Bayesian analysis for you to do that.

František: So far, analysis of optimum number of clusters, noisy or, interested in working with small datasets.

Guy: This is a little different -- the technical term is active learning.

Luis: Random clusters have no meaning, and users might not understand. So think in terms of predictions for each of the cells in the table for a given verb, but ask the speakers about the ones predicted with low confidence.

EMB: Looking at those graphs (slide 22) -- are the graphs that are with the bars of most similar length the ones with the most uncertainty?

Guy: Yes. So (to F) then what the CAS folks have prepared is already pretty close to what you need.

Guy: More open-ended thing: This way of doing data analysis makes some simplifying assumptions about relationships you're expecting to find in the data. I wonder if you would get different conclusions if you used a different kind of model. If you switch to a different kind of model, do you get very different predictions? I don't know how modular the software is wrt to models. E.g. switching from Bayesian networks (top-down) to undirected models.

František: I know whe have tried different types of algorithms for finding the relations. We've used some things that come from biology (species clustering). The biggest problem that we have been distracted by is what does the 0 mean. We have been doing some other experimentation with how to model with uncertainty around the 0, and they'll be coming back with those changed models.

Guy: It is interesting to see if you switch the model do you get different predictions. At this stage, you probably don't want to be too wedded to a particular kind of analysis. But you already have this nice interface, would be good to be able to keep using it.

František: Curious whether using a different input would change it --- one that has slots.

Luis: With Emily's FST you could have it.

Guy: From a mathematical perspective, that's a different model.

Luis: That's a different goal.

František: If I want to write a lemma for the grammar for a verb, I need to know what things go in there.

EMB: What about a much bigger Bayesian graph, one node for each fully inflected form for a lemma?

Guy: Graph is way big, and you wouldn't have enough data to learn it. Also lose the information about co-occurrence of particular affixes (in a form).

Francis: Pairs + SVM.

Guy: Different idea -- some nodes at paradigm level and some nodes at the word-form level, to keep the feature space small (given small amount of data). If you split how you interpret different nodes in the network, software might not adapt to it, but hopefully your collaborators will find that exciting. Bottom part could be filled in for a specific word form, top part could be filled in for the paradigm info.

Sander: What about the impossibilities? Every language has some.

Guy: Hopefully the model can give a very small probability.

Luis: There are biases -- and active learning will exacerbate them as well.


Last update: 2024-07-06 by emilymbender [[edit](https://github.com/delph-in/docs/wiki/OlomoucAbuiMorphology/_edit)]{% endraw %}