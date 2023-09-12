{% raw %}Searching DELPH-IN corpora & the Linguistic Type Database (LTDB)

* [Francis's slides](https://github.com/delph-in/docs/blob/main/summits/2023/ltdb-update-2023.pdf?raw=true)
* Scribe: Emily

* * *

Francis: How do we choose which sentences to display? Corpus order and length both unsatisfying.

Emily: Suggest configurable parameter of min length -- like 5.

Eric: Can you click through to the next one?

Francis: Not yet, but TODO.

Francis: LTDB has been going from static to less static over the years. But MRS to DMRS conversion and conversion to JSON done statically once. Eric suggested writing everything out again so it can be hosted on GitHub (using workarounds for size of the repository).

Francis: Currently can look at any sentence in the treebank, useful. And it would also be nice to have a local demo of the grammar --- but that requires running a server.

Alexandre: Would like to have this as a homepage for PorGram -- like link in github repo pointing to this.

Alexandre: Can offer contact with front-end developers, who might be able to go after concrete issues in the github.

Francis: Don't yet even really understand the problem. Have to draw and then hide the tree, MRS, etc --- otherwise don't display well.

Eric: Which frameworks?

Francis: DS3, mainly --- but all written by different people. I will try to write up a description.

Luis: I was the first to put the trees & MRS up. Quick and dirty, but nice to have the dump here. But would be nice to have it asynchronously, rather than livin in the html. But if you want to host it in a github repo, then you don't want to calculate interactively.

Luis: Which treebanks do you hit right now? Many grammars have treebanks in various stages of development.

Francis: Currently look under gold and check in run that the version matches the grammar being processed for LTDB.

Luis: Suggest metadata that grammar writer can provide about which treebanks to use.

Luis: Type addenda?

Francis: I'm storing all of that info but I plan to show all of the snippets in the order displayed.

Luis: Can PyDelphin merge?

Francis: Not easily, and I think it's useful to know which files they're in, so don't want to merge.

Luis: Reverse search from the treebank: input is words and/or phrases, and then get rules or collection of rules used in licensing the constituent so far. Could use for testing consistency of analysis over time.

Francis: Was thinking of using something like Grewmatch (full search over trees). Can look for not just arbitrary phrase, but rather relationships between words. Should be doable for both MRS and derivation trees. If we're going to do a search beyond individual types, try to build on what's been done. Anyone doing this? I know there's Fangorn, WeSearch.

Emily: WeSearch was integrated with the ESD fingerprints, but no longer working so far as I know.

Berthold: LIFT meeting last year --- someone used grew on DMRS. Here: https://pageperso.lis-lab.fr/bernard.espinasse/wp-content/uploads/2023/01/Hijazi-NLP2022.pdf

Francis: Grew is widely used by UD, and is a rewriter.

Alexandre: Have been playing with rewriting WeSearch, changing fingerprints into SparQL query. Nice is reusable library. Bad thing is reliance on triple stores; hard to find libraries with good performance. Maybe time to move to graph-based things.

Francis: No UD treebanks are that big so don't know how well it will work with our biggest resources (esp WikiWoods). But with only gold data, hopefully manageable.

Sara: Is the github repo the home of the most recent documentation?

Olga: How are up to date are the installation instructions? Are there any outdated instructions to your knowledge?

Francis: Somewhat out of date

Olga: Will it be, sometime soon?

Francis: Yes to the first

Olga: I tried to set this up, but got stuck for lack of documentation. Very juicy trap and really want to set it up for my own work.

Francis: Have lost some functionality and really want to regain before telling people install it.

Emily: I hear Olga saying that she wants it, even if not fully published.

Francis: Okay...

Olga: Mainly the installation instructions.

Berthold: LIFT person was (Francis took the note).

Olga: Colleagues at A Coruna didn't know of grew.

Emily: How does this work with the Matrix?

Francis: You have a minimal grammar or that basic Japanese one, or could even just do the static Matrix core, but would prefer it to be a working grammar.

Emily: Being able to visit the documentation that way, might inspire more of it.

Alexandre: irules and lrules mixed?

Francis: Yes.

Francis: Also read roots, labels, and chart mapping rules but don't yet know how to display the latter.

Francis: It is of course restful -- if it's stable or aliased to somewhere where it's stable, should be able to link to it from elsewhere where someone is looking at a grammar. In that case should put the grammar version in the URL.

Eric: Does it have the predicates?

Francis: [Searches up udef_q]

Eric: So if it had a docstring, it would show up there. Thinking about how far we are from using this as part of the documentation, at least for grammar predicates.

Francis: This will never have the depth of info that the wiki does, should link both.

Francis: For predicates would be good to have links to example sentences.

Francis: For Jacy we had a name for the type in Japanese --- to make collaboration easier. Would anyone else be interested in supporting that?

Emily: Not relevant for the Matrix....

Francis: But for Hausa, do you want Hausa names for head-comp-rule?

Berthold: Would be good for consumption by Hausa speakers.

Francis: For Japanese, the treebanking was being done by non-linguists, so this helped.

Berthold: The Paris crowd had a habit of putting lots of French in, didn't like that.

Emily: But it's important when working with another community's language to make the resource accessible to them.

Berthold: Yes!

Emily: So Francis is talking about adding a separate layer of translations.

Berthold: Sounds good. For HaG, would be Hausa and French.

Tara: Toggle-able so that you can choose what you're seeing?

John: Dan talks about having a list of abbreviations...

Francis: Let's wrap up before people can add things to my todo list.

Emily: Very first thing is making it possible for Olga to get installed.

* Download from github
* Make sure you have the metadata file in your grammar directory (as in slides)
* Script whose 1 argument is the metadata file
* It reads the grammar, and assuming all goes well, it produces the ltdb
* Put the database into the db in the directory
* It's a flask app, can run from command line or put it where you but wsgi scripts
* If there's no treebank it won't use the treebank
* If there's no doc strings it just shows parent & child types

Still useful even without docstrings or treebank, but even a very small treebank it makes a difference.

Alexander: How do point to treebanks?

Francis: It assumes they're in tsdb/gold, otherwise add symlink. Luis requests a way to configure that.

Francis: [Works on setting it up for SRG]

Olga: Very nice to have this demo being recorded!

Francis: [Hacks for a bit, finds something in temp --- and displays SRG LTDB!] It just works :)

Francis: bash deploy.sh in the github repo runs it locally for just you. Downloads the requirements, activates the requirements, etc.

Olga: Which linux?

Francis: Ubuntu from ~3 years ago.

Berthold: Can you turn that think about which file which line into a link?

Francis: If it's on the web, then maybe not? Unless we put the source files on the web too. Would you like the whole grammar to be embedded here?

Emily: No, because of the use case where you're actively developing the grammar, and you'll want to look at the latest grammar files, not something frozen.

Francis: There should be some info displaying when the thing was compiled, how many of each kind of grammar entity, etc.

Olga: I plan to work on finding correlations between structures which tend to occur around learner usages in the learner treebank. I think ltdb will be super useful in the current form, but I wonder if there are avenues for new tools being developed based on this which help with that kind of corpus exploration?

Francis: I can give more access to the SQL. Currently allow a glob search (limited regexes). There's no a priori reason I couldn't give more access, but you probably want an interface like grewmatch or something like that. Or Luis's idea of being able to search for a string of words is probably easy & still useful. E.g. search for 'years ago'.

Emily: Why not just parse? Oh right: The advantage of searching a treebank rather than just parsing is that you get gold trees.

David: I am looking forward to the updated LTDB  documentation. Last time (3 years ago or so) I tried with INDRA but got many error messages...

Francis: Used to be very different and much less robust. Michael has made some improvements via pydelphin for parsing tdl. Sorry about that. This one should be must better.

John: Reading ace config.tdl because pydelphin has a reader for that, but we don't have that for LKB?

Francis: Was using the PAGE-error dump-XML set up but the doc strings were called different things in different places and I'm not that good at lisp.

John: Please send the name of the function you were using.

Francis: And then I was parsing the XML.

Emily: But you're not using ace?

Francis: Just the config.tdl and then using pydelphin to parse tdl. Nice thing about LKB was I could ask what is the type of the value of a feature, and that requires unifying. Pydelphin doesn't natively unify.

John: In theory also richer info about the type hierarchy.

Francis: Such as?

John: All descendants/ancestors?

Francis: Easy enough in SQL.

John: Wouldn't get glb types.

Francis: I don't want them.

Berthold: Unrelated question --- is there a central place to store grammars? Something replacing the emmtee server?

John: Grammar catalogue?

Francis: That lists info about the grammar.

Olga: Go to the main org page (github.com/delphin). 25 repositories total, grammars are starting to live there.

Francis: Find to put grammars there, fine to have them elsewhere. So long as they're listed in the wiki. If they're on github in a uniform way, we might be able to do more.

Eric: Easier to get them into the external docs pages, too.

Alexandre: GrammarCatalogue page has info about all the grammars. I updated it for PorGram yesterday.

Berthold: Does it make sense to have dev versions somewhere on a different git server? Not sure I want to put everything out straightaway.

Luis: The org should be forking into it whenever individual people have repos. The nice thing to do so that the org doesn't lose track of it, is to fork under DELPH-IN, and can update when you want to. If Francis wants to delete it one day it would be safely stored under DELPH-IN. But also you don't have a public facing repo the minute you start working in it.

Berthold: Own repo anywhere? Or github github.

Luis: Has to be github for this to work, but can work locally and then push to multiple places.

Alexandre: Question is when and who updates the fork.

Luis: I think not everyone has the same rights on the delph-in org. Was told only some people can do this. Ownership should be from the developer, create on your own site, and then invite delph-in admins to do that creation of fork.

Olga: Unfortunately, only admins can create repos, and admins can do too many other things to make everyone admins.

Luis: Someone with admin access should be responsible for forking repos on request.

Alexandre: Good idea not only for grammars but also utool (which as repo outside of DELPH-IN). Would be good to have a fork for safe-keeping. But there's a little bit of maintenance, have to pull changes.

Luis: There are also some git actions that can do automated updates when original repos are updated. I'm not the best person to do it, but I know it is doable.

Alexandre: Fork set up also shows something about both provenance and approval.

Luis: And also respects the open sourcedness of repos a little bit better. 


Last update: 2023-06-30 by emilymbender [[edit](https://github.com/delph-in/docs/wiki/GaliciaLtdb/_edit)]{% endraw %}