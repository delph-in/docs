{% raw %}# Linking wh-words to a specific event in the MRS

### Participants

- Moderator: OlgaZamaraeva (OZ)
- Scribe: MichaelGoodman (MWG) (the scribe
apologizes for not always keeping up with who said what when.)
- Other Participants (in order of appearance): Dan Flickinger (DPF),
Guy Emerson (GE), Woodley Packard (WP), Ann Copestake (AAC), David
Inman (DI), Francis Bond (FCB)

### Minutes

- OZ: Problem is linking a wh word to a specific event when there's
more than one in a sentence
  - Do you know who Kim saw?
- OZ: Goal is to figure out how real the problem is, how it relates to
the Matrix
- OZ: In Oslo we discussed these, but mostly about linguistic context;
i want to know technical difficulties
- DPF: wh gives ARG0, in typical case it is deterministic
- DPF: but we may have more than one event where it's applicable: Who
tried to chase Kim
- Examples from slides
  - (1b) Sandy said who saw \*who\*?
  - (2b) Sandy said who \*who\* saw?
- DPF: 2b is a silly analysis, with the second \*who\* being a
relative clause
- GE: With echo questions... from earlier discussion:
- GE: It doesn't need to be a question: "Sandy said who saw who."
- WP: What's an echo question?
- DPF: When A says: "John saw a glarump..." and B says: "John saw
what?"
- DPF: It's interesting because the ERG doesn't do well with polarity
questions: "I wonder whether ..."
- DPF: And these interact with echo questions
- WP: In the MRS for "John wondered whether Kim left." the only
difference between "John was amazed that Kim left" (besides
wonder/amaze) is that \_leave\_v\_1 has sf: ques
- GE: In Oslo it was suggested to use ICONS to link the wh word to the
clauses
- DPF: Can we create an information-structure backstory for that?
Currently ICONS is used for information-structure in the ERG.
- OZ: There is literature on focus with wh-questions. Many believe
they are always focused (though there is disagreement)
- AAC: Back to the echo questions... The "who" of the echo question is
not the same as the who in the actual question, but it's a discourse
thing; asking the speaker to clarify what they said.
- AAC: So we need to decide if the MRS should be underspecified here
or if we can capture them somehow.
- DI: "John saw Mary and \*mumble\*"
  - "John saw Mary and who?" Felicitous response is "John saw Mary
and who?" not "John saw who?"
- DPF: And not "John saw who and Mary?"
- AAC/DPF: "John saw Mary and whom?" -- do constraints on case persist
in echo questions? general agreement that this sounds pedantic
- GE: Echo in yes/no questions: "Is Kim here?" "Is who here?"
- AAC: Coming back to an underspecified representation... If it is
ambiguous between a polarity question and a wh-question, can this be
underspecified?
- DPF: "Is who here?" is both a wh-question and also the original
yes-know question
- WP: If you have a sentence with many wh-words and one becomes the
focus of an echo question, the rest are invalidated... You're really
asking to clarify that one, the rest are background.
- AAC: Yes, let's set aside echo questions, they're a distraction.
- OZ: "Who do you know whether Kim saw"... In Russian it's better with
negation: "Who do you not know whether Kim saw"
- .... (couldn't keep up here)
- OZ: If I want to model this in the Matrix, do I have a problem here?
- OZ: "Do you know who Kim saw" can be polar: literal answer "yes",
pragmatic answer may be "Sandy"
- WP: Can't these have truth conditional effects? If the answer to the
polar question depends on the answer to the wh, then we have a
problem because ICONS should not change truth-conditions.
- GE: "I know whether you know who Kim saw."
- GE: vs "I know who you know whether Kim saw."
- ... again, the scribe can't keep up with these examples apologies
abound.
- MWG: wait I thought ICONS \*could\* effect truth conditions
- DPF: In the current uses, passive, topic, I don't think it does
- AAC: But if we use them for pronouns it could
- AAC: But in general they should not affect truth values... Although
they could be used to disambiguate truth conditions
- DPF: Before we had ICONS between an event and an individual that did
not affect truth, and between two individuals where it does, but
this presents a third case between an event and an individual that
does affect truth
- DI: Use focus to show what is the expected answer... "Who did Kim
see?" "Do you know who Kim saw?"
- DPF: ..
- WP: What if both wh are individuals?
- DI: Who saw what?
- AAC: If we want lists of pairs for responses, then for "Do you know
who Kim saw?" then "Yes, Sandy" is a valid answer.
- DI: But not "No, Sandy"
- GE: "What do you know who Kim gave?"
- FCB: In Japanese it's fine, just answer all whs.

Last update: 2019-07-16 by MichaelGoodman [[edit](https://github.com/delph-in/docs/wiki/CambridgeWhEvents/_edit)]{% endraw %}