{% raw %}# Using Apache Ant for Testing DELPH-IN Tools and Resources

(UlrichSchaefer)

A short description of SProUTomat can be found
[here](http://www.dfki.de/~uschaefer/sproutomat/). Here is the [LREC-06
paper](http://www.dfki.de/dfkibib/publications/docs/sproutomat.pdf).

I start with a short description of ant I copied from
<http://ant.apache.org> :

* * *

*Apache Ant is a Java-based build tool. In theory, it is kind of like
Make, but without Make's wrinkles.*

*Why another build tool when there is already make, gnumake, nmake, jam,
and others? Because all those tools have limitations that Ant's original
author couldn't live with when developing software across multiple
platforms. Make-like tools are inherently shell-based -- they evaluate a
set of dependencies, then execute commands not unlike what you would
issue in a shell. This means that you can easily extend these tools by
using or writing any program for the OS that you are working on.
However, this also means that you limit yourself to the OS, or at least
the OS type such as Unix, that you are working on.*

*Makefiles are inherently evil as well. Anybody who has worked on them
for any time has run into the dreaded tab problem. "Is my command not
executing because I have a space in front of my tab!!!" said the
original author of Ant way too many times. Tools like Jam took care of
this to a great degree, but still have yet another format to use and
remember.*

*Ant is different. Instead of a model where it is extended with
shell-based commands, Ant is extended using Java classes. Instead of
writing shell commands, the configuration files are XML-based, calling
out a target tree where various tasks get executed. Each task is run by
an object that implements a particular Task interface.*

*Granted, this removes some of the expressive power that is inherent by
being able to construct a shell command such as
\`find . -name foo -exec rm {}\`, but it gives you the ability to be
cross platform -- to work anywhere and everywhere. And hey, if you
really need to execute a shell command, Ant has an &lt;exec&gt; task
that allows different commands to be executed based on the OS that it is
executing on.*

* * *

The only prerequisite for running ant is a Java JRE (JDK if Java
compilation is required), and via Java, the most important platforms are
supported, like Windows, Linux, Solaris, Mac OS etc.

Advantages I see in the DELPH-IN context:

- platform-independent (except for some very special external tasks)
- widely used, e.g. standard in Eclipse
- powerful patternset, fileset, filemapper, filterset, filterchain
mechanism
- user-definable tasks (java class)
- external binaries can be called (exec)
- support for BSF subshells
- plugin-mechanism for third-party extensions
- many usually platform-dependent tools can be called platform
independently:
  - zip, tar, gzip, bzip, jar, javadoc, SQL, SMTP, file/dir
operations, ftp, perforce, scp, sshexec, telnet, checksum,
buildnumber
- pre-defined external platform-dependent tasks: rpm, cab etc.
- built-in integration of XSLT and XML validation
- parallelism (using Java threads), sequence, waitfor
- configuration (e.g. default values for properties/variables) via
property files

Disadvantages:

- variables are write-once only (first setting wins e.g. command line
args overwrite internal defaults; i.e. similar to XSLT variables)
- no &lt;if&gt; construct (could be added using a plug-in)
- svn support still only via plug-in (will probably be integrated in
the near future)

BTW Heart of Gold already uses a (quite) small ant build script for
compiling, starting, generating stylsheets etc.: file hog/build.xml in
the source tree

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/TestingWithAnt/_edit)]{% endraw %}