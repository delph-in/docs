{% raw %}# Detailed LTDB Installation and Usage (using an Ubuntu virtual machine on a MacOS)

# Introduction
This documents my experience installing and using LTDB on an Ubuntu VM on the UTM app on a MacOS on a 2025 Macbook Pro with an M4 chip (updated to Tahoe 26.1). It explains the [setup and installation](https://github.com/delph-in/docs/wiki/LkbLtdb_MacOS_VM_Installation#setup-and-installation), [how to run the LTDB](https://github.com/delph-in/docs/wiki/LkbLtdb_MacOS_VM_Installation#run-the-ltdb), and finally [how to create your own database from a grammar](https://github.com/delph-in/docs/wiki/LkbLtdb_MacOS_VM_Installation#add-your-own-database-inside-ltdb-from-a-grammar).

# Setup and Installation
Within the VM, open the terminal.

Enter the following commands into the terminal:

    sudo apt install python3.8-venv
    sudo apt install python3-pip
    pip install --upgrade.pip
    sudo apt-get install apache2 xmlstarlet p7zip sqlite3
    sudo apt-get install python3-docutils python3-lxml
    pip install pydelphin --upgrade
    systemctl restart apache2
    sudo a2enmod userdir
    systemctl restart apache2
    sudo a2enmod cgi
    sudo chown $USER:$USER /etc/apache2/sites-available/000-default.conf

Open the file /etc/apache2/sites-available/000-default.conf

Within the 000-default.conf file, add the following lines to the end of the file:

    <Directory .home/*/public_html/cgi-bin/>
        Options +ExecCGI
        AddHandler cgi-script .cgi
    </Directory>

Open the terminal again.

Enter the following commands:

    sudo service apache2 restart
    sudo apt install git

Then, clone the LTDB github repository.

NOTE: If you get an error that says "waiting for cache lock", try restarting the VM (that fixed it for me)

Now, use the following commands to checkout to the flask branch and setup the LTDB for running:

    cd ltdb
    git fetch --all
    git branch -a
    git switch flask
    cd ..
    source .venv/bin/activate
    cd ltdb
    pip install -r requirements.txt
    chmod +x deploy.sh

# Run the LTDB

While inside the ltdb file folder, type into the terminal:

    ./deploy.sh

Then, while it's running, click on the link in the terminal output after 'running on..."

While on the site, select the grammar DB you want to look at. Then , you can click on different grammar features, such as "Lexical Types".

# Add your own database inside LTDB from a grammar

Unpack your grammar into the Ubuntu VM

Open the METADATA file and add the following line to the end:

    ACE_CONFIG_FILE = "ace/config.tdl"

Return to the terminal and run the following commands:

    cd ltdb
    cd scripts
    python3 grm2db.py /home/ubuntu/your-grammar-folder/METADATA

Open the file system and go to tmp/tmp####/ (where #### are random letters and numbers; the full name will be output into the terminal after your last command)

Copy the file called your-grammar-name####.db

Paste the file into the folder ltdb/web/db/

Now you can [run LTDB](https://github.com/delph-in/docs/wiki/LkbLtdb_MacOS_VM_Installation#run-the-ltdb) and click on your-grammar-name as a database.

Last update: 2025-12-06 by elshire7311 [[edit](https://github.com/delph-in/docs/wiki/LkbLtdb_MacOS_VM_Installation/_edit)]{% endraw %}