{% raw %}# Discussion: Packaging and Delivery

July 20 (Mon) 16:30--17:00

# Moderator: Emily Bender, Francis Bond; Scribe: Richard Bergmair

Recent great improvements in ease of deployment of DELPH-IN tools. SVN,
LOGON distribution, ubuntu-nlp. Some issues remain --- loss of working
windows version of LKB, a lot of reliance on Oslo, components are not
tested in a variety of environments.

# Objective

- share knowledge of the various "distributions"
  - LinGO
  - LOGON
  - UW bootable disc
  - Ubuntu NLP
  - HoG
- dependency on CLIM (and Allegro CL)
- discuss the state of DELPH-IN tools on other OSes (Mac, MS)
- where should we package glue scripts? In the grammar or in the
distribution?
- can we define sensible defaults for these
  - client scripts
  - skeletons
  - tsdb cpu definitions
- where should we put "universal" files?
  - predicates.tdl, mrs.tdl mtr.tdl
- How to add new tools to the distributions?

Some additional background:

      Date: Tue, 21 Apr 2009 14:50:25 +0900
      From: Francis Bond <fcbond@gmail.com>
      To: participants@delph-in.net
      Subject: [delph-in] DELPHIN Agenda
    
      G'day,
    
      On the developers list Emily suggested:
    
      > I've had conversations with some of you about breaking free of
      > Franz: My question is whether we could pool the funds we would be
      > putting into these licenses for the next couple of years and use them
      > to hire someone to do the UI coding necessary to undo our reliance
      > on CLIM.  Perhaps it's time to renew that discussion?
    
      I propose this to be added for the agenda at the upcoming Summit at
      Barcelona.   I volunteer to chair the session, and would like to
      request any developers who will be attending, especially people
      working on the LISP code base, to attend.
    
      Date: Tue, 21 Apr 2009 16:38:09 +0100
      From: Ann Copestake <Ann.Copestake@cl.cam.ac.uk>
      To: bond@ieee.org
      Cc: Ann.Copestake@cl.cam.ac.uk, participants@delph-in.net
      Subject: Re: [delph-in] DELPHIN Agenda
    
      I'm afraid I won't be able to make it to the Barcelona meeting.
      I had assumed I'd be able to escape from JHU for a couple of days
      but it turns out that's not possible.  I'll try and participate
      in this session via some sort of videolink, however.
    
      I'm afraid we're not buying ACL licences here, other than the
      single user Windows licence, so there isn't any significant money
      for the pool.  I'm expecting to distribute SBCL versions of the
      *MRS code at some point (separate from the LKB).  Most currently
      looks OK under SBCL - it's a matter of tidying it up and keeping
      it working.

### SBCL Known Issues

- No CLIM =&gt; no text entry box, no type hierarchy viewer
- no [\[incr tsdb()\]](http://www.delph-in.net/itsdb) &lt;old, partial
patch available from Ben&gt;
- no LOGON (=&gt; no web demonstrators, among other things)
- not yet a consensus to support it for all subsytems

# Notes

## Windows support

Windows problem is an issue because Bulgarian friends of Valia's were
trying to "join" the group, and were trying to use Windows. Francis has
had numerous requests from Korea etc. as well.

Dan reports that Ann values her Windows user group as well, and that she
thinks that VirtualBox is a possible solution to that, and has tested
it.

Stephan: It seems we are no longer supporting Windows. Hoping that
Cambridge (possibly together with UW) will provide instructions for less
technically-minded users to use the VirtualBox solution.

Emily: UW sys-admin could support the live CD, which is also used for
teaching at UW.

Stephan: At Oslo we're commited to continue supporting the Linux license
for Allegro, so a similar problem to the Windows problem should not
occur for Linux.

Emily: UW does as well.

Fracis: NICT no longer does.

## Can we break free of Allegro?

Dan: Ann has focused on MRS code, core functionality for porting to
SBCL.

Yi: Bernd Kiefer is working (in his own time) on a Java visualization
utility to interface with PET. (potential replacement of the current
CLIM functionality).

Dan: There is free "slave labor" for this as Bernd is teaching a Java
class and has students working on it.

Francis: long range goal, as SBCL is still not a viable replacement for
what we are doing with CLIM. no consensus to support SBCL for all
subsystems.

Berthold: still font issues with LUI.

Francis: code for pango-LUI now available

Francis: Perhaps the only reason why DELPH-IN hasn't taken Japan in a
storm is that you can't enter Japanese into a parse window. At least we
can cut and paste now. :wink:

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/BarcelonaPackaging/_edit)]{% endraw %}