{% raw %}## Obtaining Egad

You can get the original Egad Perl scripts here.
[goodmami.org/files/projects/egad.tgz](http://goodmami.org/files/projects/egad.tgz)

## Preparing Egad for Use

The current version is not ideal for distribution, so you will need to
do a few steps before you can use it. In the "use ..." sections of both
analyze-profile.perl and analyze-derivation.perl, you will need to
change the directory /home/goodmami to something more meaningful for
your setup. Further, you may need to change the statements "use
Delphin::XYZ..." to "use egad::XYZ...".

## Next Version of Egad

Egad is undergoing a rewrite into Python, and the resulting module will
be easier to setup and use. We suggest you wait for that version. See
<https://launchpad.net/egad> for developments.
<update date omitted for speed>{% endraw %}