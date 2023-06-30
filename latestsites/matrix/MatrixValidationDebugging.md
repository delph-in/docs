{% raw %}The way to debug these "no asterisk errors": Go into deffile.py to the
place where the "Create Grammar" button is being created. Instead of
passing in "len(errors) &gt; 0" as the last argument to html\_input()
(which disables the button if there are any errors), pass in "False"
instead. Then you can click the "Create Grammar" button and see the
old-style list-of-error-messages page. (sfd 6/29/09)

Last update: 2009-06-30 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/MatrixValidationDebugging/_edit)]{% endraw %}