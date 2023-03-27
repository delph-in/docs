{% raw %}This page is a place to document ideas and proposals for
improvements/changes to the Grammar Matrix codebase before they are
implemented. If they get implemented, the blueprints should be removed
or deprecated somewhere.

## Use a web framework

The Matrix has a custom web-serving solution, which has to be learned by
developers and these skills don't port easily to other projects.
Instead, consider using something like [Flask](http://flask.pocoo.org/)
or [Bottle](http://bottlepy.org) (my favorite). There would be
significant work involved in such a rewrite, but it would offer many
benefits:

- developers would learn portable skills
- Matrix codebase would be greatly simplified
- Web frontend of the Matrix should be more robust and
standards-compliant (by virtue of the web framework's well-tested
implementation)
- Adding new subpages would be easier

If a web-framework is used, the JSON-based choices files would make a
lot of sense (see below).

## Use gTest for regression testing

The regression testing framework could be largely replaced with a
solution like [gTest](https://github.com/goodmami/gtest). This would
simplify the code and make it easier to keep track of the tests that
were added. It also would make available other kinds of tests (e.g.
coverage, semantic validity).

## Choices File Data Structures

Currently we have a system where choices are filled into a data
structure of nested dictionaries and lists. For example, with the
following choices:

    noun1_name=common-noun
    noun1_stem1_orth=dog
    noun1_stem3_orth=cat

the following structure would be created:

```
   1 {'noun': [{'name': 'common-noun',
   2            'stem': [{'orth': 'dog'},
   3                     None,
   4                     {'orth': 'cat'}]}]}
```

These data structures are very close to the JSON format, and a goal
might be to convert the Questionnaire to use JSON instead of its own
format.

Interaction with these data structures is managed so users can refer to
objects by their choice key (e.g. "noun1\_stem" is the list of stems for
noun1), or as Python objects. For instance:

```
   1 >>> choices['noun1_name']
   2 common-noun
   3 >>> choices['noun1']
   4 {'name': 'common-noun',
   5          'stem': [{'orth': 'dog'},
   6                   None,
   7                   {'orth': 'cat'}]}
   8 >>> for noun in choices['noun']:
   9 ...   stem1 = noun['stem1_orth']
  10 ...   for stem in noun['stem']:
  11 ...     if stem1 == stem['orth']:
  12 ...       print stem1, '==', stem['orth']
  13 ...     else:
  14 ...       print stem1, '!=', stem['orth']
  15 dog == dog
  16 dog != cat
```

Note how sub structures can still refer to nested objects by choices key
(relative to the current object), or by iterating through them, etc.
Also note that empty items (None) are skipped.

The problem with this approach is that it is inefficient to get
substructures, because each time the key must be split into its
components (noun, 1, stem, 1, orth), and tests are run to look for empty
list items, etc. This proposal is for an alternative backend data
structure that allows the same kind of interaction.

#### Proposal 1: Simulated substructures

One possibility is to use a single dictionary that holds all full keys
(similar to the original choices file, and in some ways similar to the
original implementation, but without the headache), but use objects that
simulate substructures for the complex interactions. Some (incomplete)
code might clear things up:

```
   1 class ChoiceStruct(dict):
   2   def __init__(self, primary_key, choices):
   3     self.primary_key = primary_key
   4     self.choices = choices
   5 
   6   def __getitem__(self, key):
   7     try:
   8       return self.choices[self.primary_key + key]
   9     except KeyError:
  10       return ChoiceStruct(key, self.choices)
```

If a user gives a full key, like 'noun1\_name', it will return the value
from the choices dictionary. If it gives a partial key, such as 'noun1',
it will return a new [ChoiceStruct](/ChoiceStruct) with the primary\_key
set to 'noun1', so subsequent retrievals from the new structure would be
relative to that primary\_key. There are a few concerns:

- How to allow iteration over the numbered items (noun1\_stem1,
noun1\_stem3, etc)
- How to calculate length of lists of numbered items
- How to deal with bogus keys (e.g.
'noun1\_this\_is\_not\_a\_real\_key')
- How to deal with 'incomplete partial keys', such as 'nou'
- How to ensure setting values affects the original dictionary

#### Proposal 2: Just use JSON module, reduce functionality

Since choices files can be represented in the JSON format, we could
significantly reduce the code we have to maintain by using Python's json
module to decode them. This would result in structures similar to what
we have now, but would not allow complex key retrievals. Also, lists
would use 0-indexing. For instance:

```
   1 >>> import json
   2 >>> choices = json.load(open('test/choices.json'))
   3 >>> print choices['noun'][0]['stem'][0]['orth']
   4 dog
```

#### Proposal 3: A mix of Proposals 1 & 2

I don't see any reason why we couldn't do both Proposals 1 & 2. Use the
json module to load JSON-formatted choices files, then have some kind of
wrapper that simulates the complex interactions. The implementer would
still need to be mindful of performance, though.

### Matrix code: dependencies and control flow

Find a tool which determines dependencies between python functions,
inspect the graph and, ideally, eliminate circular dependencies (via
further modularization).

The code is plagued by if-else blocks (understandably). We could find
duplicating if-else blocks within each function and eliminate them.

Currently the linguistic logic in the code is not sufficiently separated
from utility functions. E.g. Customizing the order of auxiliaries and
their complements is linguistic logic, while checking if something is in
the choices dictionary or adding a chunk of text to a list is less so.
While it may not be possible to separate these entirely, we could
perhaps do a better job and provide better guildelines.

Last update: 2017-12-04 by OlgaZamaraeva [[edit](https://github.com/delph-in/docs/wiki/MatrixDevBlueprints/_edit)]{% endraw %}