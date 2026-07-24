{% raw %}# How to Setup and Run Matrix Regression Tests on a MacOS with an M4 Chip

This is based on my experience running Matrix Regression Tests on my 2025 Macbook Pro with an M4 Chip (updated to Tahoe 26.1). See [MatrixRegressionTesting](https://delph-in.github.io/docs/matrix/MatrixRegressionTesting).

Steps:

1)Download [ace-0.9.34-m1-test](https://sweaglesw.org/linguistics/ace-0.9.34-m1-test).

2)Move this file into a directory (I suggest making a new directory on your Desktop) and name the new directory the same name (ace-0.9.34-m1-test).

3)Rename the downloaded file inside the directory (the original ace-0.9.34-m1-test that you just downloaded) to "ace".

4)Open the terminal.

5)Navigate to your matrix directory (cd path/to/matrix).

6)Make a virtualenv with the following command:

    virtualenv -p python3 py3env

7)Activate the virtualenv with the following command:

    source py3env/bin/activate

8)Install pydelphin using:

    pip install pydelphin

9)Add Ace to your PATH with the following command (this is temporary so you need to run this line very time):

    export PATH="/Users/averybellamy/Desktop/ace-0.9.34-m1-test:$PATH"

10)To check that Ace is in your PATH, use the following command to look at the list of things in your PATH:

    echo -e ${PATH//:/\\n}

11)Now you can run the regression tests with: 

    ./rtest.py

Or, you can run individual tests with:

    ./rtest.py name-of-test

Last update: 2025-12-11 by elshire7311 [[edit](https://github.com/delph-in/docs/wiki/MatrixRegressionTestingSetupMacM4/_edit)]{% endraw %}