BEGIN R#KITYB

IF ~See(Player1)
    !StateCheck(Player1,STATE_SLEEPING)
    Global("KitFright","LOCALS",0)
    Global("KitImoenDungeon","LOCALS",1)
    CombatCounter(0)~ THEN BEGIN 0
   SAY @0
  ++ @1 DO ~SetGlobal("KitFright","LOCALS",1)~ + P1Power
  ++ @2  DO ~SetGlobal("KitFright","LOCALS",1)~ + KitFrightGood
END

IF ~~ THEN BEGIN P1Power
   SAY @3
  ++ @4 + P1Power2
  ++ @5 + KitFrightNeu
END

IF ~~ THEN BEGIN KitFrightGood
   SAY @6 
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN P1Power2
   SAY @7
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitFrightNeu
   SAY @8 
   IF ~~ THEN EXIT
END

CHAIN
  IF ~InParty("Valygar")
      See("Valygar")
      !StateCheck("Valygar",STATE_SLEEPING)
      CombatCounter(0)
      Global("ValKitMage","LOCALS",0)~ THEN R#KITYB  ValKitMageChain @9
DO ~SetGlobal("ValKitMage","LOCALS",1)~
  == BVALYGA @10
  == R#KITYB  @11
  == BVALYGA @12
  == R#KITYB  @13
  == BVALYGA @14
EXIT

CHAIN
  IF ~InParty("Jaheira")
      See("Jaheira")
      !StateCheck("Jaheira",STATE_SLEEPING)
      CombatCounter(0)
      Global("JaheiraKitIrenicus","LOCALS",0)~ THEN R#KITYB  JaheiraIrenicusChain @15
DO ~SetGlobal("JaheiraKitIrenicus","LOCALS",1)~
   == BJAHEIR @16
   == R#KITYB  @17
EXIT

CHAIN
  IF ~InParty("Anomen")
      HPLT("Anomen",10)
      See("Anomen")
      CombatCounter(0)
      Global("KitAnomenHealth","LOCALS",0)~ THEN R#KITYB  KitMocksAnomenChain @18
  DO ~SetGlobal("KitAnomenHealth","LOCALS",1)~
    == BANOMEN @19
EXIT

CHAIN
   IF ~InParty("Aerie")
       See("Aerie")
       !StateCheck("Aerie",STATE_SLEEPING)
       CombatCounter(0)
       Global("KitAerie01","LOCALS",0)~ THEN R#KITYB  KitAerie01Chain @20
DO ~SetGlobal("KitAerie01","LOCALS",1)~
   == BAERIE @21
   == R#KITYB  @22 = @23
   == BAERIE @24
   == R#KITYB @25
EXIT

CHAIN
   IF ~InParty("Edwin")
       See("Edwin")
       !StateCheck("Edwin",STATE_SLEEPING)
       CombatCounter(0)
       Global("KitHatesEdwin","LOCALS",0)~ THEN R#KITYB  KitEdwinChain @26
DO ~SetGlobal("KitHatesEdwin","LOCALS",1)~
   == BEDWIN @27
   == R#KITYB  @28 = @29
   == BEDWIN @30
   == R#KITYB  @31 = @32
EXIT

/* CHAIN
   IF ~InParty("Valygar")
       See("Valygar")
       !StateCheck("Valygar",STATE_SLEEPING)
       Dead("Lavok02")
       Global("ValKitMage","LOCALS",1)
       CombatCounter(0)
       Global("ValKitRomance","GLOBAL",1)~ THEN R#KITYB  ValygarComplimentChain @33
DO ~IncrementGlobal("ValKitRomance","GLOBAL",2)~
   == BVALYGA @34
   == R#KITYB  @35
   == BVALYGA @36
   == R#KITYB  @37
   == BVALYGA @38 = @39
EXIT */ // To be incorporated once Valygar romance is finished.

CHAIN
   IF ~InParty("Jaheira")
       See("Jaheira")
       !StateCheck("Jaheira",STATE_SLEEPING)
       CombatCounter(0)
       Global("JaheiraKitIrenicus","LOCALS",1)
       Global("KitKhalid","LOCALS",0)~ THEN R#KITYB  KitLearnKhalidChain @40
DO ~SetGlobal("KitKhalid","LOCALS",1)~
   == BJAHEIR @41
   == R#KITYB  @42
   == BJAHEIR @43 = @44 = @45 = @46
   == R#KITYB  @47
   == BJAHEIR @48
EXIT

CHAIN
   IF ~InParty("Jan")
       See("Jan")
       !StateCheck("Jan",STATE_SLEEPING)
       CombatCounter(0)
       Global("JanKitStory01","LOCALS",0)~ THEN R#KITYB  JanStoryTime01Chain @49
DO ~SetGlobal("JanKitStory01","LOCALS",1)~
   == BJAN @50 = @51
   == R#KITYB  @52
   == BJAN @53
   == R#KITYB  @54
   == BJAN @55
   == R#KITYB  @56
EXIT

CHAIN
   IF ~InParty("Cernd")
       See("Cernd")
       !StateCheck("Cernd",STATE_SLEEPING)
       AreaType(CITY)
       CombatCounter(0)
       Global("KitCerndCity","LOCALS",0)~ THEN R#KITYB  KitCerndCityChain @57
DO ~SetGlobal("KitCerndCity","LOCALS",1)~
   == BCERND @58
   = @59
   == R#KITYB  @60
   == BCERND @61
   == R#KITYB  @62
   == BCERND @63
   = @64
EXIT

CHAIN
   IF ~InParty("Cernd")
       See("Cernd")
       !StateCheck("Cernd",STATE_SLEEPING)
       AreaType(FOREST)
       Global("KitCerndCity","LOCALS",1)
       CombatCounter(0)
       Global("KitCerndForest","LOCALS",0)~ THEN R#KITYB  KitCerndForestChain @65
DO ~SetGlobal("KitCerndForest","LOCALS",1)~
   == BCERND @66
   == R#KITYB  @67
EXIT 

CHAIN
   IF ~InParty("Jaheira")
       See("Jaheira")
       !StateCheck("Jaheira",STATE_SLEEPING)
       Global("KitKhalid","LOCALS",1)
       CombatCounter(0)
       Global("KitJaheiraVen","LOCALS",0)~ THEN R#KITYB  KitJahVengeanceChain01 @68
DO ~SetGlobal("KitJaheiraVen","LOCALS",1)~
   == BJAHEIR @69
   == R#KITYB  @70
   == BJAHEIR @71
   = IF ~Global("JaheiraRomanceActive","GLOBAL",1)~ THEN @72 //Jaheira only speaks this line if in the early stages of a romance with the PC.
   = IF ~Global("JaheiraRomanceActive","GLOBAL",2)~ THEN @73 //Jaheira only speaks this if in an exclusive romance with the PC.
   == R#KITYB  @74
   == BJAHEIR @75
   == R#KITYB  @76
   == BJAHEIR @77
EXIT

CHAIN
   IF ~InParty("Jaheira")
       See("Jaheira")
       !StateCheck("Jaheira",STATE_SLEEPING)
       CombatCounter(0)
       Global("KitJaheiraVen","LOCALS",1)
       Global("KitJaheiraApol","LOCALS",0)~ THEN R#KITYB  KitJahVengeanceChain02 @78
DO ~SetGlobal("KitJaheiraApol","LOCALS",1)~
   == BJAHEIR @79
   == R#KITYB  @80 = @81
   == BJAHEIR @82
   == R#KITYB  @83
EXIT

CHAIN
   IF ~InParty("Imoen2")
       See("Imoen2")
       !StateCheck("Imoen2",STATE_SLEEPING)
       CombatCounter(0)
       Global("KitImoenPerky","LOCALS",0)~ THEN R#KITYB  KitImoenHappyChain @84
DO ~SetGlobal("KitImoenPerky","LOCALS",1)~
   == IMOEN2J @85
   == R#KITYB  @86
   == IMOEN2J @87
   == R#KITYB  @88
   == IMOEN2J @89
EXIT

CHAIN
   IF ~InParty("Edwin")
       See("Edwin")
       !StateCheck("Edwin",STATE_SLEEPING)
       CombatCounter(0)
       Global("KitEdwinGlare","LOCALS",0)~ THEN R#KITYB  EdwinGlaringChain @90
DO ~SetGlobal("KitEdwinGlare","LOCALS",1)~
   == BEDWIN @91
   == R#KITYB  @92
   == BEDWIN @93
   == R#KITYB  @94
EXIT

CHAIN
   IF ~InParty("Imoen2")
       See("Imoen2")
       !StateCheck("Imoen2",STATE_SLEEPING)
       CombatCounter(0)
       Global("KitImoenDungeon","LOCALS",0)
       AreaType(DUNGEON)~ THEN R#KITYB  KitImoenDungeonChain @95
DO ~SetGlobal("KitImoenDungeon","LOCALS",1)~
   == IMOEN2J @96 = @97
   == R#KITYB  @98
   == IMOEN2J @99
   == R#KITYB  @100
   == IMOEN2J @101
   == R#KITYB  @102
   == IMOEN2J @103
   == R#KITYB  @104
EXIT

CHAIN
   IF ~InParty("Minsc")
       See("Minsc")
       !StateCheck("Minsc",STATE_SLEEPING)
       CombatCounter(0)
       Global("KitMinscBoo","LOCALS",0)~ THEN R#KITYB  KitMinscBooChain @105
DO ~SetGlobal("KitMinscBoo","LOCALS",1)~
   == BMINSC @106
   == R#KITYB  @107
   == BMINSC @108
   == R#KITYB  @109
EXIT

CHAIN
   IF ~InParty("Aerie")
       See("Aerie")
       !StateCheck("Aerie",STATE_SLEEPING)
       CombatCounter(0)
       Global("KitAerieConfidence","LOCALS",0)~ THEN R#KITYB  KitAerieTalkChain @110
DO ~SetGlobal("KitAerieConfidence","LOCALS",1)~
   == BAERIE @111
   == R#KITYB  @112
   == BAERIE @113
   == R#KITYB  @114
EXIT

/* CHAIN
  IF ~InParty("Valygar")
      See("Valygar")
      !StateCheck("Valygar",STATE_SLEEPING)
      CombatCounter(0)
      Global("ValKitRomance","GLOBAL",2)~ THEN R#KITYB  ValKitFriendshipChain @115
DO ~IncrementGlobal("ValKitRomance","GLOBAL",3)~
   == BVALYGA @116
   == R#KITYB  @117
   == BVALYGA @118
   == R#KITYB  @119
   == BVALYGA @120 = @121
   == R#KITYB  @122
EXIT */ // To be incorporated once Valygar romance is finished.

CHAIN
   IF ~InParty("Keldorn")
       See("Keldorn")
       !StateCheck("Keldorn",STATE_SLEEPING)
       CombatCounter(0)
       Global("KitKeldornMage","LOCALS",0)~ THEN R#KITYB  KelKitMageChain @123
DO ~SetGlobal("KitKeldornMage","LOCALS",1)~
   == BKELDOR @124
   == R#KITYB  @125
   == BKELDOR @126
   == R#KITYB  @127
   == BKELDOR @128
   == R#KITYB  @129
EXIT

CHAIN
  IF ~InParty("Mazzy")
      See("Mazzy")
      !StateCheck("Mazzy",STATE_SLEEPING)
      Class(Player1, PALADIN)
      CombatCounter(0)
      Global("KitMazEnvy","LOCALS",0)~ THEN R#KITYB  KitMazzyEnvyChain @130
DO ~SetGlobal("KitMazEnvy","LOCALS",0)~
  == BMAZZY @131
  == R#KITYB  @132
  == BMAZZY @133
  == R#KITYB  @134
  == BMAZZY @135
EXIT

CHAIN
  IF ~InParty("Minsc")
      See("Minsc")
      CombatCounter(0)
      !StateCheck("Minsc",STATE_SLEEPING)
      Global("KitMinscCombat","LOCALS",0)~ THEN R#KITYB  KitMinscCombatChain @136
DO ~SetGlobal("KitMinscCombat","LOCALS",1)~
  == BMINSC @137
  == R#KITYB  @138
  == BMINSC @139
  == R#KITYB  @140
  == BMINSC @141
  == R#KITYB  @142
  == BMINSC @143
  == R#KITYB  @144
  == BMINSC	@145
  == R#KITYB  @146
  == BMINSC @147
  == R#KITYB  @148
EXIT

CHAIN
  IF ~InParty("Minsc")
      See("Minsc")
      !StateCheck("Minsc",STATE_SLEEPING)
      CombatCounter(0)
      Global("KitMinscGrammar","LOCALS",0)~ THEN R#KITYB  KitMinscCommunicationChain @149
DO ~SetGlobal("KitMinscGrammar","LOCALS",1)~
  == BMINSC @150
  == R#KITYB  @151
  == BMINSC @152
  == R#KITYB  @153
  == BEDWIN IF ~IsValidForPartyDialogue("Edwin")~ THEN @154 //Edwin will speak this if he is in the party.
  == R#KITYB  IF ~IsValidForPartyDialogue("Edwin")~ THEN @155 //Kitanya will respond to Edwin
  == BMINSC @156
  == R#KITYB  @157 = @158
EXIT

CHAIN
  IF ~InParty("Imoen2")
      See("Imoen2")
      !StateCheck("Imoen2",STATE_SLEEPING)
      CombatCounter(0)
      Global("KitImoenTag","LOCALS",0)~ THEN R#KITYB  KitImoenTagChain @159
DO ~SetGlobal("KitImoenTag","LOCALS",1)~
  == IMOEN2J @160
  == R#KITYB  @161
  == IMOEN2J @162
  == R#KITYB  IF ~AreaType(DUNGEON)~ THEN @163 // Kitanya says this if the party is in a dungeon
  == R#KITYB  IF ~!AreaType(DUNGEON)~ THEN @164 // Kitanya says this if the group is not in a dungeon
  == IMOEN2J @165
  == R#KITYB  @166
EXIT

CHAIN
  IF ~InParty("Yoshimo")
      See("Yoshimo")
      !StateCheck("Yoshimo",STATE_SLEEPING)
      CombatCounter(0)
      Global("KitYoshSuspicious","LOCALS",0)~ THEN R#KITYB  KitSuspiciousYoshGeasChain @167
DO ~SetGlobal("KitYoshSuspicious","LOCALS",1)~
  == BYOSHIM @168
  == R#KITYB  @169 = @170
  == BYOSHIM @171
  == R#KITYB  @172
EXIT

CHAIN
  IF ~InParty("Yoshimo")
      See("Yoshimo")
      !StateCheck("Yoshimo",STATE_SLEEPING)
      Global("YoshNoticeKit","GLOBAL",1)
      CombatCounter(0)
      Global("KitYoshApology","LOCALS",0)~ THEN R#KITYB  KitYoshSorryChain @173
DO ~SetGlobal("KitYoshApology","LOCALS",1)~
  == BYOSHIM @174
  == R#KITYB  @175
  == BYOSHIM @176
  == R#KITYB  @177 = @178 = @179 = @180
  == BYOSHIM @181
EXIT

CHAIN
 IF ~InParty("Keldorn")
     See("Keldorn")
     !StateCheck("Keldorn",STATE_SLEEPING)
     CombatCounter(0)
     Global("KitKeldornDanger","LOCALS",0)~ THEN R#KITYB  KitKeldornDangerChain @182
DO ~SetGlobal("KitKeldornDanger","LOCALS",1)~
  == BKELDOR @183
  == R#KITYB  @184
  == BKELDOR @185
  == R#KITYB  @186
  == BKELDOR @187
  == R#KITYB  @188
  == BKELDOR @189 = @190
EXIT

CHAIN
  IF ~InParty("Keldorn")
      See("Keldorn")
      !StateCheck("Keldorn",STATE_SLEEPING)
      CombatCounter(0)
      Global("KitKeldornTorm","LOCALS",0)~ THEN R#KITYB  KitInterestInTormChain @191
DO ~SetGlobal("KitKeldornTorm","LOCALS",1)~
  == BKELDOR @192
  == R#KITYB  @193
  == BKELDOR @194
EXIT

CHAIN
  IF ~InParty("Korgan")
      See("Korgan")
      !StateCheck("Korgan",STATE_SLEEPING)
      CombatCounter(0)
      Global("KitKorganMerc","LOCALS",0)~ THEN R#KITYB  KitKorganMercChain @195
DO ~SetGlobal("KitKorganMerc","LOCALS",1)~
  == BKORGAN @196 =	@197
EXIT

CHAIN
  IF ~InParty("Minsc")
      See("Minsc")
      !StateCheck("Minsc",STATE_SLEEPING)
      CombatCounter(0)
      Global("KitMinscDyna","LOCALS",0)~ THEN R#KITYB  MinscDynaheirChain @198
DO ~SetGlobal("KitMinscDyna","LOCALS",1)~
  == BMINSC	@199
  == R#KITYB  @200
  == BMINSC @201
  == R#KITYB  @202
  == BMINSC @203
  == R#KITYB  @204
EXIT

CHAIN
  IF ~InParty("Nalia")
      See("Nalia")
      !StateCheck("Nalia",STATE_SLEEPING)
      CombatCounter(0)
      Global("KitNaliaBenevolence","LOCALS",0)~ THEN R#KITYB  NaliaBenevolenceChain @205
  DO ~SetGlobal("KitNaliaBenevolence","LOCALS",1)~
  == BNALIA @206
  == R#KITYB  @207
  == BNALIA @208
EXIT

CHAIN
  IF ~InParty("HaerDalis")
      See("HaerDalis")
      !StateCheck("HaerDalis",STATE_SLEEPING)
      CombatCounter(0)
      Global("KitBardPlanes","LOCALS",0)~ THEN R#KITYB  KitHaerPlanesChain @209
  DO ~SetGlobal("KitBardPlanes","LOCALS",1)~
  == BHAERDA @210
  == R#KITYB  @211
  == BHAERDA @212
  == R#KITYB  @213
  == BHAERDA @214
  == R#KITYB  @215
EXIT

CHAIN
  IF ~InParty("Nalia")
      See("Nalia")
      !StateCheck("Nalia",STATE_SLEEPING)
      CombatCounter(0)
      Global("KitNaliaHelp","LOCALS",0)~ THEN R#KITYB  NaliaHelpChain @216
DO ~SetGlobal("KitNaliaHelp","LOCALS",1)~
  == BNALIA @217 = @218 = @219
  == R#KITYB  @220
  == BNALIA @221 = @222
  == R#KITYB  @223
  == BNALIA @224
  == R#KITYB  @225 = @226
EXIT

CHAIN
  IF ~InParty("Jaheira")
      See("Jaheira")
      !StateCheck("Jaheira",STATE_SLEEPING)
      CombatCounter(0)
      Global("KitJaheiraSuldanessalar","LOCALS", 0)~ THEN R#KITYB  SuldanessalarChain @227
  DO ~SetGlobal("KitJaheiraSuldanessalar","LOCALS",1)~
  == BAERIE IF ~IsValidForPartyDialogue("Aerie")~ THEN @228
  == BJAHEIR IF ~IsValidForPartyDialogue("Aerie")~ THEN @229
  == BJAHEIR IF ~!IsValidForPartyDialogue("Aerie")~ THEN @230
  == R#KITYB  @231
  == BJAHEIR @232
  == R#KITYB  @233
  == BJAHEIR @234
  == R#KITYB  @235
  == BJAHEIR @236
  == R#KITYB  @237
  == BJAHEIR @238
  == R#KITYB  @239
EXIT

CHAIN
  IF ~InParty("Mazzy")
      See("Mazzy")
      !StateCheck("Mazzy",STATE_SLEEPING)
      CombatCounter(0)
      Global("KitMazFightTalk","LOCALS",0)~ THEN R#KITYB  KitMazFightTalkChain @240
  DO ~SetGlobal("KitMazFightTalk","LOCALS",1)~
  == BMAZZY @241
  == R#KITYB  @242
  == BMAZZY @243
EXIT

CHAIN
   IF ~InParty("R!Kitanya")
       See("R!Kitanya")
       !StateCheck("R!Kitanya",STATE_SLEEPING)
       CombatCounter(0)
       Global("R#YoshKitHome","LOCALS",0)~ THEN BYOSHIM YoshKitHomeChain @244
DO ~SetGlobal("R#YoshKitHome","LOCALS",1)~
   == R#KITYB  @245
   == BYOSHIM @246
   == R#KITYB  @247
   == BYOSHIM @248
   == R#KITYB  @249
   == BYOSHIM @250
EXIT

CHAIN
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      CombatCounter(0)
      Global("R#YoshNoticeKit","GLOBAL",0)~ THEN BYOSHIM YoshNoticingKitChain @251
DO ~SetGlobal("R#YoshNoticeKit","GLOBAL",1)~
  == R#KITYB  @252
  == BYOSHIM @253
  == R#KITYB  @254 = @255
  == BYOSHIM @256
  == R#KITYB  @257 =	@258
  == BYOSHIM @259
  == R#KITYB  @260 = @261
  == BYOSHIM @262
  == R#KITYB  @263
  == BYOSHIM @264
  == R#KITYB  @265 = @266
EXIT

CHAIN
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      CombatCounter(0)
      Global("R#KitVicJealous","LOCALS",0)~ THEN BVICONI KitJealousChain @267
DO ~SetGlobal("R#KitVicJealous","LOCALS",1)~
  == R#KITYB  @268
  == BVICONI @269
  == R#KITYB  @270
  == BVICONI @271
  == R#KITYB  @272 = @273
  == BVICONI @274
  == R#KITYB  @275
  == BVICONI @276
EXIT

CHAIN
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      CombatCounter(0)
      Global("R#KitMinscFightTalk","LOCALS",0)~ THEN BMINSC KitAfterFightChain @277
DO ~SetGlobal("R#KitMinscFightTalk","LOCALS",1)~
  == R#KITYB  @278
  == BMINSC @279
  == R#KITYB  @280
  == BMINSC @281
  == R#KITYB  @282
  == BMINSC @283 = @284
EXIT

CHAIN
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      CombatCounter(0)
      Global("R#KitMinscHate","LOCALS",0)~ THEN BMINSC WhyHateDynaChain @285
DO ~SetGlobal("R#KitMinscHate","LOCALS",1)~
  == R#KITYB  @286
  == BMINSC @287
  == R#KITYB  @288 = @289
  == BMINSC	@290
  == R#KITYB  @291
  == BMINSC @292
  == R#KITYB  @293
  == BMINSC @294
EXIT

CHAIN
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      CombatCounter(0)
      Global("R#KitMinscRep","LOCALS",0)~ THEN BMINSC KitMinscGoodnessChain @295
DO ~SetGlobal("R#KitMinscRep","LOCALS",1)~
  == R#KITYB  @296
  == BMINSC @297
  == R#KITYB  @298
  == BMINSC @299
  == R#KITYB  @300 = @301
EXIT

CHAIN
   IF ~InParty("R!Kitanya")
       See("R!Kitanya")
       StateCheck("R#Kitanya",STATE_SLEEPING)
       CombatCounter(0)
       Global("R#KitMazzyUmar","LOCALS",0)~ THEN BMAZZY KitMazUmarChain @302
DO ~SetGlobal("R#KitMazzyUmar","LOCALS",1)~
   == R#KITYB @303 = @304
   == BMAZZY @305
   == R#KITYB @306
   == BMAZZY @307
   == R#KITYB @308
   == BMAZZY @309
   == R#KITYB @310 = @311
   == BMAZZY @312
EXIT

CHAIN
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      CombatCounter(0)
      Global("R#KitKorganFlirt","LOCALS",0)~ THEN BKORGAN KitFlirtChain @313
DO ~SetGlobal("R#KitKorganFlirt","LOCALS",1)~
  == R#KITYB  @314
  == BKORGAN @315
  == R#KITYB  @316
  == BKORGAN @317
  == R#KITYB  @318
  == BKORGAN @319
  == R#KITYB  @320
EXIT

CHAIN
   IF ~InParty("R!Kitanya")
       See("R!Kitanya")
       !StateCheck("R!Kitanya",STATE_SLEEPING)
       CombatCounter(0)
       Global("R#KitJanStorytime","LOCALS",0)~ THEN BJAN KitOrcChain @321
DO ~SetGlobal("R#KitJanStorytime","LOCALS",1)~
   == R#KITYB  @322
   == BJAN @323
   == R#KITYB  @324
   == BJAN @325
   == R#KITYB  @326
   == BJAN @327
   == R#KITYB  @328
   == BJAN @329
   == R#KITYB  @330
EXIT

CHAIN
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      CombatCounter(0)
      Global("R#KitJanRelate","LOCALS",0)~ THEN BJAN KitJanRelateChain @331
DO ~SetGlobal("R#KitJanRelate","LOCALS",1)~
  == R#KITYB  @332
  == BJAN @333
  == R#KITYB  @334
  == BJAN @335
  == R#KITYB  @336
  == BJAN @337
  == BANOMEN IF ~InParty("Anomen")
                 See("Anomen")~ THEN @338
  == BJAN IF ~InParty("Anomen")
              See("Anomen")~ THEN @339
  == BJAN @340
  == R#KITYB  @341
  == BJAN @342 = @343
  == BEDWIN IF ~InParty("Edwin")
                See("Edwin")~ THEN @344
  == BJAN IF ~InParty("Edwin")
              See("Edwin")~ THEN @345
  == R#KITYB  @346 = @347
  == BJAN @348
EXIT

APPEND ~BJAN~

IF ~See(Player1)
    !StateCheck(Player1,STATE_SLEEPING)
    Global("KitJanRelate","LOCALS",1)
    Global("JanAnnoyPC","LOCALS",0)
    CombatCounter(0)~ THEN BEGIN JanAnnoyPlayerStart
  SAY @349
  ++ @350 + RefuseStory
  ++ @351 + TellStory
  + ~InParty("Imoen2")~ + @352  EXTERN IMOEN2J JanAnnoyImmyChain
  + ~InParty("R!Kitanya")~ + @353  EXTERN R#KITYB  JanGooberKitChain
END

IF ~~ THEN BEGIN RefuseStory
  SAY @354 = @355 = @356 = @357 = @358
  ++ @359  + NoInterrupting
  ++ @360 + TalkedDeath
  ++ @361 + WantToContinue
  + ~InParty("Anomen")~ + @362 EXTERN BANOMEN AnoPissJanChain
END

IF ~~ THEN BEGIN NoInterrupting
  SAY @363 = @364
  ++ @365 + ThreatenedByPlayer
  ++ @361 + WantToContinue
  + ~InParty("Aerie")~ + @366 EXTERN BAERIE NoNo
END

IF ~~ THEN BEGIN ThreatenedByPlayer
  SAY @367 = @368
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN TellStory
  SAY @355 = @356 = @357 = @358
  ++ @369 + Quest
  ++ @370 + TalkedDeath
END

IF ~~ THEN BEGIN TalkedDeath
  SAY @371 = @372
  ++ @373 + Shutup
  ++ @374 + BlameJan
  ++ @375 EXIT
END

IF ~~ THEN BEGIN Quest
  SAY @376  
  IF ~~ THEN EXTERN BEDWIN JanFemaleChain
END

IF ~~ THEN BEGIN WantToContinue
  SAY @377 = @378 = @379 = @380
  ++ @381 + MinoEat
  ++ @382 EXIT
END

IF ~~ THEN BEGIN MinoEat
  SAY @383
  IF ~IsValidForPartyDialogue("Viconia")~ THEN EXTERN BVICONI MinoEat
  IF ~!IsValidForPartyDialogue("Viconia")~ THEN REPLY @384 GOTO JanWrong
  IF ~!IsValidForPartyDialogue("Viconia")~ THEN REPLY @385 GOTO PCAstonished
  IF ~!IsValidForPartyDialogue("Viconia")~ THEN REPLY @386 EXIT
END

IF ~~ THEN BEGIN Makeup
  SAY @387  
  IF ~~ THEN EXTERN BVICONI JanDontTalk
END

IF ~~ THEN BEGIN JanWrong
  SAY @388 = @389
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN PCAstonished
  SAY @390 = @391
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Shutup
  SAY @392
  ++ @393 + EndStory
  ++ @394 + WantToContinue
  ++ @395 + EndStory
END

IF ~~ THEN BEGIN BlameJan
  SAY @396
  ++ @397 + NotBlameJan
  ++ @398 + ReallyBlameJan
  ++ @399 + EndStory
END

IF ~~ THEN BEGIN ReallyBlameJan
  SAY @400
  ++ @235 + WantToContinue
  ++ @401 + EndStory
END

IF ~~ THEN BEGIN NotBlameJan
  SAY @402
  ++ @235 + WantToContinue
  ++ @401 + EndStory
END

IF ~~ THEN BEGIN EndStory
  SAY @403
  IF ~~ THEN EXIT
END
END // of APPEND

CHAIN
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      CombatCounter(0)
      Global("R#KitJanTimeForStory","LOCALS",0)~ THEN BJAN KitTellAStoryChain @404
DO ~SetGlobal("R#KitJanTimeForStory","LOCALS",1)~
  == R#KITYB  @405
  == BJAN @406
  == BAERIE IF ~IsValidForPartyDialogue("Aerie")~ THEN @407
  == BANOMEN IF ~IsValidForPartyDialogue("Anomen")~ THEN @408
  == BJAHEIR IF ~IsValidForPartyDialogue("Jaheira")~ THEN @409
  == BEDWIN IF ~IsValidForPartyDialogue("Edwin")~ THEN @410
  == BJAN IF ~OR(4)
               IsValidForPartyDialogue("Aerie")
               IsValidForPartyDialogue("Anomen")
               IsValidForPartyDialogue("Jaheira")
               IsValidForPartyDialogue("Edwin")~ THEN @411 = @412
EXIT

CHAIN
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      GlobalGT("Chapter","GLOBAL",%bg2_chapter_4%)
      CombatCounter(0)
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      Global("R#KitJahContemplate","LOCALS",0)~ THEN BJAHEIR KitJahContemplateChain @413
DO ~SetGlobal("R#KitJahContemplate","LOCALS",1)~
  == R#KITYB  @414
  == BJAHEIR @415
  == R#KITYB  @416
  == BJAHEIR @417
  == R#KITYB  @418
  == BJAHEIR @419 = @420 = @421
  == R#KITYB  @422 = @423
EXIT

CHAIN
   IF ~InParty("R!Kitanya")
       See("R!Kitanya")
       !StateCheck("R!Kitanya",STATE_SLEEPING)
       CombatCounter(0)
       Global("R#KitEdwinWar","LOCALS",0)~ THEN BEDWIN KitEdwinWarChain @424
DO ~SetGlobal("R#KitEdwinWar","LOCALS",1)~
   == R#KITYB  @425
   == BEDWIN @426
EXIT

CHAIN
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      CombatCounter(0)
      Global("R#KitEdwinFlirt","LOCALS",0)~ THEN BEDWIN KitEdwinFlirtChain @427
DO ~SetGlobal("R#KitEdwinFlirt","LOCALS",1)~
  == R#KITYB  @428
  == BEDWIN @429
  == R#KITYB  @430
  == BEDWIN @431
  == R#KITYB  @432
DO ~ActionOverride("Edwin",Panic())~
EXIT

CHAIN BEDWIN JanFemaleChain
  @433 = @434
  == BANOMEN IF ~InParty("Anomen") !Dead("Anomen") See("Anomen")~ THEN @435
  == BEDWIN IF ~InParty("Anomen") !Dead("Anomen") See("Anomen")~ THEN @436
  == BJAN @437 = @438
  == BEDWIN @439
EXIT

CHAIN
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      CombatCounter(0)
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      Global("R#CerndEnvyKit","LOCALS",0)~ THEN BCERND CerndEnviesKitChain @440
DO ~SetGlobal("R#CerndEnvyKit","LOCALS",1)~
  == R#KITYB  @441
  == BCERND @442
  == R#KITYB  @443
  == BCERND @444
  == R#KITYB  @445
  == BCERND @446
  == R#KITYB  @447
  == BCERND @448
  == R#KITYB  @449
  == BCERND @450
  == R#KITYB  @451
  == BCERND @452
EXIT

CHAIN
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      CombatCounter(0)
      Global("R#KitCerndNature","LOCALS",0)
      AreaType(FOREST)~ THEN BCERND KitNatureChain @453
DO ~SetGlobal("R#KitCerndNature","LOCALS",1)~
  == R#KITYB  @454
  == BCERND @455
  == R#KITYB  @456 = @457
  == BCERND @458
  == R#KITYB  @459
  == BCERND @460
  == R#KITYB  @461
  == BCERND @462
  == R#KITYB  @463
  == BCERND @464
  == R#KITYB  @465
  == BCERND @466
  == R#KITYB  @467
  == BCERND @468
  == R#KITYB  @469
  == BCERND @470
  == R#KITYB  @471
  == BCERND @10
  == R#KITYB  @472
  == BANOMEN IF ~IsValidForPartyDialogue("Anomen")~ THEN @473
  == BCERND @474
EXIT

CHAIN
 IF WEIGHT #-999 ~InParty("R!Kitanya")
                  See("R!Kitanya")
                  CombatCounter(0)
 	          !StateCheck("R!Kitanya",STATE_SLEEPING)
 		  Global("R#AnomenDefendKitanya","LOCALS",0)~ THEN BANOMEN AnomenKitDefendChain @475
DO ~SetGlobal("R#AnomenDefendKitanya","LOCALS",1)~
   == R#KITYB  @476
   == BANOMEN @477
   == R#KITYB  @478
   == BANOMEN @479
   == R#KITYB  @480
EXIT

CHAIN
 IF ~InParty("R!Kitanya")
     See("R!Kitanya")
     !StateCheck("R!Kitanya",STATE_SLEEPING)
     !Global("AnomenRomanceActive","GLOBAL",2)
     CombatCounter(0)
     Global("R#AnomenKitFlirt","LOCALS",0)~ THEN BANOMEN AnomenFlirtKitChain @481
DO ~SetGlobal("R#AnomenKitFlirt","LOCALS",1)~
   == R#KITYB  @482
   == BANOMEN @483
   == R#KITYB  @484
   == BANOMEN @485
   == R#KITYB  @486
EXIT

CHAIN
 IF ~InParty("R!Kitanya")
     See("R!Kitanya")
     !StateCheck("R!Kitanya",STATE_SLEEPING)
     CombatCounter(0)
     !Global("AnomenRomanceActive","GLOBAL",2)
     Global("R#AnomenKitFlirt2","LOCALS",0)~ THEN BANOMEN AnomenFlirt2Chain @487
DO ~SetGlobal("R#AnomenKitFlirt2","LOCALS",1)~
   == R#KITYB  @488
   == BANOMEN @489
   == R#KITYB  @490 = @491
   == BANOMEN @492
   == R#KITYB  @493 = @494 = @495
   == BANOMEN @496
   == R#KITYB  @497
EXIT

CHAIN
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      !Global("AnomenRomanceActive","GLOBAL",2)
      CombatCounter(0)
      Global("R#KitAnomenFlirt3","LOCALS",0)~ THEN BANOMEN AnomenFlirt3Chain @498
DO ~SetGlobal("R#KitAnomenFlirt3","LOCALS",1)~
  == R#KITYB  @499
  == BANOMEN @500
  == R#KITYB  @501
EXIT

CHAIN BANOMEN AnoPissJanChain @502
  == BJAN @503
END BJAN WantToContinue

CHAIN
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      CombatCounter(0)
      !Global("AnomenRomanceActive","GLOBAL",2)
      Global("R#KitAnomenFlirt4","LOCALS",0)~ THEN BANOMEN AnomenFlirt4Chain @504
DO ~SetGlobal("R#KitAnomenFlirt4","LOCALS",1)~
  == R#KITYB  @505
  == BANOMEN @506
  == R#KITYB  @507 = @508
DO ~DisplayString("R!Kitanya",999999)
    CallLightning("Anomen")~
EXIT

CHAIN
 IF ~InParty("R!Kitanya")
     See("R!Kitanya")
     !StateCheck("R!Kitanya",STATE_SLEEPING)
     CombatCounter(0)
     Global("R#KitAerieInsecure","LOCALS",0)~ THEN BAERIE KitComfortChain @509
DO ~SetGlobal("R#KitAerieInsecure","LOCALS",1)~
   == R#KITYB  @510
   == BAERIE @511
   == R#KITYB  @512
   = IF ~Global("AerieRomanceActive","GLOBAL",1)~ THEN @513
   = IF ~Global("AerieRomanceActive","GLOBAL",2)~ THEN @513
   == BAERIE @514
   == R#KITYB  @515
   == BAERIE @516
   == R#KITYB  @517
   == BAERIE @518
EXIT

APPEND ~BAERIE~
IF ~~ THEN BEGIN NoNo
  SAY @519 = @520
  IF ~~ THEN EXIT
END 
END

CHAIN
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      !Global("AerieRomanceActive","GLOBAL",3)
      !Global("AerieRomanceActive","GLOBAL",0)
      GlobalGT("LoveTalk","LOCALS",38)
      GlobalLT("LoveTalk","LOCALS",46)
      CombatCounter(0)
      Global("R#KitAerieLove","LOCALS",0)~ THEN BAERIE KitAeriePersonalChain @521
DO ~SetGlobal("R#KitAerieLove","LOCALS",1)~
  == R#KITYB  @522
  == BAERIE @523
  == R#KITYB  @524 = @525
  == BAERIE @526
  == R#KITYB  @527 = @528
  == BAERIE @322
  == R#KITYB  @529
  == BAERIE @530
  == R#KITYB  @531
EXIT

CHAIN
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      CombatCounter(0)
      Global("R#KitAerieFight","LOCALS",0)~ THEN BAERIE KitFightChain @532
DO ~SetGlobal("R#KitAerieFight","LOCALS",1)~
  == R#KITYB  @533
  == BAERIE @534
  == R#KITYB  @535
  == BAERIE @536
  == R#KITYB  @537
  == BAERIE @538
EXIT

CHAIN
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      CombatCounter(0)
      Global("R#KitVicNookie","LOCALS",0)~ THEN BVICONI KitSexTalkChain @539
  DO ~SetGlobal("R#KitVicNookie","LOCALS",1)~
  == R#KITYB  @540
  == BVICONI @541
  == R#KITYB  @542
  == BVICONI @543
  == R#KITYB  @544 = @545
  == BVICONI @546
EXIT

CHAIN
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      CombatCounter(0)
      Global("R#KitKorganInsult","LOCALS",0)~ THEN BKORGAN KorganKitInsultDejaChain @547
  == BANOMEN IF ~IsValidForPartyDialogue("Anomen")~ THEN @548
  == R#KITYB  IF ~IsValidForPartyDialogue("Anomen")~ THEN @549
  == R#KITYB  IF ~!IsValidForPartyDialogue("Anomen")~ THEN @550
  == BKORGAN @551
  == R#KITYB  @552
  == BKORGAN @553 = @554
  == R#KITYB  @555
EXIT

CHAIN
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      CombatCounter(0)
      Global("R#KitJanTurnips","LOCALS",0)~ THEN BJAN KitTurnipChain @556
  DO ~SetGlobal("R#KitJanTurnips","LOCALS",1)~
  == R#KITYB  @557
  == BJAN @558
  == R#KITYB  @559
  == BJAN @560
  == R#KITYB  @561
  == BJAN @562
  == R#KITYB  @563
EXIT

CHAIN R#KITYB  JanGooberKitChain @564
  == BJAN @565
  == R#KITYB  IF ~AreaType(DUNGEON)~ THEN @566
  = IF ~AreaType(DUNGEON)~ THEN @567
  == R#KITYB  IF ~!AreaType(DUNGEON)~ THEN @568
  == BJAN IF ~!AreaType(DUNGEON)~ THEN @569
  == R#KITYB  IF ~!AreaType(DUNGEON)~ THEN @570
  == BJAN IF ~!AreaType(DUNGEON)~ THEN @571
  == BJAN IF ~AreaType(DUNGEON)~ THEN @572
  == R#KITYB  IF ~AreaType(DUNGEON)~ THEN @573
EXIT

APPEND ~BVICONI~
IF ~~ THEN BEGIN MinoEat
  SAY @574
  IF ~~ THEN EXTERN ~BJAN~ Makeup
END

IF ~~ THEN BEGIN JanDontTalk
  SAY @575
  IF ~~ THEN EXIT
END
END

CHAIN
  IF ~InParty("R!Kitanya")
      See("R!Kitanya")
      !StateCheck("R!Kitanya",STATE_SLEEPING)
      CombatCounter(0)
      Global("R#KitKeldornFamily","LOCALS",0)~ THEN BKELDOR KitFamilyTalkChain @576
  DO ~SetGlobal("R#KitKeldornFamily","LOCALS",1)~
  == R#KITYB  @577
  == BKELDOR @578
  == R#KITYB  @579
  == BKELDOR @580
  == R#KITYB  @581
  == BKELDOR @582
EXIT

CHAIN IMOEN2J JanAnnoyImmyChain @583
  == BJAN @355 = @356 = @357 = @358
  == IMOEN2J @584
  == BANOMEN IF ~IsValidForPartyDialogue("Anomen")~ THEN @585
  == BJAN IF ~IsValidForPartyDialogue("Anomen")~ THEN @586
  == BJAN @587 = @377 = @378 = @379 = @380
  == IMOEN2J @588
  == BJAN @589
  == IMOEN2J @590
EXIT
