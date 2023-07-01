{% raw %}(comment: Why not merge this page with [LkbEmacs](https://delph-in.github.io/docs/tools/LkbEmacs)?)

There are some emacs lisp extensions to make life easier when you are
running the [LKB](https://delph-in.github.io/docs/tools/LkbTop) from within [emacs](https://delph-in.github.io/docs/tools/LkbEmacs),

lkb.el (available
[here](http://svn.emmtee.net/trunk/lingo/lkb/src/lkb.el)) adds an LKB
menu to the emacs menu bar and provides some useful keybinds (see
below).

tdl-mode.el (available
[here](http://svn.emmtee.net/trunk/lingo/lkb/src/tdl-mode.el)) creates a
mode for editing TDL called tdl-mode that provides syntax
highlighting and lines up elements in the tdl expressions.

Install with:

    ;;; load them
    (load-file "/path/to/lkb.el")
    (load-file "/path/to/tdl-mode.el")
    ;;; use it for .tdl and .mtr files
    (add-to-list 'auto-mode-alist '("\\.tdl\\'" . tdl-mode))
    (add-to-list 'auto-mode-alist '("\\.mtf\\'" . tdl-mode))
    ;;; make a menu of types in this file
    (add-hook 'tdl-mode-hook
              (function (lambda ()
                          (imenu-add-to-menubar "Types"))))

They are both installed as part of [Logon](https://delph-in.github.io/docs/tools/LogonTop).

## Key Bindings

There are also some general key bindings for controlling the lkb when
using [LkbEmacs](https://delph-in.github.io/docs/tools/LkbEmacs).

The "⁁" shows where the cursor is placed at the end of the command.

- **C-c p**: parse using the main grammar (lkb::do-parse-tty "⁁")

<!-- -->


- **C-c r**: parse using a client grammar
  
  - (mt::parse-interactively "⁁")
  
  **C-c u**: start a client grammar
  
  - (tsdb::tsdb :cpu :⁁ :file t)
  
  **C-c g**: load a grammar
  
  - (lkb::read-script-file-aux "\~/⁁/lkb/script")
  
  **C-c G**: reload a grammar
  
  **C-c i**: index for generation
  
  **C-c I**: reload and index grammar
  
  **C-c l**: show a word (unexpanded)
  
  - (lkb::show-word-aux-tty "⁁" nil)
  
  **C-c L**: show a word (expanded)
  
  - (lkb::show-word-aux-tty "⁁" t)

You can also use commands from Inferior Common Lisp, such as the
extremely useful:

- **C-c C-p**:find the previous command
  
  - fi:pop-input
  
  **C-c C-n**: find the next command in the ring
  
  - fi:push-input

#### Troubleshooting

Older versions of emacs use insert-string(), while newer versions use
insert(). The newest version of lkb.el can handle both (thanks to
Stephan Oepen and Joshua Crowgey).

Last update: 2020-05-02 by AlexandreRademaker [[edit](https://github.com/delph-in/docs/wiki/LkbMode/_edit)]{% endraw %}