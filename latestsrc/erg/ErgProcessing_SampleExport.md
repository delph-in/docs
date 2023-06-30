{% raw %}# Background

This page documents the result of exporting four different perspectives
on HPSG analyses obtained from the ERG (in its 1111 release version and
using the stock Redwoods parse selection model in one-best mode); see
the [ErgProcessing](https://delph-in.github.io/docs/erg/ErgProcessing) page for more details.

    [1] (1 of 1) {1} `The ERG is easy to install and use.'
    
    
    [1:0] (active)
    
    (ROOT_STRICT
     (1323 SB-HD_MC_C 8.70491 0 8
      (1311 SP-HD_N_C 1.11976 0 2
       (100 the_1/d_-_the_le -0.14088 0 1
        ("the" 86
         "token [ +TRAIT native_trait +CLASS alphabetic [ +CASE capitalized+lower +INITIAL + ] +PRED predsort +CARG \"The\" +TNT null_tnt [ +MAIN tnt_main [ +TAG \"DT\" +PRB \"1\" ] +PRBS *null* +TAGS *null* ] +TO \"3\" +FROM \"0\" +ID *diff-list* [ LAST #1=*top* LIST *cons* [ REST #1 FIRST \"42\" ] ] +FORM \"the\" ]"))
       (1310 N_SG_ILR 1.029 1 2
        (109 erg_n1/n_-_c_le 0 1 2
         ("erg" 87
          "token [ +TRAIT native_trait +CLASS alphabetic [ +INITIAL - +CASE capitalized+upper ] +PRED predsort +CARG \"ERG\" +TNT null_tnt [ +MAIN tnt_main [ +PRB \"0.52159999999999995\" +TAG \"NN\" ] +PRBS *null* +TAGS *null* ] +TO \"7\" +FROM \"4\" +ID *diff-list* [ LIST *cons* [ FIRST \"43\" REST #1=*top* ] LAST #1 ] +FORM \"erg\" ]"))))
      (1322 HD-CMP_U_C 6.05265 2 8
       (135 be_c_is/v_prd_is_le 2.00943 2 3
        ("is" 67
         "token [ +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +PRB \"1\" +TAG \"VBZ\" ] ] +TO \"10\" +FROM \"8\" +ID *diff-list* [ LIST *cons* [ FIRST \"44\" REST #1=*top* ] LAST #1 ] +CARG #2=\"is\" +PRED predsort +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT native_trait +FORM #2 ]"))
       (1321 HD-CMP_U_C 3.58047 3 8
        (1312 HD_OPTCMP_C -0.563259 3 4
         (173 easy_a3/aj_pp-vp_i-tgh_le 0.172789 3 4
          ("easy" 77
           "token [ +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +TAG \"JJ\" +PRB \"0.94899999999999995\" ] ] +TO \"15\" +FROM \"11\" +ID *diff-list* [ LAST #1=*top* LIST *cons* [ REST #1 FIRST \"45\" ] ] +CARG #2=\"easy\" +PRED predsort +CLASS alphabetic [ +CASE non_capitalized+lower +INITIAL - ] +TRAIT native_trait +FORM #2 ]")))
        (1320 HD-CMP_U_C 2.89692 4 8
         (200 to_c_prop/cm_vp_to_le 2.24017 4 5
          ("to" 69
           "token [ +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +PRB \"1\" +TAG \"TO\" ] ] +TO \"18\" +FROM \"16\" +ID *diff-list* [ LIST *cons* [ FIRST \"46\" REST #1=*top* ] LAST #1 ] +CARG #2=\"to\" +PRED predsort +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT native_trait +FORM #2 ]"))
         (1319 VP-VP_CRD-NFIN-T_C 0.230933 5 8
          (1314 HD_XCMP_C -0.39958 5 6
           (1313 V_N3S-BSE_ILR 0.0122178 5 6
            (219 install_v1/v_np*_le 0 5 6
             ("install" 71
              "token [ +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +PRB \"1\" +TAG \"VB\" ] ] +TO \"26\" +FROM \"19\" +ID *diff-list* [ LIST *cons* [ FIRST \"47\" REST #1=*top* ] LAST #1 ] +CARG #2=\"install\" +PRED predsort +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT native_trait +FORM #2 ]"))))
          (1318 MRK-NH_EVNT_C 0.35383 6 8
           (223 and_conj/c_xp_and_le 0.282446 6 7
            ("and" 73
             "token [ +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +PRB \"1\" +TAG \"CC\" ] ] +TO \"30\" +FROM \"27\" +ID *diff-list* [ LIST *cons* [ FIRST \"48\" REST #1=*top* ] LAST #1 ] +CARG #2=\"and\" +PRED predsort +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT native_trait +FORM #2 ]"))
           (1317 HD_XCMP_C -0.401074 7 8
            (1316 W_PERIOD_PLR -0.584206 7 8
             (1315 V_N3S-BSE_ILR -0.468538 7 8
              (240 use_v1/v_np_le -0.0077208 7 8
               ("use." 79
                "token [ +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +PRB \"0.87180000000000002\" +TAG \"VB\" ] ] +TO \"35\" +FROM \"31\" +ID *diff-list* [ LIST *cons* [ REST *cons* [ REST #1=*list* FIRST \"50\" ] FIRST \"49\" ] LAST #1 ] +CARG \"use\" +PRED predsort +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT native_trait +FORM \"use.\" ]"))))))))))))
    
    (S (NP (DET (the)) (N (N (erg))))
     (VP (V (is))
      (AP (ADJ (ADJ (easy)))
       (VP/NP (COMP/NP (to))
        (VP/NP (VP/NP (V/NP (V/NP (install))))
         (VP-C/NP (CONJ/NP (and)) (VP/NP (V/NP (V/NP (V/NP (use.)))))))))))
    
    
     [ LTOP: h1
       INDEX: e2 [ e SF: PROP TENSE: PRES MOOD: INDICATIVE PROG: - PERF: - ]
       RELS: <
              [ _the_q_rel<0:3>
                LBL: h3
                ARG0: x5 [ x PERS: 3 NUM: SG IND: + ]
                RSTR: h6
                BODY: h4 ]
              [ "_erg_n_1_rel"<4:7>
                LBL: h7
                ARG0: x5 ]
              [ "_easy_a_for_rel"<11:15>
                LBL: h8
                ARG0: e2
                ARG1: h9
                ARG2: i10 ]
              [ "_install_v_1_rel"<19:26>
                LBL: h11
                ARG0: e12 [ e SF: PROP-OR-QUES TENSE: UNTENSED MOOD: INDICATIVE PROG: - PERF: - ]
                ARG1: i13
                ARG2: x5 ]
              [ _and_c_rel<27:30>
                LBL: h14
                ARG0: e16 [ e SF: PROP-OR-QUES TENSE: UNTENSED MOOD: INDICATIVE PROG: - PERF: - ]
                L-HNDL: h11
                L-INDEX: e12
                R-HNDL: h17
                R-INDEX: e15 [ e SF: PROP-OR-QUES TENSE: UNTENSED MOOD: INDICATIVE PROG: - PERF: - ] ]
              [ "_use_v_1_rel"<31:35>
                LBL: h17
                ARG0: e15
                ARG1: i13
                ARG2: x5 ] >
       HCONS: < h6 qeq h7 h9 qeq h14 > ]
    
    {e2:
     x5:_the_q<0:3>[]
     e2:_easy_a_for<11:15>[ARG1 e16:_and_c]
     e12:_install_v_1<19:26>[ARG2 x5:_erg_n_1]
     e16:_and_c<27:30>[L-INDEX e12:_install_v_1, R-INDEX e15:_use_v_1, L-HNDL e12:_install_v_1, R-HNDL e15:_use_v_1]
     e15:_use_v_1<31:35>[ARG2 x5:_erg_n_1]
    }
    
    ^L
    [2] (1 of 1) {1} `Parsing English with the ERG is a real pleasure.'
    
    
    [2:0] (active)
    
    (ROOT_STRICT
     (1245 SB-HD_MC_C 10.3042 0 9
      (1238 HDN_BNP-VGER_C 4.96528 0 5
       (1237 VP_NP-GER_C 4.33811 0 5
        (1236 HD-AJ_INT-UNSL_C 3.80861 0 5
         (1232 HD-CMP_U_C 3.73731 0 2
          (1229 V_PRP_OLR 0.771617 0 1
           (107 parse_v1/v_np*_le 0.0141567 0 1
            ("parsing" 98
             "token [ +TRAIT native_trait +CLASS alphabetic [ +INITIAL + +CASE capitalized+lower ] +PRED predsort +CARG \"Parsing\" +TNT null_tnt [ +MAIN tnt_main [ +PRB \"0.85760000000000003\" +TAG \"NNP\" ] +PRBS *null* +TAGS *null* ] +TO \"7\" +FROM \"0\" +ID *diff-list* [ LIST *cons* [ FIRST \"42\" REST #1=*top* ] LAST #1 ] +FORM \"parsing\" ]")))
          (1231 HDN_BNP-PN_C 2.25047 1 2
           (1230 N_SG_ILR 1.69565 1 2
            (111 english_n1/n_-_pn_le 2.0648 1 2
             ("english" 97
              "token [ +TRAIT native_trait +CLASS alphabetic [ +INITIAL - +CASE capitalized+lower ] +PRED predsort +CARG \"English\" +TNT null_tnt [ +MAIN tnt_main [ +PRB \"0.8679\" +TAG \"NNP\" ] +PRBS *null* +TAGS *null* ] +TO \"15\" +FROM \"8\" +ID *diff-list* [ LIST *cons* [ FIRST \"43\" REST #1=*top* ] LAST #1 ] +FORM \"english\" ]")))))
         (1235 HD-CMP_U_C -0.277961 2 5
          (126 with_p/p_np_i_le -0.835301 2 3
           ("with" 73
            "token [ +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +PRB \"1\" +TAG \"IN\" ] ] +TO \"20\" +FROM \"16\" +ID *diff-list* [ LIST *cons* [ FIRST \"44\" REST #1=*top* ] LAST #1 ] +CARG #2=\"with\" +PRED predsort +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT native_trait +FORM #2 ]"))
          (1234 SP-HD_N_C 0.257588 3 5
           (142 the_1/d_-_the_le -0.737332 3 4
            ("the" 75
             "token [ +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +PRB \"1\" +TAG \"DT\" ] ] +TO \"24\" +FROM \"21\" +ID *diff-list* [ LIST *cons* [ FIRST \"45\" REST #1=*top* ] LAST #1 ] +CARG #2=\"the\" +PRED predsort +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT native_trait +FORM #2 ]"))
           (1233 N_SG_ILR 0.726072 4 5
            (151 erg_n1/n_-_c_le 0 4 5
             ("erg" 99
              "token [ +TRAIT native_trait +CLASS alphabetic [ +INITIAL - +CASE capitalized+upper ] +PRED predsort +CARG \"ERG\" +TNT null_tnt [ +MAIN tnt_main [ +PRB \"0.61629999999999996\" +TAG \"NNP\" ] +PRBS *null* +TAGS *null* ] +TO \"28\" +FROM \"25\" +ID *diff-list* [ LIST *cons* [ FIRST \"46\" REST #1=*top* ] LAST #1 ] +FORM \"erg\" ]"))))))))
      (1244 HD-CMP_U_C 4.7185 5 9
       (179 be_id_is/v_np_is_le 1.53352 5 6
        ("is" 77
         "token [ +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +PRB \"1\" +TAG \"VBZ\" ] ] +TO \"31\" +FROM \"29\" +ID *diff-list* [ LIST *cons* [ FIRST \"47\" REST #1=*top* ] LAST #1 ] +CARG #2=\"is\" +PRED predsort +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT native_trait +FORM #2 ]"))
       (1243 SP-HD_N_C 2.86189 6 9
        (217 a_det/d_-_sg-nmd_le 0.147598 6 7
         ("a" 79
          "token [ +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +PRB \"1\" +TAG \"DT\" ] ] +TO \"33\" +FROM \"32\" +ID *diff-list* [ LIST *cons* [ FIRST \"48\" REST #1=*top* ] LAST #1 ] +CARG #2=\"a\" +PRED predsort +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT native_trait +FORM #2 ]"))
        (1242 AJ-HDN_NORM_C 1.7814 7 9
         (241 real_a1/aj_-_i_le -0.0092076 7 8
          ("real" 81
           "token [ +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +PRB \"1\" +TAG \"JJ\" ] ] +TO \"38\" +FROM \"34\" +ID *diff-list* [ LIST *cons* [ FIRST \"49\" REST #1=*top* ] LAST #1 ] +CARG #2=\"real\" +PRED predsort +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT native_trait +FORM #2 ]"))
         (1241 HDN_OPTCMP_C 0.741446 8 9
          (1240 W_PERIOD_PLR 0.359169 8 9
           (1239 N_MS-CNT_ILR 0.172771 8 9
            (248 pleasure_n1/n_pp_mc-of-ns_le 0 8 9
             ("pleasure." 83
              "token [ +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +TAG \"NN\" +PRB \"1\" ] ] +TO \"48\" +FROM \"39\" +ID *diff-list* [ LAST #1=*list* LIST *cons* [ FIRST \"50\" REST *cons* [ FIRST \"51\" REST #1 ] ] ] +CARG \"pleasure\" +PRED predsort +CLASS alphabetic [ +CASE non_capitalized+lower +INITIAL - ] +TRAIT native_trait +FORM \"pleasure.\" ]"))))))))))
    
    (S
     (NP
      (N
       (VP (VP (V (V (parsing))) (NP (N (N (english)))))
        (PP (P (with)) (NP (DET (the)) (N (N (erg))))))))
     (VP (V (is))
      (NP (DET (a)) (N (AP (real)) (N (N (N (N (pleasure.)))))))))
    
    
     [ LTOP: h1
       INDEX: e2 [ e SF: PROP TENSE: PRES MOOD: INDICATIVE PROG: - PERF: - ]
       RELS: <
              [ udef_q_rel<0:28>
                LBL: h3
                ARG0: x5 [ x PERS: 3 NUM: SG GEND: N ]
                RSTR: h4
                BODY: h6 ]
              [ nominalization_rel<0:28>
                LBL: h7
                ARG0: x5
                ARG1: h8 ]
              [ "_parse_v_1_rel"<0:7>
                LBL: h8
                ARG0: e9 [ e SF: PROP TENSE: UNTENSED MOOD: INDICATIVE PROG: + PERF: - ]
                ARG1: i11
                ARG2: x10 [ x PERS: 3 NUM: SG IND: + ] ]
              [ proper_q_rel<8:15>
                LBL: h12
                ARG0: x10
                RSTR: h13
                BODY: h14 ]
              [ named_rel<8:15>
                LBL: h15
                ARG0: x10
                CARG: "English" ]
              [ _with_p_rel<16:20>
                LBL: h8
                ARG0: e16 [ e SF: PROP TENSE: UNTENSED MOOD: INDICATIVE ]
                ARG1: e9
                ARG2: x17 [ x PERS: 3 NUM: SG IND: + ] ]
              [ _the_q_rel<21:24>
                LBL: h18
                ARG0: x17
                RSTR: h20
                BODY: h19 ]
              [ "_erg_n_1_rel"<25:28>
                LBL: h21
                ARG0: x17 ]
              [ _be_v_id_rel<29:31>
                LBL: h22
                ARG0: e2
                ARG1: x5
                ARG2: x23 [ x PERS: 3 NUM: SG ] ]
              [ _a_q_rel<32:33>
                LBL: h24
                ARG0: x23
                RSTR: h26
                BODY: h25 ]
              [ "_real_a_1_rel"<34:38>
                LBL: h27
                ARG0: e28 [ e SF: PROP TENSE: UNTENSED MOOD: INDICATIVE ]
                ARG1: x23 ]
              [ "_pleasure_n_of_rel"<39:48>
                LBL: h27
                ARG0: x23
                ARG1: i29 ] >
       HCONS: < h4 qeq h7 h13 qeq h15 h20 qeq h21 h26 qeq h27 > ]
    
    {e2:
     x5:udef_q<0:28>[]
     x5:nominalization<0:28>[ARG1 e9:_parse_v_1]
     e9:_parse_v_1<0:7>[ARG2 x10:named(english)]
     x10:proper_q<8:15>[]
     e16:_with_p<16:20>[ARG1 e9:_parse_v_1, ARG2 x17:_erg_n_1]
     x17:_the_q<21:24>[]
     e2:_be_v_id<29:31>[ARG1 x5:nominalization, ARG2 x23:_pleasure_n_of]
     x23:_a_q<32:33>[]
     e28:_real_a_1<34:38>[ARG1 x23:_pleasure_n_of]
    }
    
    ^L
    [3] (1 of 1) {1} `We are grateful to everyone who contributed to the grammar and software.'
    
    
    [3:0] (active)
    
    (ROOT_STRICT
     (2157 SB-HD_MC_C 8.83583 0 12
      (2137 HDN_BNP-QNT_C 0.259436 0 1
       (113 we/n_-_pr-we_le -0.225481 0 1
        ("we" 112
         "token [ +TRAIT native_trait +CLASS alphabetic [ +CASE capitalized+lower +INITIAL + ] +PRED predsort +CARG \"We\" +TNT null_tnt [ +MAIN tnt_main [ +TAG \"PRP\" +PRB \"1\" ] +PRBS *null* +TAGS *null* ] +TO \"2\" +FROM \"0\" +ID *diff-list* [ LAST #1=*top* LIST *cons* [ REST #1 FIRST \"42\" ] ] +FORM \"we\" ]")))
      (2156 HD-CMP_U_C 7.54616 1 12
       (122 be_c_are/v_prd_are_le 1.08949 1 2
        ("are" 85
         "token [ +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +PRB \"1\" +TAG \"VBP\" ] ] +TO \"6\" +FROM \"3\" +ID *diff-list* [ LIST *cons* [ FIRST \"43\" REST #1=*top* ] LAST #1 ] +CARG #2=\"are\" +PRED predsort +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT native_trait +FORM #2 ]"))
       (2155 HD-AJ_INT-UNSL_C 5.60773 2 12
        (130 grateful_isect/aj_-_i_le 0 2 3
         ("grateful" 87
          "token [ +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +PRB \"1\" +TAG \"JJ\" ] ] +TO \"15\" +FROM \"7\" +ID *diff-list* [ LIST *cons* [ FIRST \"44\" REST #1=*top* ] LAST #1 ] +CARG #2=\"grateful\" +PRED predsort +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT native_trait +FORM #2 ]"))
        (2154 HD-CMP_U_C 4.66342 3 12
         (156 to/p_np_i-nnm_le -1.4786 3 4
          ("to" 89
           "token [ +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +PRB \"1\" +TAG \"TO\" ] ] +TO \"18\" +FROM \"16\" +ID *diff-list* [ LIST *cons* [ FIRST \"45\" REST #1=*top* ] LAST #1 ] +CARG #2=\"to\" +PRED predsort +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT native_trait +FORM #2 ]"))
         (2153 HDN_BNP-QNT_C 6.4368 4 12
          (2152 HDN-AJ_RC_C 6.83132 4 12
           (2138 HDN_OPTCMP_C 1.42244 4 5
            (175 everyone/n_-_pr_le 0 4 5
             ("everyone" 91
              "token [ +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +PRB \"1\" +TAG \"NN\" ] ] +TO \"27\" +FROM \"19\" +ID *diff-list* [ LIST *cons* [ FIRST \"46\" REST #1=*top* ] LAST #1 ] +CARG #2=\"everyone\" +PRED predsort +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT native_trait +FORM #2 ]")))
           (2151 FLR-HD_REL-FIN_C 4.72298 5 12
            (2139 HDN_BNP-QNT_C -0.301662 5 6
             (178 who2/n_-_pr-rel-who_le -0.202481 5 6
              ("who" 93
               "token [ +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +PRB \"1\" +TAG \"WP\" ] ] +TO \"31\" +FROM \"28\" +ID *diff-list* [ LIST *cons* [ FIRST \"47\" REST #1=*top* ] LAST #1 ] +CARG #2=\"who\" +PRED predsort +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT native_trait +FORM #2 ]")))
            (2150 HD_XSB-FIN_C 4.46702 6 12
             (2149 HD-CMP_U_C 3.48481 6 12
              (2141 HD_OPTCMP_C 0.595239 6 7
               (2140 V_PST_OLR 0.126199 6 7
                (182 contribute_v2/v_np*-pp_to_le 0 6 7
                 ("contributed" 105
                  "token [ +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +TAG \"VBD\" +PRB \"0.95009999999999994\" ] ] +TO \"43\" +FROM \"32\" +ID *diff-list* [ LAST #1=*top* LIST *cons* [ REST #1 FIRST \"48\" ] ] +CARG #2=\"contributed\" +PRED predsort +CLASS alphabetic [ +CASE non_capitalized+lower +INITIAL - ] +TRAIT native_trait +FORM #2 ]"))))
              (2148 HD-CMP_U_C 1.91197 7 12
               (245 to_prtcl/p_np_ptcl_le 0.651968 7 8
                ("to" 95
                 "token [ +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +PRB \"1\" +TAG \"TO\" ] ] +TO \"46\" +FROM \"44\" +ID *diff-list* [ LIST *cons* [ FIRST \"49\" REST #1=*top* ] LAST #1 ] +CARG #2=\"to\" +PRED predsort +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT native_trait +FORM #2 ]"))
               (2147 SP-HD_N_C 0.0933799 8 12
                (267 the_1/d_-_the_le -0.739935 8 9
                 ("the" 97
                  "token [ +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +PRB \"1\" +TAG \"DT\" ] ] +TO \"50\" +FROM \"47\" +ID *diff-list* [ LIST *cons* [ FIRST \"50\" REST #1=*top* ] LAST #1 ] +CARG #2=\"the\" +PRED predsort +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT native_trait +FORM #2 ]"))
                (2146 N-N_CRD-DIV-T_C 1.12527 9 12
                 (2142 N_MS-CNT_ILR -0.30482 9 10
                  (274 grammar_n1/n_-_mc_le -0.222114 9 10
                   ("grammar" 99
                    "token [ +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +PRB \"1\" +TAG \"NN\" ] ] +TO \"58\" +FROM \"51\" +ID *diff-list* [ LIST *cons* [ FIRST \"51\" REST #1=*top* ] LAST #1 ] +CARG #2=\"grammar\" +PRED predsort +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT native_trait +FORM #2 ]")))
                 (2145 MRK-NH_N_C 1.56666 10 12
                  (277 and_conj/c_xp_and_le -1.06077 10 11
                   ("and" 101
                    "token [ +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +PRB \"1\" +TAG \"CC\" ] ] +TO \"62\" +FROM \"59\" +ID *diff-list* [ LIST *cons* [ FIRST \"52\" REST #1=*top* ] LAST #1 ] +CARG #2=\"and\" +PRED predsort +CLASS alphabetic [ +INITIAL - +CASE non_capitalized+lower ] +TRAIT native_trait +FORM #2 ]"))
                  (2144 W_PERIOD_PLR 1.50055 11 12
                   (2143 N_MS_ILR 0.565224 11 12
                    (287 software_n1/n_-_m_le 0 11 12
                     ("software." 103
                      "token [ +TNT null_tnt [ +TAGS *null* +PRBS *null* +MAIN tnt_main [ +TAG \"NN\" +PRB \"1\" ] ] +TO \"72\" +FROM \"63\" +ID *diff-list* [ LAST #1=*list* LIST *cons* [ FIRST \"53\" REST *cons* [ FIRST \"54\" REST #1 ] ] ] +CARG \"software\" +PRED predsort +CLASS alphabetic [ +CASE non_capitalized+lower +INITIAL - ] +TRAIT native_trait +FORM \"software.\" ]"))))))))))))))))))
    
    (S (NP (NP (we)))
     (VP (V (are))
      (AP (AP (grateful))
       (PP (P (to))
        (NP
         (N (N (N (everyone)))
          (S (NP (N (who)))
           (S/NP
            (VP/NP (V/NP (V/NP (V/NP (contributed))))
             (PP (P (to))
              (NP (DET (the))
               (N (N (N (grammar)))
                (N (CONJ (and)) (N (N (N (software.)))))))))))))))))
    
    
     [ LTOP: h1
       INDEX: e2 [ e SF: PROP TENSE: PRES MOOD: INDICATIVE PROG: - PERF: - ]
       RELS: <
              [ pron_rel<0:2>
                LBL: h3
                ARG0: x4 [ x PERS: 1 NUM: PL PRONTYPE: STD_PRON ] ]
              [ pronoun_q_rel<0:2>
                LBL: h5
                ARG0: x4
                RSTR: h6
                BODY: h7 ]
              [ "_grateful_a_1_rel"<7:15>
                LBL: h8
                ARG0: e2
                ARG1: x4 ]
              [ _to_p_rel<16:18>
                LBL: h8
                ARG0: e9 [ e SF: PROP TENSE: UNTENSED MOOD: INDICATIVE ]
                ARG1: e2
                ARG2: x10 [ x PERS: 3 NUM: SG ] ]
              [ person_rel<19:27>
                LBL: h11
                ARG0: x10 ]
              [ every_q_rel<19:27>
                LBL: h12
                ARG0: x10
                RSTR: h13
                BODY: h14 ]
              [ "_contribute_v_to_rel"<32:43>
                LBL: h11
                ARG0: e15 [ e SF: PROP TENSE: PAST MOOD: INDICATIVE PROG: - PERF: - ]
                ARG1: x10
                ARG2: p17
                ARG3: x16 [ x PERS: 3 ] ]
              [ _the_q_rel<47:50>
                LBL: h18
                ARG0: x16
                RSTR: h20
                BODY: h19 ]
              [ udef_q_rel<51:58>
                LBL: h21
                ARG0: x23 [ x PERS: 3 NUM: SG ]
                RSTR: h22
                BODY: h24 ]
              [ "_grammar_n_1_rel"<51:58>
                LBL: h25
                ARG0: x23 ]
              [ udef_q_rel<59:72>
                LBL: h26
                ARG0: x27 [ x PERS: 3 NUM: SG GEND: N IND: - ]
                RSTR: h28
                BODY: h29 ]
              [ _and_c_rel<59:62>
                LBL: h30
                ARG0: x16
                L-INDEX: x23
                R-INDEX: x27 ]
              [ "_software_n_1_rel"<63:72>
                LBL: h31
                ARG0: x27 ] >
       HCONS: < h6 qeq h3 h13 qeq h11 h20 qeq h30 h22 qeq h25 h28 qeq h31 > ]
    
    {e2:
     x4:pronoun_q<0:2>[]
     e2:_grateful_a_1<7:15>[ARG1 x4:pron]
     e9:_to_p<16:18>[ARG1 e2:_grateful_a_1, ARG2 x10:person]
     x10:every_q<19:27>[]
     e15:_contribute_v_to<32:43>[ARG1 x10:person, ARG3 x16:_and_c]
     x16:_the_q<47:50>[]
     x23:udef_q<51:58>[]
     x27:udef_q<59:72>[]
     x16:_and_c<59:62>[L-INDEX x23:_grammar_n_1, R-INDEX x27:_software_n_1]
    }

Last update: 2012-01-18 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/ErgProcessing_SampleExport/_edit)]{% endraw %}