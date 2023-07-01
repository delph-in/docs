{% raw %}# Grammar Engineering Frequently Asked Questions

## The keyboard doesn't work in the \[incr tsdb()\] window -or- The keyboard doesn't work in Emacs after exiting \[incr tsdb()\]

This is a known problem with \[incr tsdb()\] and SCIM. You can
temporarily disable SCIM by running Emacs with the following command
line:

    XMODIFIERS=@im=none emacs 

There are [other workarounds](https://delph-in.github.io/docs/tools/ItsdbTroubleshooting) in the DELPH-IN wiki
that may be more elegant.

If you're working in the Treehouse, the following will fix the problem
permanently for your account:

- Make sure you have no SCIM-enabled applications open (emacs, vim,
etc.)
- Stop SCIM with

<!-- -->


    killall -r scim

- Edit \~/.scim/config
- Change

<!-- -->


    /FrontEnd/X11/Dynamic = false

to

    /FrontEnd/X11/Dynamic = true

- Log out and log back in, or restart SCIM by running

<!-- -->


    scim -d

- If you get a "skull and crossbones" mouse cursor in the \[incr
tsdb()\] window, reboot the machine. It should work normally after
that.

For Treehouse users, the default configuration file for new accounts was
changed on February 25, 2009, so you should only have to do this if your
account was created before that date.

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqKeyboardNotWorking/_edit)]{% endraw %}