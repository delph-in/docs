{% raw %}# Simple psql use for single user mode Lex DB

Instructions for the installation of postgres will depend on your
operating system. It may be already installed or you may be able to
install it via RPMs. These particular instructions work for Fedora
machines in the Cambridge Computer Laboratory, but are described here in
the hope that it will be easier to find equivalents in other systems
than to start from the postgres documentation.

For Fedora Core, the necessary bundles are postgresql, postgresql-server
and postgresql-libs. Once the RPMs are installed, you need a location
for the database files, for instance:

    $ export PGDATA=/local/scratch/~aac10/pg-data

Then initialize:

    $ /usr/bin/initdb

If initialization is successful, the server can be started. e.g.,

    $ /usr/bin/pg_ctl -D /local/scratch/aac10/pg-data -l logfile start

We can then go ahead and create a lexical db, as described in
[LkbLexDbSingleUser](https://delph-in.github.io/docs/tools/LkbLexDbSingleUser).

The database will run under your user id, so this procedure is
unsuitable for the multi-user mode.

To stop the postgres server gracefully:

    /usr/bin/pg_ctl -D /local/scratch/$USER/pg-data stop

Last update: 2009-04-10 by AnnCopestake [[edit](https://github.com/delph-in/docs/wiki/LexDbSimplePsql/_edit)]{% endraw %}