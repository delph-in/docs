{% raw %}# FFTB: the full forest treebanker

FFTB is a tool for treebanking with DELPH-IN grammars that allows the
selection of an arbitrary tree from the "full forest" without
enumerating/unpacking all analyses in the parsing stage. FFTB is partly
integrated with \[incr tsdb()\] and the LOGON tree; for details on using
FFTB through that toolchain, please see [LogonAnswer](https://delph-in.github.io/docs/tools/LogonAnswer).
There is a [wishlist](https://delph-in.github.io/docs/tools/FftbWishlist).

The canonical citation is:

Woodley Packard (2015) *[Full Forest
Treebanking](https://digital.lib.washington.edu/researchworks/handle/1773/33194)*,
MA Thesis, University of Washington

## Obtaining it

The last binary versions of all ACE-dependent tools are here:

<http://sweaglesw.org/linguistics/acetools/>

You should make sure you get the same version of **ace**:

<http://sweaglesw.org/linguistics/ace/download> (you want the binary:
ace-0.9.30-x86-64.tar.gz)

You also need **art**:

<http://sweaglesw.org/linguistics/libtsdb/art.html>

**Notes:**

- On Ubuntu 18.04 **0.9.30** works, but **0.9.31** does not.
- the webdir (with the javascript and css) is only included with
**fftb 0.9.31**, in the directory assets

## Selecting the trees

To see rules that can be applied to a span, middle-click on the first
word of the span and drag it to the last word of the span you want to
inspect. The span will be marked in red. Only rules that can build that
span will be shown below.

## Using the acetools

Make a fresh profile

    mkprof -s src/profile new/profile

Fill it with a *packed* parse (this is done with the **-f** and **-O**)

    $ art -f -a 'ace --disable-generalization -g grm.dat -O' new/profile

Suggested best practice is to also store the roots and lexical types:

    $ art -f -a 'ace --rooted-derivations --udx --disable-generalization -g grm.dat -O' new/profile

Launch the **fftb**:

    $ fftb -g grm.dat --browser --webdir ~/bin/acetools-x86-0.9.31/assets/ new/profile

A browser window should pop up with a list of sentences, now you can
treebank!

Note the **webdir** is the one with the files control.js, index.html and
render.js in it. We found it in ace-tools-x86.0.9.31/assets, it can also
be found in logon/lingo/answer/fftb.

## Updating the treebank

You can do it through the web interface:

    fftb -g grm.dat --browser --webdir ~/bin/acetools-x86-0.9.31/assets/ new/profile --gold gold/profile

This will show you, for each parse:

- This profile has an active tree, not updating
- Unexpected error
- No parses now, no active gold exists
- No parses now, active gold exists
- Overconstrained now, active gold exists
- Fully disambiguated, identical to stored gold tree
- Fully disambiguated, different from stored gold tree
- Remaining ambiguity, was resolved in gold
- Remaining ambiguity, was unresolved in gold

It allows you to do the automatic update, but shows you more information
about what has changed. I would recommend this (FCB).

You can also just do it automatically:

    fftb -g grm.dat new/profile --gold gold/profile --auto 

For beginners, here is a [tutorial](https://delph-in.github.io/docs/tools/FftbTreebankUpdateTutorial) about manually updating items which are easy to update and yet were missed by the automatic tool.

## Training a ranking model

**ffmaster** and **ffworker** are in **acetools**. The master can have
multiple workers working on different profiles.

    usage: ffmaster NUM_WORKERS model.mem [regularization]
    usage: ffworker grammar.dat forest-profile gold-profile master-host [parallelism]

For example:

    $ mkprof -s gold/profile new/profile
    $ art -a "ace -g grm.dat -O" -f new/profile
    $ FFGRANDPARENT=0 ffmaster 1 grm.mem &
    > waiting for 1 workers to connect on port 2577...
    $ FFGRANDPARENT=0 ffworker grm.dat new/profile gold/profile localhost
    > ...
    > Done

Try parsing a sentence:

    ace -g ind.dat--maxent=grm.mem -l

# Miscellaneous Notes

## FFTB on OSX

It is possible to use FFTB independently of the LOGON tree, either on
Linux or on Mac OS X. The instructions below explain how to install and
launch FFTB on OSX. Note that although the treebanking user interface
presented by FFTB will be identical regardless of whether the LOGON tree
is used, some of the ancillary steps, such as preparing a full-forest
profile to use with FFTB, may be quite different when the LOGON tree is
not used. Such methods are experimental and not (yet) discussed here.

Download from <http://sweaglesw.org/linguistics/osx-fftb.tar.gz> 

```bash
$ cd osx-fftb
$ export DYLD_LIBRARY_PATH=./dependencies/
$ ./fftb -g erg-1214.dat --browser path/to/profile
```

The adventurous can attempt to compile and run a standalone fftb on
linux from the SVN repository: <http://sweaglesw.org/svn/treebank/trunk>

## FFTB for bridging analyses (self-help robust treebanking)

As of 1214, the ERG includes (disabled by default) so-called bridging
rules which enable a parse to be found for any input string, with
degraded semantic usefulness. There is currently no parse selection
model trained to function properly with these rules enabled, so they
should be disabled when the ERG is used in an online processing
environment. However, in an offline treebanking environment, these rules
enable annotators to capture some of the correct semantics for
ungrammatical sentences even when a fully correct analysis is not
available. In the future, it may be possible to use such annotations to
train an automatic parse selection model to work with the bridging
rules.

If a profile has been parsed to include an "edge" relation using the
bridging rules, and erg-1214-bridge.dat is an ACE grammar image with the
relevant rules enabled, it is possible to update the profile from a
non-bridged one and continue annotating the rejected sentences with a
command like this:

fftb --suppress-bridges --browser -g erg-1214-bridge.dat --gold path/to/previous-profile path/to/new-profile-with-bridging 

The --suppress-bridges option causes FFTB to assume a discriminant has
been selected for each sentence rejecting the bridging rule at the top
level span. This should cause the update to behave exactly as if the
bridging rules had not been enabled in parsing the new profile. After
updating, you can rerun without that option (and also without the --gold
... option), or you can manually disable that discriminant each time you
visit a rejected item that you want to reclaim.

## FFTB on remote machine

You can wrap a proxy server round fftb and treebank remotely.

Here is the configuration for [nginx](https://www.nginx.com/), thanks to
AlexandreRademaker. with minor tweaks to get it
running on Ubuntu. This serves it at localhost:8080/private/. Call fftb
without --browser.

    ### our changes
    user www-data;
    include /etc/nginx/modules-enabled/*.conf;
    # daemon on
    
    worker_processes  1;
    
    error_log  /var/log/nginx/error.log;
    pid        /var/run/nginx.pid;
    
    events {
       worker_connections  1024;
    }
    
    http {
       merge_slashes off;
    
       default_type  application/octet-stream; 
       charset   utf-8;
       keepalive_timeout  65;
       server_tokens       off;
       tcp_nopush          off;
       tcp_nodelay         on;
    
       gzip              on;
       gzip_http_version 1.0;
       gzip_proxied      any;
       gzip_min_length   500;
       gzip_disable      "MSIE [1-6]\.";
       gzip_types        text/plain text/xml text/css
                         text/comma-separated-values
                         text/javascript
                         application/x-javascript
                         application/atom+xml;
    
       include mime.types;
    
       upstream fftb9080 {
           server 127.0.0.1:9080;
       }
    
       server {
           listen      8080;
           server_name localhost;
           charset     utf-8;
           
           location / {
               proxy_pass http://fftb9080;
               ## for password protection
               #auth_basic "Private Forest";
               #auth_basic_user_file /etc/nginx/.htpasswd;
           }
       }
    }

# Trouble Shooting

## Error Messages

### 404 no stored forest found for this item

FFTB shows **404 no stored forest found for this item** for multiple
reasons:

- This message appears if the grammar is missing lexicon entries. This
can happen when it lacks a lexicon entry or, in the case your
language needs special tokenization, if the sentence is not
adequately tokenized.

On the terminal-side, FFTB will say something
like:  found a stored forest, but couldn't use it.-&gt; no usable stored forest

### 404 not found

The most common reason for this is that the parameter --webdir is not
passed correctly (or points to the wrong place).

### 500 unable to read TSDB home directory

The directory should be +wrx.

## Span

The tool offers you the chance to select select spans with "Is A
Constituent" but this causes the system to crash (very often) when you
try to save the tree (from at least 0.9.23). So don't do this.

## LOGNAME

At least when running inside a docker container, fftb crashes if it
can't find the environment variable LOGNAME. To set it use

    export LOGNAME=myuser

Last update: 2023-04-26 by Olga Zamaraeva [[edit](https://github.com/delph-in/docs/wiki/FftbTop/_edit)]{% endraw %}