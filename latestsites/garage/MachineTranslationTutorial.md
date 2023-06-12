{% raw %}How to set up an MT system.

- 1 take three grammars
  - A parser that can parse (and returns mrs) PET preferred
    - Note: ERG requires some repp stuff loaded

<!-- -->


     (tsdb::tsdb :cpu :mrs :file t)

- A transfer grammar

<!-- -->


     (lkb::read-script-file-aux "~/logon/uio/enja/lkb/script")

- one that can generate (and works as a generation server)

<!-- -->


    (lkb::read-script-file-aux "~/logon/dfki/jacy/lkb/script")
    (lkb::index-for-generator)
    (lkb::start-generator-server)

- vpm mappings for everything in both directions

<!-- -->


- 2 See example systems in logon/uio
  - set up the translation grid in lkb/script

## Useful Pages

- [NoJa](https://delph-in.github.io/docs/tools/NoJa) --- an early adopter --- gives outlines of what to
change and where
- [LogonTransfer](https://delph-in.github.io/docs/tools/LogonTransfer) --- Transfer Rules

Last update: 2010-06-14 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/MachineTranslationTutorial/_edit)]{% endraw %}