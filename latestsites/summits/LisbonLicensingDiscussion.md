{% raw %}## Discussion on Open Source Licensing and DELPH-IN Resources

Moderator: [WoodleyPackard](/WoodleyPackard)

Scribe: Jeff Good

### Background

The purpose of this discussion was to discuss what decisions DELPH-IN
needs to make with respect to software and documentation licenses.

### The current state of affairs

Many of the projects affiliated with DELPH-IN have already adopted
licenses of one sort or another. Some have no license. This is
summarized here:

- [PET](https://delph-in.github.io/docs/garage/PetTop), [Heart of Gold](https://delph-in.github.io/docs/garage/HeartofgoldTop), and [\[incr
tsdb()](https://delph-in.github.io/docs/tools/ItsdbTop)\] are all licensed under the [GNU Lesser General
Public License (LGPL)](http://www.gnu.org/copyleft/lesser.html)
- The [LKB](https://delph-in.github.io/docs/tools/LkbTop), ERG, and the [Matrix](https://delph-in.github.io/docs/matrix/MatrixTop) are all licensed
under the [MIT
license](http://www.opensource.org/licenses/mit-license.php)
- Hinoki and the German Grammar are closed
- The DELPH-IN wiki, the Norwegian Grammar, and the Modern Greek
Grammar are not currently under any specific license
- The group was unsure of the licenses used in tsdb(1) (the RDBMS
behind \[itsdb\]) and [YZ
Windows](http://yz-windows.sourceforge.net/) (which is used in
[LUI](https://delph-in.github.io/docs/tools/LkbLui))

### Aspects of licensing to consider

It was suggested that in choosing a license, resource creators consider
at least these three aspects of licensing:

- Attribution: Who must be cited when a DELPH-IN resource is used by
another project (either a project which is part of DELPH-IN or not)?
An open question is whether or not the DELPH-IN name should be
encouraged as being used in appropriate attribution of DELPH-IN
resources.
- Sharing: If a resource is to be distributed using an open source
license, do the resource creators also want to stipulate that any
new resources using that resource also be open source?
- Usage: Are there different requirements for commercial versus
non-commerical use of the resource?

DELPH-IN has not adopted any specific policies for any of these three
aspects of licensing. As discussed below, the current consensus is that
DELPH-IN should leave most licensing decisions up to those working on
the individual DELPH-IN projects.

### Which licenses might be suitable for DELPH-IN resources

All of the discussion in this section should be prefaced by the
disclaimer that no one participating was a lawyer and, therefore, none
of the comments or advice given here should be understood to be
completely accurate. Only a lawyer can give completely competent advice
in the area of licensing. More information on open source licensing can
be found in the [Open Source Initiative](http://www.opensource.org/) web
site.

A summary of different software licenses, including documentation
licenses, can be found on the [GNU Project's software licensing
page](http://www.gnu.org/philosophy/license-list.html).

For projects where open source licenses are a possibility, it was
discussed that the [GNU General Public License
(GPL)](http://www.gnu.org/copyleft/gpl.html) was probably not ideal for
many DELPH-IN projects since it requires any software using a library
licensed under the GPL to also be open source. This might be considered
too restrictive by corporate sponsors of DELPH-IN research. The LGPL and
MIT licenses adopted by some of the DELPH-IN projects are free software
licenses which do not have this added requirement. (NTT is an example of
a corporation which was satisfied with the LGPL but not the GPL.) It was
also suggested that the
[BSD](http://www.opensource.org/licenses/bsd-license.php) license might
be appropriate for DELPH-IN resources. This license allows the source
code of a project based on open source software to be closed if major
changes are made to it. In practice there appears to be little relevant
difference between the MIT and BSD licenses

Since choosing an appropriate license may be difficult for many DELPH-IN
members, it was suggested that members from projects who have chosen a
license discuss why they chose a particular license on the wiki. This
discussion may be helpful to projects which have not yet chosen a
license. The relevant wiki articles can be linked to from the
LicensingChoices page.

### Delph-In policies regarding licenses

There was general agreement that there should not be one required
license for all DELPH-IN resources. Rather, individual projects could
choose the license or licenses most appropriate for their needs.
Furthermore, since DELPH-IN is not a legal entity in any sense, DELPH-IN
itself can not license any resources. DELPH-IN's lack of legal status
probably also means it should not adopt a policy of distinguishing
between resources licensed for use by DELPH-IN projects and resources
licensed for use by other researchers (though licenses should be open to
distinguish between research and commercial uses of Delph-In resources).

However, it was also agreed that DELPH-IN should adopt the following
policies regarding licenses:

- All new DELPH-IN resources should be required to adopt some license
- DELPH-IN projects should publicize which licenses apply to their
resources
- The number of different licenses adopted by DELPH-IN projects should
be minimized to the extent possible

### Licensing the wiki

One of the more pressing concerns with regard to licenses and DELPH-IN
is associating the DELPH-IN wiki with an appropriate license. One of the
[Creative Commons](http://creativecommons.org/) licenses might be
appropriate.

AnnCopestake was unanimously approved as the DELPH-IN
member in charge of doing further research on a license for the wiki.
She is encouraged to contact those who have already contributed to the
wiki in deciding on a license for it.

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/LisbonLicensingDiscussion/_edit)]{% endraw %}