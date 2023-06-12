{% raw %}# Regression Test

Regression testing checks if a new implementation works well with all
the previous functionality in the development of software.

## Required Components

The coverage testing employs several DELPH-IN tools. All the paths of
the tools below must be enrolled as PATH in \~/.bashrc.

1. **ace**: see [AceTop](https://delph-in.github.io/docs/tools/AceTop)
2. **art**: see <http://sweaglesw.org/linguistics/libtsdb/art>
3. **pyDelphin**: see <https://github.com/goodmami/pydelphin>
4. **gTest**: see <https://github.com/goodmami/gtest>

## Usage

The regression test can be done under ind/utils.

    $ ./regression_test.sh

The profiles to be tested are enumerated in COMPARISON under ind/utils
(line by line).

If regression test cannot be done, try

    $ sudo apt-get install python3-networkx

## gTest

Update gTest

    ~/tools/gtest$ git stash
    ~/tools/gtest$ git pull
    ~/tools/gtest$ export PYTHONPATH=~/tools/pydelphin

For help:

    ~/tools/gtest$ ./gTest.py -h

Run gTest

    ~/tools/gtest$ ./gTest.py -G ~/grammar/ind C -l
    ~/tools/gtest$ ./gTest.py -G ~/grammar/ind C :mrs

Example result:

    :mrs (172 items; 0 ignored):
                  :       grammatical        :       ungrammatical
      items       :   172/172   (1.0000)     :     0/172   (0.0000)
      parses      :    60/172   (0.3488)     :     0/0     (------)    
      readings    :    83/60    (1.3833)     :     0/0     (------)    

Run gTest

    ~/tools/gtest$ ./gTest.py -G ~/grammar/ind M :mrs

Example result:

    ...
    Xmrs structure is not connected.
      warn(str(ex), XmrsWarning)
      results     :    83/60    (1.3833 per item)
      No MRS      :     0/83    ( 0.00% of results)
      Bad MRS     :     0/83    ( 0.00%)
      Ill-formed  :    16/83    (19.28%)
      Disconnected:     3/83    ( 3.61%)
      Non-headed  :    10/83    (12.05%)
    
    ~/tools/gtest$ ls
    ~/tools/gtest$ ls tmp/
    ~/tools/gtest$ ls /tmp/tmpsb9ihq4e/
    ~/tools/gtest$ less /tmp/tmpsb9ihq4e/run-mrs.log 
    ~/tools/gtest$ ./gTest.py -W tmp -G ~/grammar/ind M :mrs
    ~/tools/gtest$ less tmp/run-mrs.log

Last update: 2017-01-09 by DavidMoeljadi [[edit](https://github.com/delph-in/docs/wiki/IndraRegressionTest/_edit)]{% endraw %}