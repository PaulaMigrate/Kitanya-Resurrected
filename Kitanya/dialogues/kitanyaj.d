BEGIN R#KITYJ

IF WEIGHT #0 ~AreaCheck("AR2800")
              InParty("R!Kitanya")
	      !Dead("R!Kitanya")
	      !StateCheck("R!Kitanya",STATE_SLEEPING)
              Global("R#KitanyaHome","GLOBAL",0)~ THEN BEGIN KitanyaHomeSay
   SAY @0 = @1 = @2
   IF ~~ THEN DO ~SetGlobal("R#KitanyaHome","GLOBAL",1)~ EXIT
END

IF WEIGHT #1 ~Global("PhaereInnuendo","GLOBAL",2)
              OR(2)
	       Global("R!KitanyaRomanceActive","GLOBAL",2)
	       Global("R!KitanyaRomanceActive","GLOBAL",1)
	      Global("PCShaggedPhaere","LOCALS",0)~ THEN BEGIN PCShaggedPhaere
  SAY @3
  ++@4 DO ~SetGlobal("PCShaggedPhaere","LOCALS",1)~ +PCShaggedPhaere1
  ++@5 DO ~SetGlobal("PCShaggedPhaere","LOCALS",1)~ +PCShaggedPhaere2
END

IF ~~ THEN BEGIN PCShaggedPhaere1
  SAY @6 = @7
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN PCShaggedPhaere2
  SAY @8
  IF ~~ THEN EXIT
END

IF WEIGHT #2 ~Global("PhaereInnuendo","GLOBAL",3)
	      OR(2)
		Global("R!KitanyaRomanceActive","GLOBAL",2)
		Global("R!KitanyaRomanceActive","GLOBAL",1)
	      Global("PCAvoidedPhaere","LOCALS",0)~ THEN BEGIN PCAvoidedPhaere
  SAY @9 = @10 = @11
  IF ~~ THEN DO ~SetGlobal("PCAvoidedPhaere","LOCALS",1)~ EXIT
END

IF WEIGHT #3 ~Global("PhaereInnuendo","GLOBAL",1)
	      OR(2)
		Global("R!KitanyaRomanceActive","GLOBAL",1)
		Global("R!KitanyaRomanceActive","GLOBAL",2)
              Global("PCWantsPhaere","LOCALS",0)~ THEN BEGIN PCWantsPhaere
 SAY @12
 ++@13 DO ~SetGlobal("PCWantsPhaere","LOCALS",1)~ +PCWantsPhaere1
 ++@14 DO ~SetGlobal("PCWantsPhaere","LOCALS",1)~ +PCWantsPhaere2
END

IF ~~ THEN BEGIN PCWantsPhaere1
 SAY @15
 IF ~~ THEN DO ~IncrementGlobal("KitLikes","GLOBAL",-5)~ EXIT
END

IF ~~ THEN BEGIN PCWantsPhaere2
 SAY @16
 IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN BelminFightFunny
  SAY @17
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN BelminFightWisdom
  SAY @18 = @19
  ++ @20 + BelminFightHateElvesJoke
  ++ @21 + PCHatesElves
  ++ @22 + BelminFightInsult
END

IF ~~ THEN BEGIN BelminFightStop
  SAY @23
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN BelminFightHateElvesJoke
  SAY @24
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN PCHatesElves
  SAY @25 = @26
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN BelminFightInsult
  SAY @27
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitValyCowledQuest
  SAY @28
  ++ @29 + KitValyGuilty
  ++ @30 EXTERN TOLGER 83
  ++ @31 GOTO KitValyWhy
END

IF ~~ THEN BEGIN KitValyWhy
  SAY @32 = @33
  ++ @34 EXTERN TOLGER 83
  ++ @35 EXTERN TOLGER 84
END

IF ~~ THEN BEGIN KitValyGuilty
  SAY @36
  ++ @37 EXTERN TOLGER 83
  ++ @38 EXTERN TOLGER 84
END

IF ~~ THEN BEGIN ValygarCowledGiven
  SAY @39 = @40
  IF ~~ THEN DO ~Enemy()
                 Attack(Player1)~ EXIT
END

INTERJECT C6ELHAN2 55 r#KitDefendsVic
  == R#KITYJ IF ~InParty("R!Kitanya")
                 !StateCheck("R!Kitanya",STATE_SLEEPING)
                 !Dead("R!Kitanya")~ THEN @41
  == C6ELHAN2 @42
  == R#KITYJ @43
END C6ELHAN 59

INTERJECT_COPY_TRANS TOLGER 75 r#KitTolger
  == R#KITYJ IF ~InParty("R!Kitanya")
                 !StateCheck("R!Kitanya",STATE_SLEEPING)
                 !Dead("R!Kitanya")~ THEN @44
END

INTERJECT_COPY_TRANS GAAL 1 r#GaalOffendsKit
   == R#KITYJ IF ~InParty("R!Kitanya")
                  !StateCheck("R!Kitanya",STATE_SLEEPING)
                  !Dead("R!Kitanya")~ THEN @45
END

INTERJECT_COPY_TRANS SCSARLES 11 r#SarlesOpinion
   == R#KITYJ IF ~InParty("R!Kitanya")
                  !StateCheck("R!Kitanya",STATE_SLEEPING)
                  !Dead("R!Kitanya")~ THEN @46 = @47
END

INTERJECT_COPY_TRANS VALYGAR 28 r#ValygarAttacked
   == R#KITYJ IF ~InParty("R!Kitanya")
                  !StateCheck("R!Kitanya",STATE_SLEEPING)
                  !Dead("R!Kitanya")~ THEN @48 = @49 = @50 
  DO ~LeaveParty() SetGlobal("R#KitValygarAttacked","GLOBAL",1)~
END

INTERJECT_COPY_TRANS ANOMEN 11 r#KitAnomenRighteousness
   == R#KITYJ IF ~InParty("R!Kitanya")
	          See("R!Kitanya")
	          !Dead("R!Kitanya")
		  !StateCheck("R!Kitanya",STATE_SLEEPING)~ THEN @51 = @52
   == ANOMEN @53
END

INTERJECT ANOMEN 16 r#KitAnomenLadies
  == R#KITYJ IF ~InParty("R!Kitanya")
                 See("R!Kitanya")
		 !Dead("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)~ THEN @54
  == ANOMEN @55 = @56
  == R#KITYJ @57
END ANOMEN 18

INTERJECT_COPY_TRANS ANOMEN 25 r#KitAnomenTeam
  == R#KITYJ IF ~InParty("R!Kitanya")
                 See("R!Kitanya")~ THEN @58
  DO ~ActionOverride("Anomen",JoinParty())~
END

INTERJECT FIRKRA01 5 r#KitLFirkFlattery
  == R#KITYJ IF ~InParty("R!Kitanya")
                 See("R!Kitanya")
                 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @59
  == FIRKRA01 @60
  == R#KITYJ @61
END FIRKRA01 7

INTERJECT_COPY_TRANS2 FIRMAG01 1 r#KitConsterDeath
  == R#KITYJ IF ~InParty("R!Kitanya")
                 See("R!Kitanya")
                 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @62
END

INTERJECT FIRMAG01 2 r#KitConsterDevotion
  == R#KITYJ IF ~InParty("R!Kitanya")
                 See("R!Kitanya")
                 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @63
  DO ~ActionOverride("Firmag01",Enemy())~ EXIT

INTERJECT FIRMAG01 3 r#KitConsterDevotion2
  == R#KITYJ IF ~InParty("R!Kitanya")
                 See("R!Kitanya")
                 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @63
 DO ~ActionOverride("Firmag01",Enemy())~ EXIT

INTERJECT_COPY_TRANS HELLSARE 8 r#KitSarevokInHell
  == R#KITYJ IF ~InParty("R!Kitanya")
                 See("R!Kitanya")
                 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @64
END

INTERJECT_COPY_TRANS HELLSARE 24 r#KitSarevokInHell2
  == R#KITYJ IF ~InParty("R!Kitanya")
                 See("R!Kitanya")
                 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @64
END

INTERJECT_COPY_TRANS VICONI 8 r#KitViconiaBurningReason
  == R#KITYJ IF ~InParty("R!Kitanya")
                 See("R!Kitanya")
                 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @65
  == VICONI @66
  == R#KITYJ @67 = @68
END

INTERJECT_COPY_TRANS VICONI 2 r#KitViconiaRight
  == R#KITYJ IF ~InParty("R!Kitanya")
                 See("R!Kitanya")
                 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @69
END

INTERJECT_COPY_TRANS BODHI 3 r#KitBodhiIntent
  == R#KITYJ IF ~InParty("R!Kitanya")
                 See("R!Kitanya")
                 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @70
  == BODHI @71
END

INTERJECT_COPY_TRANS BODHI 6 r#KitBodhiWork
  == R#KITYJ IF ~InParty("R!Kitanya")
                 See("R!Kitanya")
                 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @72
END

INTERJECT_COPY_TRANS2 BODHI 28 r#KitBodhiRob
  == R#KITYJ IF ~InParty("R!Kitanya")
                 See("R!Kitanya")
                 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @73 = @74
END

INTERJECT_COPY_TRANS BODHI 45 r#KitBodhiGoodEvil
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @75 = @76
END

INTERJECT_COPY_TRANS BODHI 62 r#KitBodhiFinalTask
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @77
END

INTERJECT_COPY_TRANS BODHI 82 r#KitBodhiIrenicus
  == R#KITYJ IF ~InParty("R!Kitanya")
                 See("R!Kitanya")
                 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @78
  == BODHI @79
END

INTERJECT_COPY_TRANS ARAN 4 r#KitAranFirst
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @80 = @81
END

INTERJECT_COPY_TRANS ARAN 13 r#KitAranBodhi
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @82 = @83
  == ARAN @84
END

INTERJECT_COPY_TRANS ARAN 40 r#KitAranSpellhold
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @85 = @86
END

INTERJECT_COPY_TRANS ARAN 47 r#KitAranDepart
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @87
END

INTERJECT_COPY_TRANS ARAN 85 r#KitAranBodhiReturns
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @88
  == ARAN @89
END

INTERJECT_COPY_TRANS BEGGAR1 6 r#KitBeggarSlaves
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @90
  == BEGGAR1 @91
  == R#KITYJ @92
  == BEGGAR1 @93
  == R#KITYJ @94
DO ~TakePartyGold(1)~
END

INTERJECT_COPY_TRANS BEGGAR3 5 r#KitBeggarHusband
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @95
  == BEGGAR3 @96
END

INTERJECT_COPY_TRANS CELOGAN 18 r#KitLoganPrejudice
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @97 = @98
END

INTERJECT_COPY_TRANS CELOGAN 21 r#KitLoganTask
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @99
  == CELOGAN @100
END

INTERJECT_COPY_TRANS CELOGAN 22 r#KitLoganCernd
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @101
END

INTERJECT_COPY_TRANS CELOGAN 57 r#KitLoganRakshasa
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @102
END

INTERJECT_COPY_TRANS PPIRENI2 49 r#KitYoshiDiscover
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @103 = @104
  == PPIRENI2 @105 = @106
  == R#KITYJ @107
  == PPIRENI2 @108
END

INTERJECT_COPY_TRANS PPIRENI2 53 r#KitIrenicusYoshDiscover
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @109
  == PPIRENI2 @110
END

INTERJECT_COPY_TRANS PPIRENI2 35 r#KitIrenicusThreat
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @111 = @112
END

INTERJECT_COPY_TRANS YOSHJ 113 r#KitYoshTraitor
  == R#KITYJ IF ~Global("YoshNoticeKit","GLOBAL",1)
                 InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @113
  == YOSHJ @114
END

INTERJECT_COPY_TRANS C6DRIZZ1 1 r#PCAttackDrizzt
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @115 = @116 = @117
END

INTERJECT_COPY_TRANS C6DRIZZ1 5 r#KitDrizztFight
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @118
DO ~ActionOverride("R!Kitanya",LeaveParty())
    ActionOverride("R!Kitanya",EscapeArea())~
END

INTERJECT C6DRIZZ1 7 r#KitDrizztFriend
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @119
  == C6DRIZZ1 @120
  == C6WULF1 @121
  == R#KITYJ @122
  == C6REGIS1 @123
  == C6DRIZZ1 @124
END C6DRIZZ1 8 

INTERJECT_COPY_TRANS C6DRIZZ1 9 r#KitDrizztFight2
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @118
DO ~ActionOverride("R!Kitanya",LeaveParty())
    ActionOverride("R!Kitanya",EscapeArea())~
END

INTERJECT_COPY_TRANS C6DRIZZ1 18 r#KitDrizztFight3
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @118
DO ~ActionOverride("R!Kitanya",LeaveParty())
    ActionOverride("R!Kitanya",EscapeArea())~
END

INTERJECT_COPY_TRANS2 C6DRIZZ1 37 r#KitDrizztJoined
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @125 = @126
END

INTERJECT_COPY_TRANS C6DRIZZ1 41 r#KitDrizztFight4
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @118
DO ~ActionOverride("R!Kitanya",LeaveParty())
    ActionOverride("R!Kitanya",EscapeArea())~
END

INTERJECT_COPY_TRANS C6DRIZZ1 48 r#KitDrizztFight5
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @118
DO ~ActionOverride("R!Kitanya",LeaveParty())
    ActionOverride("R!Kitanya",EscapeArea())~
END

INTERJECT_COPY_TRANS C6DRIZZ1 55 r#KitDrizztFight6
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @118
DO ~ActionOverride("R!Kitanya",LeaveParty())
    ActionOverride("R!Kitanya",EscapeArea())~
END

INTERJECT_COPY_TRANS LYROS 16 r#KitXzarOpinion
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @127
  == LYROS @128
END

INTERJECT_COPY_TRANS LYROS 19 r#KitXzarQuest
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @129
END

INTERJECT_COPY_TRANS EDWIN 8 r#KitEdwinRayic
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @130 = @131
END

INTERJECT_COPY_TRANS EDWIN 26 r#KitEdwinHonor
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @132 = @133
END

INTERJECT_COPY_TRANS LAVOK 2 r#KitLavokFake
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @134
  == VALYGARJ @135
  == R#KITYJ @136
  == VALYGARJ @137
END

INTERJECT LAVOK 21 r#KitLavokEvil
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @138
  == LAVOK @139 = @140 = @141
  == R#KITYJ @142
  == LAVOK @143
  == R#KITYJ @144
  == LAVOK @145
  == R#KITYJ @146
  == LAVOK @147
  == R#KITYJ @148
  == LAVOK @149 = @150
  == R#KITYJ @151
END LAVOK 47

INTERJECT VALYGARJ 108 r#KitValyPartyStay
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @152
  == VALYGARJ @153
  == R#KITYJ @154
  == VALYGARJ @155
  == R#KITYJ @156
  == VALYGARJ @157
  == R#KITYJ @158
  == VALYGARJ @159
END VALYGARJ 112

EXTEND_BOTTOM VALYGARJ 117
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      !Dead("R!Kitanya")
      Global("R#KitValyOpinionRendered","GLOBAL",0)~ THEN DO ~SetGlobal("R#KitValyOpinionRendered","GLOBAL",1)~ EXTERN R#KITYJ KitValyCowledQuest
END

EXTEND_BOTTOM TOLGER 84
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      !Dead("R!Kitanya")
      Global("R#KitValygarSurrendered","GLOBAL",0)~ THEN DO ~SetGlobal("R#KitValygarSurrendered","GLOBAL",1)~ EXTERN R#KITYJ ValygarCowledGiven
END

INTERJECT_COPY_TRANS UDPHAE01 48 r#KitPhaeBehold
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @160 = @161
END

INTERJECT_COPY_TRANS UDPHAE01 88 r#KitPhaeSola
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @162 = @163
END

INTERJECT_COPY_TRANS UDPHAE01 136 r#KitPhaeDemon
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @164
END

INTERJECT UDPHAE01 140 r#KitPhaeDemonSilver
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @165
END UDPHAE01 141

INTERJECT_COPY_TRANS UDSILVER 9 r#KitAdalonA
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @166
  == UDSILVER @167
  == R#KITYJ @168
END

INTERJECT_COPY_TRANS UDSILVER 16 r#KitAdalonElves
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @169 = @170
END

INTERJECT_COPY_TRANS NOBLEM1 7 r#KitMagic
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @171
END

INTERJECT_COPY_TRANS2 PPSAEM2 8 r#KitInmatesHelp
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @172 = @173
END

INTERJECT PPSAEM2 12 r#KitSaemonBash
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @174
  == PPSAEM2 @175
END PPSAEM2 16

INTERJECT_COPY_TRANS PPSAEM2 19 r#KitSaemonAllies
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @176 = @177
END

INTERJECT PPSAEM2 24 r#KitSaemonSulda
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @178 = @179
END
+ ~OR(2) GlobalGT("R!KitanyaRomanceActive","GLOBAL",0) GlobalLT("R!KitanyaRomanceActive","GLOBAL",3)~ + @180 DO ~IncrementGlobal("KitLikes","GLOBAL",2)~ EXTERN R#KITYJ SpellholdStopJon
++ @181 EXTERN R#KITYJ SpellholdStopJon
++ @182 DO ~IncrementGlobal("KitLikes","GLOBAL",-1)~ EXTERN R#KITYJ SpellholdStopJon2

INTERJECT PPSAEM3 1 r#KitNoShip
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @183
END PPSAEM3 3

INTERJECT_COPY_TRANS SUDEMIN 5 r#KitElhanDemin
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @184
  = @185
END

INTERJECT SUDEMIN 11 r#KitDeminEmotion
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @186
  == SUDEMIN @187
END SUDEMIN 12

INTERJECT_COPY_TRANS SUDEMIN 38 r#RudeToDemin
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @188
END

INTERJECT_COPY_TRANS PLAYER1 25 r#KitInHell
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @189 = @190
END

EXTEND_BOTTOM SUDEMIN 40
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      !Dead("R!Kitanya")~ THEN DO ~Enemy()
				  ActionOverride("R!Kitanya",LeaveParty())
				  ActionOverride("R!Kitanya",Enemy())
				  ActionOverride("R!Kitanya",Attack(Player1))~ EXTERN R#KITYJ PCAttackedDemin
END

INTERJECT_COPY_TRANS SUDEMIN 45 r#AcceptedQuest
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @191
END

INTERJECT_COPY_TRANS HELLJON 7 r#DieSlayer
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @192
END

INTERJECT_COPY_TRANS HELLJON 8 r#DieSlayer2
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @192
END

INTERJECT_COPY_TRANS HELLJON 9 r#DieSlayer3
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @192
END

INTERJECT_COPY_TRANS HELLJON 10 r#DieSlayer4
  == R#KITYJ IF ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")~ THEN @192
END

EXTEND_BOTTOM PLAYER1 33
  IF ~InParty("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      InMyArea("R#Kitanya")
      !Global("R!KitanyaRomanceActive","GLOBAL",2)
      !Global("R!KitanyaRomanceActive","GLOBAL",1)~ THEN GOTO PCKitToLTalk
  IF ~InParty("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      InMyArea("R#Kitanya")
      Global("R!KitanyaRomanceActive","GLOBAL",2)~ THEN GOTO PCKitToLTalk2
  IF ~InParty("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      InMyArea("R#Kitanya")
      Global("R!KitanyaRomanceActive","GLOBAL",1)~ THEN GOTO PCKitToLTalk1
END

APPEND ~PLAYER1~
  IF ~~ THEN BEGIN PCKitToLTalk
  SAY @193
  +~Global("R#KitAtTree","GLOBAL",0)~+ @194 DO ~SetGlobal("R#KitAtTree","GLOBAL",1)~ EXTERN R#KITYJ ToLDanger
  +~Global("R#KitAtTree","GLOBAL",0)~+ @195 DO ~SetGlobal("R#KitAtTree","GLOBAL",1)~ EXTERN R#KITYJ ToLDanger
  +~Global("R#KitAtTree","GLOBAL",0)~+ @196 DO ~SetGlobal("R#KitAtTree","GLOBAL",1)~ EXTERN R#KITYJ ToLNoCare
  END

  IF ~~ THEN BEGIN PCKitToLTalk2
  SAY @197
  +~Global("R#KitAtTree","GLOBAL",0)~+ @198 DO ~SetGlobal("R#KitAtTree","GLOBAL",1)~ EXTERN R#KITYJ ToLExclusive
  END

  IF ~~ THEN BEGIN PCKitToLTalk1
  SAY @199
  +~Global("R#KitAtTree","GLOBAL",0)~+ @198 DO ~SetGlobal("R#KitAtTree","GLOBAL",1)~ EXTERN R#KITYJ ToLFriends
  END
END

APPEND R#KITYJ

IF ~~ THEN BEGIN ToLFriends
  SAY @200
  COPY_TRANS PLAYER1 33
END

IF ~~ THEN BEGIN ToLExclusive
  SAY @201 = @202 = @203
  COPY_TRANS PLAYER1 33
END

IF ~~ THEN BEGIN ToLDanger
  SAY @204
  COPY_TRANS PLAYER1 33
END

IF ~~ THEN BEGIN ToLNoCare
  SAY @205
  COPY_TRANS PLAYER1 33
END

IF ~~ THEN BEGIN SpellholdStopJon
  SAY @206
  COPY_TRANS PPSAEM2 24
END

IF ~~ THEN BEGIN SpellholdStopJon2
  SAY @207 = @208
  COPY_TRANS PPSAEM2 24
END

IF ~~ THEN BEGIN PCAttackedDemin
  SAY @209
  COPY_TRANS SUDEMIN 40
END

END // of append

EXTEND_TOP ~BODHIAMB~ 5 #1
IF ~OR(2)Global("R!KitanyaRomanceActive","GLOBAL",2) Global("R!KitanyaRomanceActive","GLOBAL",1) InParty("R!Kitanya")~ THEN GOTO KitBodhiVampChain
END

CHAIN
  IF WEIGHT #-1 ~InParty("R!Kitanya")
		 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")
                 Global("R#KitBeggar2","LOCALS",0)~ THEN BEGGAR2 KitTalkChain @210
DO ~SetGlobal("KitBeggar2","LOCALS",1)~
  == R#KITYJ @211
  == BEGGAR2 @212
  == R#KITYJ @213
  == BEGGAR2 @214
  == R#KITYJ @215
  == BEGGAR2 @216
  == R#KITYJ @217
  == BEGGAR2 @218
  == R#KITYJ @219
EXIT

CHAIN
  IF WEIGHT #-999 ~InParty("R!Kitanya")
                   See("R!Kitanya")
                   !StateCheck("R!Kitanya",STATE_SLEEPING)
		   !Dead("R!Kitanya")
                   Global("KitRibald","LOCALS",0)~ THEN RIBALD MeetKitanyaChain @220
  DO ~SetGlobal("KitRibald","LOCALS",1)~
  == R#KITYJ @221
  == RIBALD @222
  == R#KITYJ @223
  == RIBALD @224 = @225 = @226
  == R#KITYJ @227 = @228
  == RIBALD @229
  == R#KITYJ @230
END RIBALD 0

CHAIN
  IF WEIGHT #-1 ~InParty("R!Kitanya")
                 See("R!Kitanya")
		 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")
                 Global("KitBelminInsult","LOCALS",0)
                 !See("Sola")
                 !See("Viconia")~ THEN BELMIN KitInsultChain @231 // Ensures compatibility with Solaufein mod
DO ~SetGlobal("KitBelminInsult","LOCALS",1)~
  == BELMIN @232
  == R#KITYJ @233
  == BELMIN @234
  == R#KITYJ @235
  == BELMIN @236
  == R#KITYJ @237
  == BELMIN @238
  == R#KITYJ @239
  == BELMIN @240
  == R#KITYJ @241 = @242 = @243
END
++@244 EXTERN R#KITYJ BelminFightFunny
++@245 EXTERN R#KITYJ BelminFightWisdom
++@246 EXTERN R#KITYJ BelminFightStop

CHAIN
  IF WEIGHT #-1 ~InParty("R!Kitanya")
                 See("R!Kitanya")
                 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")
                 Global("SoldSphereKit","LOCALS",0)~ THEN WAYLANE KitSellChain @247
  DO ~SetGlobal("SoldSphereKit","LOCALS",1)~
  == R#KITYJ @248
  == WAYLANE @249
  == R#KITYJ @250
  == WAYLANE @251
  == R#KITYJ @252
  == WAYLANE @253
  == R#KITYJ @254
  == WAYLANE @255
  == R#KITYJ @256 = @257
  == WAYLANE @258
  == R#KITYJ @259
EXIT

CHAIN
  IF WEIGHT #-1 ~InParty("R!Kitanya")
  	         See("R!Kitanya")
	         !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")
	         RandomNum(2,1)
	         Global("KitKid","LOCALS",0)~ THEN BRAT3 KitTalkChain @260
  DO ~SetGlobal("KitKid","LOCALS",1)~
  == R#KITYJ @261
  == BRAT3 @262
  == R#KITYJ @263
EXIT

CHAIN
  IF WEIGHT #-1 ~InParty("R!Kitanya")
                 See("R!Kitanya")
                 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")
                 OR(3)
                   !InParty("Mazzy")
                   Dead("Mazzy")
                   !See("Mazzy")~ THEN SHADEL KitInPartyChain @264
  == R#KITYJ @265
  == SHADEL @266
  == R#KITYJ @267
  == SHADEL @268
  == R#KITYJ @269
  == SHADEL @270
  == R#KITYJ @271
  == SHADEL @272 = @273
  == R#KITYJ @274
END SHADEL KitRefused

APPEND SHADEL
  IF ~~ THEN BEGIN KitRefused
  SAY @275
  IF ~~ THEN DO ~Enemy()
                 ActionOverride("rngsha02",Enemy())~ EXIT
  END
END

CHAIN
  IF WEIGHT #-2 ~InParty("R!Kitanya")
                  See("R!Kitanya")
      		  !StateCheck("R!Kitanya",STATE_SLEEPING)
		  !Dead("R!Kitanya")
                  InParty("Mazzy")
      		  OR(3)
        	    IsValidForPartyDialogue("Mazzy")
		    See("Mazzy")
                    IsGabber("Mazzy")~ THEN SHADEL KitMazzyTalkChain @276
  == R#KITYJ @277
  == MAZZYJ @278
  == R#KITYJ @279
  == SHADEL @280
  == R#KITYJ @281
END SHADEL KitRefused

CHAIN
  IF WEIGHT #-999 ~InParty("R!Kitanya")
                   See("R!Kitanya")
                   !StateCheck("R!Kitanya",STATE_SLEEPING)
		   !Dead("R!Kitanya")
                   Global("KitSalvanas","LOCALS",0)~ THEN SALVANAS KitFlirtChain @282
  DO ~SetGlobal("KitSalvanas","LOCALS",1)~
  == R#KITYJ @283
  == SALVANAS @284
  == R#KITYJ @285
  == SALVANAS @286
  == R#KITYJ @287
  == SALVANAS @288
  == R#KITYJ @289
  == SALVANAS @290
  == R#KITYJ @291
  == SALVANAS @292
EXIT

CHAIN
  IF WEIGHT #-1 ~InParty("R!Kitanya")
		 See("R!Kitanya")
                 !StateCheck("R!Kitanya",STATE_SLEEPING)
		 !Dead("R!Kitanya")
                 Global("KitNoble","LOCALS",0)~ THEN NOBLEM1 KitProposeChain @293
  DO ~SetGlobal("KitNoble","LOCALS",1)~
  == R#KITYJ @294
  == NOBLEM1 @295
  == R#KITYJ @296
EXIT

CHAIN
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      !Dead("R!Kitanya")
      Global("KitMurtlen","LOCALS",0)~ THEN MURTLEN KitCheatChain @297
  DO ~SetGlobal("KitMurtlen","LOCALS",1)~
  == R#KITYJ @298
EXIT

CHAIN
  IF WEIGHT #-999 ~InParty("R!Kitanya")
		   See("R!Kitanya")
		   !StateCheck("R!Kitanya",STATE_SLEEPING)
		   !Dead("R!Kitanya")
		   Global("ElvenAvatar","GLOBAL",0)
		   Global("TalkedToDemin","GLOBAL",0)
		   Dead("suadsaan")
		   Dead("surakraj")
		   Dead("suraksha")~ THEN SUDEMIN TalkWithKitChain @299
  DO ~SetGlobal("TalkedToDemin","GLOBAL",1)~
  == R#KITYJ @300
  == SUDEMIN @301
  == R#KITYJ @302
  == SUDEMIN @303
  == R#KITYJ @304
END SUDEMIN 3

APPEND BODHIAMB
 IF ~~ THEN BEGIN KitBodhiVampChain
  SAY @305
  IF ~!InPartyAllowDead("R#Kitanya")
      Dead("R#Kitanya")~ THEN GOTO 6
  IF ~InPartyAllowDead("R#Kitanya")
      !Dead("R!Kitanya")~ THEN GOTO KitBodhiVampChain2
 END

 IF ~~ THEN BEGIN TakeKit
  SAY @306
  IF ~~ THEN DO ~ClearAllActions()
                 StartCutSceneMode()
                 StartCutScene("r!kitvmp")~ UNSOLVED_JOURNAL @307 EXIT
END

END // of append

CHAIN BODHIAMB KitBodhiVampChain2
  @308
  == R#KITYJ @309
  == BODHIAMB @310
  == R#KITYJ @311
END BODHIAMB TakeKit

APPEND R#KITYJ

IF ~IsGabber(Player1)~ THEN BEGIN TalkedToByPC
  SAY @312
  IF ~Global("R!KitanyaRomanceActive","GLOBAL",2)~ THEN REPLY @313 GOTO KitFlirt2
  IF ~Global("R!KitanyaRomanceActive","GLOBAL",1)~ THEN REPLY @313 GOTO KitFlirt1
  IF ~~ THEN REPLY @314 GOTO Irenicus
  IF ~Global("Chapter","GLOBAL",%bg2_chapter_6%)~ THEN REPLY @315 GOTO Rhynn
  IF ~~ THEN REPLY @316 GOTO KitPast
  IF ~GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ THEN REPLY @317 GOTO KitCowled
  IF ~Gender(Player1,MALE)
      GlobalLT("R!KitanyaRomanceActive","GLOBAL",2)~ THEN REPLY @318 GOTO KitInterests
  IF ~NumInPartyGT(2)~ THEN REPLY @319 GOTO KitCompanions
END

IF ~~ THEN BEGIN KitFlirt2
  SAY @320
  IF ~RandomNum(3,1)~ THEN REPLY @321 GOTO KitFlirtWhistle2.1
  IF ~RandomNum(3,2)~ THEN REPLY @321 GOTO KitFlirtWhistle2.2
  IF ~RandomNum(3,3)~ THEN REPLY @321 GOTO KitFlirtWhistle2.3
  IF ~RandomNum(3,1)~ THEN REPLY @322 GOTO KitFlirtStare2.1
  IF ~RandomNum(3,2)~ THEN REPLY @322 GOTO KitFlirtStare2.2
  IF ~RandomNum(3,3)~ THEN REPLY @322 GOTO KitFlirtStare2.3
  IF ~RandomNum(3,1)~ THEN REPLY @323 GOTO KitFlirtFeel2.1
  IF ~RandomNum(3,2)~ THEN REPLY @323 GOTO KitFlirtFeel2.2
  IF ~RandomNum(3,3)~ THEN REPLY @323 GOTO KitFlirtFeel2.3
  IF ~RandomNum(3,1)~ THEN REPLY @324 GOTO KitFlirtKiss2.1
  IF ~RandomNum(3,2)~ THEN REPLY @324 GOTO KitFlirtKiss2.2
  IF ~RandomNum(3,3)~ THEN REPLY @324 GOTO KitFlirtKiss2.3
  IF ~RandomNum(3,1)~ THEN REPLY @325 GOTO KitFlirtPeck2.1
  IF ~RandomNum(3,2)~ THEN REPLY @325 GOTO KitFlirtPeck2.2
  IF ~RandomNum(3,3)~ THEN REPLY @325 GOTO KitFlirtPeck2.3
  IF ~RandomNum(3,1)~ THEN REPLY @326 GOTO KitFlirtNookie2.1
  IF ~RandomNum(3,2)~ THEN REPLY @326 GOTO KitFlirtNookie2.2
  IF ~RandomNum(3,3)~ THEN REPLY @326 GOTO KitFlirtNookie2.3
  IF ~RandomNum(3,1)~ THEN REPLY @327 GOTO KitFlirtSqueeze2.1
  IF ~RandomNum(3,2)~ THEN REPLY @327 GOTO KitFlirtSqueeze2.2
  IF ~RandomNum(3,3)~ THEN REPLY @327 GOTO KitFlirtSqueeze2.3
  IF ~RandomNum(3,1)~ THEN REPLY @328 GOTO KitFlirtArmor2.1
  IF ~RandomNum(3,2)~ THEN REPLY @328 GOTO KitFlirtArmor2.2
  IF ~RandomNum(3,3)~ THEN REPLY @328 GOTO KitFlirtArmor2.3
  IF ~RandomNum(3,1)~ THEN REPLY @329 GOTO KitFlirtMassage2.1
  IF ~RandomNum(3,2)~ THEN REPLY @329 GOTO KitFlirtMassage2.2
  IF ~RandomNum(3,3)~ THEN REPLY @329 GOTO KitFlirtMassage2.3
  IF ~AreaType(FOREST)
      RandomNum(2,1)~ THEN REPLY @330 GOTO KitFlirtForest2.1
  IF ~AreaType(FOREST)
      RandomNum(2,2)~ THEN REPLY @330 GOTO KitFlirtForest2.2
  IF ~RandomNum(3,1)~ THEN REPLY @331 GOTO KitFlirtHand2.1
  IF ~RandomNum(3,2)~ THEN REPLY @331 GOTO KitFlirtHand2.2
  IF ~RandomNum(3,3)~ THEN REPLY @331 GOTO KitFlirtHand2.3
  IF ~AreaType(DUNGEON)
      OR(3)
        Class(Player1,FIGHTER_ALL)
        Class(Player1,PALADIN_ALL)
        Class(Player1,RANGER_ALL)~ THEN REPLY @332 GOTO KitFlirtFighterDungeon2.1
  IF ~AreaType(DUNGEON)
      OR(3)
        !Class(Player1,FIGHTER_ALL)
        !Class(Player1,PALADIN_ALL)
        !Class(Player1,RANGER_ALL)~ THEN REPLY @332 GOTO KitFlirtMageDungeon2.2
  IF ~InParty("Anomen")
      !Dead("Anomen")
      See("Anomen")~ THEN REPLY @333 GOTO KitFlirtAnomen2
  IF ~~ THEN REPLY @334 EXIT
END

IF ~~ THEN BEGIN KitFlirtWhistle2.1
  SAY @335
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtWhistle2.2
  SAY @336
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtWhistle2.3
  SAY @337
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtStare2.1
  SAY @338
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtStare2.2
  SAY @339
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtStare2.3
  SAY @340
  IF ~~ THEN REPLY @341 GOTO KitFlirtStare2.3Secret
  IF ~~ THEN REPLY @342 GOTO KitFlirtStare2.3Apologize
END

IF ~~ THEN BEGIN KitFlirtStare2.3Secret
  SAY @343
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtStare2.3Apologize
  SAY @344
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtFeel2.1
  SAY @345
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtFeel2.2
  SAY @346
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtFeel2.3
  SAY @347
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtKiss2.1
  SAY @348
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtKiss2.2
  SAY @349
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtKiss2.3
  SAY @350
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtPeck2.1
  SAY @351
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtPeck2.2
  SAY @352
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtPeck2.3
  SAY @353
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtNookie2.1
  SAY @354
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtNookie2.2
  SAY @355
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtNookie2.3
  SAY @356
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtSqueeze2.1
  SAY @357
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtSqueeze2.2
  SAY @358
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtSqueeze2.3
  SAY @359
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtArmor2.1
  SAY @360
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtArmor2.2
  SAY @361
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtArmor2.3
  SAY @362
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtMassage2.1
  SAY @363
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtMassage2.2
  SAY @364
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtMassage2.3
  SAY @365
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtForest2.1
  SAY @366
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtForest2.2
  SAY @367
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtHand2.1
  SAY @368
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtHand2.2
  SAY @369
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtHand2.3
  SAY @370
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtFighterDungeon2.1
  SAY @371
  IF ~~ THEN REPLY @372 GOTO KitFlirtFighterDungeon2.2
  IF ~~ THEN REPLY @373 GOTO KitFlirtFighterDungeon2.3
END

IF ~~ THEN BEGIN KitFlirtFighterDungeon2.2
  SAY @374
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtFighterDungeon2.3
  SAY @375
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtMageDungeon2.2
  SAY @376
  IF ~~ THEN REPLY @377 GOTO KitFlirtFighterDungeon2.2
  IF ~~ THEN REPLY @378 GOTO KitFlirtFighterDungeon2.3
END

IF ~~ THEN BEGIN KitFlirtAnomen2
  SAY @379
  IF ~~ THEN REPLY @380 GOTO KitFlirtAnomen2.1
  IF ~~ THEN REPLY @381 GOTO KitFlirtAnomen2.2
  IF ~~ THEN REPLY @382 GOTO KitFlirtAnomen2.3
END

IF ~~ THEN BEGIN KitFlirtAnomen2.1
  SAY @383
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtAnomen2.2
  SAY @384
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtAnomen2.3
  SAY @385
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Rhynn
  SAY @386
  IF ~~ THEN REPLY @387 GOTO Rhynn1
  IF ~~ THEN REPLY @388 GOTO Rhynn2
  IF ~~ THEN REPLY @389 GOTO Rhynn3
  IF ~~ THEN REPLY @390 EXIT
END

IF ~~ THEN BEGIN Rhynn1
  SAY @391
  IF ~~ THEN REPLY @388 GOTO Rhynn2
  IF ~~ THEN REPLY @389 GOTO Rhynn3
  IF ~~ THEN REPLY @390 EXIT
END

IF ~~ THEN BEGIN Rhynn2
  SAY @392
  IF ~~ THEN REPLY @387 GOTO Rhynn1
  IF ~~ THEN REPLY @389 GOTO Rhynn3
  IF ~~ THEN REPLY @390 EXIT
END

IF ~~ THEN BEGIN Rhynn3
  SAY @393
  IF ~~ THEN REPLY @387 GOTO Rhynn1
  IF ~~ THEN REPLY @388 GOTO Rhynn2
  IF ~~ THEN REPLY @394 EXIT
END

IF ~~ THEN BEGIN Irenicus
  SAY @395
  IF ~GlobalGT("Chapter","GLOBAL",%bg2_chapter_4%)~ THEN GOTO IrenicusSoul
  IF ~GlobalLT("Chapter","GLOBAL",%bg2_chapter_5%)~ THEN GOTO IrenicusNoKnow
END

IF ~~ THEN BEGIN IrenicusSoul
  SAY @396
  IF ~~ THEN REPLY @397 GOTO IrenicusSoul2
  IF ~~ THEN REPLY @398 GOTO IrenicusSoul2
END

IF ~~ THEN BEGIN IrenicusSoul2
  SAY @399
  IF ~~ THEN REPLY @400 GOTO IrenicusSuldanesselar
  IF ~~ THEN REPLY @401 GOTO IrenicusSuldanesselar
  IF ~~ THEN REPLY @402 GOTO IrenicusPCNoCare
END

IF ~~ THEN BEGIN IrenicusSuldanesselar
  SAY @403  = @404
  IF ~~ THEN REPLY @405 EXIT
  IF ~~ THEN REPLY @406 GOTO NotEasy
  IF ~~ THEN REPLY @407 GOTO NotEasy
END

IF ~~ THEN BEGIN NotEasy
  SAY @408
  IF ~~ THEN UNSOLVED_JOURNAL @409  EXIT
END

IF ~~ THEN BEGIN IrenicusPCNoCare
  SAY @410 = @411
  IF ~~ THEN UNSOLVED_JOURNAL @412 EXIT
END

IF ~~ THEN BEGIN IrenicusNoKnow
  SAY @413
  IF ~~ THEN REPLY @414 GOTO JonFound
  IF ~~ THEN REPLY @415 GOTO JonFound
  IF ~~ THEN REPLY @416 EXIT
END

IF ~~ THEN BEGIN JonFound
  SAY @417
  IF ~~ THEN UNSOLVED_JOURNAL @418 EXIT
END

IF ~~ THEN BEGIN KitInterests
  SAY @419
  IF ~~ THEN REPLY @420 GOTO KitSpeechless
  IF ~~ THEN REPLY @421 GOTO KitCurious
  IF ~~ THEN REPLY @422 GOTO KitPass
  IF ~~ THEN REPLY @423 GOTO KitSpeechless
END

IF ~~ THEN BEGIN KitCurious
  SAY @424
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitSpeechless
  SAY @425
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitPass
  SAY @426
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitCompanions
  SAY @427
  IF ~InParty("Anomen") !Dead("Anomen") !Alignment("Anomen",CHAOTIC_NEUTRAL)~ THEN REPLY @428 GOTO KitCompanionsAno1
  IF ~InParty("Aerie") !Dead("Aerie")~ THEN REPLY @429 GOTO KitCompanionsAerie
  IF ~InParty("Nalia") !Dead("Nalia")~ THEN REPLY @430 GOTO KitCompanionsNalia
  IF ~InParty("Imoen2") !Dead("Imoen2")~ THEN REPLY @431 GOTO KitCompanionsImoen
  IF ~InParty("Viconia") !Dead("Viconia")~ THEN REPLY @432 GOTO KitCompanionsViccy
  IF ~InParty("Minsc") !Dead("Minsc")~ THEN REPLY @433 GOTO KitCompanionsMinsc
  IF ~InParty("Keldorn") !Dead("Keldorn")~ THEN REPLY @434 GOTO KitCompanionsKeldorn
  IF ~InParty("HaerDalis") !Dead("HaerDalis")~ THEN REPLY @435 GOTO KitCompanionsBard
  IF ~InParty("Korgan") !Dead("Korgan")~ THEN REPLY @436 GOTO KitCompanionsKorgan
  IF ~InParty("Jaheira") !Dead("Jaheira")~ THEN REPLY @437 GOTO KitCompanionsJaheira
  IF ~InParty("Jan") !Dead("Jan")~ THEN REPLY @438 GOTO KitCompanionsJan
  IF ~InParty("Yoshimo") !Dead("Yoshimo")~ THEN REPLY @439 GOTO KitCompanionsYosh
  IF ~InParty("Edwin") !Dead("Edwin")~ THEN REPLY @440 GOTO KitCompanionsEdwin
  IF ~InParty("Anomen") !Dead("Anomen") Alignment("Anomen",CHAOTIC_NEUTRAL)~ THEN REPLY @428 GOTO KitCompanionsAno2
END

IF ~~ THEN BEGIN KitCompanionsAno1
  SAY @441
  IF ~~ THEN REPLY @442 GOTO KitCompanions
  IF ~~ THEN REPLY @443 EXIT
END

IF ~~ THEN BEGIN KitCompanionsAerie
  SAY @444
  IF ~~ THEN REPLY @442 GOTO KitCompanions
  IF ~~ THEN REPLY @443 EXIT
END

IF ~~ THEN BEGIN KitCompanionsNalia
  SAY @445
  IF ~~ THEN REPLY @442 GOTO KitCompanions
  IF ~~ THEN REPLY @443 EXIT
END

IF ~~ THEN BEGIN KitCompanionsImoen
  SAY @446
  IF ~~ THEN REPLY @442 GOTO KitCompanions
  IF ~~ THEN REPLY @443 EXIT
END

IF ~~ THEN BEGIN KitCompanionsViccy
  SAY @447
  IF ~~ THEN REPLY @442 GOTO KitCompanions
  IF ~~ THEN REPLY @443 EXIT
END

IF ~~ THEN BEGIN KitCompanionsMinsc
  SAY @448
  IF ~~ THEN REPLY @442 GOTO KitCompanions
  IF ~~ THEN REPLY @443 EXIT
END

IF ~~ THEN BEGIN KitCompanionsKeldorn
  SAY @449
  IF ~~ THEN REPLY @442 GOTO KitCompanions
  IF ~~ THEN REPLY @443 EXIT
END

IF ~~ THEN BEGIN KitCompanionsBard
  SAY @450
  IF ~~ THEN REPLY @442 GOTO KitCompanions
  IF ~~ THEN REPLY @443 EXIT
END

IF ~~ THEN BEGIN KitCompanionsKorgan
  SAY @451
  IF ~~ THEN REPLY @442 GOTO KitCompanions
  IF ~~ THEN REPLY @443 EXIT
END

IF ~~ THEN BEGIN KitCompanionsJaheira
  SAY @452
  IF ~~ THEN REPLY @442 GOTO KitCompanions
  IF ~~ THEN REPLY @443 EXIT
END

IF ~~ THEN BEGIN KitCompanionsJan
  SAY @453
  IF ~~ THEN REPLY @442 GOTO KitCompanions
  IF ~~ THEN REPLY @443 EXIT
END

IF ~~ THEN BEGIN KitCompanionsYosh
  SAY @454
  IF ~~ THEN REPLY @442 GOTO KitCompanions
  IF ~~ THEN REPLY @443 EXIT
END

IF ~~ THEN BEGIN KitCompanionsEdwin
  SAY @455
  IF ~~ THEN REPLY @442 GOTO KitCompanions
  IF ~~ THEN REPLY @443 EXIT
END

IF ~~ THEN BEGIN KitCompanionsAno2
  SAY @456
  IF ~~ THEN REPLY @442 GOTO KitCompanions
  IF ~~ THEN REPLY @443 EXIT
END

IF ~~ THEN BEGIN KitFlirt1
  SAY @457
  IF ~RandomNum(3,1)~ THEN REPLY @458 GOTO KitFlirtArm1.1
  IF ~RandomNum(3,2)~ THEN REPLY @458 GOTO KitFlirtArm1.2
  IF ~RandomNum(3,3)~ THEN REPLY @458 GOTO KitFlirtArm1.3
  IF ~RandomNum(3,1)~ THEN REPLY @459 GOTO KitFlirtChest1.1
  IF ~RandomNum(3,2)~ THEN REPLY @459 GOTO KitFlirtChest1.2
  IF ~RandomNum(3,3)~ THEN REPLY @459 GOTO KitFlirtChest1.3
  IF ~~ THEN REPLY @460 GOTO KitFlirtPersonal
  IF ~RandomNum(3,1)~ THEN REPLY @461 GOTO KitFlirtHug1.1
  IF ~RandomNum(3,2)~ THEN REPLY @461 GOTO KitFlirtHug1.2
  IF ~RandomNum(3,3)~ THEN REPLY @461 GOTO KitFlirtHug1.3
  IF ~RandomNum(3,1)~ THEN REPLY @462 GOTO KitFlirtHair1.1
  IF ~RandomNum(3,2)~ THEN REPLY @462 GOTO KitFlirtHair1.2
  IF ~RandomNum(3,3)~ THEN REPLY @462 GOTO KitFlirtHair1.3
  IF ~RandomNum(4,1)~ THEN REPLY @463 GOTO KitFlirtStare1.1
  IF ~RandomNum(4,2)~ THEN REPLY @463 GOTO KitFlirtStare1.2
  IF ~RandomNum(4,3)~ THEN REPLY @463 GOTO KitFlirtStare1.3
  IF ~RandomNum(4,4)~ THEN REPLY @463 GOTO KitFlirtStare1.4
  IF ~RandomNum(3,1)~ THEN REPLY @327 GOTO KitFlirtSqueeze1.1
  IF ~RandomNum(3,2)~ THEN REPLY @327 GOTO KitFlirtSqueeze1.2
  IF ~RandomNum(3,3)~ THEN REPLY @327 GOTO KitFlirtSqueeze1.3
  IF ~Class(Player1,MAGE_ALL) RandomNum(3,1)~ THEN REPLY @464 GOTO KitFlirtRobe1.1
  IF ~Class(Player1,MAGE_ALL) RandomNum(3,2)~ THEN REPLY @464 GOTO KitFlirtRobe1.2
  IF ~Class(Player1,MAGE_ALL) RandomNum(3,3)~ THEN REPLY @464 GOTO KitFlirtRobe1.3
  IF ~!Class(Player1,MAGE_ALL) RandomNum(3,1)~ THEN REPLY @465 GOTO KitFlirtRobe1.1
  IF ~!Class(Player1,MAGE_ALL) RandomNum(3,2)~ THEN REPLY @465 GOTO KitFlirtArmor1.2
  IF ~!Class(Player1,MAGE_ALL) RandomNum(3,3)~ THEN REPLY @465 GOTO KitFlirtArmor1.3
  IF ~RandomNum(3,1)~ THEN REPLY @466 GOTO KitFlirtSpar1.1
  IF ~RandomNum(3,2)~ THEN REPLY @466 GOTO KitFlirtSpar1.2
  IF ~RandomNum(3,3)~ THEN REPLY @466 GOTO KitFlirtSpar1.3
  IF ~RandomNum(3,1)~ THEN REPLY @467 GOTO KitFlirtWhore1.1
  IF ~RandomNum(3,2)~ THEN REPLY @467 GOTO KitFlirtWhore1.2
  IF ~RandomNum(3,3) Race(Player1,ELF)~ THEN REPLY @467 GOTO KitFlirtWhore1.3
  IF ~RandomNum(3,3) !Race(Player1,ELF)~ THEN REPLY @467 GOTO KitFlirtWhore1.4
  IF ~RandomNum(4,1)~ THEN REPLY @468 GOTO KitFlirtStrip1.1
  IF ~RandomNum(4,2)~ THEN REPLY @468 GOTO KitFlirtStrip1.2
  IF ~RandomNum(4,3)~ THEN REPLY @468 GOTO KitFlirtStrip1.3
  IF ~RandomNum(4,4)~ THEN REPLY @468 GOTO KitFlirtStrip1.4
  IF ~RandomNum(3,1)~ THEN REPLY @469 GOTO KitFlirtStuff1.1
  IF ~RandomNum(3,2)~ THEN REPLY @469 GOTO KitFlirtStuff1.2
  IF ~RandomNum(3,3)~ THEN REPLY @469 GOTO KitFlirtStuff1.3
  IF ~~ THEN REPLY @334 EXIT
END

IF ~~ THEN BEGIN KitFlirtArm1.1
  SAY @470
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtArm1.2
  SAY @471
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtArm1.3
  SAY @472 = @473
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtChest1.1
  SAY @474
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtChest1.2
  SAY @475
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtChest1.3
  SAY @476
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtPersonal
  SAY @477
  IF ~RandomNum(2,1)~ THEN REPLY @478 GOTO KitFlirtPersonalFeelings1.1
  IF ~RandomNum(2,2)~ THEN REPLY @478 GOTO KitFlirtPersonalSecret1.1
  IF ~RandomNum(2,1)~ THEN REPLY @479 GOTO KitFlirtPersonalAge1.1
  IF ~RandomNum(2,2)~ THEN REPLY @479 GOTO KitFlirtPersonalSecret1.1
  IF ~~ THEN REPLY @480 GOTO KitFlirtPersonalNothing
END

IF ~~ THEN BEGIN KitFlirtPersonalFeelings1.1
  SAY @481
  IF ~~ THEN REPLY @482 GOTO KitFlirtPersonal
  IF ~~ THEN REPLY @483 GOTO TalkedToByPC2
  IF ~~ THEN REPLY @484 EXIT
END

IF ~~ THEN BEGIN KitFlirtPersonalSecret1.1
  SAY @485
  IF ~~ THEN REPLY @486 GOTO KitFlirtPersonal
  IF ~~ THEN REPLY @483 GOTO TalkedToByPC2
  IF ~~ THEN REPLY @484 EXIT
END

IF ~~ THEN BEGIN KitFlirtPersonalAge1.1
  SAY @487
  IF ~~ THEN REPLY @486 GOTO KitFlirtPersonal
  IF ~~ THEN REPLY @483 GOTO TalkedToByPC2
  IF ~~ THEN REPLY @484 EXIT
END

IF ~~ THEN BEGIN KitFlirtPersonalNothing
  SAY @488
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN TalkedToByPC2
  SAY @489
  IF ~Global("R!KitanyaRomanceActive","GLOBAL",2)~ THEN REPLY @313 GOTO KitFlirt2
  IF ~Global("R!KitanyaRomanceActive","GLOBAL",1)~ THEN REPLY @313 GOTO KitFlirt1
  IF ~~ THEN REPLY @314 GOTO Irenicus
  IF ~Global("Chapter","GLOBAL",%bg2_chapter_6%)~ THEN REPLY @315 GOTO Rhynn
  IF ~~ THEN REPLY @316 GOTO KitPast
  IF ~GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ THEN REPLY @317 GOTO KitCowled
  IF ~Gender(Player1,MALE)
      GlobalLT("R!KitanyaRomanceActive","GLOBAL",2)~ THEN REPLY @318 GOTO KitInterests
  IF ~~ THEN REPLY @319 GOTO KitCompanions
END

IF ~~ THEN BEGIN KitFlirtHug1.1
  SAY @490
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtHug1.2
  SAY @491
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtHug1.3
  SAY @492
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtHair1.1
  SAY @493
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtHair1.2
  SAY @494
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtHair1.3
  SAY @495
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtStare1.1
  SAY @496
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtStare1.2
  SAY @497
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtStare1.3
  SAY @498
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtStare1.4
  SAY @499
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtSqueeze1.1
  SAY @500
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtSqueeze1.2
  SAY @501
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtSqueeze1.3
  SAY @502
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtRobe1.1
  SAY @503
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtRobe1.2
  SAY @504
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtRobe1.3
  SAY @505
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtArmor1.2
  SAY @506
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtArmor1.3
  SAY @507
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtSpar1.1
  SAY @508
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtSpar1.2
  SAY @509
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtSpar1.3
  SAY @510
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtWhore1.1
  SAY @511
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtWhore1.2
  SAY @512
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtWhore1.3
  SAY @513
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtWhore1.4
  SAY @514
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtStrip1.1
  SAY @515
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtStrip1.2
  SAY @516
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtStrip1.3
  SAY @517
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtStrip1.4
  SAY @518
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtStuff1.1
  SAY @519
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtStuff1.2
  SAY @520
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirtStuff1.3
  SAY @521
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitCowled
  SAY @522
  IF ~~ THEN REPLY @523 GOTO KitCowled2
  IF ~~ THEN REPLY @524 EXIT
END

IF ~~ THEN BEGIN KitCowled2
  SAY @525
  IF ~~ THEN REPLY @526 GOTO TalkedToByPC2
  IF ~~ THEN REPLY @527 EXIT
END

IF ~~ THEN BEGIN KitPast
  SAY @528
  IF ~~ THEN REPLY @529 GOTO KitBio
  IF ~~ THEN REPLY @530 GOTO TalkedToByPC2
END

IF ~~ THEN BEGIN KitBio
  SAY @531 = @532 = @533 = @534 = @535 = @536
  IF ~~ THEN REPLY @537 GOTO KitOkay
  IF ~~ THEN REPLY @538 GOTO TalkedToByPC
END

IF ~~ THEN BEGIN KitOkay
  SAY @539 = @540
  IF ~~ THEN REPLY @541 DO ~IncrementGlobal("KitLikes","GLOBAL",3)~ GOTO KitThank
  IF ~~ THEN REPLY @542 GOTO TalkedToByPC2
  IF ~~ THEN REPLY @543 EXIT
END

IF ~~ THEN BEGIN KitThank
  SAY @544 = @545
  IF ~~ THEN REPLY @546 EXIT
  IF ~~ THEN REPLY @547 GOTO TalkedToByPC2
END

// End of Player Initiated Dialogues and Flirts

// Begin R#Kitanya Initiated Flirts

IF WEIGHT #1 ~Global("KitFlirts","GLOBAL",1)
	      !Global("Chapter","GLOBAL",%bg2_chapter_5%)
	      CombatCounter(0)
	      Global("R!KitanyaRomanceActive","GLOBAL",1)
	      See(Player1)
	      !StateCheck(Player1,STATE_SLEEPING)
              GlobalTimerExpired("KitFlirt","GLOBAL")~ THEN BEGIN KitRomance1Flirts
  SAY @548
  IF ~RandomNum(10,1)~ THEN GOTO KitFlirt1-1
  IF ~RandomNum(10,2)~ THEN GOTO KitFlirt1-2
  IF ~RandomNum(10,3)~ THEN GOTO KitFlirt1-3
  IF ~RandomNum(10,4)~ THEN GOTO KitFlirt1-4
  IF ~RandomNum(10,5)~ THEN GOTO KitFlirt1-5
  IF ~RandomNum(10,6)~ THEN GOTO KitFlirt1-6
  IF ~RandomNum(10,7)~ THEN GOTO KitFlirt1-7
  IF ~RandomNum(10,8)~ THEN GOTO KitFlirt1-8
  IF ~RandomNum(10,9)~ THEN GOTO KitFlirt1-9
  IF ~RandomNum(10,10)~ THEN GOTO KitFlirt1-10
END

IF ~~ THEN BEGIN KitFlirt1-1
  SAY @549
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirt1-2
  SAY @550
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirt1-3
  SAY @551
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirt1-4
  SAY @552
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirt1-5
  SAY @553
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirt1-6
  SAY @554
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirt1-7
  SAY @555
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirt1-8
  SAY @556
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirt1-9
  SAY @557
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirt1-10
  SAY @558 = @559
  IF ~~ THEN EXIT
END

IF WEIGHT #2 ~Global("R!KitanyaRomanceActive","GLOBAL",2)
	      !Global("Chapter","GLOBAL",%bg2_chapter_5%)
	      Global("KitFlirts","GLOBAL",1)
	      CombatCounter(0)
	      See(Player1)
	      !StateCheck(Player1,STATE_SLEEPING)
	      GlobalTimerExpired("KitFlirt","GLOBAL")~ THEN BEGIN KitRomance2Flirts
  SAY @560
  IF ~RandomNum(8,1)~ THEN GOTO KitFlirt2-1
  IF ~RandomNum(8,2)~ THEN GOTO KitFlirt2-2
  IF ~RandomNum(8,3)~ THEN GOTO KitFlirt2-3
  IF ~RandomNum(8,4)~ THEN GOTO KitFlirt2-4
  IF ~RandomNum(8,5)~ THEN GOTO KitFlirt2-5
  IF ~RandomNum(8,6)~ THEN GOTO KitFlirt2-6
  IF ~RandomNum(8,7)~ THEN GOTO KitFlirt2-7
  IF ~RandomNum(8,8)~ THEN GOTO KitFlirt2-8
END

IF ~~ THEN BEGIN KitFlirt2-1
  SAY @561 = @562 = @563
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirt2-2
  SAY @564
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirt2-3
  SAY @565 = @566
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirt2-4
  SAY @567 = @568
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirt2-5
  SAY @569
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirt2-6
  SAY @570
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirt2-7
  SAY @571 = @572
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFlirt2-8
  SAY @573
  IF ~~ THEN EXIT
END

// End of Flirts

// Begin PC Health Chats

IF WEIGHT #3 ~HPLT(Player1,10)
	      Global("KitWorried","LOCALS",0)
              See(Player1)
	      !StateCheck(Player1,STATE_SLEEPING)~ THEN BEGIN KitWorriedTalk
  SAY @574
  IF ~~ THEN REPLY @575 DO ~SetGlobal("KitWorried","LOCALS",1)~ GOTO KitWorriedTalk-1
  IF ~~ THEN REPLY @576 DO ~SetGlobal("KitWorried","LOCALS",1)~ GOTO KitWorriedTalk-2
  IF ~~ THEN REPLY @577 DO ~SetGlobal("KitWorried","LOCALS",1)~ GOTO KitWorriedTalk-3
END

IF ~~ THEN BEGIN KitWorriedTalk-1
  SAY @578
  IF ~~ THEN REPLY @579 GOTO KitWorriedTalk-4
  IF ~~ THEN REPLY @580 GOTO KitWorriedTalk-4
END

IF ~~ THEN BEGIN KitWorriedTalk-2
  SAY @581
  IF ~~ THEN REPLY @582 GOTO KitWorriedTalk-5
  IF ~~ THEN REPLY @583 GOTO KitWorriedTalk-6
  IF ~~ THEN REPLY @584 GOTO KitWorriedTalk-3
END

IF ~~ THEN BEGIN KitWorriedTalk-3
  SAY @585
  IF ~~ THEN DO ~SetGlobal("R!KitanyaRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN KitWorriedTalk-4
  SAY @586
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitWorriedTalk-5
  SAY @587
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitWorriedTalk-6
  SAY @588
  IF ~~ THEN EXIT
END

END // Of appending

EXTEND_BOTTOM UDPHAE01 106
 + ~OR(2)
	Global("R!KitanyaRomanceActive","GLOBAL",1)
	Global("R!KitanyaRomanceActive","GLOBAL",2)~ + @589+110
END
