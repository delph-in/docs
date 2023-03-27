{% raw %}The so-called HandOn release comprises the state of development as of
early 2008, i.e. at the completion of the
[HandOn](http://emmtee.net/index.php?page=7&lang=en) project on scaling
up the LOGON Norwegian–English MT demonstrator.

# (1) LOGON Redwoods Treebanks (Public)

The core directory lingo/redwoods/ contains the environment for
semi-automated parse selection, realization ranking, and MRS re-ranking
experiments, using treebanked versions of the LOGON tourism corpora. In
the *core* installation, this directory only contains the scripts and
various configuration files for such experimentation, but not the
treebanks or corresponding version of the ERG. To download the complete
data, execute the following:

      cd $LOGONROOT/lingo/redwoods
      svn switch http://svn.emmtee.net/extras/handon/lingo/redwoods

The SVN *switch* command makes a sub-directory of an SVN-controlled tree
point to a different module from the same repository (i.e. it does not
allow 'mixing and matching' across repositories). Please see the [SVN
documentation](http://svnbook.red-bean.com/) for further information.

# (3) LOGON Norwegian–English Evolution Profiles (Public)

For several of the LOGON development data sets and the final test set
(which only became available after completion of system development),
historic [\[incr tsdb()\]](http://www.delph-in.net/itsdb) profiles (and
fan-out log files) are available. These profiles document (in great
detail) development progress made in the course of the original
[LOGON](http://www.emmtee.net/) and
[HandOn](http://www.emmtee.net/index.php?page=7) projects. To add this
data to your LOGON tree, do

      cd $LOGONROOT/uio/evolution
      svn switch http://svn.emmtee.net/extras/handon/uio/evolution

To analyze the evolution of the LOGON Norwegian–English instantiation,
point [\[incr tsdb()\]](http://www.delph-in.net/itsdb) to uio/evolution/
as its datatabase directory and experiment with the commands in its
*Evolution* menu.

# (6) XLE LFG System (Restricted)

For the full Norwegian–English system (but not other language pairs), a
copy of the proprietary [XLE](http://www2.parc.com/isl/groups/nltt/xle/)
software is required. If your site holds a valid license, the following
command will agument the *core* LOGON tree with the XLE software:

      cd $LOGONROOT/parc/xle
      svn switch http://logon.emmtee.net/extras/handon/parc/xle

# (7) Norwegian–English Dictionary (Restricted)

The LOGON project licensed *Norsk–Engelsk Stor Ordbok* from
*Kunnskapsforlaget* for use in the project. For the remaining duration
of the LOGON project proper, members of the original consortium can
install a copy of the XML files for the dictionary as follows:

      cd $LOGONROOT/kf
      svn switch http://logon.emmtee.net/extras/handon/kf .

This dictionary was used for the Norwegian–English demonstrator to
auto-generate transfer rules for open-class words with predictable
properties, mostly nouns and adjectives. The licensing agreement with
*Kunnskapsforlaget* (probably) does not allow public distribution of
these derived transfer rules, hence they are not part of the *core*
LOGON tree. To re-generate these transfer rules, once you have
successfully installed the dictionary, execute

      cd $LOGONROOT/uio/noen
      ./trag --kf

This process should take a little while (thirty minutes to two hours,
maybe, depending on the type of machine that you have available). It
should result in new files kf.a.mtr, kf.n.mtr, and kf.nn.mtr, containing
on the order of 15,000 transfer rules.

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/LogonHandon/_edit)]{% endraw %}