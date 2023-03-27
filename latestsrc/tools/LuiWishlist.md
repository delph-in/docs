{% raw %}This is the page to add wishlist items for the Lui interface
([LkbLui](https://delph-in.github.io/docs/tools/LkbLui)).

## Open

- show the provenance of feature values in an AVM (FCB)
- Add a latex output to the indexed-mrs (something like this output
(mrs::output-mrs1 mrs 'mrs::latex stream)) (FCB)
- 2005-08-20 make the ordering of features in the avm display
configurable (WP).
  - I am not sure this needs to be configurable. I would rather have
sensible defaults,... Too much configuration leads to madness
(FCB)
  
  <!-- -->

  
  - OK... so are the current defaults sensible, or do we need to
work on this? Someone needs to specify a display order, whether
it's a LUI configuration or part of the grammar producing the
AVMs. the TDL defining one AVM might mention features in a
different order than the TDL defining another AVM... do people
care about that difference being reflected in LUI? that would
not be something ACE could provide when driving LUI, but maybe
the LKB could. (WP 2013-07-02)
- 2005-08-19 Use CFROM/CTO to link the text to the MRS predicates in
the simple MRS, like in the HoG HTML interface. (FCB)
- 2005-08-19 Make all text windows selectable (JG)
- 2005-08-18 Halfwidth characters shown as halfwidth in yz. (FCB)
  - semi solved by pavel in trollet
  - are there still issues with this in the main pangolui
distribution in the logon tree? can someone provide an example
that renders incorrectly (their .luirc or .pangoluirc and also
/tmp/pangolui.debug.\*)? (WP 2013-07-02)
- 2017-07-31 Feature structure diff - could be separated into two
steps: interactive generalization, and interactive comparison (of a
more general structure with a more specific structure). Comparison
could highlight the constraints that are only in the more specific
structure. (GE)

## Closed

- 2005-09-21 Convert the treebanking tool to LUI (FCB and the NTT
treebankers)
  - this direction is being taken over by FFTB (the full forest
treebanker), which is separate from LUI...
- 2005-09-21 Use fontsets rather than fonts to allow greater language
coverage (FCB)
  - pretty much solved by Pavel in yzlui, will close when the pango
version becomes mainstream
- 2005-08-18 Multibyte fonts in the window titles. (FCB) **Done:**
2005-08-19 (WP)
- 2006-06-25 Display of fs for lexical entries.
(lkb::show-word-aux-tty "鬼" nil) **Done:** 2009-10-13 (actually
earlier by OE, FCB)

Last update: 2017-07-31 by GuyEmerson [[edit](https://github.com/delph-in/docs/wiki/LuiWishlist/_edit)]{% endraw %}