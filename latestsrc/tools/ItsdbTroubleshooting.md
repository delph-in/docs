{% raw %}# Page Status

This page presents user-supplied information, hence may be inaccurate in
some details, or not necessarily reflect use patterns anticipated by the
[\[incr tsdb()\]](http://www.delph-in.net/itsdb) developers. This page
was initiated by FrancisBond; please feel free to make
additions or corrections as you see fit. However, before revising this
page, one should be reasonably confident of the information given being
correct.

Contents

1. [Page Status](https://delph-in.github.io/docs/tools/ItsdbTroubleshooting#Page_Status)
2. [Debugging Distributed Mode](https://delph-in.github.io/docs/tools/ItsdbTroubleshooting#Debugging_Distributed_Mode)
   1. [communication error -6](https://delph-in.github.io/docs/tools/ItsdbTroubleshooting#communication_error_-6)
   2. [communication error -7](https://delph-in.github.io/docs/tools/ItsdbTroubleshooting#communication_error_-7)
   3. [client exit for 'user'](https://delph-in.github.io/docs/tools/ItsdbTroubleshooting#client_exit_for_.27user.27)
      1. [parse-interactively(): error \`maximum number of active
sessions
exhausted'](https://delph-in.github.io/docs/tools/ItsdbTroubleshooting#parse-interactively.28.29:_error_.60maximum_number_of_active_sessions_exhausted.27)
3. [Keyboard Freeze](https://delph-in.github.io/docs/tools/ItsdbTroubleshooting#Keyboard_Freeze)
4. [Podium font too big](https://delph-in.github.io/docs/tools/ItsdbTroubleshooting#Podium_font_too_big)

# Debugging Distributed Mode

## communication error -6

    (tsdb::tsdb :cpu :jacy :file t)
    initialize-cpus(): `merlot' communication error [-6].

This normally means that the hostname is wrong. Check using pvm what
hosts pvmd thinks are available. A common mistake is to use merlot
instead of merlot.domain.county or the other way round.

## communication error -7

    (tsdb::tsdb :cpu :jacy :file t)
    initialize-cpus(): `merlot' communication error [-7].

Check that the path to the grammar, cheap instance and so on are
correct. Also that cheap and tsdb are linked to the same version of the
pvm libraries.

## client exit for 'user'

    (tsdb::tsdb :cpu :jacy :file t)
    
    [t40002] BEGIN
    [t40002] Reading ...
    ...
    [t40002] EOF
      wait-for-clients(): client exit for 'user' <262146>
    NIL

This probably means that cheap has died! Try calling cheap as:
cheap -tsdb language.grm to see if it is working properly in tsdb mode.
This was a common problem in 2004.

### parse-interactively(): error \`maximum number of active sessions exhausted'

If after loading your grammar, the parser, the transfer grammar, and the
generator, you encounter such in error then it might be that your \~/tmp
directory contains some old rubbish .pvm files that need to be removed
manually.

- Remove any .pvm files and restart your logon process and try again.

# Keyboard Freeze

If you are using SCIM as an input mode (the default for recent Debian
and Ubuntu), then the keyboard may freeze when you try to type in the
podium.

Three fixes:

- Set /FrontEnd/X11/Dynamic = true in \~/.scim/config Note that you
may have to stop scim first, as it ovewrites the file when it stops
- Use **scim-bridge**

<!-- -->


    sudo apt-get install scim-bridge

- edit /etc/X11/xinit/xinput.d/scim
  
  change GTK\_IM\_MODULE=xim to GTK\_IM\_MODULE="scim-bridge"
  
  restart scim: scim -d.
- switch to using **uim**

<!-- -->


    sudo apt-get remove scim scim-bridge
    sudo apt-get install uim uim-el

# Podium font too big

Add a scaling factor to your .swishrc

    tk scaling -displayof . 1.0

Last update: 2012-08-07 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/ItsdbTroubleshooting/_edit)]{% endraw %}