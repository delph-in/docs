{% raw %}# Hierarchy of French phonemes

(La Grenouille, 2007-08-21)

    phon := sort.
      voiced := phon.
      sonorant := voiced.
      nasal := sonorant.
    
    glide_cons := phon.
    glide_vow := voiced.
    
    vowel := glide_vow & sonorant.
    high-vowel := vowel.
    oral-vowel := vowel.
      high-oral-vowel := oral-vowel & high-vowel.
      mid-vowel := oral-vowel.
        tense-vowel := mid-vowel.
        lax-vowel := mid-vowel.
      low-vowel := oral-vowel.
    
     i := high-oral-vowel.
     u := high-oral-vowel.
     y := high-oral-vowel.
    
     e := tense-vowel.
     ɛ := lax-vowel.
     a := low-vowel.
     ɑ := low-vowel.
     ɔ := lax-vowel.
     o := tense-vowel.
     œ := lax-vowel.
     ø := tense-vowel.
     ə := lax-vowel.
    
    nasal-vowel := oral-vowel & nasal.
     ɔ̃ := nasal-vowel.
     ɑ̃ := nasal-vowel.
     ɛ̃ := nasal-vowel.
     œ̃ := nasal-vowel.
    
    glide := glide_cons & high-vowel.
     j := glide.
     w := glide.
     ɥ := glide.
    
    consonant := glide_cons.
    voiced-cons := consonant & voiced.
    voiceless-cons := consonant.
    stop := consonant.
    fricative := consonant.
    
    voiced-stop := voiced-cons & stop.
    voiceless-stop := voiceless-cons & stop.
    voiced-fricative := voiced-cons & fricative.
    voiceless-fricative := voiceless-cons & fricative.
    
     p := voiceless-stop.
     t := voiceless-stop.
     k := voiceless-stop.
     ʔ := voiceless-stop.
    
     b := voiced-stop.
     d := voiced-stop.
     g := voiced-stop.
    
     s := voiceless-fricative.
     f := voiceless-fricative.
     ʃ := voiceless-fricative.
     z := voiced-fricative.
     v := voiced-fricative.
     ʒ := voiced-fricative.
     h := voiceless-fricative.
    
    liquid := voiced-cons & sonorant. 
     l := liquid.
     ʎ := liquid.
     r := liquid.
     ʁ := liquid.
    
    nasal-cons := voiced-stop & nasal.
     m := nasal-cons.
     n := nasal-cons.
     ɲ := nasal-cons.
     ŋ := nasal-cons.

Last update: 2007-08-21 by JesseTseng [[edit](https://github.com/delph-in/docs/wiki/PhonologyTop_FrenchPhonemes/_edit)]{% endraw %}