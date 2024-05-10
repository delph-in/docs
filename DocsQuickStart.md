# Updating the docs
The DELPH-IN docs are generated from the content in any GitHub repository including the [DELPH-IN wiki](https://github.com/delph-in/docs/wiki) and the [DELPH-IN docs repo](https://github.com/delph-in/docs). Pages from a repository are included in the docs simply by adding a row to a configuration file, [as described below](#how-to-add-pages-to-the-docs). Pages are copied from the original repository, as is, except that the links are fixed up to keep readers within the docs site. 

This is all managed in a git repository, so changes are tracked, can be reverted, etc.  Mistakes can be cleaned up, don't worry about messing things up!

## How to Add Pages to the Docs
1. Create the pages you want in the [DELPH-IN wiki](https://github.com/delph-in/docs/wiki) or the [DELPH-IN docs repo](https://github.com/delph-in/docs). 
2. Edit the [sitesdefinitions.json file](https://github.com/delph-in/docs/tree/main/sitesdefinitions.json) in the docs repository to include the new pages. You can simply click the edit button on that link to update the sitesdefinitions.json file, no need to clone, etc. For more information see [The Site Definition File](#the-site-definition-file) below.
3. [Run the workflow](https://github.com/delph-in/docs/actions/workflows/BuildDocs.yml) to regenerate the documentation by clicking on the `Run Workflow` button on that link.  It takes about 10 minutes to regenerate.  Leaving the defaults will do the right thing. For more information see [Running the Workflow](#running-the-workflow) below.

### The Site Definition File
The Site Definition file describes all the sites, sections and documents included in the DELPH-IN documentation. It is in the [JSON format](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/JSON). 

Changing/Adding/Removing anything *except the top level navigation* in the site involves simply [editing the file](https://github.com/delph-in/docs/tree/main/sitesdefinitions.json) and [re-running the workflow](#running-the-workflow).  If you want to add or remove the *top level organization of the site* (i.e. the navigation links across the top of every page), there is a little more to do, see [Modifying the Site Structure](#modifying-the-site-structure) below.

A simplified version of the production file is below. The file has 3 initial sections that rarely need to be changed: `Comments`, `SourceRepositores`, and `Sites`.  These define what data can be included in the site and what the top level structure is.

The section that gets modified for changes inside this structure is `Pages`. That is what you need to edit for anything not involving the top level structure. Changes in this section are reflected immediately and don't require anything beyond changing the text in the file and rerunning the workflow.
~~~
{
  "Comments": [
    "This comments section is solely for comments that describe this json file"
  ],
  "SourceRepositories":
    {
      "docswiki": {"Repository": "delph-in/docs/wiki"},
      "websitewiki": {"Repository": "ericzinda/docsproto/wiki"}
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
### Pages and Sections
A page in the docs is defined like this in the `sitedefinitions.json`:
~~~
{"Page": "DeepBank 1.0", "SrcDir": "docswiki", "SrcFile": "DeepBank_OneZero.md", "Referrer": "concept/DeepBank.md"}
~~~
- `Page`: The name that should be shown to the user for the page in the left-hand navigation
- `SrcDir`: The name given to the repository that contains the file. This name is defined in the `SourceRepositories` section.
- `SrcFile`: The filename of the file that should be included in the documentation. There are no subdirectories in a wiki, so there is no need to include a path
- `Referrer`: Not used by the system but included sometimes to indicate what is linking to the file.  Any other fields can be added to the page definition and they will be ignored, as this field is.

Simply creating a new `Section` definition and putting pages inside it causes the section to be created and those pages to be included in that section of the docs.  Moving pages between sections moves them in the site and fixes up all the links to them.  Removing pages removes them from the site, etc.

The format is designed to make it easy to move files around, redefine sections, sites, etc. Just running the workflow again will create the new site structure.

More detail on the structure and background is in the [DELPH-IN Docs Reference Guide](DelphinDocsReference.md).
## Running the Workflow
[Run the workflow](https://github.com/delph-in/docs/actions/workflows/BuildDocs.yml) to regenerate the documentation by clicking on the `Run Workflow` button on that link.  It takes about 10 minutes to regenerate.

At this point the workflow will begin running and you'll see its status.  When done, it will have a green checkmark for success or a red X for failure.  If it was successful the docs have been immediately published and you can browse them live. It takes about 10 minutes to run. 

If successful, you can click on the run itself and scroll to the bottom of the output to find some analysis files that can be helpful.  In particular the file `Fixes for Broken Links to Wiki Pages` creates file definitions for every file that was linked to but not included (recursively). If you include all those file definitions in the `sitedefinitions.json` there will be no broken (Wiki) links in the site! 

> Note that a file that was linked to but didn't exist will have a definition there as well, but will include a `"FileMissing": True` field. Obviously don't add this to the site without also creating the file that was missing!


If it failed, click on the row that represents the run you just did and you'll see an error file. If you open this file, all of the errors encountered will be listed.  Fix those and rerun the workflow.  In rare cases, you might need to click on the run, and then on the box that represents the "build" part of the workflow. That will expand all the details of the run and show you why it failed.  The biggest source of failure is not formatting the JSON file correctly.

More detail on the workflow is in the [DELPH-IN Docs Reference Guide](DelphinDocsReference.md).

## Modifying the Site Structure
To modify the site structure, see the [DELPH-IN Docs Reference Guide](DelphinDocsReference.md).
