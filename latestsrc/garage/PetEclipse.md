{% raw %}# Setting Up PET in Eclipse CDT

[Eclipse CDT](http://www.eclipse.org/cdt/) (Eclipse IDE for C/C++
Developers) offers a feature-rich development platform for C++, which
facilitates editing, navigating, and debugging C++ source code. Eclipse
CDT is available as a prepackaged bundle on
<http://www.eclipse.org/downloads/> or it can be installed into an
existing Eclipse installation via the Software Updates dialog.

In the following, I assume that Eclipse-CDT 6.0 and Subclipse is
installed, that its workbench is located in \~/workbench and that PET
should be set up as a project with two configurations, "debug" (allows
for debugging in the Eclipse debugger) and "release" (optimized for
speed). Before you go on, please make sure that the
[PetDependencies](https://delph-in.github.io/docs/garage/PetDependencies) are satisfied.

## Checking out the project

- Open the SVN Repository Exploring perspective in Eclipse
- Add the repository URL <https://pet.opendfki.de/repos>
- Navigate to the branch you want to check out, e.g. "/pet/main".
- Click Checkout in the context menu.
- Choose "Check out as a project using the New Project Wizard".
- In the New Project Wizard, choose the C++ Project Wizard.
- There, choose the project name, e.g. "pet", use "Makefile project /
Empty project" as the project type and select "Other toolchain".
- Finish

## Setting up the build directories

- Open a terminal
- Go to the freshly created project directory
  
      cd ~/workbench/pet
- Initialize the build tools by running
  
      autoreconf -i
- Create build directories for the different configurations:
  
        mkdir -p build/debug
        mkdir -p build/release
- Configure the different build directories (add further options as
required):
  
        cd build/debug
        ../../configure "CXXFLAGS=-g -O0"
        cd ../release
        ../../configure "CXXFLAGS=-g -O3" --disable-assert

## Configuring the PET project in Eclipse

- Switch to the C/C++ perspective
- Click Refresh in the context menu of the new project "pet"
- Open the Project Properties
- In the "Resource" section
  - Set Text file encoding to "ISO-8859-1"
- In "C/C++ General" --&gt; "Paths and Symbols"
  
  - In the Includes tab, under GNU C++, add the workspace location
"/pet/common" for all configurations, "/pet/build/debug" for the
debug configuration and "/pet/build/release" for the release
configuration (the latter two in order to resolve pet-config.h)
  - In the Source Location tab, add /pet/cheap, /pet/common,
/pet/flop, /pet/fspp, and /pet/goofy in addition to the
preconfigured /pet as the source folders for the two
configurations
  - In the Output Location tab, add the respective build directories
for the two configurations
- In the "C/C++ Build" section
  - In "Manage Configurations", create two configurations "debug"
and "release" corresponding to the two build directories (other
configurations are not needed then)
  - In the "Build location" area, set the build directory to
${workspace\_loc:/pet/build/debug} for the debug configuration,
and ${workspace\_loc:/pet/build/release} for the release
configuration
- General Settings:
  - Either in "Window" --&gt; "Preferences" --&gt; "General" --&gt;
"Editors" --&gt; "Text editors" or in "Project Properties"
--&gt; "C/C++ General" --&gt; "Code Style"
    
    - Displayed tab size: 2
    - Insert spaces for tabs
  - To prevent spurious diffs, make sure that trailing whitespace is
*not* removed on save under "Window" --&gt; "Preferences" --&gt;
"C/C++" --&gt; "Editor".

## Running / debugging PET in Eclipse

- Set the active configuration to debug
- Select Project --&gt; Build Project.
  
  - You should see the make output in the Console view.
  - If make was successful, there should be a Binaries branch in the
Project Explorer.
- Go to Run --&gt; Run Configurations.
  
  - Select "C/C++ Local Application"
  - Click on the create icon.
  - In the Main tab, search the project for the binary to run/debug,
e.g. "cheap".
  - In the Arguments tab, enter all arguments (minimally the grammar
name for cheap) and select the grammar root directory as the
working directory.
  - Click Run
  - Any run configuration is also a debug configuration, and vice
versa.

## Trac integration

There is an integration of Trac's issue tracker into Eclipse using the
Mylyn plugin. This allows you to view issues from Track's issue tracker
and add new ones directly from Eclipse.

- Installing Mylyn:
  - Window / Preferences / Install/Update / Available Software Sites
  - activate <http://download.eclipse.org/tools/mylyn/update/e3.4>
  - Window / Help / Install Software
  - install Mylyn, especially the Mylyn Trac Connector
- Registering the PET task repository:
  - Open the Task Repositories view
  - Add Task Repository
  - Server: <https://pet.opendfki.de/>
  - Label: PET Trac
  - uncheck Anonymous and provide username and password
  - Validate Settings
  - Finish
- Associate PET Trac with your PET project:
  - open PET project properties, Task Repositories
  - check PET Trac
- Add a query (this will bring the tasks into your task list)
  - open Task List view
  - in context menu, execute New / Query
  - choose a query name, e.g. "All PET issues" and Finish

## Common Problems

**Problem:** The project is not built. Console outputs:

    make all 
    make: *** No rule to make target `all'.  Stop.

Make is executed in the directory specified as the build location. Make
sure that the current build directory is valid for your active build
configuration.

**Problem:** The debugger stops at or jumps to the wrong positions.

Make sure that your debug directory was configured with "CXXFLAGS=-O0".

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/PetEclipse/_edit)]{% endraw %}