{% raw %}# HOW TO initialize PostgreSQL server

- These instructions are appropriate for the multi-user mode of the
[LexDb](/LexDb). They should also work for single user mode, but
single user mode allows for a set up where the user is the database
owner. Multi-user mode requires that the database users postgres and
lexdb are set up as described below.
- [PostgreSQL server](http://www.postgresql.org/download/) version 8.0
or above must be running either on the local machine or remotely
over a TCP/IP port. You should set the database locale to C; eg. use
the --locale=C option when initializing the server with initdb, or
select the C locale when prompted by the M$ Windows installer.
- Create user accounts.
- Configure access privileges.
- By default the server will run on port 5432. To use another port set
the PSQL [environment
variable](http://www.postgresql.org/docs/7.4/interactive/libpq-envars.html)
PGPORT.
- Restart PostgreSQL server.

*Notes:*

- Selecting a non-C locale hurts performance by disabling index
optimizations for certain operators -- see
<http://www.postgresql.org/docs/8.0/static/charset.html>. The
environment variables LC\_COLLATE and LC\_CTYPE are recorded during
server initialization and automatically adopted at server startup.
It is perfectly safe to later select a different (non-C) locale when
creating a database within the server.

## Create User Accounts

- Ensure there exists a database user postgres with superuser
privileges.
- As the database superuser, create a database user lexdb who will
manage the database:
  
  - {{{ $ createuser -U postgres --createdb --no-adduser lexdb

CREATE USER}}}

- \[Optional\] If you wish to use password authentication add the -P
option.

<!-- -->


- As the database superuser, create a user account for yourself
(substitute your shell login for USERNAME below):
  
  - {{{ $ createuser -U postgres --no-createdb --no-adduser USERNAME

CREATE USER}}}

- \[Optional\] If you wish to use password authentication add the -P
option.

## Configure Access Privileges

### PostgreSQL server running on local machine

- Ensure the [access privilege configuration
file](http://www.postgresql.org/docs/8.1/interactive/client-authentication.html#AUTH-PG-HBA-CONF)
pg\_hba.conf is set appropriately. E.g.
  
  - {{{\# TYPE DATABASE USER CIDR-ADDRESS METHOD

local all all trust host all all 127.0.0.1/32 trust host all all ::1/128
trust}}}

- \[Optional\] If you wish to use password authentication replace
trust with md5.

### PostgreSQL server on remote machine

- Allow remote access to the server by adding lines of the following
form to your pg\_hba.conf file (replace IP\_ADDRESS with the actual
numbers):
  
  - host all all IP\_ADDRESS/32 md5
  - It is advisable to require password authentication (ie. md5
instead of trust) for remote access.

<!-- -->


- On a PostgreSQL 8 server, remote machines will not be able to
connect unless you modify listen\_addresses in the postgresql.conf
file. (The value takes the form of a comma-separated list of host
names and/or numeric IP addresses.)

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/LexDbPsqlInitialize/_edit)]{% endraw %}