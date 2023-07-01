{% raw %}# Grammar Engineering Frequently Asked Questions

## When I try to load my grammar/the matrix, the LKB says "Error: Attempt to take the value of the unbound variable ...". What am I doing wrong?

You are probably telling the LKB to load the wrong file. Load your
grammar by selecting "Load &gt; Complete grammar" from the LKB top menu
and then specifying the file lkb/script (not matrix.tdl or
esperanto.tdl) in your matrix directory.

If you are specifying the script file, and you're still getting this
error, you may have a corrupted version of the file. Open the file in
emacs and look to see if there are any extraneous characters (especially
at the beginning).

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqLoadScript/_edit)]{% endraw %}