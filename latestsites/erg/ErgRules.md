{% raw %}# ERG Lexical and Syntactic Rules

The grammar contains several types of rules, including inflectional and
derivational lexical rules, affixation rules for punctuation, and
syntactic constructions. Example analyses illustrating the use of these
rules from the Redwoods treebank can be found
[here.](http://compling.hss.ntu.edu.sg/ltdb/cgi/ERG_1214/rules.cgi)

## Names of rules

The names of the rules are assigned using the following three-field
template, with fields separated by an underscore:

|                   |             |           |
|-------------------|-------------|-----------|
| Daughter sequence | Annotations | Rule type |

The Daughter sequence field gives the sequence of one or two
constituents that comprise the sign, separated by a hyphen, using the
following abbreviations:

|      |                         |
|------|-------------------------|
| hd   | head                    |
| hdn  | nominal head            |
| nh   | non-head                |
| sb   | subject                 |
| sp   | specifier               |
| cmp  | complement              |
| aj   | adjunct                 |
| flr  | filler                  |
| mrk  | marker                  |
| np   | nominal phrase          |
| cl   | clause                  |
| vp   | verb phrase             |
| pp   | prepositional phrase    |
| n    | noun                    |
| v    | verb                    |
| j    | adjective               |
| r    | adverb                  |
| p    | preposition             |
| w    | word                    |
| num  | number                  |
| prdp | predicative phrase      |
| jpr  | predicative adj phrase  |
| vpr  | predicative verb phrase |
| ppr  | predicative prep phrase |
| mnp  | measure noun phrase     |
| pct  | punctuation mark        |

The Annotations field provides a brief sketch of the distinguishing
properties of the rule.

The Rule type distinguishes among the broad classes of rules, using the
following suffixes:

|        |                                  |
|--------|----------------------------------|
| \_ilr  | orth-invariant inflectional rule |
| \_olr  | orth-changing inflectional rule  |
| \_dlr  | orth-invariant derivational rule |
| \_odlr | orth-changing derivation rule    |
| \_plr  | punctuation affixation rule      |
| \_c    | syntactic construction           |

The table below contains an exhaustive inventory of the rules used in
the ERG (as of the 1214 release).

## Complete inventory of ERG rules

|                                  |                                           |                                             |
|----------------------------------|-------------------------------------------|---------------------------------------------|
| Rule type                        | Annotations                               | Example                                     |
| **Syntactic constructions**      |                                           |                                             |
| sb-hd\_mc\_c                     | Head+subject, main clause                 | C arrived.                                  |
| sb-hd\_nmc\_c                    | Hd+subject, embedded clause               | B thought \[C arrived\].                    |
| sb-hd\_q\_c                      | Hd+subj, in-situ WH                       | B ate what?                                 |
| hd-cmp\_u\_c                     | Hd+complement                             | B \[hired C\].                              |
| hd-cmp\_2\_c                     | Hd+second complement                      | B \[gave to C\] E.                          |
| sp-hd\_n\_c                      | Hd+specifier, nonhd = sem hd              | \[Every cat\] slept.                        |
| sp-hd\_hc\_c                     | Hd+specifier, hd = sem hd                 | The \[very old\] cat slept.                 |
| sp-hd\_hc-cmp\_c                 | Hd+specifier w/comop, hd = sem hd         | The \[more ancient\] cat than mine slept.   |
| aj-hd\_scp\_c                    | Hd+preceding scopal adjunct               | Probably B won.                             |
| aj-hd\_scp-xp\_c                 | Hd+prec.scop.adj, VP head                 | B \[probably won\].                         |
| aj-hd\_scp-pr\_c                 | Hd+pr.scop.adj, VP hd, prd pnct           | If C loses, B wins.                         |
| aj-hd\_int\_c                    | Hd+prec.intersective adjunct              | B \[quickly left\].                         |
| aj-hd\_int-inv\_c                | Hd+prec.int.adjnct, hd inverted           | On Tuesday, can you stay?                   |
| aj-hd\_int-rel\_c                | Hd+prec.int.adjnct, hd rel-vp             | which \[on Tuesday met Kim\]                |
| hd-aj\_scp\_c                    | Hd+following scopal adjunct               | B wins if C loses.                          |
| hd-aj\_scp-pr\_c                 | Hd+foll.scop.adjnct, paird pnct           | B wins, if C loses.                         |
| hd-aj\_int-unsl\_c               | Hd+foll.int.adjct, no gap                 | B \[left quietly\].                         |
| hd-aj\_int-sl\_c                 | Hd+foll.int.adjct, gap in adj             | That cafe, we \[dined in\].                 |
| hd-aj\_vmod\_c                   | Hd+foll.int.adjct, prec. NP cmp           | B \[saw here\] a big parade.                |
| hd-aj\_vmod-s\_c                 | Hd+foll.scop.adjct, prec. NP cmp          | B \[saw here\] a big parade.                |
| hd-aj\_cmod\_c                   | Conj+foll.int.adjct, prec NP cmp          | B \[and yesterday\] C arose.                |
| hd-aj\_cmod-s\_c                 | Conj+foll.scop.adjct, prec NP cmp         | B \[and probably\] C arose.                 |
| aj-hdn\_norm\_c                  | Nominal head + preceding adjnct           | The \[big cat\] slept.                      |
| aj-hdn\_adjn\_c                  | [NomHd](/NomHd)+prec.adj, hd pre-modified | The \[big old cat\] slept.                  |
| hdn-aj\_rc\_c                    | [NomHd](/NomHd)+following relative clause | The \[cat we chased\] ran.                  |
| hdn-aj\_rc-pr\_c                 | [NomHd](/NomHd)+foll.rel.cl, paired pnct  | A \[cat, which ran,\] fell.                 |
| hdn-aj\_redrel\_c                | [NomHd](/NomHd)+foll.predicative phrase   | A \[cat in a tree\] fell.                   |
| hdn-aj\_redrel-pr\_c             | [NomHd](/NomHd)+foll.prd.phr, paired pnct | A \[cat, in a tree,\] fell.                 |
| cl\_rc-fin-nwh\_c                | Rel.clause from fin.S, no relpr           | The cat \[we chased\] ran.                  |
| cl\_rc-inf-nwh\_c                | Rel.cl. fr.infin VP, non-sb gap           | People \[to admire\] sang.                  |
| cl\_rc-inf-nwh-sb\_c             | Rel.cl. from infin VP, subj gap           | Dogs \[to chase cats\] run.                 |
| cl\_rc-instr\_c                  | Rel.cl. fr.inf.VP,no gap, instr           | Money \[to buy lunch\] fell.                |
| cl\_rc-fin-modgap\_c             | Rel cl. from fin-S, modifier gap          | The day \[we arrived\] elapsed.             |
| cl\_rc-inf-modgap\_c             | Rel cl. from inf-S, modifier gap          | The day \[to arrive\] elapsed.              |
| vp\_rc-redrel\_c                 | Rel.cl. from predicative VP               | Dogs \[chasing cats\] bark.                 |
| hd\_optcmp\_c                    | Head discharges optional compl            | B \[ate\] already.                          |
| hdn\_optcmp\_c                   | [NomHd](/NomHd) discharges opt complement | The \[picture\] appeared.                   |
| hd\_xcmp\_c                      | Head extracts compl (to SLASH)            | Who does B \[admire\] now?                  |
| hd\_xsb-fin\_c                   | Extract subject from finite hd            | Who do you think \[went?\]                  |
| hd\_xaj-int-vp\_c                | Extract int.adjunct from VP               | Here we \[stand.\]                          |
| hd\_xaj-int-s\_c                 | Extract int.adjunct from S                | When is he Kim?                             |
| hd\_xaj-crd-s\_c                 | Extract adjunct from coord S              | Now B arises and C arrives.                 |
| flr-hd\_nwh\_c                   | Filler-head, non-wh filler                | Kim, we should hire.                        |
| flr-hd\_nwh-nc\_c                | Fill-head, non-wh, no NP, no comma        | Today we should arrive.                     |
| flr-hd\_nwh-nc-np\_c             | Fill-head, non-wh, NP, no comma           | Kim we should hire.                         |
| flr-hd\_wh-mc\_c                 | Fill-head, wh non-subj, main cl           | Who did they hire?                          |
| flr-hd\_wh-mc-sb\_c              | Fill-head, wh subj, main cl               | Who left?                                   |
| flr-hd\_wh-nmc-fin\_c            | Fill-head, wh, fin hd, embed cl           | B wondered \[who won.\]                     |
| flr-hd\_wh-nmc-inf\_c            | Fill-head, wh, inf hd, embed cl           | B knew \[who to hire.\]                     |
| flr-hd\_rel-fin\_c               | Fill-head, finite, relative cls           | people \[who slept\]                        |
| flr-hd\_rel-inf\_c               | Fill-head, inf, relative cls              | people \[on whom to rely\]                  |
| hd\_imp\_c                       | Imperative clause from base VP            | Hire Browne!                                |
| hd\_yesno\_c                     | Yes-no question from inverted S           | Did B arrive?                               |
| hd\_inv-nwh\_c                   | Inverted non-wh declarative cls           | Never \[has B won here.\]                   |
| hdn\_bnp\_c                      | Bare noun phrase (no determiner)          | \[Cats\] sleep.                             |
| hdn\_bnp-prd\_c                  | Bare predicative noun phrase              | B will be president.                        |
| hdn\_bnp-pn\_c                   | Bare NP from proper name                  | \[Browne\] arrived.                         |
| hdn\_bnp-num\_c                  | Bare NP from number                       | \[42\] is even.                             |
| hdn\_bnp-qnt\_c                  | NP from already-quantified dtr            | \[Some in Paris\] slept.                    |
| hdn\_bnp-sg-nmod\_c              | NP fr. detless bare sg N-N cpnd           | It was at \[eye level.\]                    |
| hdn\_bnp-sg-jmod\_c              | NP fr. detless bare sg adj+noun           | It was at \[close range.\]                  |
| hdn\_bnp-sg-nomod\_c             | NP fr. detless bare sg unmodfd            | It was within \[range.\]                    |
| hdn\_bnp-vger\_c                 | NP from verbal gerund                     | Hiring them was easy.                       |
| np-hdn\_cpd\_c                   | Compound from proper-name+noun            | The \[IBM report\] arrived.                 |
| np-hdn\_cpd-pr\_c                | Compount, proper+noun, paired pct         | The \[Cupertino, Calif., company\] arrived. |
| np-hdn\_ttl-cpd\_c               | Compound from title+proper-name           | \[Professor Browne\] left.                  |
| np-hdn\_ttl-cpd-pl\_c            | Compound from title+plural proper         | \|Mssrs. B and C left.                      |
| np-hdn\_nme-cpd\_c               | Compound from two proper names            | \[Pat Browne\] left.                        |
| np-hdn\_num-cpd\_c               | Compound from noun+number                 | Do \[problem 6\] first.                     |
| np-hdn\_cty-cpd\_c               | Compound from city+state names            | \[Portland, Oregon\] grew.                  |
| n-hdn\_cpd\_c                    | Compound from two normal nouns            | The \[guard dog\] barked.                   |
| n-hdn\_j-n-cpd\_c                | Compound from noun+\[adj+noun\]           | kitchen heavy appliance                     |
| n-v\_j-cpd\_c                    | Compound from noun+prd\_verb              | a \[snow-covered\] town                     |
| n-j\_j-cpd\_c                    | Compound from noun+adj                    | a \[dog-friendly\] town                     |
| n-j\_j-t-cpd\_c                  | Compound from noun+trans adj              | a \[dog-happy\] town                        |
| j\_n-ed\_c                       | Adj-phr from adj + noun+ed                | the \[long eared\] dog                      |
| hdn-np\_app\_c                   | Appositive NP from two NPs                | \[Joe the plumber\] spoke.                  |
| hdn-np\_app-pr\_c                | Appositive fr.two NPs, w/commas           | \[Joe, the plumber,\] spoke.                |
| hdn-np\_app-r\_c                 | Appositive fr NP+propNP, no paired pnct   | \[The plumber Joe\] arose.                  |
| hdn-np\_app-r-pr\_c              | Appositive fr NP+propNP, w/commas         | \[The plumber, Joe,\] arrived.              |
| hdn-np\_app-num\_c               | Appositive fr NP+numNP                    | \[Joe, 22,\] arose.                         |
| hdn-np\_app-idf\_c               | Appositive with indef.NP modifr           | \[Joe, a plumber,\] spoke.                  |
| hdn-np\_app-idf-p\_c             | Appositive, indef.NP, parnthszd           | \[Joe (a plumber)\] spoke.                  |
| hdn-np\_app-nbr\_c               | Appositive with N-bar modifier            | Kim, president of the PTA                   |
| np\_adv\_c                       | Modifier phrase from NP                   | B arrived \[this week.\]                    |
| np\_adv-yr\_c                    | Modifier phrase from year NP              | Jan. 11 \[2008\] arrived.                   |
| np\_adv-mnp\_c                   | Modifier phrase from measure NP           | Markets fell \[50 points.\]                 |
| hdn\_np-num\_c                   | NP from number                            | \[700 billion\] is too much.                |
| n-n\_num-seq\_c                  | NP from sequence of numbers               | The number is \[48 205 53.\]                |
| hdn\_color\_c                    | noun from color adjective                 | \[Red\] suits you.                          |
| num-n\_mnp\_c                    | Measure NP from number+noun               | A \[two liter\] jar broke.                  |
| n-num\_mnp\_c                    | Measure NP from meas-symbol+num           | We dislike \[$6\] fuel.                     |
| n\_mnp\_c                        | Measure NP from bare noun                 | This road is \[miles\] long.                |
| mnp\_deg\_c                      | Degree phrase fr meas NP, attrib          | The \[5 meter\] tall tree fell.             |
| mnp\_deg-prd\_c                  | Deg phrase fr meas NP, predictv           | Trees are \[5 meters\] tall.                |
| num\_det\_c                      | Determiner from number                    | \[Ten cats\] slept.                         |
| num\_prt-nc\_c                   | Partitive NP fr.number, no cmp            | \[Six\] were sleeping.                      |
| num\_prt-of\_c                   | Partitive fr.number, of\_PP cmp           | \[Six\] of them slept.                      |
| num\_prt-det-nc\_c               | Partitive fr.det+number, no cmp           | \[These six\] slept.                        |
| num\_prt-det-of\_c               | Partitive fr.det+num, of-PP cmp           | \[The first of them\] left.                 |
| np\_prt-poss\_c                  | Partitive fr. possessive NP               | \[The cat's\] is empty.                     |
| np-prdp\_vpmod\_c                | Modifier from pred.small clause           | We ran, \[Kim petrified\].                  |
| np\_voc-post\_c                  | Vocative modifier fr.NP, postmod          | Where are we, \[Kim?\]                      |
| np\_voc-pre\_c                   | Vocative modifier, premod                 | \[Kim,\] where are we?                      |
| cl\_np-wh\_c                     | NP from WH clause                         | \[What he saw\] scared him.                 |
| vp\_cp-sb\_c                     | VP requiring non-WH clausal subj          | That B won \[bothered C.\]                  |
| vp\_cp-sb-inf\_c                 | VP requiring non-WH inf.cls subj          | For B to win \[bothered C.\]                |
| vp\_np-ger\_c                    | NP from verbal gerund                     | Winning money \[pleased C.\]                |
| vp\_sbrd-prd-prp\_c              | Pred.subord phr from prp-VP               | Kim arrived, \[smiling.\]                   |
| vp\_sbrd-prd-pas\_c              | Pred.subord phr from passive VP           | Kim arrived, \[inspired.\]                  |
| vp\_sbrd-prd-aj\_c               | Pred.subord phr from adjctv phr           | Kim arrived, \[very happy.\]                |
| vp\_sbrd-prd-ell\_c              | Pred.subord phr, modfs ellip.VP           | Kim might, \[given time.\]                  |
| j\_sbrd-pre\_c                   | Pred.subord phr fr.adj, prehead           | \[Unhappy,\] we left.                       |
| vp\_sbrd-pre\_c                  | Pred.subord phr fr.VP, prehead            | \[Seeing Kim\] they left.                   |
| vp\_sbrd-pre-lx\_c               | Pred.subord phr fr.lex VP, prehd          | \[Smiling,\] Kim arose.                     |
| hd-cl\_fr-rel\_c                 | Free relative clause                      | We run whenever Kim runs.                   |
| mrk-nh\_evnt\_c                  | Marker + event-based complement           | B sang \[and danced.\]                      |
| mrk-nh\_cl\_c                    | Marker + clause                           | B sang \[and C danced.\]                    |
| mrk-nh\_nom\_c                   | Marker + NP                               | Cats \[and some dogs\] ran.                 |
| mrk-nh\_n\_c                     | Marker + N-bar                            | Every cat \[and dog\] ran.                  |
| mrk-nh\_atom\_c                  | Paired marker + phrase                    | \[Both B\] and C arrived.                   |
| vp-vp\_crd-fin-t\_c              | Conjnd VP, fin, top                       | B \[sees C and chases D.\]                  |
| vp-vp\_crd-fin-m\_c              | Conjnd VP, fin, mid                       | B rose, \[sang, & chased D.\]               |
| vp-vp\_crd-fin-im\_c             | Conjnd VP, fin, mid, no comma             | B rose \[sang & chased D.\]                 |
| vp-vp\_crd-nfin-t\_c             | Conjnd VP, nonfin, top                    | B'll \[see C and chase D.\]                 |
| vp-vp\_crd-nfin-m\_c             | Conjnd VP, nonfin, mid                    | B'll rise, \[sing, & see D.\]               |
| vp-vp\_crd-nfin-im\_c            | Conjnd VP, nonfin, mid, no comma          | B'll rise \[sing & see D.\]                 |
| v-v\_crd-fin-ncj\_c              | Conjnd V,VP, fin, no conjunctn            | B \[sees C, chases D.\]                     |
| v-v\_crd-nfin-ncj\_c             | Conjnd V,VP, nonfin. no cnjct             | Be will \[see C, chase D.\]                 |
| cl-cl\_crd-t\_c                  | Conjoined clauses, non-int, top           | B sang and C danced.                        |
| cl-cl\_crd-int-t\_c              | Conjnd clauses, interrog, top             | Who sang and who danced?                    |
| cl-cl\_crd-m\_c                  | Conjoined clauses, mid                    | B sang, \[C ran, & D sat.\]                 |
| cl-cl\_crd-im\_c                 | Conjoined clauses, no cma, mid            | B sang, \[C ran & D sat.\]                  |
| cl-cl\_crd-rc-t\_c               | Conjoined relative clauses                | people \[who fly & who run\]                |
| pp-pp\_crd-t\_c                  | Conjnd PP, top                            | B is \[in Paris and at work\]               |
| pp-pp\_crd-m\_c                  | Conjnd PP, mid                            | B's \[here, in P, & at work\]               |
| pp-pp\_crd-im\_c                 | Conjnd PP, mid, no comma                  | B's \[here, in P & at work\]                |
| np-np\_crd-t\_c                  | Conjoined noun phrases, top               | \[The cat and the dog\] ran.                |
| np-np\_crd-i-t\_c                | Conjoined accus-case pro and NP           | \[Me and Kim\] left.                        |
| np-np\_crd-i2-t\_c               | Conjoined NP and accus-case pro           | \[Kim and me\] left.                        |
| np-np\_crd-i3-t\_c               | Conjoined NP and nom-case pro             | B saw \[Kim and I\].                        |
| np-np\_crd-m\_c                  | Conjoined noun phrases, mid               | Kim, \[Pat, and Tom\] ran.                  |
| np-np\_crd-im\_c                 | Conjoined NPs, no comma, mid              | Kim, \[Pat and Tom\] ran.                   |
| np-np\_crd-nc-t\_c               | Conjoined NPs, no comma, top              | Buy \[tapes, films.\]                       |
| np-np\_crd-nc-m\_c               | Conjoined NPs, no comma, mid              | Buy books, \[tapes, films.\]                |
| n-n\_crd-nc-m\_c                 | Conjoined nouns, no comma, mid            | Buy a book, \[tape, film.\]                 |
| n-n\_crd-t\_c                    | Conjnd Ns, sym agr, nondiv, top           | The \[cat and dog\] ran.                    |
| n-n\_crd-div-t\_c                | Conjnd Ns, sym agr, div, top              | The \[cats and dogs\] ran.                  |
| n-n\_crd-2-t\_c                  | Conjnd Ns, sym agr, nondiv, top           | The \[cat and dog\] ran.                    |
| n-n\_crd-3-t\_c                  | Conjnd Ns, single referent, top           | My \[friend and guide\] ran.                |
| n-n\_crd-m\_c                    | Conjoined N-bars, mid                     | No cat, \[dog, or rat\] ran.                |
| n-n\_crd-im\_c                   | Conjoined N-bars, no comma, mid           | No cat, \[dog or rat\] ran.                 |
| n-n\_crd-asym-t\_c               | Conjnd Ns, asym agr, sg+pl, top           | The \[cat and dogs\] ran.                   |
| n-n\_crd-asym2-t\_c              | Conjnd Ns, asym agr, pl+sg, top           | The \[cats and dog\] ran.                   |
| n-j\_crd-t\_c                    | Conjoined noun +adjective                 | \[marble and wooden\] stairs                |
| j-n\_crd-t\_c                    | Conjoined adjective + noun                | \[wooden and marble\] stairs                |
| j-j\_crd-att-t\_c                | Conjnd attrib adjectives, top             | the \[old and young\] cats                  |
| j-j\_crd-prd-t\_c                | Conjnd pred adjs, top                     | B is \[young and tall\].                    |
| j-j\_crd-prd-m\_c                | Conjnd pred adjs, mid                     | B is old, \[big, and tall\].                |
| j-j\_crd-prd-im\_c               | Conjnd pred adjs, no comma, mid           | B is old, \[big and tall\].                 |
| jpr-jpr\_crd-t\_c                | Conjnd subord prd phr, adj, top           | B ran, \[happy but tired.\]                 |
| jpr-jpr\_crd-m\_c                | Conjnd subord prd phr, adj, mid           | B ran, hot, \[fit, and low\]                |
| jpr-jpr\_crd-im\_c               | Conjnd sbrd phr, adj,no-cma, mid          | B ran, hot, \[fit and low.\]                |
| jpr-vpr\_crd-t\_c                | Conjnd sbrd prd phr, adj,V, top           | B ran, \[happy and freed.\]                 |
| jpr-vpr\_crd-m\_c                | Conjnd sbrd prd phr, adj,V, mid           | B ran, hot, \[fit, and lit.\]               |
| jpr-vpr\_crd-im\_c               | Conjnd sbd phr, adj,V,no-cma, mid         | B ran, hot, \[fit and lit.\]                |
| vppr-vppr\_crd-t\_c              | Conjnd subord prd phr, VP, top            | B ran, \[feared and loved.\]                |
| vppr-vppr\_crd-m\_c              | Conjnd subord prd phr, VP, mid            | B ran, torn, \[bent, & cut\]                |
| vppr-vppr\_crd-im\_c             | Conjnd sbrd phr, VP, no-cma, mid          | B ran, torn, \[bent & cut.\]                |
| ppr-ppr\_crd-t\_c                | Conjnd sbrd prd phr, PP+XP, top           | B ran, \[in Rome but lost.\]                |
| ppr-ppr\_crd-m\_c                | Conjnd sbrd prd phr, PP+XP, mid           | B ran, sad, \[in R, & lost\]                |
| ppr-ppr\_crd-im\_c               | Conjnd sbrd PP+XP, no-cma, mid            | B ran, sad, \[in R & lost\]                 |
| hd-hd\_rnr\_c                    | Right-node raising                        | B amdires and relies on C                   |
| hd-hd\_rnr-nv\_c                 | Right-node raising, not VP                | B is under or replaced by C                 |
| np\_frg\_c                       | Fragment NP                               | The cat.                                    |
| np\_cnj-frg\_c                   | Fragment conj+NP                          | And the cat.                                |
| np\_nb-frg\_c                    | Fragment N-bar                            | Angry cat.                                  |
| pp\_frg\_c                       | Fragment PP                               | In Paris.                                   |
| j\_frg\_c                        | Fragment adjective phrase                 | Angry at dogs.                              |
| r\_scp-frg\_c                    | Fragment scopal adverb phrase             | Probably.                                   |
| r\_int-frg\_c                    | Fragment intersective adverb              | Quietly.                                    |
| r\_dsc-frg\_c                    | Fragment discourse adverb                 | Yes.                                        |
| r\_cl-frg\_c                     | Fragment clausal adverb                   | Because we left.                            |
| cl\_cnj-frg\_c                   | Fragment clause with conjunctn            | And Kim stayed.                             |
| vp\_fin-frg\_c                   | Fragment finite VP                        | Chases cats.                                |
| vp\_nfin-frg\_c                  | Fragment nonfinite VP                     | To chase cats.                              |
| cl\_cp-frg\_c                    | Fragment embedded clause                  | That it chases cats.                        |
| cl\_rel-frg\_c                   | Fragment relative cluase                  | Which we assumed.                           |
| aj-np\_frg\_c                    | Fragment scopal modifier + NP             | Probably Browne.                            |
| aj-np\_int-frg\_c                | Fragment intersctv modif + NP             | On Tuesday, the cat.                        |
| aj-pp\_frg\_c                    | Fragment scopal modif + PP                | Probably in Paris.                          |
| aj-r\_frg\_c                     | Fragment scopal mod + adverbial           | Maybe, if we can.                           |
| np-aj\_frg\_c                    | Fragment NP + scopal modifier             | The cats, probably.                         |
| np-aj\_rorp-frg\_c               | Fragment NP + PP or intsctv adv           | Many problems afterwards.                   |
| np-aj\_j-frg\_c                  | Fragment NP + adjective phrase            | Pizza ready.                                |
| nb-aj\_frg\_c                    | Fragment N-bar + scopal modif             | Cat : a feline.                             |
| pp-aj\_frg\_c                    | Fragment PP + scopal modifier             | In Paris before we left.                    |
| j-aj\_frg\_c                     | Fragment adjectv + scopal modif           | Unhappy if they leave.                      |
| hdn-cl\_prnth\_c                 | [NomHd](/NomHd) + parenthetical clause    | \[Cats (they snore)\] slept.                |
| hdn-n\_prnth\_c                  | [NomHd](/NomHd) + parenthetical N-bar     | \[Some guy (democrat)\] ran.                |
| hdn-cl\_dsh\_c                   | [NomHd](/NomHd) + dash-marked clause      | \[Cats - they snore - \] ran.               |
| hd-pct\_c                        | Head + punctuation token                  | B \[arrived -\] C left.                     |
| cl-cl\_runon\_c                  | Run-on sentence w/two clauses             | B arrived; C left.                          |
| cl-cl\_runon-cma\_c              | Run-on sentence, comma-joined             | B arrived, C left.                          |
| cl-np\_runon\_c                  | Run-on sentence fr.clause + NP            | B arrived; disaster.                        |
| cl-np\_runon-prn\_c              | Run-on S fr.clause + parenth NP           | B arrived (disaster).                       |
| np-cl\_numitem\_c                | Num+sentence                              | 2\. Browne arrived.                         |
| np-cl\_indef\_c                  | IndefNP+sentence                          | A fool, Browne arrived.                     |
| cl-rc\_c                         | VP-final relative clause                  | It rained, which surprised C.               |
| w-w\_fw-seq-m\_c                 | Seq. of italic/foreign wds, mid           | \[amo amas\] amat                           |
| w-w\_fw-seq-t\_c                 | NP fr.seq.of italic/foreign wds           | \[\[amo amas\] amat\]                       |
| xp\_brck-pr\_c                   | Paired bracketed phrase                   | The \[sun-drenched\] cat                    |
| xp-xp\_bridge\_c                 | Robust binary bridging rule               | \[We admire B\] \[admires C\]               |
| xp\_bridge\_c                    | Robust unary bridging rule                | We admire B \[admires C\]                   |
| **Inflectional rules**           |                                           |                                             |
| n\_pl\_olr                       | Plural noun with \|-s\| suffix            | cats                                        |
| n\_sg\_ilr                       | Singular noun                             | cat                                         |
| n\_ms\_ilr                       | Mass noun                                 | rice                                        |
| n\_ms-cnt\_ilr                   | Mass or count noun                        | \[unknown noun\]                            |
| n\_pl-cur\_ilr                   | Plural of currency noun: no \|-s\|        | $                                           |
| v\_3s-fin\_olr                   | Third-singular present verb               | admires                                     |
| v\_n3s-bse\_ilr                  | Non-3sing or base form verb               | admire                                      |
| v\_pst\_olr                      | Past tense verb                           | admired                                     |
| v\_psp\_olr                      | Past particple verb                       | admired                                     |
| v\_prp\_olr                      | Present participle verb                   | admiring                                    |
| v\_prp-nf\_olr                   | Present participle verb,nonformal         | admirin                                     |
| **Derivational lexical rules**   |                                           |                                             |
| v\_pas\_odlr                     | Passive verb                              | admired                                     |
| v\_pas-p\_odlr                   | Prepositional passive verb                | referred to                                 |
| v\_pas-p-t\_odlr                 | Prep. passive of trans. verb              | added to                                    |
| v\_pas-prt-t\_odlr               | Passive of verb + selected PP             | relied on                                   |
| v\_pas-dat\_odlr                 | Passive of dative shift verb              | given                                       |
| v\_pas-cp\_odlr                  | Passive of cp-complement verb             | said                                        |
| v\_aux-sb-inv\_dlr               | Subject-auxiliary inversion               | Did they arrive?                            |
| v\_aux-advadd\_dlr               | Addition of adverb as complement          | They did not arrive.                        |
| v\_aux-tag\_dlr                  | Tag question auxiliary                    | He arrived, didn't he?                      |
| v\_aux-ell-ref\_dlr              | Elided VP compl, referentl subj           | He did.                                     |
| v\_aux-ell-xpl\_dlr              | Elided VP compl, expletive subj           | It did.                                     |
| v\_cond-inv\_dlr                 | Conditional inversion                     | Had he left, we'd have left.                |
| v\_dat\_dlr                      | Dative shift alternation                  | They gave the book to him.                  |
| v\_np-prtcl\_dlr                 | Particle-NP reordering                    | He looked the answer up.                    |
| v\_inv-quot\_dlr                 | Main verb inversion for quoting           | He left, said Kim.                          |
| v\_nger-intr\_dlr                | Nominal gerund of intrans verb            | Leaving was easy.                           |
| v\_nger-pp\_dlr                  | Nominal gerund of PP-comp verb            | Relying on Kim was wrong.                   |
| v\_nger-tr\_dlr                  | Nominal gerund of trans verb              | The hiring of Kim was OK.                   |
| det\_prt-of-agr\_dlr             | Partitive NP, PP-of, num agrmt            | Some of us are ready.                       |
| det\_prt-of-nagr\_dlr            | Partitive NP, PP-of, no agrmt             | Each of us is ready                         |
| det\_prt-nocmp\_dlr              | Partitive NP, no PP complement            | Most arrived. part\_nocomp                  |
| n\_bipart\_dlr                   | Relax bipartite constraint                | The scissors isn't sharp.                   |
| n\_n-ed\_odlr                    | Noun with \|-ed\| suffix as adj           | Long-eared sheep slept.                     |
| v\_v-re\_dlr                     | Verb with \|re-\| prefix                  | He re-tied his shoe.                        |
| v\_v-pre\_dlr                    | Verb with \|pre-\| prefix                 | He pre-signed the check.                    |
| v\_v-mis\_dlr                    | Verb with \|mis-\| prefix                 | He mis-tied his shoe.                       |
| v\_v-co\_dlr                     | Verb with \|co-\| prefix                  | He co-wrote the paper.                      |
| v\_v-un\_dlr                     | Verb with \|un-\| prefix                  | He untied his shoes.                        |
| v\_v-counter\_dlr                | Verb with \|counter-\| prefix             | He counter-signed the bill.                 |
| n\_det-mnth\_dlr                 | Month name as determiner                  | July tenth arrived.                         |
| n\_det-wkdy\_dlr                 | Weekday name as determiner                | We arrived Sunday morning.                  |
| j\_n-minut\_dlr                  | Integer as minute name                    | Ten sixteen is too late.                    |
| j\_att\_dlr                      | Attrib adj from trans pred adj            | A similar cat arrived.                      |
| j\_enough\_dlr                   | Adj intr plus enough-complement           | A big enough cat arrived.                   |
| j\_enough-wc\_dlr                | Adj w/comps plus enough-complmnt          | A happy enough cat arrived.                 |
| j\_n-pre\_odlr                   | Adj from noun plus prefix                 | The pre-war period endured.                 |
| v\_j-nb-intr\_dlr                | Attrib adj from intrans verb              | The sleeping cat stirred.                   |
| v\_j-nb-prp-tr\_dlr              | Attr adj from trans prp verb              | The admiring crowd ran.                     |
| v\_j-nb-pas-tr\_dlr              | Attr adj from trans passive verb          | The hired consultant left.                  |
| v\_j-nb-pas-ptcl\_dlr            | Attr adj from passiveV+selected PP        | The hoped for consultant left.              |
| v\_j-nme-intr\_dlr               | Attr adj from intr verb, nme mod          | The smiling Abrams won.                     |
| v\_j-nme-tr\_dlr                 | Attr adj from trns verb, nme mod          | Our winning Abrams smiled.                  |
| w\_italics\_dlr                  | Italicized word made into NP              | Some say /windshield/.                      |
| **Punctuation affixation rules** |                                           |                                             |
| w\_period\_plr                   | Period affixed to end of word             | cat.                                        |
| w\_qmark\_plr                    | Question mark affixed to word             | cat?                                        |
| w\_qqmark\_plr                   | Double question mark affixed              | cat??                                       |
| w\_qmark-bang\_plr               | Qmark and exclam point affixed            | cat?!                                       |
| w\_comma\_plr                    | Comma affixed                             | cat,                                        |
| w\_bang\_plr                     | Exclamation point affixed                 | cat!                                        |
| w\_semicol\_plr                  | Semicolon affixed                         | cat;                                        |
| w\_double\_semicol\_plr          | Robust double semicolon                   | cat;;                                       |
| w\_rparen\_plr                   | Right parenthesis affixed                 | cat)                                        |
| w\_comma-rp\_plr                 | Comma wrongly before right paren          | cat,)                                       |
| w\_lparen\_plr                   | Left parenthesis prefixed                 | (cat                                        |
| w\_rbrack\_plr                   | Right square bracket affixed              | cat\]                                       |
| w\_lbrack\_plr                   | Left square bracket prefixed              | \[cat                                       |
| w\_dqright\_plr                  | Double quote affixed to end               | cat"                                        |
| w\_dqleft\_plr                   | Double quote prefixed                     | "cat                                        |
| w\_sqright\_plr                  | Single quote affixed to end               | cat'                                        |
| w\_sqleft\_plr                   | Single quote prefixed                     | 'cat                                        |
| w\_hyphen\_plr                   | Hyphen affixed to end                     | cat-                                        |
| w\_threedot\_plr                 | Three dots affixed to end                 | cat...                                      |
| w\_asterisk\_plr                 | Asterisk affixed to end                   | cat\*                                       |
| w\_asterisk-pre\_plr             | Asterisk prefixed to word                 | \*cat                                       |
| w\_comma-nf\_plr                 | Nonformal comma affixed                   | cat,                                        |
| w\_italright\_plr                | Italics mark \|iยฆ\| affixed              | catiยฆ                                      |
| w\_italleft\_plr                 | Italics mark \|ยฆi\| prefixed             | ยฆicat                                      |
| w\_drop-ileft\_plr               | Ignored italics mark affixed              | catiยฆ                                      |
| w\_drop-iright\_plr              | Ignored italics mark prefixed             | catiยฆ                                      |

Last update: 2015-08-25 by DanFlickinger [[edit](https://github.com/delph-in/docs/wiki/ErgRules/_edit)]{% endraw %}