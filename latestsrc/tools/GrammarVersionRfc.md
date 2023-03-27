{% raw %}This RFC describes how grammar engineers should format their grammar
version string in Version.lsp so it is useful with other software.

## Grammar (date)

Following convention, the string should contain the name of the grammar
with the date of the release in parentheses. For example, here is Jacy's
string:

    (defparameter *grammar-version* "Jacy (090705)")

See below for details on how to format the date.

## date --rfc-3339

The preferred approach is to use the output of the Unix date command
with the --rfc-3339=date option:

    $ date --rfc-3339=date
    2011-07-24

This results in a string formatted as YYYY-MM-DD

## Alternatives

As long as the string is compatible with the Unix date command, it is
acceptable. For instance:

    $ date --rfc-3339=date --date="today"
    2011-07-24
    $ date --rfc-3339=date --date="110723"
    2011-07-23

Simply having the year and month is not compatible, as it is interpreted
as being the time of the current day (shown below with the standard
output of the date command):

    $ date --date="today"
    Sun Jul 24 17:32:24 PDT 2011
    $ date --date="1010"
    Sun Jul 24 10:10:00 PDT 2011
    $ date --date="10-10"
    date: invalid date `10-10'

Developers could use "today" for the string on trunk, meaning that it is
currently the most up-to-date version. This interpretation would break
if a repository checkout has gone stale (not updated to the most recent
change), but it might be preferable to having to manually update the
version string for every commit.

## Comments

(add your comments here, and/or edit the proposal above)

Last update: 2011-07-25 by MichaelGoodman [[edit](https://github.com/delph-in/docs/wiki/GrammarVersionRfc/_edit)]{% endraw %}