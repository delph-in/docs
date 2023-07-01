{% raw %}# Grammar Engineering Frequently Asked Questions

## How do I use tab to help me figure out where my syntax error is?

tdl mode gives emacs some expectations about the syntax of tdl files.
Based on those expectations, emacs will automatically align any line if
you put the cursor on it and type tab.

If your syntax is correct, lines beginning with a feature name will
align so that features of the same type (= features at the same depth
within the feature structure) will be in the same column. Lines
beginning with \[ will line up so that the \[ is in the same column it
would be in if you hadn't put a newline before it.

If your syntax is incorrect, emacs will do its best to align things
based on the syntax you have actually coded. This usually means that the
feature or bracket will align somewhere that you can tell is wrong.

So, step by step:

- Find the type where you believe the error is.
- Don't bother with tab alignment on the line with := or the first
line with \[. (Sorry -- this is a bug in tdl-mode, it pushes the
first \[ much further to the right than you really want it.)
- Put your cursor on the next line, and hit tab.
- Keep doing down-arrow then tab until you get to the end of the type
definition, or you see something aligned funny.
- The syntax error is probably in the line above the line that aligned
funny. Check your close brackets, commas, and ampersands.

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqTabIndentation/_edit)]{% endraw %}