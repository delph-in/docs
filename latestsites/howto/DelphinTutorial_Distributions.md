{% raw %}# Background

DELPH-IN is committed to the open-source development model.
DELPH-IN resources typically are available under one of a small number
of open-source licenses (where the MIT Licesen and LGPL are the two most
common), and ongoing development is hosted in a version control system
(be it either on the main DELPH-IN servers or elsewhere). Development in
the past five or so years has exclusively focussed on GNU/Linux
environments.

Somewhat like GNU/Linux, there are several ways of obtaining an
installation of the DELPH-IN toolchain. DELPH-IN distributions differ in
their mode of delivery, philosophy, and maintainers—seeking to cater to
different target audiences.

# LinGO Builds

A core subset of DELPH-IN resources were originally packaged and
distributed by the [LinGO Laboratory](http://lingo.stanfor.edu); hence
this distribution is called the **LinGO Builds**, even though it is
nowadays maintained at the University of Washington. This distribution
bundles the LKB, [\[incr tsdb()\]](http://www.delph-in.net/itsdb), and
the ERG, i.e. the set of tools required for interactive grammar
development (plus one large grammar, for inspiration). LinGO Builds are
comprised of a set of tar(1) archives, combined with an automated
installer script (that downloads and unpacks archives), and some
collateral files to ease user-level setup. This environment was
originally created by StephanOepen but since 2010 is
managed by [DavidBrodbeck](/DavidBrodbeck); it is described (together
with mildly out-of-date information) on the
[LkbInstallation](https://delph-in.github.io/docs/tools/LkbInstallation) page. The contact address for this
distribution is lingo@delph-in.net.

# (Open) VirtualBox Appliance

[DavidBrodbeck](/DavidBrodbeck) at the University of Washington
maintains a [VirtualBox
Appliance](https://depts.washington.edu/uwcl/twiki/bin/view.cgi/Main/KnoppixLKB)
preloaded with Ubuntu Linux, the latest stable LinGO Build, emacs, and
font support for many languages. This is a convenient option for those
who would like to use the LKB and [\[incr
tsdb()\]](http://www.delph-in.net/itsdb), but do not already have a
GNU/Linux machine set up.

# The LOGON Tree

The LOGON Tree bundles a much larger set of tools and grammars than the
LinGO Builds, distributed via SVN, and pre-configured in a way that
eases interoperability and independence of configuration differences in
the host environment (e.g. different versions of the Java Runtime
Environment). For at least some grammars, this distribution is the
closest we have come to a ‘turn-key’ release channel; see the
[ErgProcessing](https://delph-in.github.io/docs/erg/ErgProcessing) page for an example. For these reasons,
the LOGON Tree is comparatively voluminous (requiring several gigabytes
of available disk space). This distribution was created and is
maintained by StephanOepen, and there is documentation
available on the [LogonTop](https://delph-in.github.io/docs/tools/LogonTop) page and its sub-pages. The
contact address for this distribution is logon@delph-in.net.

# Other Installation Options

As ACE matures, another viable run-time (if not yet grammar development
option) for at least some grammars may be through the pre-compiled ACE
(and ERG) binaries maintained by [WoodleyPackard](/WoodleyPackard) at
<http://sweaglesw.org/linguistics/ace/>.

Last update: 2013-07-30 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/DelphinTutorial_Distributions/_edit)]{% endraw %}