{% raw %}Here are some note about installing the HoG on different distributions.

## Japanese Configuration

### ChaSen

You must have [ChaSen](http://chasen.naist.jp) installed, and it must
use the IPA dictionaries.

You then configure the path names in hog/conf/ja/chasen.cfg.

    # path to server binary
    chasen.binary=/usr/bin/chasen
    # path to libraries for server
    chasen.libs=components/chasen/lib

And the dictionary path name in hog/conf/ja/chasenrc-xml:

    (GRAMMAR  /usr/share/chasen/dic/ipadic)

And in hog/components/sprout/Project:

    MorphologyApplicationPath=/usr/bin/chasen

**Note** this is usually the same as chasen.binary.

#### Debian/Ubuntu

How to get [ChaSen](http://chasen.naist.jp/):

    sudo apt-get install chasen ipadic

#### SuSE/Fedora

install the chasen and ipadic packages

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/HogInstallation/_edit)]{% endraw %}