{% raw %}## FSPP

FSPP (Finite-State [PreProcessor](/PreProcessor)) provides the simple
standard preprocesser for use with DELPH-IN software tools and grammars.
The preprocessor is available both as a stand-alone executable
([SafFsppStandAlone](/SafFsppStandAlone)) as well as an embedded module
in the [LkbTop](https://delph-in.github.io/docs/tools/LkbTop) and \[in progress...\] an embedded module in
[PetTop](https://delph-in.github.io/docs/garage/PetTop).

FSPP is initialized from a file containing finite-state rule definitions
(eg. \`preprocessor.fsr'). It is then fed input strings (one per
sentence) as input, from which it produces standoff XML (in the
[SmafTop](https://delph-in.github.io/docs/tools/SmafTop) or [SafTop](https://delph-in.github.io/docs/tools/SafTop) formats) as output.

## FSPP Example

Initialization:

    Reading preprocessor rules `preprocessor.fsr'
    Reading preprocessor rules `ecommerce.fsr'
    Reading preprocessor rules `gcide.fsr'
    Reading preprocessor rules `rondane.fsr'
    #[X-FSPP (61 global, 434 token-level rules @ `[ \t]+')]

Input:

    The dog barks.

Output:

    <?xml version='1.0' encoding='UTF-8'?><!DOCTYPE smaf SYSTEM 'smaf.dtd'><smaf><text>The dog barks.</text><olac:olac xmlns:olac='http://www.language-archives.org/OLAC/1.0/' xmlns='http://purl.org/dc/elements/1.1/' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xsi:schemaLocation='http://www.language-archives.org/OLAC/1.0/ http://www.language-archives.org/OLAC/1.0/olac.xsd'><creator>x-preprocessor 1.00</creator><created>11:12:02 4/19/2006 (UTC)</created></olac:olac><lattice init='v0' final='v3' cfrom='0' cto='14'><edge type='token' id='t1' cfrom='0' cto='3' source='v0' target='v1'>The</edge><edge type='token' id='t2' cfrom='4' cto='7' source='v1' target='v2'>dog</edge><edge type='token' id='t3' cfrom='8' cto='14' source='v2' target='v3'>barks.</edge></lattice></smaf>

Last update: 2006-04-19 by BenjaminWaldron [[edit](https://github.com/delph-in/docs/wiki/SafFspp/_edit)]{% endraw %}