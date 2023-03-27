{% raw %}This page is intended to provide a catalogue of global variables and
other information of use to Matrix developers. These global variables
should be used rather than repeating the information (for
maintainability).

## Coding style

The indentation is 4 spaces, per [the Python
styleguide](https://www.python.org/dev/peps/pep-0008/).

Please make sure to maintain the consistent indentation when you add
anything. Otherwise no strict requirements but the hope is that, for the
sake of consistency, people will try to follow the PEP.

## Lexical types

In gmcs.linglib.lexbase:

    # all types of lexical items (on lexicon page)
    ALL_LEX_TYPES = ('noun', 'verb', 'det', 'aux', 'adj', 'cop')
    
    # types used for lexical rules (verb and aux are merged)
    LEXICAL_CATEGORIES = ('noun', 'verb', 'det', 'adj', 'cop')
    
    # Types not automatically added to mylanguage.tdl
    NON_ESSENTIAL_LEX_CATEGORIES = ('det', 'adj', 'cop')
    
    # lexical_supertypes is a dictionary mapping the choices file
    # encodings to the actual lex-type identifiers of the supertypes.
    LEXICAL_SUPERTYPES = {'noun':'noun-lex',
                          'verb':'verb-lex',
                          'iverb':'intransitive-verb-lex',
                          'tverb':'transitive-verb-lex',
                          'mverb':'main-verb-lex',
                          'cop':'copula-verb-lex',
                          'det':'determiner-lex',
                          'aux':'aux-lex',
                          'adj':'adj-lex'}

## Choices file version

In gmcs.choices, in the definition of the class
[ChoicesFile](/ChoicesFile):

      ######################################################################
      # Conversion methods: each of these functions assumes the choices
      # file has already been loaded, then converts an older version into
      # a newer one, updating both old key names and old value names.
      # These methods can be called in a chain: to update from version 2
      # to 5, call convert_2_to_3, convert_3_to_4, and convert_4_to_5, in
      # that order.
      #
      # The mehods should consist of a sequence of calls to
      # convert_value(), followed by a sequence of calls to convert_key().
      # That way the calls always contain an old name and a new name.
      def current_version(self):
        return 23

That return value should be updated whenever a new uprev function (and
thus a new choices file version) is defined.

Last update: 2017-12-09 by OlgaZamaraeva [[edit](https://github.com/delph-in/docs/wiki/MatrixDevConventions/_edit)]{% endraw %}