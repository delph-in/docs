{% raw %}# MRS in Tatoeba

This is a small experiment to put MRS test suite sentences into Tatoeba
corpus. The primary purposes of this experiment are to (a) verify the
naturalness of the sentences and (b) bootstrap a crosslingual MRS corpus
through crowdsourcing.

|     |                                               |                                                 |
|-----|-----------------------------------------------|-------------------------------------------------|
| no. | English                                       | Tatoeba url                                     |
| 11  | It rained.                                    | <http://tatoeba.org/eng/sentences/show/2481815> |
| 21  | Abram barked.                                 | <http://tatoeba.org/eng/sentences/show/2481838> |
| 31  | The window opened.                            | <http://tatoeba.org/eng/sentences/show/2481909> |
| 41  | Abrams chased Browne.                         | <http://tatoeba.org/eng/sentences/show/2638106> |
| 51  | Abrams handed Browne the cigarette.           | <http://tatoeba.org/eng/sentences/show/2638130> |
| 61  | Abrams handed the cigarette to Browne.        | <http://tatoeba.org/eng/sentences/show/2638156> |
| 71  | Abrams bet Browne a cigarette that it rained. | <http://tatoeba.org/eng/sentences/show/2638181> |
| 81  | Abrams knew that it rained.                   | <http://tatoeba.org/eng/sentences/show/2638312> |
| 91  | Abrams intended to bark.                      | <http://tatoeba.org/eng/sentences/show/2638316> |
| 101 | Abrams intended Browne to bark.               | <http://tatoeba.org/eng/sentences/show/2638320> |
| 211 | Tobacco arrived.                              | <http://tatoeba.org/eng/sentences/show/2946378> |
| 251 | The dog has been barking.                     | <http://tatoeba.org/eng/sentences/show/2509670> |
| 351 | The dog is barking.                           | <http://tatoeba.org/eng/sentences/show/2482132> |
| 371 | Did the dog bark?                             | <http://tatoeba.org/eng/sentences/show/2509656> |
| 391 | The dog will bark.                            | <http://tatoeba.org/eng/sentences/show/2509579> |
| 421 | The dog couldn't bark.                        | <http://tatoeba.org/eng/sentences/show/2489590> |
| 431 | The old dog barked.                           | <http://tatoeba.org/eng/sentences/show/2509601> |
| 441 | The dog barked softly.                        | <http://tatoeba.org/eng/sentences/show/2946298> |

## Issues

Issues that came up when putting MRS test suite sentences into Tatoeba
(the bolded sentences/phrases are comments from Tatoeba's user on some
of the MRS sentences)

1. **@possible copyright violation**: no issue, the test suite is MIT.
In tatoeba, we can create a list can add the license on its title.
See <https://tatoeba.org/eng/sentences_lists/show/166576>. The same
as the grammar they were part of, which is almost always MIT (at
least ERG and Jacy are)
2. **This is not a good translation**: Some supposedly grammatical
sentences were deemed as unnatural by Tatoeba's user, should these
sentences be corrected to ensure that our grammars are parsing the
right stuff?
3. **Sentences are machine-translated.**: Are sentences from the MRS
test suite humanly translated? Or are they generated using LOGON?
4. **I cannot think of any situation where this would be used.**:
Sentences from the test suite should validate the grammars'
correctness, so it's understandable that some sentences are not very
useful to Tatoeba's user on the surface. Is there a page where it
says which phenomenon/phenomena each sentence captures? How language
dependent are the phenomena captures in the sentences?
5. users can edit a sentence. See
<https://tatoeba.org/eng/sentences/show/2638181> that was edited to
'Abrams bet Browne a cigarette that it had rained.'

Last update: 2020-06-10 by AlexandreRademaker [[edit](https://github.com/delph-in/docs/wiki/MatrixMrsTestSuiteTatoeba/_edit)]{% endraw %}