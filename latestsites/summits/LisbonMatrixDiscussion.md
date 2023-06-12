{% raw %}(An impressionistic and abbreviated transcript by Scott Drellishak --
corrections and addenda to sfd at u dot washington dot edu.)

**Dan Flickinger:**

What Matrix updates would you like to see? What would make it easier to
integrate? What community input to the Matrix developers would be
effective?

Some Matrix changes are in response to requests, and some harmonizing
still takes place to existing Matrix stuff:

- Predicate names for messages (see Matrix mailing list for
discussion)
- Messages will have an ARG0 that will be linked to the INDEX event of
the clause that supplied the message.
- (Messages are quite a complex system that does very little work --
it's a three-way distinction at the moment.)

**Anette Frank:**

It would be helpful to have more public announcements of upcoming or
proposed Matrix changes (or even ones under discussion).

**Dan F:**

We'll announce when new discussions start on the Matrix list.

**Ivan Sag:**

\[wondered what the theoretical implication of the ARG0 change was\]

**Dan F:**

It's an engineering proposal, it just makes it easier to find the event.

**Ivan S:**

There's a linguistic argument for the change as well.

**Francis Bond:**

Proposed change: he would like to see the linguistic fragment analysis
in the Matrix.

**Dan F:**

Real language includes sentence fragments that are full turns in a
discourse. Several groups are converging on a way of representing these
canonically. We'd like to put it in the Matrix. (And including it it
should have little effect on you if you don't use it.)

**Anette F:**

It would be nice if there was an area on the Wiki where people can say
they're having trouble, possibly inspiring improvements to the Matrix.

**Dan F:**

That suggests having a component-specific wish list on the Wiki. (But
maybe not for all components, so we probably still want a global
Delph-IN-wide wish list.)

**Stephan Oepen:**

I just created the page.

**Francis B:**

It would be nice to set a goal for Matrix grammars like ERG and JACY to
standardize on things like the spelling of head-daughter, etc.

**Dan F:**

Yes, we should do that, at least having documentation of where it
currently diverges.

What other mechanisms would help you communicate with us? Is there
anything you would like to never see change? E.g. should head-comp
always be a phrase? (He doesn't think so.) Somebody has to make the
scientific arguments before or in addition to the engineering hack so it
stays principled -- preferably in a paper, but at least a Wiki page.

**Emily Bender:**

The Matrix agrees with the ERG that head-comp need not be a phrase.

**Jesse Tseng:**

Is there an expectation that every Delph-in grammar should be Matrix
compatible? (And what does "Matrix compatible" mean?)

**Dan F:**

No, that'd be unrealistic, although it might be a goal we're heading
toward. What "Matrix compatible" means is not conflicting with the
Matrix, and if such conflicts occur, that's a reason to discuss changing
the Matrix. We want people to use the Matrix to save them from having to
worry about MRS composition. It makes generation much easier.

**Jesse T:**

It would be nice for pre-Matrix grammars to be able to make use of the
MRS composition stuff -- how can that be done?

**Dan F:**

We'll find out in a few months. A partial import might be doable.

**Emily B:**

To anyone who's considering using the Matrix, we'd love to hear the
feedback from your attempt.

**Valia Kordoni:**

Parts of the matrix (CONTEXT) don't seem to have any effect (or
side-effect).

**Dan F:**

You don't have to use any part of the Matrix you don't need or want.

There hasn't been much cross-linguistic thinking about what CONTEXT
should look like outside of Japanese. Maybe there should be a group.

**Valia K:**

Some part of the Ginzburg and Sag book was implemented. Is that right?

**Dan F:**

A student implemented some of it, but it might not be distributable.

**Ivan S:**

I have it here on my laptop.

Last update: 2005-08-25 by ScottDrellishak [[edit](https://github.com/delph-in/docs/wiki/LisbonMatrixDiscussion/_edit)]{% endraw %}