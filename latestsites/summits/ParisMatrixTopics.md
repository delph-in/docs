{% raw %}- Tutorial on using the customization system, including:
  - Using the customization system for different purposes (small
grammar linguistic hypothesis testing, working towards broad
coverage grammar, language documentation)
    1. Which choices are most "bland" in each library
  - Best practice for using the customization system
    1. Iterative customization and testing (including TbG)
    2. Even after "detaching", how to go back to the customization
system and get further information (recommended procedure
involves taking old choices file, creating fresh old grammar
and diffing to both hand-edited grammar and new customized
grammar, then deciding how to merge)
    3. Encourage people to customize/download grammars not intended
for extension but just to see how various analyses are
working. (E.g., an example grammar with periphery-sensitive
phenomena even if that doesn't work together with actual
word order choices.)
- DOCUMENTATION
  - In-tdl comments
  - Links to descriptions of analyses
  - Mouse over message
  - Tutorial (see above)
- Separate simple analyses and more advanced phenomena
  - Advise using simple analyses first and then add advanced
phenomena later to see how it works. Should motivate iterative
development cycle.
  - Give simple general analyses on top.
  - More specific ones that maybe should be generalized more, maybe
don't combine well with all choices in other libraries, lower
down with documentation of:
    - Which choices they work well with
    - Which languages they are inspired by
    - Request for input if someone finds a combination of
complicated choice with an as-yet unenabled option in
another library
- Interactions and simple options:
  - E.g., adverbs allow only simple word order choices (e.g.,
anywhere or just right before or right after verbs)
  - with a disclaimer saying what to expect out of the grammar
(i.e., recall but not precision in this case).
- In adding libraries, focus on recall over precision:
  - Model of coordination, which is underspecified but relatively
easy to add to.
  - Prioritize things like ditransitives (other verb complementation
patterns), modification over things like negative concord.

Last update: 2010-07-04 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/ParisMatrixTopics/_edit)]{% endraw %}