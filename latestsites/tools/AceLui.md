{% raw %}## Installation

See [here](https://delph-in.github.io/docs/tools/LkbLui) for how to get the LUI binaries.

## Debugging Features in LUI mode

The LUI mode can be activated with the -l option, assuming yzlui exists
on PATH (also see [AceFaq](https://delph-in.github.io/docs/tools/AceFaq)). While in LUI mode, lots of
additional debugging features are available as "colon" commands:

| command         | description                                                                                                                                                                                                                                           |
| --- | --- |
| :c              | get the parse chart of the last processed item                                                                                                                                                                                                        |
| :r rule         | display the AVM of a grammar rule (e.g. `:r sb-hd_mc_c`)                                                                                                                                                                                              |
| :t type         | display the AVM of a grammar type (e.g. `:t synsem`)                                                                                                                                                                                                  |
| :l lex-entry    | display the AVM of a lexical entry (e.g. `:l sleep_v1`)                                                                                                                                                                                               |
| :g one two      | compute the GLB of types *one* and *two* (e.g. `:g + -`); results will be shown as text, not in a GUI                                                                                                                                                 |
| :h type         | show the local supertypes and subtypes of *type* (e.g. `:h head`); also shown as text                                                                                                                                                                 |
| :trigger [rule] | in generation mode, show which trigger rules fired and why; when *rule* is provided (e.g. `:trigger does1_pos_rule3`) , it will show more information about the particular rule (including why an unused rule didn't fire); results are shown as text |

## Getting the yzlui binary on your PATH

On Linux, you can get the yzlui binary from within the LOGON tree. You'll need to copy it to somewhere like `/usr/bin/` or else modify
your `PATH` environment variable to point to the directory containing yzlui. You will probably need to change permissions for the executable (in particular, give it permission to be executed). This can be done on linux and OSX e.g. by `chmod +x /usr/bin/yzlui`
You can also download a (relatively recent but not necessarily maximally up to date) yzlui binary from [here](http://sweaglesw.org/linguistics/yzlui.x86-64) (again, it will need to be renamed 'yzlui' and put somewhere visible to PATH).

On macOS, you can either:
* download `yzlui` directly from [here](http://sweaglesw.org/linguistics/yzlui-for-osx.tgz) and follow the INSTALL instructions
* install `ace` and `maclui` via homebrew: `brew install delph-in/delphin/ace delph-in/delphin/maclui`

Note also that, to use the LUI mode on macOS, you need to run ACE interactively and type the sentences: 

    ./ace -g path/to-grammar -l 

If you try to feed it a file, the LUI app will not stay open.

A few further tips for those not too familiar with Unix systems and terminal commands:

Suppose you downloaded the archive to your Desktop. You can typically expand it by double-clicking on it, but an alternative way is to open the Terminal application (use Search if you can't locate it immediately: the looking glass icon in the upper right corner) and type:

```bash
cd ~/Desktop
tar xzf yzlui-for-osx.tgz
cd yzlui-for-osx
```

Then to follow the instructions:

```bash
sudo cp yzlui /usr/local/bin
```

(it will prompt you to enter your administrator's password)

```bash
sudo cp *.dylib /usr/local/lib
sudo cp -r yzlui.app /Applications
```

If the last stop doesn't work, this maybe because Mac hides the extension of the file. In this case, note which file appears in the Finder as type "Application" and move it to the Applications folder manually.

Last update: 2022-08-31 by T.J. Trimble [[edit](https://github.com/delph-in/docs/wiki/AceLui/_edit)]{% endraw %}