# DELPH-IN Docs Reference Guide
The documentation system is designed to be able to combine documentation from any publicly accessible git repository into an arbitrary set of sites.  Pages from one repository can be put into different sites and will automatically keep their links valid. Furthermore, documentation can be generated from, for example, grammar source and included as well.  The definition of the sites created is copied into the docs repository so that git can be used to see what changed and observe the history.  Branches can be used to test, etc.

It does this by using a [GitHub Workflow](https://docs.github.com/en/actions/using-workflows/about-workflows) which is located in the [/.github/workflows folder](https://github.com/delph-in/docs/tree/main/.github/workflows) of the DELPH-IN docs repository to build the docs. A workflow is simply a way of defining computer code that can run on GitHub's servers.  The workflow runs on an actual computer at GitHub, it has access to a file system and it can run any command you can run from a linux shell (including git commands), etc.  It is just a large script running on a Linux server. It uses a [system called Jekyll to create a set of sites and then uses GitHub pages to publish the sites.](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/about-github-pages-and-jekyll)

In a nutshell the workflow does the following to build the documentation site:
1. Clone (in a git sense, i.e. git clone ...) every repository that has any content we want to use in the ultimate documentation. This will make a copy of it available on the GitHub server the script is running on. We will selectively choose which files to include in later steps. Step 1 simply grabs the entire set of repositories we want access to.

Run the [`createdocs.py` script](https://github.com/delph-in/docs/blob/main/sitescripts/createdocs.py) that is in the `sitescripts` folder of the `docs` repository. This script does the following:

2. Load in the file called [`sitesdefinitions.json`](https://github.com/delph-in/docs/blob/main/sitesdefinitions.json) in the root of the `docs` repository.  This file defines all of the sites that will be created, and all of the files that will be copied from the repositories we cloned in step 1.  This is how the structure of the documentation sites and the docs that populate them are defined.
3. Create blank template site definitions for everything in the `Sites` section of `sitesdefinitions.json`. These site definitions are for Jekyll to use. Jekyll will actually turn them into valid HTML pages that Github Pages can serve.  See [the Github Pages docs](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/about-github-pages-and-jekyll) for more information.
4. Copy all of the pages in the `Pages` section of [`sitesdefinitions.json`](https://github.com/delph-in/docs/blob/main/sitesdefinitions.json) to the proper site definition where they should be displayed.  In the process, `createdocs.py` reads each file and fixes up its links to point to the proper place in the new site structure.  This is so pages that link to other pages in the same repository will continue to work in the final documentation, even if the pages fall in different sites.

After the `createdocs.py` script is finished, control goes back to the workflow and it:

5. Actually runs Jekyll on all the site definitions to build the real HTML
6. Publishes the sites to GitHub pages so they can be served

## The docs repository folder structure
The `docs` repository has the following folder structure:
- `.github`: This folder contains the GitHub workflow that runs the documentation build process.  It also contains a folder called `workflows` which contains the actual workflow definition.  This is the file that is run when you click the "Actions" tab on the GitHub page for the `docs` repository.
- `latestsrc`: Files selected by [`sitedefinitions.json`](https://github.com/delph-in/docs/blob/main/sitesdefinitions.json) to be in the documentation sites are initially copied here.  Think of this as the raw documentation that will be turned into actual HTML site.  This is checked into git so that changes can be tracked.
- `latestsites`: Jekyll takes the raw input from `latestsrc` and turns it into a real HTML site in this folder. This folder contains the latest version of the documentation sites.  It is the output of the workflow and is checked into git, so that differences between versions can be seen.  It is the folder that is served by GitHub pages. 
- `sitescripts`: Contains the python scripts that are run by the workflow to build the documentation sites.  It also contains files that start with `template_` which are some of the template files needed by Jekyll to build the sites. The `sitescripts/site_template_standard` folder contains the rest of the files used by Jekyll. The `sitescripts/site_template_standard` folder is copied into the `latestsites` folder, once for each site built.
- `sitescripts/testdata`: Contains some test data that is used by the workflow to test the documentation build process.  It is not used in the actual documentation build process.
- `sitescripts/testsitesdefinitions.json`: This is a copy of `sitesdefinitions.json` that is used by the workflow to test the documentation build process (along with the `testdata` folder).  It is not used in the actual documentation build process.
- `sitesdefinitions.json`: This is the file that defines the structure of the documentation sites.  It is the key file in the whole process that defines the site structure and what goes where.

There are also some markdown (`.md`) files in the root of the `docs` repository that get included in the documentation (such as this file).  This is where pages that aren't really appropriate in the WIKI should go.  For example `MatrixDocsOverview.md` refers to navigation that isn't there when you are browsing the wiki directly, it is solely used in the documentation site. The documentation reference files are here instead of in the WIKI to make them discoverable by people browsing the docs site.

## Defining the Documentation Structure
[`sitesdefinitions.json`](https://github.com/delph-in/docs/blob/main/sitesdefinitions.json) is the key file in this whole process. A simplified version looks like this:

~~~
{
  "Comments": [
    "This comments section is solely for comments that describe this json file"
  ],
  "SourceRepositories":
    {
      "docswiki": {"Repository": "delph-in/docs/wiki"},
      "websitewiki": {"Repository": "ericzinda/docsproto/wiki", "ReportUnusedWikiEntries": True}
    },
  "Sites":
  [
    {"SiteFullName": "DELPH-IN Docs", "SiteNavigationName": "Home", "Site": "home", "HomePage": "Home.md"},
    {"SiteFullName": "DELPH-IN How-to", "SiteNavigationName": "How-to", "Site": "howto"}
  ],
  "Pages":
  {
    "home": [
      {"Section": "DELPH-IN", "Pages": [
        {"Page": "Overview", "SrcDir": "docswiki", "SrcFile": "Home.md"},
        {"Page": "Welcome", "SrcDir": "docswiki", "SrcFile": "DelphinWelcome.md", "Referrer": "home/Home.md"},
        {"Page": "Applications", "SrcDir": "docswiki", "SrcFile": "DelphinApplications.md", "Referrer": "home/Home.md"}
      ]},
      {"Section": "Projects", "Pages": [
        {"Page": "DeepBank", "SrcDir": "docswiki", "SrcFile": "DeepBank.md"}
      ]}
    ],
    "howto": [
      {"Section": "DELPH-IN", "Pages": [
        {"Page": "Welcome", "SrcDir": "docswiki", "SrcFile": "DelphinWelcome.md", "Referrer": "home/Home.md"}
      ]},
      {"Section": "Tutorials", "Pages": [
        {"Page": "DelphinTutorial", "SrcDir": "docswiki", "SrcFile": "DelphinTutorial.md", "Referrer": "summits/SaarlandSchedule.md"},
        {"Page": "DelphinTutorial_Formalisms", "SrcDir": "docswiki", "SrcFile": "DelphinTutorial_Formalisms.md" 
      ]}
   ]}
  }
}
~~~
### SourceRepositories
The `SourceRepositories` section declares what repositories will be used to populate the content of the site. Not everything from these repositories is included in the final sites, just the files listed in [`sitedefinitions.json`](https://github.com/delph-in/docs/blob/main/sitesdefinitions.json). 
- `key` is the name that will be used by the `SrcDir` field in every page in the `Pages` section to refer to the repository.  It must match the directory name where the repository got cloned by the workflow.
- `Repository` is the name of the repository in Github.  If it is a Wiki, replace the dot in the name (delph-in/docs.wiki) with a slash (delph-in/docs/wiki)
- `ReportUnusedWikiEntries` should be set to true if you want the `Fixes for Broken Links to Pages` report to include any pages from a github wiki site that were *not* included in the docs

To add a new repository, a row must be added here *and* the [workflow](https://github.com/delph-in/docs/tree/main/.github/workflows/BuildDocs.yml) must be modified to also clone it so the data is available. Below is where a new row would be added to declare that a new repository should be available for entries in `sitesdefinitions.json`:
~~~
  ...
  
  "SourceRepositories":
    {
      "docswiki": {"Repository": "delph-in/docs/wiki"},
      "websitewiki": {"Repository": "ericzinda/docsproto/wiki"}
    },
  
  ...
~~~

You can see how to update the [workflow](https://github.com/delph-in/docs/tree/main/.github/workflows/BuildDocs.yml) by looking for where the existing repositories are cloned and adding a new section.

### Sites
The `Sites` section declares what top level sites exist to hold content. Think of these like chapters in a book. These create the top level navigation on the site.
- `SiteFullName` is the descriptive name that will be shown for the site when you are in that site.
- `SiteNavigationName` is what shows up in the menu to change between sites
- `Site` is not shown to the user but is used as the *key* in the `Pages` section to identify the site
- `HomePage` is optional. If included, that will be the first page displayed when you go to the site. If missing, the very first page listed in the site will be shown.
~~~
  ...
  
  "Sites":
  [
    {"SiteFullName": "DELPH-IN Docs", "SiteNavigationName": "Home", "Site": "home", "HomePage": "Home.md"},
    {"SiteFullName": "DELPH-IN How-to", "SiteNavigationName": "How-to", "Site": "howto"}
  ],
  
  ...
~~~

### Pages
The `Pages` section declares which pages from the different repositories should actually be included in the site, and where. It is in a tree structure so that pages can easily be moved around. The page definitions themselves don't have information about where they are. Their location is set by their location in the tree.  

So, to include 2 pages in the "concept" site in a structure like this:
~~~
concept
    Erg Semantics
        ErgSemantics.md
    More Semantics
        ErgSemantics_Basics.md
~~~
You would use the definition below:
~~~
  "Pages":
  {
    "concept": [
      {"Section": "Erg Semantics", "Pages": [
        {"Page": "Overview", "SrcDir": "docswiki", "SrcFile": "ErgSemantics.md"},
      ]},
      {"Section": "More Semantics", "Pages": [
        {"Page": "Basics", "SrcDir": "docswiki", "SrcFile": "ErgSemantics_Basics.md"},
      ]}
    ]
  }
~~~
The `Page` definition fields are:
- `Page`: The name that should be shown to the user for the page
- `SrcDir`: The name of the directory that contains the repository that contains it. This directory name is defined in the workflow.
- `SrcFile`: The filename and path to the file in the directory that should be included in the documentation.
- `DstFile`: (optional) This field can be included if the name of the original page needs to be changed when it is included in the documentation (e.g. to avoid a conflict) or if the file needs to be put in a location different from its default.  If `DstFile` is not included, the default location in the documentation site will be the same as the relative location in the original. For example, if the file was in the root of its source repository, it will be in the root of the documentation site too. If it was in the `foo/bar/goo` directory, that is where it will get put in the documentation site as well. NOTE: Any directory structure deeper than one directory seems to be ignored by the Jekyll system, so use this field to copy files into a structure that is only one directory deep.
- `DefinitiveLink`: (optional) This field can be included if the page appears in more than one place in the site. The one (or the last one if multiple are) marked as `'DefinitiveLink'=true` will be the one other pages choose to link to. If this is not included, then the first reference to the page in the entire `sitedefinitions.json` file will be where all the links go. 
- `Referrer`: Not used by the system but sometimes included to indicate what is linking to the file.  Any other fields can be added to the page definition and they will be ignored, as this field is.  

Simply creating a new `Section` definition and putting pages inside it causes them to be included in the site, and in that section of the docs.

The format is designed to make it easy to move files around, redefine sections, sites, etc. Just running the workflow again will create the new site structure.

## Running the Workflow
To run the workflow:
1. Click on the `Actions` tab at the top of the DELPH-IN docs repository on GitHub.  
2. Then click `BuildDocs` on the left side of the page. At this point you'll see a record of previous runs (if they weren't deleted)
3. Finally, click the `Run Workflow` button on the right side and then `Run Workflow` on the UI that appears

At this point the workflow will begin running and you'll see its status.  When done, it will have a green checkmark for success or a red X for failure.  If it was successful the docs have been immediately published and you can browse them live. It takes about 10 minutes to run. 

You can also click on the row that represents the run you just did and you'll see an "Artifacts" section at the bottom. This gives you files that get output by the run:
- `All Links`: A Json file that lists every link in every document included in every site and whether they are broken, valid, etc. Useful for debugging. If you chose to check external links (which takes about 1.5 hours) the validity of those will be included. Otherwise only internal links between wiki pages are checked.
- `All Pages`: Lists every page in every site.
- `Fixes for Broken Links to Pages`: Creates page definitions suitable for including in `sitesdefinition.json` for every broken link and for every page that was not included from a site that had `ReportUnusedWikiEntries` set to true (this allows detecting pages that weren't linked to and not included). Note that this includes adding entries for wiki pages that *don't exist* (those will have the `FileMissing` field set in their definition). This allows you to simply copy the `File` definition to the `sitesdefinition.json` file to include it and fix the broken link. It includes the transitive closure of all broken links (i.e. the links from those files to other files that aren't included, and so on).  If you included all of these files in `sitesdefinition.json`, there would be no broken (Wiki) links!


> Note that a file that was linked to but didn't exist will have a definition in `Fixes for Broken Links to Pages` as well, but will include a `"FileMissing": True` field. Obviously don't add this to the site without also creating the file that was missing!
 
If it failed, click on the row that represents the run you just did and you'll see an error file. If you open this file, all of the errors encountered will be listed.  Fix those and rerun the workflow.  In rare cases, you might need to click on the run, and then on the box that represents the "build" part of the workflow. That will expand all the details of the run and show you why it failed.  The biggest source of failure is not formatting the JSON file correctly.

## The `<ignore>` Section
Note that any section named `<ignore>` that is included in the docs will *not* be included in the output.  However, any pages in it will be counted as "not broken" when linked to, even if they don't exist in the site. This is a mechanism for removing them from being added to the "Fixes for Broken Links to Wiki Pages" output file that the build generates.  Note that the any links to them will have the link removed as well.

## Running `createdocs.py` Directly for Testing
The `createdocs.py` script is usually run by the `BuildDocs.yml` workflow in the `.github` folder.  However, it is just a Python script and it can be run directly from the command line for testing purposes.  If you run it with no arguments, it will tell you what arguments it expects and then fail, like this:

~~~
python ./createdocs.py
Error: Requires 5 arguments: 
1) Root address of site (i.e. sites will be under that URL address)
2) Full path to where repositories containing docs to be used as source are stored
3) Full path to the latestsrc directory of the docs repository
4) Full path to the latestsites directory of the docs repository
5) Full path and filename of the json file that defines the docs
6) (optional) true or false (default false): run in quick and dirty mode which removes things like timestamps on files that take a while to calculate
7) (optional) true or false (default false): VERY SLOW: Run in url check mode which checks that all links to other (internal and public) pages are valid
Traceback (most recent call last):
  File "./createdocs.py", line 659, in <module>
    assert False
AssertionError
~~~

So, to run the script in test mode (meaning: using the `sitescripts/testsitesdefinitions.json` definition file and the data from `sitescripts/testdata`), publishing to the github pages site "https://blog.inductorsoftware.com/docsproto", and with the `docs` repository in the `/docsproto` directory, you would run the following:
~~~
python ./createdocs.py  https://blog.inductorsoftware.com/docsproto  /docsproto/sitescripts/testdata /docsproto/latestsrc /docsproto/latestsites /docsproto/sitescripts/testsitesdefinitions.json true, false
~~~

To see what requirements should be `pip install`ed, look at the `BuildDocs.yml` workflow in the `.github/workflows` folder.

Note that running `createdocs.py` directly won't actually publish the site anywhere, it will just clear out the `latestsrc` directory and replace it with whatever is in the `testsitesdefinitions.json` file.

Running in test mode is useful for debugging the script by placing interesting edge cases, etc into the `testdata` folder and referencing them from the `testsitesdefinitions.json` file. 
