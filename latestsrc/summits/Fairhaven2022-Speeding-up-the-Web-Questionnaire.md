{% raw %}# Discussion: Speeding up Matrix Customization

**Moderator:** Emily M. Bender & Tom Liu

**Scriber:** Rosetta Pendleton; I paraphrased a bunch.

**Slides:** [Speeding up the web Questionnaire.pdf](https://github.com/delph-in/docs/blob/main/summits/2022/Speeding%20up%20the%20Web%20Questionnaire.pdf?raw=true)

**About:** The Matrix Customization system (Web Questionnaire) can be very slow especially when loading a large choices file. There are also some issues about saving progress in between navigating between subsections of the questionnaire. This is a discussion to mitigate these issues.

## Minutes

### Overview of Suggestions

- Tom: Suggests adding a loading animation for when the page is loading (context: it takes up to 36 seconds to load a 635 lexicon choices file).
- Tom: Suggests changing the way the page is initialized (example not loading all fields at once).
- Tom: Mentions if we are interested in searching through the web page.
- Tom: Suggests a dialogue box to save & stay before navigating away to another page in the questionnaire.
- Tom: Suggests If we should automatically save the questionnaire choices when the user navigates to different pages.
- Tom: Suggests displaying when the choices file was last saved (although even this may be a blurry indicator of what is saved because users can make multiple changes in seconds).
- Tom: Suggests Improving the aesthetics of the page or modernizing the front end framework

### Discussion on Rendering & Redesigning

- Luis: Should we keep the file to be loaded on the user side or should we transform the matrix to a grammar development space where each user has their own version of the choices file saved already where they can edit it?
- Emily: That would involve account management which could be a lot of work.
- Tom: The choices file itself is very small (~100kb) the slowness is from the javascript loading the page. It has algorithms to load the front end features (drop boxes, textboxes, etc.)
- Luis: Every lexical entry has to be saved. If we can have asynchronous fetching of lexical entry using a database on UW side to grab the lexicon this may help.
- Emily: The slowness isn't from the fetching of the lexical entries but the slowness of rendering.
- Guy: We could consider only rendering a part of the page and load more as you scroll down.
- Glenn: We can default to collapse all drop boxes when the page loads.
- Olga: We can also collapse all the fields because the default is they are all open. 
- Dan: In order for searching to work successfully we need the whole page to be populated (It uses the browser find feature)
- Guy: We may be able to implement our own search (such as a predicate name) and we can search through the lexicon in the choices file which is typically less than 1000 words.
- Olga: TJ is bringing up the fact that we are using a relatively old framework for the ui (cgi) maybe we can use more modern front end frameworks.
- Emily: Do people have wisdom about react, angular, etc.?
- Chris: (from chat) yeah, I keep thinking of that too. React for example works by detaching rendering from data population.
- Michael: We can use react but it is a learning curve.
- Eric: It goes in and out of style pretty easily.
- Luis: Everything is a call back in react.
- Eric: Is it really common to load in the grammar file and search for things? We could have a UI for loading display on the page and see the page fill in and you can start interacting with it as it fills in.
- Luis: You can use cgi to not render the full page. But you essentially need more callback functions. The problem is the HTML is there right now and it is slow to render on the browser. You could have it so that when you click on some button a cgi program could load a side panel that users could then interact with.
- Eric: I would be surprised if React will be around for 5 more years as javascript new frameworks get developed constantly. But despite this framework being old it still stands the test of time.
- TJ: (from chat) In general, I think most library developers aren't doing a lot of front end work. If the front end was ported to React in part or whole, I think it would continue that most library developers wouldn't do a lot of front end work.
- Michael: It would be nice to parse the choices file in a javascript presentation and the presentation is a filter of whats there and render the objects that are needed for the page on the customization., It can clear the objects and generate the ones that are needed. We can move all the python to javascript as well so it is not a mix of javascript and python.
- Emily: Should we be doing DART?
- Luis: NTU moved to using flask because there are things that are easier to do there than cgi and if we are losing the ability to change things easily in cgi it may be helpful to change to flask. But the people maintaining the system may have a hard time with the learning curve again.
- Michael: There is a template called ninja used with ajax that can help render pages.
- Luis: So the simple move will be to have javascript and flask.
- TJ: (from chat) React is developed by Meta and has a large open source community and Angular is developed by Google and has a large open source community. React was released 9 years ago, Angular was released 5 years ago, I don't think they'll be gone in 5 years.
- Tom: I know react and jquery so I can do that but one thing I am concerned with is the validation. IF there are any errors made in the predication when i hit save & stay it will send that choices to the server, and render the validation messages. The choices can not be purely modified in the front end it also needs to be communicated with the backend.
- Liz: I found the outdated-ness of the website turns students away from wanted to use the platform or join the class so I think even if we invest in react and making the appearance nicer and have to do it again 5 years later it may be worth doing.

### Discussion on Save & Stay
- Dan: Auto-saving is very frustrating because I will make some changes by hitting a few characters without noticing and it saved them. I prefer the confirmation about saving before navigating away intuitive and common. I also found "save & stay" counter intuitive because I actually want to save & leave essentially. It's a question about how comfortable you are with interacting with the web interface. 
- Glenn: Since the page validates on save every time you make changes if its invalid you will get a bunch of error messages constantly which may be annoying to debug.
- Emily: We don't want auto save in the same page because of all the changes being made. But auto-save between changing pages should be done.
- Emily: When we talk about save we're talking about two different things. It's actually save & validate.
- TJ: (from chat) There's currently basically two services from the backend: save+validate and customize. So, saving could be just in the frontend, on your local machine (as suggested previously) and then customize would stay the same. And I guess there's another service for test by generation 😛
- Emily M. Bender (from chat) So save is local, but it has to be transmitted to the backend for validation?
- T.J. Trimble (from chat) That's what I'm suggesting, yes, but that's not how it currently works
- Emily M. Bender (from chat) What's the benefit of saving locally if you have to send the file anyway?
- T.J. Trimble (from chat) You can save as often as required with minimal latency.
- Emily M. Bender (from chat) Ah got it.
- Tara: I actually used the navigation to make "clear" my changes knowing that what I was messing with on the page is not saved.
- Eric: Auto save works best when there is robust undo.
- Emily: Summary: We can add a button for Validate now, moving between pages should have a dialogue box for saving.
- Francis: I'm not a fan of shorten names of the sections and it is not clear what "NMZ" means.
- Olga: There are actually short and long forms of the section names and it depends on the size of the window which is used but the full name of the section would be displayed if the window was expanded to the full screen.
- Tom: Should we display when the choices file was saved and the version of choices file being used? It is common to have several different version of the choices file while developing on it.
- Tom: Can we have a last modified field in the choices file? It can display at the top of the choices file for example.
- Emily: Yes and maybe it is useful to have a field to name the choices file. So you can title your versions. But you can not repurpose the "version" field already in there because that is the version of the system.
- Tom: * Was demoing saving something but it didn't save, tried it again and it did*
- Olga: Save doesn't always work for some cases. Unclear why. 
- Emily: This is a good reason for why last saved should be displayed somewhere so it is clear when it saved.
- Glenn: There is a concept of weak & strong we can apply to save and autosave. We can have a strong version of save where anytime there is a difference between last saved and current state of the choices file then we can notify that there are unsaved changes. The weaker version of that is there is a flag somewhere indicating unsaved changes. (RP: I think that was the suggestion?)
- Eric: How large is the code for all this? How difficult would it be to rewrite the code to a more modern framework.
- Olga & Emily: * mentioned some specific files that would be more challenging to change but not impossible *
- T.J. Trimble (from chat): I think there's a couple options that could be updated: literally just the JS isn't very big (<500 lines), the questionnaire rendering is pretty big, then the choices file is all wrapped in there and you have the whole repo :-)
- T.J. Trimble (from chat): We could theoretically keep matrixdef depending on how much we want to change :-) but deffile.py would need to change
- Emily: Thanks everyone! Hopefully we have a more responsive matrix. And perhaps more modern. (:

Last update: 2022-07-19 by rosypen [[edit](https://github.com/delph-in/docs/wiki/Fairhaven2022-Speeding-up-the-Web-Questionnaire/_edit)]{% endraw %}