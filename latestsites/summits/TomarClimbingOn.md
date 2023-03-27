{% raw %}Notes taken during discussion on CLIMB held in Tomar 2014-07-15

Antske introduced the topic: Future of CLIMB. How can it be made more
useful to users? Report on current status ([SlaviClimb](/SlaviClimb);
Chinese Climb; Korean Climb; Flexible Matrix Grammar)

Two modes of running: precedural (Python-based) and declarative (in tdl,
but not so flexible).

\- remove code to choices (valence patterns) - interface - wishes,
ideas?

* * *

Discussion

David: It might be provided as a web service in order to be usable.

Antske: Might help engineers with complicated tasks.

Gai: What is Python for?

Antske: Python takes care of the code generation. The TDL
implementations are included in Python functions. Annoying to go from
procedural to declarative steps.

Emily: When starting a new grammar, the engineer should use CLIMB.

Fransis: Why not get CLIMB together with Matrix?

Antske: There is a start-up on how to incorporate it.

Emily: Customization of source code is needed.

Antske: Yes.

Glen: I am worried about putting roles out.

Emily: It will be customized wrt the language/grammar, this can be an
option (not standard included, provided if requested).

Michael: Is it possible to use it from one language to another?

Antske: Yes, it is flexible. I am using if for working with Germanic
languages grammars. There is also flexibility for including shared and
language specific implementations for different languages (for instance
in SlaviCLIMB). First, a complete Slavic Core is provided. Then Russian
is done separately.

At some point we'll need to simplify, not make everything a choice.
Choices files can get complex at some point.

Michael: Do you have to decide on the procedural or declarative?

Antske: You can change to declarative at any time, but you cannot
automatically move declaratively written code to procedural CLIMB.

Woodley: Is the source code available?

Antske: Yes.

Glenn: can you elaborate on the idea of using Eclipse?

Antske: There are several ways to be made more accessible, maybe eclipse
plug-ins to be added.

Dan: Maybe to be made available in Eclipse with some choices?

Antske: It is possible, but not trivial.

Dan: The software is there - a question is how to expose the info at the
right points to the grammarian.

Antske: Given the time constraints, something can be done on
prioritization. Let me know if you have specific requests.

Last update: 2014-07-16 by AntskeFokkens [[edit](https://github.com/delph-in/docs/wiki/TomarClimbingOn/_edit)]{% endraw %}