{% raw %}This is a high level design documentation that was used to guide how the docs site is built and structured.

# Requirements
First, imagine that we have two sites: The Wiki and The Documentation Site. 

The Wiki is meant as a history of the project and maintains topics of all types. Articles can be added, removed, edited by anyone with permission. It is the "Filing Cabinet" of DELPH-IN. A good place to find anything you'd like, but not necessarily well organized.

The Documentation Site is *curated* and carefully maintained to have a professional look, consistency, a particular scope, table of contents, etc. It is the "public face" if you are using and learning about DELPH-IN. It gets *built* and can pull from different sources:
- Can copy information from the wiki 
- Can contain pages that are built from grammar source (or other sources).

With these distinctions in mind, here are some requirements for The Documentation Site:

- Uses a hosting approach that is free (ideal) or able to be funded very cheaply
- Uses tools and approaches that are easy to maintain and update
- The Documentation is curated: The official documentation site needs to have controls over what gets published to it and what is included. There will be an index for searching that *only* searches The Documentation. It is opt in and thus requires an action to add things to it. 
- Home Page: It must have a home page that is welcoming both to the academic grammarian and the application developer. It should clearly show that this is an incredible body of work, that is being actively developed, used by many, and is serious. Both types of canonical reader should feel like this home page speaks to them.
- Target Conceptual Documentation by User: There must also be clearly distinguished, and separate, areas for Conceptual Docs (i.e. Explanation Docs from the [taxonomy](https://documentation.divio.com/)) for the grammarian and app developer since their needs are very different. 
- Versioned Reference Documentation: There should be a way to see documentation that is appropriate to a specific ERG version. 
  - Could be a section of every page that has version specific information
  - Could be that there are different sets of documentation for each version, but there would need to be a way to share the huge amount of content they have in common

# Approach
The new Documentation Site is hosted by, and built by, GitHub pages. This is a free hosting service that can consume content from the repositories in Github.  This is what https://delph-in.github.io/docs/ uses today.

It uses Github Actions and static Jekyll extensions to do the following:
- Pull pages from the wiki to be included
- Extract doc comments from the grammar to include
- Build a javascript based index using an approach like [this](https://github.com/jekylltools/jekyll-tipue-search) so it has good search
- Do any necessary post processing such as applications of templates to make it look nice
- Finally, push the content to https://delph-in.github.io/docs/

This gives us a free hosting service, with as much interesting indexing as we are willing to code up (as long as it can run in javascript on the client), and the ability to pull content from different sources into a curated doc system. The goal will be to keep it *simple* so it is maintainable.

# Structure
The documentation should consist of different "sites" that are unified by some simple navigation that gets you between them at the top of the page.  

Each "site" represents a "main area of documentation that is related" and has its own TOC tree on the page that lets you navigate between the different pages in that site and shows you its structure. It will actually get built as a "site" in the Jekyll sense.  It could have its own different layout if we so choose (or even not have a TOC navigation).  Sites basically get to choose the look they need based on what they are covering.

Each version of the grammar will have its own site for its reference documentation. The template we choose for any of the versioned reference docs sites will also include a way to select other versions.

# Site Structure
The site structure should be something like:

- Home Page
- Getting Started
- Tools
- Conceptual
  - Linguists
  - Grad Student
  - Engineering
- Grammar References (with dropdowns for version)
  - ERG
    - Reference for grammar version XXX
    - Reference for grammar version XXY
    - ...
  - SRG
  - ...
- etc.

# Search
Searching will search across all unversioned sites and the *latest* version of any versioned sites.  The results will get returned in a giant list. It should be able to be filtered by site.

# Template
Starting with https://mmistakes.github.io/minimal-mistakes/ since it has been used by others for docs. We can change as needed


Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/ERDW_StructureForNewDocsSite/_edit)]{% endraw %}