{% raw %}# Grammar Engineering Frequently Asked Questions

## How do I interact with the LKB through the Lisp prompt?

The LKB prompt in the common-lisp buffer is actually a Lisp prompt, so
you can of course type arbitrary Lisp code there (including any
functions defined in the LKB system). Some useful things that you might
find yourself doing often include:

- (lkb::read-script-file-aux "/path/to/lkb/script"): This is the same
as "Load &gt; Complete grammar..." from the LKB Top menu, except
that any errors or warnings are printed out in the emacs buffer
instead of the LKB Top menu window, which can be useful. The
shortcut for getting this command is C-c g.
- (lkb::do-parse-tty "example sentence"): This is the same as
"Parse &gt; Input" from the LKB Top menu. The shortcut for getting
this command is C-c p.
- (lkb::lui-initialize): Start the LUI interface.
- (lkb::lui-shutdown): Shut down the LUI interface and return to CLIM.
- (setf \*maximum-number-of-edges\* 10000) increase edge limit to find
deeper parses
- (setf \*maximum-number-of-edges\* 100) decrease edge limit to debug
rule spinning

Some of these commands assume you have lkb.el loaded and are in
lkb-mode, if so there are even more commands [documented here](https://delph-in.github.io/docs/tools/LkbMode).

Some additional useful emacs short cuts include:

- C-c C-p: Scroll backward through the previous commands.
- C-c C-n: Scroll forward through the previous commands.
- C-x b: Switch buffers
- C-r: Search backwards. E.g., C-r pt-f is useful for finding the last
"read-script-file-aux" command. Once you are there, just hitting
return will cause it to be run again.
- M-x goto-char: In your TDL file, move to the character position
indicated by an LKB error.

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqLispPromptTips/_edit)]{% endraw %}