{% raw %}# Grammar Engineering Frequently Asked Questions

When I look at the parse chart, I don't see an edge that I'm expecting
to be there. How do I find out why it's missing? When you don't see an
edge that you expect to be there (for example, an edge licensed by the
head-complement phrase spanning a verb and its complement NP), this is a
job for interactive unification. Since the parser works bottom up, an
edge can't be in the chart if its daughters aren't there. For example,
if you're expecting a subtree like this:

         VP
        /  \
       V   NP
           |
           N

but the VP is missing, the first thing to check is whether the V and NP
nodes are there. That is, look for the lowest edge that you expect to
find but don't. Now, find the edge(s) that you expect to be the
daughter(s) of the missing edge and determine which rule (grammar rule
or lexical rule) should be licensing the edge. Then, follow the
directions for doing [interactive unification](https://delph-in.github.io/docs/matrix/GeFaqInteractiveUnify).

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqMissingEdge/_edit)]{% endraw %}