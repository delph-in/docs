{% raw %}Below are some instructions which were put together for a student whose task was to manually accept items in a treebank for which there is a gold tree but FFTB couldn't automatically update them. Maybe they will serve someone in the future.

Suppose you have two versions of the treebank, with some unfortunate differences such as lexical rule name differences (which could occur if you change the version of the morphological analyzer, for example, and update the grammar accordingly).

This may result in discriminant sets which are similar but not identical to the ones stored in the gold profile. In such a case, the Automatic Update feature of FFTB will not lead to a fully updated treebank. You will still need to go through the items and reconcile the differences.

We assume that you run [fftb](https://delph-in.github.io/docs/tools/FftbTop) with the --gold flag, e.g. as below, for the Spanish treebank called tbdb03 for which we have two versions which differ significantly due to major grammar updates. The only treebanking decisions that we have are for the old version.

```
fftb -g ~/delphin/grammars/srg/ace/srg.dat --browser --webdir ~/delphin/tools/acetools/assets --gold ~/delphin/grammars/srg-treebanks/old-gold/TIBIDABO/tbdb03 ~/delphin/grammars/srg-treebanks/TIBIDABO/tbdb03
```

After you run that, you will see the sentences which constitute this portion of the treebank, and at first, al or mostly should be yellow, which means that currently, the tool does not have access to any treebanking decisions regarding to the sets of trees which correspond to each item. 

<img width="748" alt="Screen Shot 2023-04-24 at 4 10 08 PM" src="https://user-images.githubusercontent.com/10963114/234604718-f5937e54-3003-47f1-8204-8e5c327a63c7.png">


Click on “Automatic update”. You will see something like this: the same items but after the tool attempted to reconcile the new trees with the ones in the old treebank. In some cases, this automatic reconciliation will not yield too many matches (if e.g. names of the rules changed throughout the grammar).

Note: if your gold treebanks were not normalized/thinned and so you cannot easily inspect the gold tree after loading the profile in [incr tsdb()], [thinning a profile is easy](https://github.com/delph-in/docs/wiki/ItsdbTreebanking_ItsdbExporting#thinning-the-treebanks).

<img width="1270" alt="Screen Shot 2023-04-24 at 4 10 57 PM" src="https://user-images.githubusercontent.com/10963114/234605124-5bbb2a5f-d58c-4399-99b4-7fa2a02ded0e.png">


In the end, you may need to go through all the items except the green ones, and re-treebank them. In this part of the tutorial, we will focus on the easiest set of situations. This is when the new version already contains the analysis which was marked as "gold" in the old version but we need to find that tree because it could not be automatically found (for whatever reason).

Multiple situations are possible in this case.

## Situation 1: All discriminants match and there is only one remaining tree, and it is the gold tree:

<img width="1276" alt="Screen Shot 2023-04-24 at 6 44 45 PM" src="https://user-images.githubusercontent.com/10963114/234608226-aa72b0ac-b6b1-4f3a-9c6c-c0bd1169d88f.png">


In such a case, you can simply click "accept" and move to the next unannotated item. 

## Situation 2: Analyses available, disctiminants enabled, "Gold tree is out":

<img width="1273" alt="Screen Shot 2023-04-24 at 4 12 01 PM" src="https://user-images.githubusercontent.com/10963114/234610687-17378c55-246b-4c66-97d5-56c33139403a.png">


Keep disabling the discriminants by clicking on the blue "all off/off" in the purple box on the right until you see "Gold tree is in". (The blue "off"/grey "on" means the discriminant is enabled; to disable it, you need to click on "off", and then "off" will become grey. To turn the discriminant back on, click on the blue "on").

### Situation 2.1: You see "Gold tree is in" eventually, after disabling some of the old discriminants.

<img width="1246" alt="Screen Shot 2023-04-26 at 4 48 54 PM" src="https://user-images.githubusercontent.com/10963114/234614021-d4d174fc-f363-4aa4-a5b2-dd400baa52c3.png">


You can either try to understand which of the discriminants is the right one or you could even just mechanically try each of the remaining discriminants until you are in Situation 1. At that point, accept the tree.

### Situation 2.2: You still see "Gold tree is out" even after disabling all of the active discriminants.

In such a case, you need to investigate what happened to the old gold tree but running the old grammar with the appropriate software (separately from the treebanking process). If the task is to only deal with the easy cases, skip such items.

### Situation 2.3: The gold tree was "in" but seems impossible to find no matter what you try.

Sometimes, clicking on a purple box results in the message “Gold tree is in” disappearing and “Gold tree is out” appearing. This means, the discriminant you just picked is wrong. In such a case, remove it from the “new manual” by clicking on [x] next to the lowest discriminant in the “new manual” list:

<img width="1262" alt="Screen Shot 2023-04-24 at 6 47 17 PM" src="https://user-images.githubusercontent.com/10963114/234614707-60b896a1-b9fd-4712-ac00-fc95b3010bdf.png">


After you get the message “Gold tree is in” back, pick the next box, ignoring the one you already tried.

Occasionally, you will try all the boxes and will not arrive at the situation where you have one reading remaining and “Gold tree is is” message still appearing. Such cases should probably be filed as bugs against the grammar.

## Situation 3: No analyses available at all, even though in the old treebank, there was an analysis and a gold tree was recorded.

File a bug or otherwise record this, and move on to the next item.


Last update: 2023-06-23 by Olga Zamaraeva [[edit](https://github.com/delph-in/docs/wiki/FftbTreebankUpdateTutorial/_edit)]{% endraw %}