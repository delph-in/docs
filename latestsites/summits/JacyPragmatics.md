{% raw %}This page is for notes on how to make the pragmatic information,
currently in CONTEXT and thus not visible in the MRS, more visible. It
arises from discussions between Melanie Siegel, Ann Copestake, Stephan
Oepen, Dan Flickinger and Francis Bond. This page does not necessarily
accurately reflect anyone's opinions.

Contents

1. [Pragmatic Information in the
MRS](https://delph-in.github.io/docs/summits/JacyPragmatics#Pragmatic_Information_in_the_MRS)
   1. [Unresolved issues](https://delph-in.github.io/docs/summits/JacyPragmatics#Unresolved_issues)
2. [Current JACY implementation](https://delph-in.github.io/docs/summits/JacyPragmatics#Current_JACY_implementation)

# Pragmatic Information in the MRS

- make all pragmatic predicates easily distinguishable
  - subtypes of prag\_d\_rel
  - coarse POS of **d** for discourse
- To capture the information in JACY, we would need the following
relations:

<!-- -->


    prag_d_rel := arg0-relation.
    
    speaker_d_rel := prag_d_rel &
       [ARG0 index].
    
    hearer_d_rel := prag_d_rel &
       [ARG0 index]. 
    
    honor_d_rel := prag_d_rel & arg123-relation.
       [ARG0 index [POLARITY BOOLEAN],
        ARG1 index,                     ;Honorer
        ARG2 index,                     ;Honored
        ARG3 individual].               ;Bearer
    
    subj-honor_d_rel :< honor_d_rel.
    
    obj-honor_d_rel :< honor_d_rel.
    
    addr-honor_d_rel :< honor_d_rel.
    
    empathy_d_rel := prag_d_rel & arg12-relation.
       [ARG0 index, 
        ARG1 index,                    ;Empathizer
        ARG2 index].                   ;Empathized

## Unresolved issues

- speaker/hearer scope in quotations
- best way to handle polarity in honorification
- topic

# Current JACY implementation

    c-indices := avm & 
                 [SPEAKER index,
                  ADDRESSEE index].
    
    honor_rel := avm &
                 [HONORER index,
                  HONORED index,
                  POLARITY bool,
                  BEARER individual].
    
    subj-honor_rel :< honor_rel.
    
    obj-honor_rel :< honor_rel.
    
    addr-honor_rel :< honor_rel.
    
    
    j-ctxt := ctxt &
            [C-INDICES c-indices & [SPEAKER #sp],
             BACKGROUND diff-list & [LIST list],
             EMPATHY empathy_rel & [EMPER #sp]].
    
    
    empathy_rel := avm &
                   [EMPER index,
                    EMPEE index].

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/JacyPragmatics/_edit)]{% endraw %}