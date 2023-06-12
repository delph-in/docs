{% raw %}# LOGOFF and Git On

*Migrating Legacy Projects to Git Repositories*

**Moderator:** Michael Goodman

## Background

The long-running Oslo SVN server, including the LOGON repository, remains functional for the foreseeable future.
However, support to active developer communities has been limited in recent years (e.g. user creation and management of access rights).
Developer communities may consider migrating to other services.
As DELPH-IN has largely moved to GitHub, this is the default choice, however individual maintainers may choose to find their own hosting arrangement.
There was a similar discussion in the previous year (see [[VirtualInfrastructure]]), which covered many more topics, such as the migration of the wiki (which is complete, or very nearly so), and the mailing lists (which are now inaccessible; communication now happens on GitHub and the [DELPH-IN Discourse](https://delphinqa.ling.washington.edu/) site).
This discussion is about code migration.
For currently inactive projects, or ones that do not require much support, Stephan Oepen expects to maintain the SVN infrastructure at Oslo for years to come, if in part for archival purposes and to keep valid download addresses and URLs that have been published.

## Identifying Projects

http://svn.delph-in.net/

* BURGER: http://svn.delph-in.net/burger/
* ERG: http://svn.delph-in.net/erg/
* KRG: http://svn.delph-in.net/krg/
* LKB: http://svn.delph-in.net/lkb/
* LKB-FOS: http://svn.delph-in.net/lkb/branches/fos/ (spin off as separate project rather than a branch?)
* LUI: http://svn.delph-in.net/lui/
* REPP: http://svn.delph-in.net/repp/
* über tagging: http://svn.delph-in.net/ut/trunk/

Others?

Candidates:

- REPP (MWG will move)
- NorSource
- Non-FOS LKB (Jon will talk to oe)
- SRG ~~(Olga will ask Montse, strong intention to move)~~ (https://github.com/delph-in/srg/)
- Jigsaw (unclear; ask Yi)
- GG (ask Berthold)
- HaG (ask Berthold)
- BURGER ~~(Francis will ask Petya)~~ (https://github.com/delph-in/burger)
- KRG (Francis will ask Sanghoun)
- Emily to move current transfer matrix stuff (ace-enabled) from UW-local to GitHub
- SDSU TADM -- ask if anyone is using

## Identifying Authors

```console
$ svn log --quiet http://svn.delph-in.net/ \
  | grep '^r[0-9]' | cut -d'|' -f2 | sed -e 's/^ *//' -e 's/ *$//' \
  | sort | uniq -c | sort -nk1 \
  > authors.txt
```

(email addresses have been partially redacted)

| Commit Count | SVN User | GitHub Username |
| ------------ | -------- | --------------- |
|      2 | adolphs | |
|      2 | alex | |
|      2 | andreku | |
|      2 | eric-n | |
|      2 | linghelp@ | |
|      2 | root | |
|      3 | sshieber | |
|      3 | tbaldwin | |
|      3 | uc | |
|      4 | ezra99 | |
|      4 | kiefer | |
|      5 | kordoni | |
|      5 | rpearah@ | |
|      5 | uschaefer | |
|      6 | simoes | |
|      7 | jbernd | |
|      8 | dag | |
|      9 | ccb | |
|      9 | gslayden@ | glenn-slayden |
|     17 | jbeavers | |
|     18 | ericn | |
|     18 | olasba | |
|     19 | cj | |
|     20 | frermann | |
|     22 | bender | emilymbender|
|     22 | biehl | |
|     22 | gisle | |
|     22 | test | |
|     22 | tobiasvl | |
|     31 | bart | |
|     33 | murhaff | |
|     39 | liljao | |
|     42 | ebender@ | emilymbender |
|     49 | ilianas | |
|     50 | dan | |
|     50 | sweaglesw | sweaglesw |
|     55 | rdrid |  becdridan |
|     56 | mingwen | |
|     63 | petterha | |
|     71 | marsuk | |
|     75 | fettig | |
|     78 | gisley | |
|     78 | jread | |
|     79 | johanbev | |
|     82 | yzhang | |
|     86 | sanghoun | |
|     98 | montse | |
|    101 | brodbd | |
|    109 | bond | |
|    117 | milen | |
|    127 | erikve | |
|    131 | j.a.carroll@ | john-a-carroll |
|    142 | lluisp | |
|    152 | angelii | |
|    158 | rdridan | becdridan |
|    210 | emanuel | |
|    215 | sweagles | sweaglesw |
|    235 | malouf | |
|    242 | arnskj | |
|    266 | crysmann | |
|    280 | johnca | john-a-carroll |
|    905 | bmw | |
|    948 | aac | |
|   1068 | danf | |
|   8333 | oe | |
|  14205 | (no author) | |

*oe: I am surprised at the large number of anonymous commits – how is that possible?*

## Migrating From Subversion To Git

The `git svn` tool (https://git-scm.com/docs/git-svn) does a reasonably good job of importing Subversion repositories, including converting conventional `branches/` and `tags/` subdirectories into the appropriate Git structures:

```console
$ git svn clone http://svn.delph-in.net/... --stdlayout --authors-file=authors.txt
```

I have some notes about doing this for ACE here: https://gist.github.com/goodmami/b2e70fe2fd47fb92bb27576d8c59f758

It's useful to map the SVN authors to GitHub `@users.noreply.github.com` email addresses so their personal emails are not exposed while still mapping to their GitHub profiles, if they exist.

## Notes

The above SVN-to-Git import does not push the repositories to GitHub, so you will need to do this separately.
You may also need to perform additional steps to convert tags to proper Git tags instead of branches.

GitHub, being a free service, has size limits on individual files and on full repositories (including the history). Individual files should be less than 50MB, and strictly less than 100MB. Repositories should aim to be less than 1GB. See https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-large-files-on-github. In order to accommodate this, we may need to filter out files from larger projects. Some guidelines:

- Avoid checking in binary files (`.grm`, `.dat`, etc.)
  - Binary files that are trivially reproducible should be excluded
  - Those that are hard to reproduce but change infrequently may be included, provided they are < 100MB
  - Consider creating a "release" on GitHub and attaching binaries to it
- Very large repositories may need to be split into multiple

## Backups

We believe that for codebases, the fact that people have things checked out locally will serve as a backup, but need other plans for things like the wiki, the discussions on the `participants' team.

GitHub suggests owners of organization can do a 'github migration' --- prepare to do that, get a full dump. This can be backed up. EMB worries this would be an expensive way to create backups to store on the patas cluster. Maybe better to create a cron job that does a `git pull' for the docs repo (aka the wiki) and whatever the appropriate API call is to pull the info on issues for some list of projects (at least Matrix, maybe orphan projects).

Last update: 2022-09-17 by Michael Wayne Goodman [[edit](https://github.com/delph-in/docs/wiki/Fairhaven2022-LOGOFF-and-Git-On/_edit)]{% endraw %}