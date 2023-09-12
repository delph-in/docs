{% raw %}Notes from discussion of MRS design for light verb constructions at [Galicia Summit](https://delph-in.github.io/docs/summits/GaliciaSchedule).

* [Tara's slides](https://github.com/delph-in/docs/blob/main/summits/2023/lvc-mrs-design-2023.pdf?raw=true)
* Scribe: Emily

Questions:

* How many EPs in the MRS?
* What kind of argument sharing between them?
* How about the idea of sharing scope position (labels)?

Berthold: Persian (and probably Hindi/Urdu): Very limited inventory of verbs. Some kind of allomorphic variance --- particular LVs appear with certain predicates. Researcher in Amsterdam has looked into this.

Francis:
How much do you want to keep the semantics similar to the surface v. deeper?
*I gave my son a bath*
there is a special bath predicate and it behaves like bathe (bath(me, my son)) or do we still want my son as an argument of give?

Tara:
Test involving replacement with a verby form.

Francis:
Do you want the predicate _bath_coverb or _bath_n_rel. Would prefer the former.

Emily:
Why?

Francis:
Makes it easier to manipulate the semantics to do things. Jacy: *Kim talked to Sandy* all arguments of the verb suru. Then have to do a rewriting step in the semantics to get to what I want. Not necessarily an argument for it being the right representation. Because suru is so light...

Emily:
*suru* really takes a dative argument?

Francis:
We have one that does. But *ni* is tricky because it can also be an adjunct.

Dan:
What about a verb that takes a VP complement...

Francis:
*hanashi wo shite mita* --- *try* attaches to *do*.

Emily:
What about clausal complements? ... but anyway, *suru* is super bleached and shouldn't be in the semantics.

Guy:
Does cleaner semantics push the complexity elsewhere?
*I gave my son a bath and a book*

Dan:
Heading towards Zeugma:
*I drove my mother crazy and my daughter to Texas* -

Francis:
I would be okay if that was in fact blocking that.

Dan:
*I took a bath and a nap* -- sounds fine.

Emily:
LVC in both cases there (and same LV) so that's okay.

Dan:
If *I took a bus, I took a train, I took a plane* is a LVC -- no corresponding verb handy. Have to make a verby predicate. *I took a taxi* doesn't mean the same thing as *I taxied*. Doing that while parsing & composing semantics seems out of reach...

Francis:
I don't expect it to be the same predicate. Was thinking more _bath_v_rel (not same as _bathe_v_rel) and then some hierarchy relates them. Not sure *take a taxi* is a LVC.

Guy:
Maybe like the VPCs: _bath_v_take

Emily:
What does _taxi_v_take get you? And what about *We took two taxis* And what about *I took a quick bath* v. *I took a hot bath*.

Guy:
How about _hot_a_rel predicated of _bath_v_take

Emily:
But what do we do about the semantics of the determiner *a*?

Dan:
In take a hot bath, it really is about the temp of the liquid.

Emily:
And so what's your theory of *take a quick bath*

Dan:
Reduced to previously unsolved problem: *I enjoy an occasional bath*

Guy:
So we can't derive anything from the fact that it modifies the noun.

Dan:
Still don't understand the drive to jump all the way to the meaning of the idiom.

Francis:
There are places where the coverb affects the argument structure. *I don't a give fuck about sthg* v. *I gave him a bath about sthg*. The about is being licensed by the co-verb. The about is being licensed by the co-verb. Would you agree?

Emily:
Or just another idiom involving *give*.

Tara:
Point of Japanese examples was that the arguments depend on the co-verb.

Emily:
But *suru* is completely transparent.

Dan:
*I gave a talk about that subject.*

Francis/Emily:
The PP[about] in that one is just a nouny modifier.

Emily:
Japanese is one type (very transparent), English another. Parameter in the customization system...

Francis:
Jacy has a difference between LVCs with and without the accusative marker. Maybe that's wrong, maybe there is a thing to model there.

Francis:
Why should LVs have a different analysis from just being an argument of the verb?

Tara:
[Scribe was catching up]

Hei:
Would the LVC analysis replace the original one or become a second analysis? *I get criticism* = *I was criticized*. Do we model this as ambiguity?

Emily:
Replacing...

Francis:
*I took a bath* -- it could be I picked up a bathtub. So do we want two readings? And how would they differ?

Hei:
*I am getting support* -- two readings.

Emily:
Which one is the LVC?


Last update: 2023-06-27 by emilymbender [[edit](https://github.com/delph-in/docs/wiki/GaliciaMrsLvc/_edit)]{% endraw %}