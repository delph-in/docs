{% raw %}# Page Status

This page presents user-supplied information, hence may be inaccurate in
some details, or not necessarily reflect use patterns anticipated by the
[\[incr tsdb()\]](http://www.delph-in.net/itsdb) developers. This page
was initiated by FrancisBond; please feel free to make
additions or corrections as you see fit. However, before revising this
page, one should be reasonably confident of the information given being
correct.

# Distributed Processing

Contents

1. [Page Status](https://delph-in.github.io/docs/tools/ItsdbDistributedProcessing#Page_Status)
2. [Distributed Processing](https://delph-in.github.io/docs/tools/ItsdbDistributedProcessing#Distributed_Processing)
   1. [CPU definitions](https://delph-in.github.io/docs/tools/ItsdbDistributedProcessing#CPU_definitions)
   2. [Activating CPUs](https://delph-in.github.io/docs/tools/ItsdbDistributedProcessing#Activating_CPUs)

Parsing in [\[incr tsdb()\]](http://www.delph-in.net/itsdb) (see
[ItsdbTop](https://delph-in.github.io/docs/tools/ItsdbTop)) can be distributed over several machines. This is
done over the parallel virtual machine (PVM) interface.

Client processors are called *cpu*s. Each cpu is usually described in
terms of a host (node in the **pvm** virtual machine that is used to run
the client), the command to start the client (i.e. a binary executed on
the remote machine), optional startup options, and one or more class
identifier(s) used to refer to individual cpus or cpu groups; [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) cpu descriptions can include
additional information like the **custom** data passed to the client on
test run creation and completion.

A new [\[incr tsdb()\]](http://www.delph-in.net/itsdb) **client** (or
client task) is created each time a cpu is activated (or initialized);
activating a cpu here means to request (from the **pvm** daemon
responsible for the node in question) that the command associated with
the cpu be executed; after process creation the client itself is
responsible for registration with the [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) server (typically through
execution of the slave() function presented) a client process on some
node in the virtual machine that the [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) can communicate with by virtue
of the application program interface.

## CPU definitions

Usually, users will have a set of [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) cpus to choose from; when
preparing for a test run, a selection from the set of available cpus is
made to create clients as needed. The per-user configuration file
\~/.tsdbrc (see [ItsdbCustomization](https://delph-in.github.io/docs/tools/ItsdbCustomization)) can be used to
enumerate a list of cpus (similar to the **pvm** node listing in the
\~/.pvm\_hosts file).

    (setf *pvm-cpus*
      (list
       (make-cpu 
        :host "ld.at.coli.uni-sb.de" :class '(:cheap :cheap@ld)
        :spawn "/proj/perform/lbin/cheap"
        :options '("-tsdb" "/proj/perform/lingo/current/english.gram"))
       (make-cpu 
        :host "ld.at.coli.uni-sb.de" :class '(:cheap :cheap@ld)
        :spawn "/proj/perform/lbin/cheap"
        :options '("-tsdb" "/proj/perform/lingo/current/english.gram"))
       (make-cpu 
        :host "ld.at.coli.uni-sb.de" :class :one
        :spawn "/proj/perform/lbin/cheap"
        :options '("-tsdb" "-one-solution" "-default-les" 
                   "/proj/perform/lingo/current/english.gram"))
       (make-cpu 
        :host "top.coli.uni-sb.de" :class :lkb
        :spawn "/proj/perform/nacl/bin/acl"
        :options '("-L" "/proj/perform/lkb/startup")
        :create "/proj/perform/lingo/current/lkb/script")))

Sample definition of [\[incr tsdb()\]](http://www.delph-in.net/itsdb)
cpus (taken from a user .tsdbrc file): the class name(s) chosen --- at
least in some cases --- reflect the client type as well as the node used
to run the client.

## Activating CPUs

\* You can start a cpu as follows (in the \*common-lisp\* buffer:

    (tsdb::tsdb :cpu :cheap :file t)

\* You can start 2 instances of a cpu as follows (useful if you have
machines with multiple cpus):

    (tsdb::tsdb :cpu :nihongo :file t :count 2)}

\* You can list all available cpus (as defined in \*pvm-cpus\* with:

    (tsdb::tsdb :cpu :list)

The full set of possibilities is

    (tsdb::tsdb :cpu [ name ] [ :file string ] [ :reset bool ] [ :count n ]
               [:active]  [:help] [:kill]

\* :cpu \[ name \] list or activate \[incr tsdb()\] cpus; keyword is a
class name (used in the cpu definition) that identifies which client(s)
to start;

\* \[ :file string \] write client output to file string (defaults to
/tmp/pvm.debug.user' --- where user' is the active account name; \`t' as
the :file argument means client output goes to standard out).

\* \[:reset boolean\] defaults to \`t' and shuts down all existing cpus
before initialization; set to nil to add new clients while keeping the
exisiting ones

\* \[:count n\] defaults to \`1' and determines the number of instances
of the cpu to be started;

\* \[:active\] or no keyword argument lists currently active clients;

\* \[:list\] provides a summary of all available client definitions;

\* \[:kill\] shuts down all existing clients; this makes the \[LKB
[LkbTop](https://delph-in.github.io/docs/tools/LkbTop)\] the default client.

(setf \*process-raw-print-trace-p\* t) will make the print-out while
going through a test run look nicer.

Last update: 2012-08-07 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/ItsdbDistributedProcessing/_edit)]{% endraw %}