{% raw %}Interactive unification is a poweful technique in grammar engineering
and debugging: following a user request to attempt and unify two feature
structures, LUI will call back into the back-end processing system (the
LKB, for example) to have the unification executed and information about
unification failure(s) recorded. This technique will often be helpful in
working out why a specific (sub-)structure has not been built during
parsing, i.e. often one will want to unify the feature structure(s)
associated to one or more existing constituent(s) in the parse chart
into the argument position(s) of a phrase structure rule.

Interactive unification in LUI is activated by means of *drag and drop*:
click on the (sub-)structure you want to unify, hold down the mouse
button, and drag it onto the target location, i.e. the (sub-)structure,
typically in a different LUI window, where you want the first feature
structure to unified into.

The result of interactive unification will be displaed as a new LUI AVM
window, either simply showing the result of unification, if successful,
or presenting an AVM annotated with failure information. When an
interactive unification attempt fails, LUI can display the partial
result with failure sites highlighted (in red ink) and detailed. The
user can navigate between the (potentially numerous) unification
failures using the left and right arrow keys.

Last update: 2006-03-09 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/LuiUnification/_edit)]{% endraw %}