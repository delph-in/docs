{% raw %}See also [LogonUbuntu](https://delph-in.github.io/docs/tools/LogonUbuntu).

# Debian 8 -&gt; 9: libpng12

Autumn 2016:

After upgrading my Debian 8 "jessie" system to Debian 9 "stretch", I
found that libpng12 has been removed from the repos for libpng16.
Because clim requires libpng12, the solution for me was to add 'jessie'
to my sources list and then install libpng12-0.

For example, I track debian testing, which entails my upgrade to
"stretch" when "jessie" went stable. So, I had to add "stable" back to
my sources in order to see packages only in "jessie".

    deb http://ftp.us.debian.org/debian testing main contrib non-free  
    deb-src http://ftp.us.debian.org/debian testing main contrib non-free  
    deb http://ftp.us.debian.org/debian stable main contrib non-free  
    deb-src http://ftp.us.debian.org/debian stable main contrib non-free
    
    deb http://ftp.debian.org/debian/ testing-updates main contrib non-free  
    deb-src http://ftp.debian.org/debian/ testing-updates main contrib non-free  
    deb http://ftp.debian.org/debian/ stable-updates main contrib non-free  
    deb-src http://ftp.debian.org/debian/ stable-updates main contrib non-free

After that apt-get update and then the missing package is available:

    jcrowgey@quercus:~$ apt-cache search libpng12 
    libpng12-0 - PNG library - runtime 
    libpng12-dev - PNG library - development 
    libpng3 - PNG library - runtime

After sudo apt-get install libpng12-0, logon functionality is restored.

This mailing list thread contains some discussion including the error
logs observed:
<http://lists.delph-in.net/archives/developers/2016/002334.html>

Update 06-10-2016: oe added libpng12-0 and a handful of other shared
libs to the logon tree, so this issue may not exist anymore.

Last update: 2016-10-06 by JoshuaCrowgey [[edit](https://github.com/delph-in/docs/wiki/LogonDebian/_edit)]{% endraw %}