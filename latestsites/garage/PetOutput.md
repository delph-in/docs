{% raw %}# Redirecting Pet's Output

For historical reasons, cheap doesn't send its output to STDOUT
(although it really should). You can get at the output by redirecting
STDERR, an example is given below:

    cat input.text | cheap -limit=10000 -mrs=xml japanese.grm &> output.xml

To get more output, increase the verbosity.
<update date omitted for speed>{% endraw %}