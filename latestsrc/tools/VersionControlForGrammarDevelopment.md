{% raw %}# Version Control for Grammar Development

This page is intended to describe how to use version control systems
(VCSs) with grammars. Version control (also "revision control") is
essentially a more sophisticated method of backup for files. Users
"checkout" files from a repository, modify the files, and "commit" their
changes back into the repository. These systems usually have
functionality for merging changes from multiples users, thus
facilitating collaboration, and users can get previous versions of files
from the history in order to revert damaging changes, etc. The
repository is usually stored somewhere other than the development
machines for safety. More information is available at
<http://en.wikipedia.org/wiki/Revision_control>.

The two systems discussed below are Subversion and Git. Unless you are
working with an existing setup with Subversion, it is recommended to use
Git as it is more powerful and more readily available, although it has a
higher learning curve. Subversion is a centralized system while Git is
distributed. This means that with Subversion all users collaborate by
committing work to one hosted repository, while with Git each user has
their own repository and they collaborate by merging changes between
repositories. For more information see the Wikipedia page on
[distributed version
control](https://en.wikipedia.org/wiki/Distributed_version_control).

Contents

1. [Version Control for Grammar
Development](https://delph-in.github.io/docs/tools/VersionControlForGrammarDevelopment#Version_Control_for_Grammar_Development)
   1. [Subversion](https://delph-in.github.io/docs/tools/VersionControlForGrammarDevelopment#Subversion)
   2. [Git](https://delph-in.github.io/docs/tools/VersionControlForGrammarDevelopment#Git)
   3. [General Suggestions](https://delph-in.github.io/docs/tools/VersionControlForGrammarDevelopment#General_Suggestions)

## Subversion

For an introduction to Subversion's commands and workflow, please see
[this quick-start guide](https://subversion.apache.org/quick-start), or
[this book](http://svnbook.red-bean.com/) if you need even more info.
Below is a brief listing of common commands.

```
   1 $ svn checkout svn://example.com/mygrammar  # check out a grammar's repository
   2 $ cd mygrammar/                             # change to grammar directory
   3 $ emacs mygrammar.tdl                       # edit a file
   4 $ svn status                                # check the edit status of files
   5 $ svn diff                                  # view differences between the local and remote versions
   6 $ svn add newfile.tdl                       # add a new file to be tracked
   7 $ svn commit -m "message"                   # commit current changes to the repository
   8 $ svn log                                   # view the change history
   9 $ svn update                                # download and merge commits from the remote repository
  10 
```

## Git

For an introduction to Git's commands and workflow, please see [its
website](https://git-scm.com/), which has links to free learning
resources, including books, a cheat-sheet, videos, etc. Below is a brief
listing of common commands. Also note that the Grammar Matrix
Customization System will allow you to download a grammar already
initialized with Git.

```
   1 $ git clone git://example.com/mygrammar     # clone a remote repository locally
   2 $ cd mygrammar/                             # change to grammar directory
   3 $ emacs mygrammar.tdl                       # edit a file
   4 $ git status                                # check the edit status of files
   5 $ git diff                                  # view differences between the local and remote versions
   6 $ git add newfile.tdl                       # add a new or modified file to the "staging area"
   7 $ git commit -m "message"                   # commit current changes to the local repository
   8 $ git push                                  # upload local commits to a remote repository
   9 $ git pull                                  # download and merge commits from a remote repository
  10 $ git log                                   # view the change history
  11 $ git grep ...                              # perform a grep search only over tracked files (very useful!)
  12 
```

## General Suggestions

When working with grammar repositories, these suggestions may save you
some headaches:

- Do not track easily recreateable files; for instance ACE's .dat
files, temporary files, parsed [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) profiles (except for gold
profiles or skeletons), etc.
- Do not track binaries or compressed files; this includes .dat files
and compressed [\[incr tsdb()\]](http://www.delph-in.net/itsdb)
relations (e.g., item.gz); the version control system compresses
things itself, so by tracking compressed text files you make it less
efficient at computing changes
- For Git, use a .gitignore file so commands like git status do not
show you files you do not want to track. Here is a sample .gitignore
file:
  
  -      # Temporary files from Emacs, vim, etc.
             *~
             \#*\#
             *.elc
             auto-save-list
             .\#*
        
             # Compiled Grammar images
             *.dat
             *.grm
        
             # TSDB profiles
             tsdb/home/
             tsdb/current/
             trees/

Last update: 2020-03-26 by MichaelGoodman [[edit](https://github.com/delph-in/docs/wiki/VersionControlForGrammarDevelopment/_edit)]{% endraw %}