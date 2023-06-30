{% raw %}# Grammar Engineering Frequently Asked Questions

## How can I tell \[incr tsdb()\] to start with the directories for "home" and "skeletons" that I want each time?

Create a file called .tsdbrc in your home directory. (Your general home
directory, not your tsdb home directory.) In that file, put the
following two lines:

    (setf tsdb::*tsdb-home* "< tsdb home directory >") 
    (setf tsdb::*tsdb-skeleton-directory*  "< skeleton directory >")

... with the desired directories filled in. .tsdbrc is read whenever you
start up \[incr tsdb()\].

Note that if \*tsdb-skeleton-directory\* is not set to a legitimate
skeletons directory (with Index.lisp and Relations) \[incr tsdb()\] gets
unhappy, and can experience mysterious errors.

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqTsdbRc/_edit)]{% endraw %}