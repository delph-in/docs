{% raw %}# Overview

The LOGON tree makes heavy use of the SVN revisioning system. For
example, both *tagged* 'release' snapshots and the 'bleeding-edge'
development *trunk* are available through SVN. This page provides some
general suggestions for LOGON-related SVN use.

# Switching from a Tagged Version to the Trunk or Vice Versa

It is possible to *switch* a working copy from one revision in the SVN
repository to another revision (of the same data, conceptually), without
having to do a complete, fresh check-out. Please consult the [SVN
documentation](http://svnbook.red-bean.com/) for details, but the
*switch* command works very similar to the *update* command. In
particular, it should be save to switch over a working copy even if
there are local modifications in the working copy. SVN is expected to do
The Right Thing™ in this situation.

Assume that you initially checked out a copy of the so-called
*Barcelona* release (i.e. the revision of the system available as
http://svn.emmtee.net/tags/barcelona/). To move your working copy of the
LOGON tree to the latest and greatest (and at times untested)
development trunk, do the following:

      cd $LOGONROOT
      svn switch http://svn.emmtee.net/trunk

Note that the *switch* sub-command may recurse into directories that are
switched already, for example those that contain optional, add-on
components. Unless there are local modifications, *switch* will override
the effects of earlier *switch* commands. Thus, to completely switch
over a tree from one universe to another, it may be necessary to apply
additional *switch* commands on directories that correpond to add-on
components; see the [LogonExtras](https://delph-in.github.io/docs/tools/LogonExtras) page for details. In
determining which parts of a local copy correspond to which revisions in
the repository, the SVN sub-commands *status* and *info* can be very
convenient.

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/LogonSvn/_edit)]{% endraw %}