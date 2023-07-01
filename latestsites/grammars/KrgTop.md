{% raw %}This is a page for up-to-date notes on running the [Korean Resource
Grammar](http://krg.khu.ac.kr).

The Korean Resource Grammar was originally built by
JongBokKim and [JaehyungYang](/JaehyungYang). A revised
matrix-compliant version has been rebuilt by
SanghounSong and FrancisBond --- the KRG
now both parses and generates.

### Encoding Issues

- CLIM does not currently support entering Korean directly under
linux. Instead, we recommend you enter it though emacs.
- To show Korean in the output either
  - use pangolui (see *Alternative Lui Implementations* on the
[LkbLui](https://delph-in.github.io/docs/tools/LkbLui) page) (FrancisBond recommends
this)
  - specify Korean fonts in the .luirc (see [LuiRc](https://delph-in.github.io/docs/tools/LuiRc))

### Tokenizing

- There are three script files; lkb/script, lkb/script.common,
lkb/test.
- lkb/script: If you take this, the input string should be fully
tokenized.
- lkb/script.common: If you take this, you can input just common
Korean sentences. This script will operate the pre-processor for
parsing and generation.
- lkb/test: If you want to test each grammar module with a small size
of lexicon, please take this.

Last update: 2011-10-10 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/KrgTop/_edit)]{% endraw %}