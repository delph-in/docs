**matrixdef File Syntax**

The file matrixdef defines the Matrix customization web interface,
specifically the form fields that appear, their possible values, and the
HTML surrounding and formatting them. The file is parsed server side in
deffile.py, and outputs HTML. The syntax currently allows for sections,
labels, check boxes, radio buttons, selects, files, buttons, and text
fields. There are also two special, custom UI elements, Iterables and
MultiSelects. The file is broken up into sections, each of which
corresponds to a different sub-page of our multi-page questionnaire.

Note that this page uses square bracket syntax "\[\]" to denote optional
definitions.

The file consists of a series of form-field declarations, separated by
blank lines. Most elements in matrixdef generally follow the syntax as
follows:

Keyword Variable-Name "Friendly-Name" \["HTML-before" "HTML-after" \["JavaScript-onChange"\]\]

-   Keyword is one of {
    Section, Label, Check, Separator, Radio, Select, MultiSelect, Text, TextArea, Hidden, File, Button, BeginIter, Cache 
    }

-   Variable is the name of the form field, consisting of alphanumeric
    characters, \_, and -. Generally, variable names should consist of
    English words or abbreviations separated by -. Iterable choices are
    separated by \_. Thus, variable names are described the the
    following regular expression: (\[-a-zA-Z\]+\[0-9\]+\_)\*\[-a-zA-Z\]+

-   Friendly-Name is an English-language name for the form field that
    will appear in the main page of the questionnaire

-   HTML-before is the HTML that will appear before the form field

-   HTML-after is the HTML that will appear after the form field

-   JavaScript-onChange is some [JavaScript](/JavaScript) code to place
    in the onChange event. Depending on the keyword, this is also
    sometimes onClick. See below for details.

The last three parts of a form field definition are irrelevant for
keywords Section and Label, and the last, Width, is only relevant only
the Text keyword. Irrelevant parts of a definition are ignored.

**Section, Label, and Separator**

Section produces a heading in the HTML file. Label allows arbitrary HTML
to be added to the page, such as notes or labels. Separator adds a
horizontal line across the page.

**Check**

Checkboxes are boolean (yes/no) choices for the user-linguist to choose.
They are defined as follows:

 Check variable-name "friendly\_name" "HTML before" "HTML after" \["Javascript onclick"\] 

Additionally, a choices on one page can affect choices on other pages.
This allows, for instance, a checkbox to not be rendered unless a
relevant choice is marked on a different subpage, or vice versa. The
choice can be marked with an exact string or a regex pattern. Multiple
variables can be joined via \| to form a set of variables. The syntax
for this is as follows:

 Check variable-name "friendly\_name" "HTML before" "HTML after" \["Javascript onclick" \["VariableName1ToSwitchOn"\[\|"VariableName2ToSwitchOn"\]\]\] 

**Iterables**

Iterables define a section of choices that can be entered multiple times
by a user. A button which copies the definition of choices within an
iterable allows the user to define more choices.

Iterables are enclosed by the BeginIter and EndIter keywords.

e.g.

        BeginIter forbid{k} "a Forbid constraint"

          Select others "Noun Position Class {i} Lexical Rule Type {j} forbids" "Lexical Rule Type {j} forbids the following: " ""
          fillcache c=nouns
          fillregex p=noun-pc[0-9]+(_lrt[0-9]+)?_name
          . noun "Any noun" "any noun"

        EndIter forbid

where the syntax of BeginIter is as follows:

-   BeginIter VariableName{counterVariable} "HTML" show\_hide:bool iter\_min:int 

The above matrixdef definitions create HTML with appropriate javascript
functions to generate an iterable select option. This can be viewed live
by looking at the forbid constraints on lexical rules on the [Morphology
page](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology).

These options are defined as follows:

-   VariableName Name of the iterable

-   CounterVariable Variable to be defined and used in the iterable and
    objects associated with it: for instance, in naming lexical rule
    instances, there is a counter for the position class (i), lexical
    rule type (j), and the lexical rule instance (k).

-   "HTML" HTML value to show the user, akin to the "friendly name"

-   show\_hide Boolean value represented as 0 or 1, where 1 adds the
    show\_hide option to the iterable, allowing the iterable to be
    collapsed using an arrow. 0 does not include this functionality for
    this iterable.

-   iter\_min Integer count for minimum/default number of iterables. For
    instance, a choices file is deemed acceptable if one noun and two
    verbs are defined. This is prompted to the user by setting the
    iter\_min of the "noun" iterable to 1 and the iter\_min of the
    "verb" iterable to 2.

Forthcoming syntax allows iterables to be toggled given a choice on a
different subpage. The choice can be marked with an exact string or a
regex pattern. For instance, Incorporated Stem Lexical Rules are only
available on nouns in the Morphology page if the "Some nouns in this
language take adjectives as incorporated affixes:" checkbox is checked.
The name of this Check option is adj\_incorp, and so to create an
iterable that is skipped if the adj\_incorp is checked, the following
syntax is used:

-   BeginIter VariableName{counterVariable} "HTML" show\_hide:bool iter\_min:int \["VariableName1ToSwitchOn"\|"VariableName2ToSwitchOn"\] 

e.g.

-   BeginIter is-lrt{j} "an Incorporated Stem Lexical Rule Type" 1 0 "adj\_incorp" 

Using this syntax, if the choice named adj\_incorp has a value, the
iterable will appear, else, it will not.

Note that if an iterable is activated by some choice, filled out, and
then the choice that it switches on is deactivated, the iterable and its
data will be lost. This is intended behavior.

**Radio Buttons**

Radio buttons have additional syntax associated with them. Whereas the
other form field definitions consist of single lines separated by blank
lines, radio button definitions consist of multiple lines: the first
defines the name of the radio button group and the subsequent lines
define the radio buttons and the values associated with them.

        Radio variable "Friendly-Name" "HTML-before" "HTML-after"<<BR>>
        . choice-variable "Choice Friendly-Name" "Choice HTML-before" "Choice HTML-after/Choice Text"<<BR>>
        . choice-variable "Choice Friendly-Name" "Choice HTML-before" "Choice HTML-after/Choice Text" disabled_flag_x<<BR>>
        . etc...

A sample radio button definition appears below:

        Radio neg-infl-type "Negative inflection type" "On: " ""
        . aux "Auxiliaries only" "" "auxiliaries only "
        . main "Main verbs only" "" "main verbs only "
        . aux-main "Main or auxiliary verbs" "" "any finite verb (main or auxiliary)<br>" x

Notice that the radio button lines have a keyword of ".". This is a
placeholder that keeps the number of parts in all definitions
consistent. The definition above produces the following HTML:

        On:
        <input type="radio" name="neg-infl-type" value="aux" id="choiceID1"><label for="choiceID1">auxiliaries only </label>
        <input type="radio" name="neg-infl-type" value="main" id="choiceID2"><label for="choiceID2">main verbs only </label>
        <input type="radio" name="neg-infl-type" value="aux-main" id="choiceID3" disabled><label for="choiceID3">any finite verb (main or auxiliary) <br></label>

Forthcoming syntax allows a radio button form to be toggled given a
choice on another subpage. This allows a radio button form to not be
rendered unless a relevant choice is marked on a different subpage. The
choice can be marked with an exact string or a regex pattern. The syntax
for this is as follows:

 Radio variable-name "friendly\_name" "HTML before" "HTML after" \["VariableName1ToSwitchOn"\|"VariableName2ToSwitchOn"\] 

**Select and Multiselect**

Select creates drop-downs via HTML select elements. A Select element
must be followed by one or more lines specifying the values in the
drop-down. These values can be defined overtly as radio button values as
described above.

Multiselect creates custom drop-downs which allow for multiple choices
to be checked. Otherwise, they are the same as Select.

Multiselect allows an option to be greyed out by putting an "x" flag
after the option.

-   Normal option:
    -   . ap  "AP" "APs"

    Greyed out option:
    -   . pp "PP" "PPs" x

Alternatively, or in addition, Select and Multiselect lines may be
followed by 'fill' statements that can take zero or more arguments,
e.g., fillregex p=number\[0-9\]+\_name n=1, where the arguments in this
example are p=pattern and n=1. Possible arguments are defined in
deffile.py.

**Text and [TextArea](/TextArea)**

Text inserts a small text input box, while TextArea inserts a larger
one. The syntax is as follows:

        Keyword Variable-Name "Friendly-Name" ["HTML-before" "HTML-after" [Width]]

These also support the special Width keyword, to specify the maximum
length, in characters, of the input.

There is also an OnChange flag that allows [JavaScript](/JavaScript) to
be associated with the OnChange event of the text field (that is, code
that is executed when the text box changes).

**Hidden**

Add information to the HTML page hidden from the user, such as text to
be shown via some [JavaScript](/JavaScript) interactivity or
[JavaScript](/JavaScript).

**File**

Define a file to be uploaded.

**Button**

Define a button with a [JavaScript](/JavaScript) handler attached.

**Fill commands**

The possible fill commands are as follows:

-   |                                  |                                                                                                                                                                                |
    |----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | fillregex p=REGEXPATTERN \[n=1\] | Searches item on current page matching the regular expression REGEXPATTERN. If n=1 is given, only the variable name will be displayed, rather than "variable (friendly)" names |
    | fillnames c=CATEGORY             | Fill with feature names from CATEGORY                                                                                                                                          |
    | fillvalues p=PATTERN \[l=1\]     | Fill with values from PATTERN. If l=1 is given, PATTERN is just a feature name. Otherwise it is a key specifying an element on the page                                        |
    | fillverbpat                      | (No arguments) Fill with verb patterns (currently "intransitive" and "transitive")                                                                                             |
    | fillnumbers                      | (No arguments) Fill with the number features                                                                                                                                   |
    | fillcache c=CACHENAME            | Fill with items in the cache CACHENAME. The cache is created with a Cache command (see below)                                                                                  |

One can use fill commands as well as additional choices in both Select
and MultiSelect blocks:

    MultiSelect inputs "Verb Position Class {i} Input" "<br/>Possible inputs:" ""
      fillcache c=verbs
      fillcache c=auxes
      fillregex p=verb-pc[0-9]+(_lrt[0-9]+)?_name
      . verb "Any verb" "any verb"
      . iverb "Any intransitive verb" "any intransitive verb"
      . tverb "Any transitive verb" "any transitive verb"
      . aux "Any auxiliary verb" "any auxiliary verb"

**Choice Caching**

A questionnaire page does not have direct access to the choices file or
other questionnaire subpages, so if you need values from other pages you
can use a Cache command to store them in a [JavaScript](/JavaScript)
array.

       Cache CACHENAME REGEXPATTERN DISPLAYSUBKEY

The [JavaScript](/JavaScript) variable will be called CACHENAME, and
will include any items matching REGEXPATTERN. This regular expression
must match the beginning of the choice key, but is not required to match
the end of the key. Thus, if you want to get non-terminal choices (e.g.
noun1, but not noun1\_name, noun1\_feat1\_name, etc.), use a $ at the
end of the pattern. DISPLAYSUBKEY, if provided, is used to get the
choice value displayed in the questionnaire. For instance, if you want
to cache all nouns, but want them to be displayed by their name, use the
following:

        Cache nouns noun[0-9]+$ name

**Toggling an element on a choice**

As described above, several of the UI elements can automatically be
toggled on or off given a choice on another subpage. The functionality
of this is as follows: if any non empty value exists in this position,
then the UI element is skipped, unless the UI element matches a choice
on a different page as described below.

While the syntax of where the switching string appears given a UI
element (see specific sections for this syntax), the syntax is the same
across sections. The syntax is as follows:

 "VariableName1ToSwitchOn\|VariableName2ToSwitchOn\|VariableNameRegex\\dToSwitchOn\|VariableName3=SomeValue\|VariableName4=(Value1,Value2)" 

Some notes on matching values:

-   Matching variable names: The string can be either a direct string
    match, for choices that are relevant cross linguistically and not
    associated with an iterable (such as has-aux), or the string can be
    a regular expression to match iterables (such as adj\\d\_predcop).

-   Matching values: If a particular value is required for the match,
    then this can be specified with an =. For instance,
    "adj\\d\_predcop=opt" only matches if a choice matching the name
    adj\\d\_predcop has the value opt.

-   Matching multiple names: The \| operator can be used to string
    together multiple expressions to match. For instance, if a value
    only appears when choice1 and noun\\d\_choice2 have some value, the
    string choice1\|noun\\d\_choice2 should match and toggle this
    appropriately.

-   Matching multiple values: The system can match multiple values after
    an = by listing the values in a comma separated list.

Note that if a match is made, a UI element is rendered, and a choice is
made, and then the original choice is unchecked, the dependent choices
will be lost (**on loading the page they are from**). This is intended
behavior. Ideally, the choice would be removed in any case, but this is
future work.

### Examples

 fillvalues p=nominalization l=1 

(this will give you a dropdown with only values from the Nominalization
page).

### Common mistakes

-   Using the same loop name for
    [BeginInter/EndIter](/BeginInter/EndIter) will lead to an error. If
    you see an internal server error message when switching between
    subpages after adding a new loop, check that you used a unique name.

-   Blank lines are meaningful; they separate statements from each
    other. Thus, something like this won't work (note the blank line):

<!-- -->

        Radio neg-infl-type "Negative inflection type" "On: " ""

        . aux "Auxiliaries only" "" "auxiliaries only "
        . main "Main verbs only" "" "main verbs only "
        . aux-main "Main or auxiliary verbs" "" "any finite verb (main or auxiliary)<br>" x

-   It is easy to forget empty "HTML before/after" fields, for example,
    the below will lead to a non-loading web page because the "HTML
    after" field, which in this case might be just empty ("") is missing
    at the end:

<!-- -->

        Radio neg-infl-type "Negative inflection type" "On: "
