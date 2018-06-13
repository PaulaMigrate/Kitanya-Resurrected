// creator:  Rastor (rastor@rpgdungeon.net)
// Do not use this as an example of a well-coded dialogue file.  This was originally
// done in IDU and I was too lazy to rename some of the states.

BEGIN ~R#kitya~

IF ~NumTimesTalkedTo(0)
    Gender(Player1,MALE)~ THEN BEGIN 0 // from:
  SAY @0
  ++@1 DO ~SetGlobal("PCIgnorant","LOCALS",1)~+KitAttention
  ++@2+1
END

IF ~~ THEN BEGIN 1 // from: 0.1
  SAY @3
  ++@4+2
  ++@5+6
  ++@6+7
END

IF ~~ THEN BEGIN 2 // from: 1.0
  SAY @7
  ++@8+ 3
  ++@9+4
  ++@10+5
END

IF ~~ THEN BEGIN 3 // from: 2.0
  SAY @11
  ++@12+14
  ++@13+23
  ++@14+24
END

IF ~~ THEN BEGIN 4 // from: 2.1
  SAY @15
  ++@16+KitBeauty
END

IF ~~ THEN BEGIN 5 // from: 2.2
  SAY @17
  ++@18+21
  ++@19+10
END

IF ~~ THEN BEGIN 6 // from: 1.1
  SAY @20
  ++@21+8
  ++@22+25
  ++@23+9
  ++@24+10
  +~Global("AerieRomanceActive","GLOBAL",1)
    IsValidForPartyDialogue("Aerie")~+@21 DO ~SetGlobal("R#kityaAerieFlirt","GLOBAL",1)~ EXTERN AERIEJ AKitWantsToJoinFlirtChain
  +~Global("AerieRomanceActive","GLOBAL",2)
    IsValidForPartyDialogue("Aerie")~+@21 DO ~SetGlobal("R#kityaAerieExclusive","GLOBAL",1)~ EXTERN AERIEJ KitJoinedExclusive
  +~Global("JaheiraRomanceActive","GLOBAL",1)
    IsValidForPartyDialogue("Jaheira")~+@21 DO ~SetGlobal("R#kityaJahFlirt","GLOBAL",1)~ EXTERN JAHEIRAJ JKitWantsToJoinChain
  +~Global("JaheiraRomanceActive","GLOBAL",2)
    IsValidForPartyDialogue("Jaheira")~+@21 DO ~SetGlobal("R#kityaJahExclusive","GLOBAL",1)~ EXTERN JAHEIRAJ KitJoinedChain
  +~Global("ViconiaRomanceActive","GLOBAL",1)
    IsValidForPartyDialogue("Viconia")~+@21 DO ~SetGlobal("R#kityaVicFlirt","GLOBAL",1)~ EXTERN VICONIJ VKitWantsToJoinFlirt
  +~Global("ViconiaRomanceActive","GLOBAL",2)
    IsValidForPartyDialogue("Viconia")~+@21 DO ~SetGlobal("R#kityaVicExclusive","GLOBAL",1)~ EXTERN VICONIJ VKitWantsToJoinExclusive
END

IF ~~ THEN BEGIN 7 // from: 1.2
  SAY @25
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 8 // from: 6.0
  SAY @26
  IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN 9 // from: 6.2
  SAY @27
  IF ~IsValidForPartyDialogue("Aerie")
      !Global("AerieRomanceActive","GLOBAL",3) 
      !Global("AerieRomanceActive","GLOBAL",0)~ THEN DO ~SetGlobal("R#kityaAerieObjects","GLOBAL",1)~ EXTERN AERIEJ AerieObjectsChain
  IF ~IsValidForPartyDialogue("Jaheira")
      OR(2)
        Global("JaheiraRomanceActive","GLOBAL",1)
        Global("JaheiraRomanceActive","GLOBAL",2)~ THEN DO ~SetGlobal("R#kityaJahObjects","GLOBAL",1)~ EXTERN JAHEIRAJ JaheiraObjectsChain
  IF ~IsValidForPartyDialogue("Viconia")
      OR(2)
        Global("ViconiaRomanceActive","GLOBAL",1)
        Global("ViconiaRomanceActive","GLOBAL",2)~ THEN DO ~SetGlobal("R#kityaVicObjects","GLOBAL",1)~ EXTERN VICONIJ ViccyObjectsChain
  IF ~!Global("AerieRomanceActive","GLOBAL",1)
      !Global("AerieRomanceActive","GLOBAL",2)
      !Global("JaheiraRomanceActive","GLOBAL",1)
      !Global("JaheiraRomanceActive","GLOBAL",2)
      !Global("ViconiaRomanceActive","GLOBAL",1)
      !Global("ViconiaRomanceActive","GLOBAL",2)~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN 10 // from: 6.3
  SAY @28
  ++@29+11
END

IF ~~ THEN BEGIN 11 // from: 10.0
  SAY @30
  ++@31+12
  ++@32+13
END

IF ~~ THEN BEGIN 12 // from: 11.0
  SAY @33
  ++@34+PCFemaleFriends
  ++@35+KitCareful
  ++@36+PCImoenFeelings
END

IF ~~ THEN BEGIN 13 // from: 11.1
  SAY @37
  IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN 14 // from: 3.0
  SAY @38
  ++@39+15
  ++@40+22
  ++@41+KitHuntElf
END

IF ~~ THEN BEGIN 15 // from: 14.0
  SAY @42
  ++@43+16
  ++@44+21
  ++@45+PCScared
END

IF ~~ THEN BEGIN 16 // from: 15.0
  SAY @46
  ++@47+17
  ++@48+21
END

IF ~~ THEN BEGIN 17 // from: 16.0
  SAY @49
  ++@50+18
  ++@51+19
  ++@52+20
END

IF ~~ THEN BEGIN 18 // from: 17.0
  SAY @53
  ++@54+PCQuestions
  ++@55 EXIT
END

IF ~~ THEN BEGIN 19 // from: 17.1
  SAY @56
  ++@57 DO ~JoinParty()~ EXIT
  ++@58+25
END

IF ~~ THEN BEGIN 20 // from: 17.2
  SAY @59
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 21 // from: 15.1
  SAY @60
  IF ~~ THEN DO ~IncrementGlobal("KitLikes","GLOBAL",-5)~ EXIT
END

IF ~~ THEN BEGIN 22 // from: 14.1
  SAY @61
  ++@62+17
  ++@63+KitNobleFailed
END

IF ~~ THEN BEGIN 23 // from: 3.1
  SAY @64
  ++@65+PCGreed
END

IF ~~ THEN BEGIN 24 // from: 3.2
  SAY @66
  ++@67+JonCrimes
END

IF ~~ THEN BEGIN 25 // from: 6.1
  SAY @68
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN PCScared
  SAY @69
  ++@70+PCQuestions
  ++@71+PCQuestions
END

IF ~~ THEN BEGIN KitHuntElf
  SAY @72
  ++@73+JonCrimes
  ++@74+JonElf
  ++@75+PCQuestions
END

IF ~~ THEN BEGIN JonElf
  SAY @76
  ++@77+JonCrimes
  ++@78+JonRace
  ++@79+PCQuestions
END

IF ~~ THEN BEGIN JonRace
  SAY @80
  ++@81+JonCrimes
  ++@82+PCQuestions
END

IF ~~ THEN BEGIN PCFemaleFriends
  SAY @83
  ++@84+PCHero
  ++@85+WorkAndAssist
  ++@86+KitImpress
END

IF ~~ THEN BEGIN WorkAndAssist
  SAY @87
  ++@88 DO ~IncrementGlobal("KitLikes","GLOBAL",2)~ +PCQuestions
  ++@89 DO ~IncrementGlobal("KitLikes","GLOBAL",1)~ +PCQuestions
  ++@90 EXIT
END

IF ~~ THEN BEGIN KitImpress
  SAY @91
  ++ @92 + PCQuestions
  ++ @93 DO ~IncrementGlobal("KitLikes","GLOBAL",1)~ + PCQuestions
  ++ @94 DO ~IncrementGlobal("KitLikes","GLOBAL",-1)~ EXIT
  ++ @95 EXIT
END

IF ~~ THEN BEGIN PCHero
  SAY @96
  ++ @97 + KitBaron
  ++ @98 + KitPhilosophy
  ++ @99 + PCQuestions
  ++ @100 EXIT
END

IF ~~ THEN BEGIN KitBaron
  SAY @101
  ++ @102 + PCQuestions
  ++ @103 DO ~IncrementGlobal("KitLikes","GLOBAL",1)~ + PCQuestions
  ++ @104 + PCQuestions
  ++ @105 EXIT
END

IF ~~ THEN BEGIN KitPhilosophy
  SAY @106
  ++ @107 DO ~IncrementGlobal("KitLikes","GLOBAL",2)~ + PCQuestions
  ++ @108 EXIT
END

IF ~~ THEN BEGIN PCGreed // from: 23.1
  SAY @109
  ++ @110 + PCKitDeath
  + ~CheckStatGT(LastTalkedToBy(Myself),15,CHR)~ + @111 + PCKitCharm
  ++ @112 + FriendsBetrayal
  ++ @113 + FriendsPersuade
END

IF ~~ THEN BEGIN FriendsPersuade
  SAY @114
  ++ @115 + PCQuestions
  ++ @116 + PCQuestions
  ++ @117 + 21
  ++ @118 + 25
END 

IF ~~ THEN BEGIN FriendsBetrayal
  SAY @119
  ++ @120 + PCKitDeath
  + ~CheckStatGT(LastTalkedToBy(Myself),15,CHR)~ + @121 + PCKitCharm
  ++ @122 + PCQuestions
  ++ @123 DO ~IncrementGlobal("KitLikes","GLOBAL",-2)~ EXIT
  ++ @124 EXIT
END

IF ~~ THEN BEGIN PCKitDeath // from: PCGreed.1
  SAY @125
  IF ~~ THEN DO ~SetGlobal("KitMadMonster","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN PCKitCharm // from:  PCGreed.2
  SAY @126
  IF ~OR(2)
        IsValidForPartyDialogue("Nalia")
        IsGabber("Nalia")~ THEN DO ~SetGlobal("R#kityaNaliaPoor","GLOBAL",1)~ EXTERN NALIAJ NaliaKitPoorAChain
  + ~!IsValidForPartyDialogue("Nalia")
     !IsGabber("Nalia")~ + @127 + PCWealthQuestionable
  + ~!IsValidForPartyDialogue("Nalia")
     !IsGabber("Nalia")~ + @128 + PCNeedsStuff
  + ~!IsValidForPartyDialogue("Nalia")
     !IsGabber("Nalia")~ + @129 + PCKitReward
END

IF ~~ THEN BEGIN PCWealthQuestionable
  SAY @130
  ++ @131 + PCQuestions
  ++ @132 + PCQuestions
  ++ @133 EXIT
END

IF ~~ THEN BEGIN PCKitReward
  SAY @134
  ++ @135 + 21
  ++ @136 DO ~IncrementGlobal("KitLikes","GLOBAL",1)~ + PCQuestions
  ++ @137 + KitEnlightenment
END

IF ~~ THEN BEGIN PCNeedsStuff
  SAY @138
  ++ @139 + PCQuestions
  ++ @140 + 25
END

IF ~~ THEN BEGIN KitEnlightenment
  SAY @141
  ++ @142 + PCQuestions
  ++ @143 + PCStiff
  ++ @144 + 25
END

IF ~~ THEN BEGIN PCStiff
  SAY @145
  ++ @146 + PCQuestions
  ++ @147 + 25
END

IF ~~ THEN BEGIN PCAgrees
  SAY @148
  =
  @149
  ++ @150 + 14
  ++ @151 + KitSelf
  + ~!Global("AerieRomanceActive","GLOBAL",1)
     !Global("AerieRomanceActive","GLOBAL",2)
     !Global("JaheiraRomanceActive","GLOBAL",1)
     !Global("JaheiraRomanceActive","GLOBAL",2)
     !Global("ViconiaRomanceActive","GLOBAL",1)
     !Global("ViconiaRomanceActive","GLOBAL",2)~ + @152 + KitJoin
  + ~!Global("ViconiaRomanceActive","GLOBAL",1)
     !Global("JaheiraRomanceActive","GLOBAL",2)
     !Global("JaheiraRomanceActive","GLOBAL",1)
     !Global("ViconiaRomanceActive","GLOBAL",2)
     IsValidForPartyDialogue("Aerie")
     Global("AerieRomanceActive","GLOBAL",1)~ + @152 DO ~SetGlobal("R#kityaAerieFlirt2","GLOBAL",1)~ EXTERN AERIEJ KitJoinedFlirtChain
  + ~IsValidForPartyDialogue("Aerie")
     Global("AerieRomanceActive","GLOBAL",2)~ + @152 DO ~SetGlobal("R#kityaAerieExclusive","GLOBAL",1)~ EXTERN AERIEJ KitJoinedExclusive
  + ~!Global("ViconiaRomanceActive","GLOBAL",1)
     !Global("ViconiaRomanceActive","GLOBAL",2)
     IsValidForPartyDialogue("Jaheira")
     Global("JaheiraRomanceActive","GLOBAL",1)~ + @152 DO ~SetGlobal("R#kityaJahExclusive","GLOBAL",1)~ EXTERN JAHEIRAJ KitJoinedChain
  + ~IsValidForPartyDialogue("Jaheira")
     Global("JaheiraRomanceActive","GLOBAL",2)~ + @152 DO ~SetGlobal("R#kityaJahExclusive","GLOBAL",1)~ EXTERN JAHEIRAJ KitJoinedChain
  + ~IsValidForPartyDialogue("Viconia")
     Global("ViconiaRomanceActive","GLOBAL",1)~ + @152 DO ~SetGlobal("R#kityaVicFlirt2","GLOBAL",1)~ EXTERN VICONIJ KitJoinedFlirtChain
  + ~Global("ViconiaRomanceActive","GLOBAL",2)
     IsValidForPartyDialogue("Viconia")~ + @152 DO ~SetGlobal("R#kityaVicExclusive2","GLOBAL",1)~ EXTERN VICONIJ KitJoinedExclusiveChain
END

IF ~~ THEN BEGIN KitQuestion
  SAY @153
  ++ @154 + 10
  ++ @155 + 9
  + ~CheckStatLT(Player1, 12, WIS)~ + @156 + Wealth
  ++ @157 + PCNoGoal
END

IF ~~ THEN BEGIN Wealth
  SAY @158
  =
	@159
  ++ @160 DO ~JoinParty()~ EXIT
  ++ @161 + 25
END

IF ~~ THEN BEGIN PCNoGoal
  SAY @162
  =
	@163
  ++ @164 DO ~JoinParty()~ + JonDescribe
  + ~CheckStatGT(Player1,15,CHR)~ + @165 + KitComplimented
  + ~OR(2)
       CheckStatLT(Player1,15,CHR)
       CheckStat(Player1,15,CHR)~ + @165 + FailureKitComplimented
  ++ @166 + 25
END

IF ~~ THEN BEGIN KitComplimented
  SAY @167
  IF ~~ THEN GOTO JonDescribe
END

IF ~~ THEN BEGIN FailureKitComplimented
  SAY @168
  IF ~~ THEN GOTO JonDescribe
END

IF ~~ THEN BEGIN JonDescribe
  SAY @169
  ++ @170 + JonCrimes
  ++ @171 + JonVengeance
  ++ @172 EXIT
END

IF ~~ THEN BEGIN JonVengeance
  SAY @173 = @174
  ++@170+JonCrimes
  ++@175+PCQuestions
END

IF ~~ THEN BEGIN JonCrimes
  SAY @176
  =
	@177
  ++ @178 EXIT
  ++ @179 GOTO JonMoreInfo
  ++ @180 GOTO JonFound
END

IF ~~ THEN BEGIN JonMoreInfo
  SAY @181
  =
	@182
  =
	@183
  ++ @184 EXIT
  ++ @185 + JonFound
  ++ @186 EXIT
END

IF ~~ THEN BEGIN JonFound
  SAY @187
  ++ @188 EXIT
  ++ @189 EXIT
END

IF ~~ THEN BEGIN PCImoenFeelings
  SAY @190
  ++ @191 + ImoenFriend
  ++ @192 + ImoenNoLove
  ++ @193 + KitImoen
END

IF ~~ THEN BEGIN KitImoen
  SAY @194
  IF ~~ THEN GOTO ImoenFriend
END

IF ~~ THEN BEGIN ImoenNoLove
  SAY @195
  ++ @196 + KitImoenNose
  ++ @197 + PCQuestions
END

IF ~~ THEN BEGIN KitImoenNose
  SAY @198 = @199 = @200
  ++ @201 + KitAssumePCQ
  ++ @202 + KitImoenNoseNo
END

IF ~~ THEN BEGIN KitImoenNoseNo
  SAY @203
  IF ~~ THEN GOTO KitAssumePCQ
END

IF ~~ THEN BEGIN KitAssumePCQ
  SAY @204
  ++ @205 + PCQuestions
  ++ @206 + PCAdventurer
  ++ @207 EXIT
END

IF ~~ THEN BEGIN PCAdventurer
  SAY @208 = @209
  ++ @205 + PCQuestions
  ++ @207 EXIT
END

IF ~~ THEN BEGIN ImoenFriend
  SAY @210
  ++ @211 + PCSavesFriends
  ++ @212 + PCSavesFriends
  ++ @213 + PCEnemy
END

IF ~~ THEN BEGIN PCSavesFriends
  SAY @214
  ++ @215 + ImoenImportant
  ++ @216 EXIT
END

IF ~~ THEN BEGIN ImoenImportant
  SAY @217
  ++ @218 + 6
  ++ @219 + KitInvite
END

IF ~~ THEN BEGIN KitInvite
  SAY @220
  ++ @221 + 6
  ++ @222 + KitReconsider
  ++ @223 + 21
END

IF ~~ THEN BEGIN KitReconsider
  SAY @224
  ++ @225 + KitMenial
  ++ @226 + 6
  ++ @227 + 7
  ++ @228 + 25
END

IF ~~ THEN BEGIN KitMenial
  SAY @229
  ++ @230 + 6
  ++ @231 + FedEx
  ++ @232 + KitWorthless
END

IF ~~ THEN BEGIN KitWorthless
  SAY @233
  ++ @234 DO ~IncrementGlobal("KitLikes","GLOBAL",-1)~ + 6
  ++ @235 + 6
  ++ @236 + PCUnhelpful
END

IF ~~ THEN BEGIN FedEx
  SAY @237
  ++ @238 + 6
END

IF ~~ THEN BEGIN PCUnhelpful
  SAY @239
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN KitAttention
  SAY @240 = @241
  ++ @242 + NoTalk
  + ~IsValidForPartyDialogue("Jaheira")~ + @243 EXTERN JAHEIRAJ KitWho
  + ~IsValidForPartyDialogue("Aerie")
     !IsValidForPartyDialogue("Jaheira")~ + @243 EXTERN AERIEJ KitWho
  + ~!IsValidForPartyDialogue("Jaheira")
     !IsValidForPartyDialogue("Aerie")~ + @243 GOTO NoTalk
END

IF ~~ THEN BEGIN KitCorrect
  SAY @244
  ++ @245 + KitNymph
  ++ @246 + KitNotElf
END

IF ~~ THEN BEGIN NoTalk
  SAY @247
  ++ @242 + KitName
  ++ @243 + KitWhat
END

IF ~~ THEN BEGIN KitWhat
  SAY @248
  ++ @249 + KitNotElf
  ++ @250 + PCQuestions
  ++ @251 + 6
END

IF ~~ THEN BEGIN KitNotElf
  SAY @73
  + ~IsValidForPartyDialogue("Viconia")~ + @252 EXTERN VICONIJ KitSexy
  + ~!IsValidForPartyDialogue("Viconia")~ + @252 + 15
  ++ @253 + PCQuestions
  ++ @254 + KitFeatures
END

IF ~~ THEN BEGIN KitFeatures
  SAY @255
  ++ @256 + PCQuestions
  ++ @257 + PCQuestions
  ++ @258 EXIT
END

IF ~~ THEN BEGIN KitNymph
  SAY @259
  + ~IsValidForPartyDialogue("Jaheira")~ + @260 + JaheiraAfter
  ++ @261 + 6
  ++ @262 + NymphExplain
END

IF ~~ THEN BEGIN JaheiraAfter
 SAY @777
 ++ @778 + PCQuestions
 ++ @779 EXIT
END

IF ~~ THEN BEGIN NymphExplain
  SAY @263
  =
	@264
  ++ @265 + PCQuestions
  ++ @266 + PCQuestions
  ++ @267 EXIT
END

IF ~~ THEN BEGIN PCQuestions
  SAY @268
  ++ @269 + 6
  ++ @151 + KitSelf
  + ~!Global("AerieRomanceActive","GLOBAL",1)
     !Global("AerieRomanceActive","GLOBAL",2)
     !Global("JaheiraRomanceActive","GLOBAL",1)
     !Global("JaheiraRomanceActive","GLOBAL",2)
     !Global("ViconiaRomanceActive","GLOBAL",1)
     !Global("ViconiaRomanceActive","GLOBAL",2)~ + @152 + KitJoin
  + ~!Global("ViconiaRomanceActive","GLOBAL",1)
     !Global("JaheiraRomanceActive","GLOBAL",2)
     !Global("JaheiraRomanceActive","GLOBAL",1)
     !Global("ViconiaRomanceActive","GLOBAL",2)
     IsValidForPartyDialogue("Aerie")
     Global("AerieRomanceActive","GLOBAL",1)~ + @152 DO ~SetGlobal("R#kityaAerieFlirt2","GLOBAL",1)~ EXTERN AERIEJ KitJoinedFlirtChain
  + ~IsValidForPartyDialogue("Aerie")
     Global("AerieRomanceActive","GLOBAL",2)~ + @152 DO ~SetGlobal("R#kityaAerieExclusive","GLOBAL",1)~ EXTERN AERIEJ KitJoinedExclusive
  + ~!Global("ViconiaRomanceActive","GLOBAL",1)
     !Global("ViconiaRomanceActive","GLOBAL",2)
     IsValidForPartyDialogue("Jaheira")
     Global("JaheiraRomanceActive","GLOBAL",1)~ + @152 DO ~SetGlobal("R#kityaJahExclusive","GLOBAL",1)~ EXTERN JAHEIRAJ KitJoinedChain
  + ~IsValidForPartyDialogue("Jaheira")
     Global("JaheiraRomanceActive","GLOBAL",2)~ + @152 DO ~SetGlobal("R#kityaJahExclusive","GLOBAL",1)~ EXTERN JAHEIRAJ KitJoinedChain
  + ~IsValidForPartyDialogue("Viconia")
     Global("ViconiaRomanceActive","GLOBAL",1)~ + @152 DO ~SetGlobal("R#kityaVicFlirt2","GLOBAL",1)~ EXTERN VICONIJ KitJoinedFlirtChain
  + ~Global("ViconiaRomanceActive","GLOBAL",2)
     IsValidForPartyDialogue("Viconia")~ + @152 DO ~SetGlobal("R#kityaVicExclusive2","GLOBAL",1)~ EXTERN VICONIJ KitJoinedExclusiveChain
  + ~GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ + @270 + ImoenCowled
  + ~GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ + @271  + KitKnowsJon
END

IF ~~ THEN BEGIN ImoenCowled
  SAY @28
  ++ @272 + ImoenDismissal
  ++ @273 + ImoenSpellhold
  ++ @274 + PCQuestions
END

IF ~~ THEN BEGIN ImoenDismissal
  SAY @275
  IF ~~ THEN GOTO ImoenSpellhold
END

IF ~~ THEN BEGIN ImoenSpellhold
  SAY @276 = @277
  ++ @278 + PCQuestions
  ++ @279 + PCQuestions
  ++ @280+ KitSarcastic
  ++ @281 EXIT
END

IF ~~ THEN BEGIN KitSarcastic
  SAY @282
  IF ~~ THEN GOTO PCQuestions
END

IF ~~ THEN BEGIN KitKnowsJon
  SAY @283
  ++ @205 + PCAfterJon
  ++ @284 + JonReaction
  ++ @285 + JonReaction2
  ++ @286 + KitJon
END

IF ~~ THEN BEGIN KitJon
  SAY @287
  ++ @288 + 6
  ++ @289 + JonCrimes
END

IF ~~ THEN BEGIN JonReaction
  SAY @290
  IF ~~ THEN GOTO PCAfterJon
END

IF ~~ THEN BEGIN JonReaction2
  SAY @291
  IF ~~ THEN GOTO PCAfterJon
END  

IF ~~ THEN BEGIN PCAfterJon
  SAY @292
  ++ @293 + WizardSlayer
  ++ @294 + WizardSlayer
  + ~NumInParty(6)~ + @295 + 25
  ++ @296 + PCFocus
  ++ @297 + SnowInHell
END

IF ~~ THEN BEGIN SnowInHell
  SAY @298
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN WizardSlayer
  SAY @299 = @300
  + ~!Global("AerieRomanceActive","GLOBAL",1)
     !Global("AerieRomanceActive","GLOBAL",2)
     !Global("JaheiraRomanceActive","GLOBAL",1)
     !Global("JaheiraRomanceActive","GLOBAL",2)
     !Global("ViconiaRomanceActive","GLOBAL",1)
     !Global("ViconiaRomanceActive","GLOBAL",2)~ + @301 + 6
  + ~Global("AerieRomanceActive","GLOBAL",1)
     !Global("JaheiraRomanceActive","GLOBAL",1)
     !Global("JaheiraRomanceActive","GLOBAL",2)
     !Global("ViconiaRomanceActive","GLOBAL",1)
     !Global("ViconiaRomanceActive","GLOBAL",2)~ + @301 DO ~SetGlobal("R#kityaAerieFlirt","GLOBAL",1)~ EXTERN AERIEJ AKitWantsToJoinFlirtChain
  + ~Global("AerieRomanceActive","GLOBAL",2)
     !Global("JaheiraRomanceActive","GLOBAL",1)
     !Global("JaheiraRomanceActive","GLOBAL",2)
     !Global("ViconiaRomanceActive","GLOBAL",1)
     !Global("ViconiaRomanceActive","GLOBAL",2)~ + @301 DO ~SetGlobal("R#kityaAerieExclusive","GLOBAL",1)~ EXTERN AERIEJ KitJoinedExclusive
  + ~Global("JaheiraRomanceActive","GLOBAL",1)
     !Global("ViconiaRomanceActive","GLOBAL",1)
     !Global("ViconiaRomanceActive","GLOBAL",2)~ + @301 DO ~SetGlobal("R#kityaNaive","GLOBAL",1)~ EXTERN JAHEIRAJ PCNaive
  + ~Global("JaheiraRomanceActive","GLOBAL",2)
     !Global("ViconiaRomanceActive","GLOBAL",1)
     !Global("ViconiaRomanceActive","GLOBAL",2)~ + @301 DO ~SetGlobal("R#kityaJahExclusive2","GLOBAL",1)~ EXTERN JAHEIRAJ JKitWantsToJoinExclusive
  + ~Global("ViconiaRomanceActive","GLOBAL",1)~ + @301 DO ~SetGlobal("R#kityaVicFlirt","GLOBAL",2)~ EXTERN VICONIJ VKitWantsToJoinFlirt
  + ~Global("ViconiaRomanceActive","GLOBAL",2)~ + @301 DO ~SetGlobal("R#kityaVicExclusive","GLOBAL",1)~ EXTERN VICONIJ VKitWantsToJoinExclusive
END

IF ~~ THEN BEGIN KitJoin
  SAY @302
  IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN ThreeCompany
  SAY @303
  IF ~~ THEN DO ~IncrementGlobal("KitLikes","GLOBAL",-3)~ GOTO AllowKit
END

IF ~~ THEN BEGIN AllowKit
  SAY @304
  ++ @305 DO ~JoinParty()~ EXIT
  ++ @306 + 25
END

IF ~~ THEN BEGIN KitBeauty
  SAY @307
  ++ @308 + 17
  ++ @309 + 16
  ++ @310 + MoreInfo
END

IF ~~ THEN BEGIN MoreInfo
  SAY @311
  ++ @205 + PCQuestions
  ++ @312 + NoSay
  ++ @313 EXIT
END

IF ~~ THEN BEGIN NoSay
  SAY @314
  ++ @315 + 21
  ++ @316 + 6
  ++ @317 + 21
  ++ @318 + PCQuestions
  ++ @319 EXIT
END

IF ~~ THEN BEGIN KitNobleFailed
  SAY @320
  ++ @321 + NoNoble
  ++ @322 + 5
END

IF ~~ THEN BEGIN KitCareful
  SAY @323
  IF ~~ THEN GOTO PCImoenMeaning
END

IF ~~ THEN BEGIN PCImoenMeaning
  SAY @324
  ++ @325 DO ~IncrementGlobal("KitLikes","GLOBAL",1)~ + PCSavesFriends
  ++ @326 + PCEnemy
  ++ @327 + ImoenThief
END

IF ~~ THEN BEGIN ImoenThief
  SAY @328
  ++ @329 + PCStillRescue
  ++ @330 + PCEnemy
END

IF ~~ THEN BEGIN PCStillRescue
  SAY @331 = @332
  IF ~~ THEN DO ~IncrementGlobal("KitLikes","GLOBAL",-5)~ EXIT
END

IF ~~ THEN BEGIN PCEnemy
  SAY @333
  ++ @334 + KitKnowsJon
  ++ @335 + ImoenSpellhold
  ++ @336 + KitVillian
END

IF ~~ THEN BEGIN KitVillian
  SAY @337 = @338 = @339
  ++ @340  + KitJon
  ++ @341 + JonCrimes
  ++ @342 + KitSenseWrong
  ++ @343 + KitInsight
END

IF ~~ THEN BEGIN KitSenseWrong
  SAY @344
  ++ @345 + ImoenSpellhold
  ++ @346 + PCNoJon
  ++ @347 + PCYesJon
END

IF ~~ THEN BEGIN PCNoJon
  SAY @348
  ++ @349 + PCQuestions
  ++ @350 + PCQuestions
  ++ @351 + ImoenSpellhold
  ++ @352 EXIT
END

IF ~~ THEN BEGIN PCYesJon
  SAY @353
  IF ~~ THEN GOTO ImoenSpellhold
END

IF ~~ THEN BEGIN KitInsight
  SAY @354
  ++ @355 + PCQuestions
  ++ @356 + PCQuestions
  ++ @357 EXIT
END

IF ~~ THEN BEGIN NoNoble
  SAY @358
  IF ~~ THEN GOTO KitQuestion
END

IF ~~ THEN BEGIN PCFocus
  SAY @359
  ++ @360 + 15
  ++ @361 + 21
  ++ @362 + KitBeauty
  + ~!Global("AerieRomanceActive","GLOBAL",1)
     !Global("AerieRomanceActive","GLOBAL",2)
     !Global("JaheiraRomanceActive","GLOBAL",1)
     !Global("JaheiraRomanceActive","GLOBAL",2)
     !Global("ViconiaRomanceActive","GLOBAL",1)
     !Global("ViconiaRomanceActive","GLOBAL",2)~ + @363 + KitJoin
  + ~IsValidForPartyDialogue("Aerie")
     Global("AerieRomanceActive","GLOBAL",1)
     !Global("JaheiraRomanceActive","GLOBAL",1)
     !Global("JaheiraRomanceActive","GLOBAL",2)
     !Global("ViconiaRomanceActive","GLOBAL",1)
     !Global("ViconiaRomanceActive","GLOBAL",2)~ + @363 DO ~SetGlobal("R#kityaAerieFlirt2","GLOBAL",1)~ EXTERN AERIEJ KitJoinedFlirtChain
  + ~IsValidForPartyDialogue("Aerie")
     Global("AerieRomanceActive","GLOBAL",2)
     !Global("JaheiraRomanceActive","GLOBAL",1)
     !Global("JaheiraRomanceActive","GLOBAL",2)
     !Global("ViconiaRomanceActive","GLOBAL",1)
     !Global("ViconiaRomanceActive","GLOBAL",2)~ + @363 DO ~SetGlobal("R#kityaAerieExclusive","GLOBAL",1)~ EXTERN AERIEJ KitJoinedExclusive
  + ~IsValidForPartyDialogue("Jaheira")
     Global("JaheiraRomanceActive","GLOBAL",1)
     !Global("ViconiaRomanceActive","GLOBAL",1)
     !Global("ViconiaRomanceActive","GLOBAL",2)~ + @363 DO ~SetGlobal("R#kityaJahFlirt","GLOBAL",1)~ EXTERN JAHEIRAJ JKitWantsToJoinChain
  + ~IsValidForPartyDialogue("Jaheira")
     Global("JaheiraRomanceActive","GLOBAL",2)
     !Global("ViconiaRomanceActive","GLOBAL",1)
     !Global("ViconiaRomanceActive","GLOBAL",2)~ + @363 DO ~SetGlobal("R#kityaJahFlirt","GLOBAL",1)~ EXTERN JAHEIRAJ JKitWantsToJoinChain
  + ~IsValidForPartyDialogue("Viconia")
     Global("ViconiaRomanceActive","GLOBAL",1)~ + @363 DO ~SetGlobal("R#kityaVicFlirt2","GLOBAL",1)~ EXTERN VICONIJ KitJoinedFlirtChain
  + ~IsValidForPartyDialogue("Viconia")
     Global("ViconiaRomanceActive","GLOBAL",2)~ + @363 DO ~SetGlobal("R#kityaVicExclusive","GLOBAL",1)~ EXTERN VICONIJ VKitWantsToJoinExclusive
END

IF ~~ THEN BEGIN PCKitQuestion
  SAY @364
  ++ @365 + KitQuestion
  ++ @366 + 25
  ++ @367 DO ~IncrementGlobal("KitLikes","GLOBAL",1)~ + KitQuestion
END

IF ~~ THEN BEGIN KitSelf
  SAY @368
  ++ @369 DO ~IncrementGlobal("KitLikes","GLOBAL",1)~ + KitStory
  ++ @370 + PCQuestions
END

IF ~~ THEN BEGIN KitStory
  SAY @371 = @372 = @373 = @374 = @375 = @376
  ++ @377 + PCQuestions
  ++ @378 DO ~IncrementGlobal("KitLikes","GLOBAL",2)~ + 6
  ++ @379 + 25
END

IF ~~ THEN BEGIN KitName
  SAY @380
  ++ @381 + 6
  ++ @382 + 21
  ++ @383 + PCQuestions
  ++ @384 EXIT
END

IF ~~ THEN BEGIN KitPCEvil
 SAY @385
 ++@386 DO ~EscapeArea()~ EXIT
 ++@387+PCQuestions
 ++@388+25
END

IF ~~ THEN BEGIN PCLawlessness
 SAY @389 = @390
 ++@391 DO ~EscapeArea()~ EXIT
 ++@392+PCQuestions
END

// These are the dialogues that the PC will get whenever he/she returns to talk with Kitanya

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN PlayerReturns
 SAY @393
  +~ReputationGT(Player1,14)~+ @394 + ReturnJoin
  +~ReputationLT(Player1,15)~+ @394 + ReturnChallenge
  ++ @395 + ReturnQuestions
  ++ @396 EXIT
END

IF ~~ THEN BEGIN ReturnJoin
  SAY @397
  IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN ReturnChallenge
 SAY @398 = @399
 +~GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~+@400+ ReturnImmy
 +~GlobalGT("Chapter","GLOBAL",%bg2_chapter_4%)~+@401+ ReturnIrenicus1
 ++@402+ ReturnIrenicus1
 ++@403+ ReturnWealth
END

IF ~~ THEN BEGIN ReturnImmy
 SAY @404
 ++@405+ReturnImmyJoin
 ++@406+ReturnImmy2
END

IF ~~ THEN BEGIN ReturnImmy2
 SAY @407
 ++@408+ReturnImmyJoin
 ++@409+ReturnImmyJoin2
END

IF ~~ THEN BEGIN ReturnImmyJoin2
 SAY @410
 IF ~~ THEN GOTO ReturnImmyJoin
END

IF ~~ THEN BEGIN ReturnImmyJoin
 SAY @411
 +~!Global("AerieRomanceActive","GLOBAL",1)
   !Global("AerieRomanceActive","GLOBAL",2)
   !Global("JaheiraRomanceActive","GLOBAL",1)
   !Global("JaheiraRomanceActive","GLOBAL",2)
   !Global("ViconiaRomanceActive","GLOBAL",1)
   !Global("ViconiaRomanceActive","GLOBAL",2)~+@412 DO ~JoinParty()~ EXIT
 +~Global("AerieRomanceActive","GLOBAL",1)
   !Global("JaheiraRomanceActive","GLOBAL",1)
   !Global("JaheiraRomanceActive","GLOBAL",2)
   !Global("ViconiaRomanceActive","GLOBAL",1)
   !Global("ViconiaRomanceActive","GLOBAL",2)~+@412 DO ~SetGlobal("R#kityaAerieFlirt","GLOBAL",1)~ EXTERN AERIEJ AKitWantsToJoinFlirtChain
 +~Global("AerieRomanceActive","GLOBAL",2)
   !Global("JaheiraRomanceActive","GLOBAL",1)
   !Global("JaheiraRomanceActive","GLOBAL",2)
   !Global("ViconiaRomanceActive","GLOBAL",1)
   !Global("ViconiaRomanceActive","GLOBAL",2)~+@412 DO ~SetGlobal("R#kityaAerieObjects","GLOBAL",1)~ EXTERN AERIEJ AerieObjectsChain
 +~Global("JaheiraRomanceActive","GLOBAL",1)
   !Global("ViconiaRomanceActive","GLOBAL",1)
   !Global("ViconiaRomanceActive","GLOBAL",2)~+@412 DO ~SetGlobal("R#kityaJahFlirt","GLOBAL",1)~ EXTERN JAHEIRAJ JKitWantsToJoinChain
 +~Global("JaheiraRomanceActive","GLOBAL",2)
   !Global("ViconiaRomanceActive","GLOBAL",1)
   !Global("ViconiaRomanceActive","GLOBAL",2)~+@412 DO ~SetGlobal("R#kityaJahFlirt","GLOBAL",1)~ EXTERN JAHEIRAJ JKitWantsToJoinChain
 +~Global("ViconiaRomanceActive","GLOBAL",1)~+@412 DO ~SetGlobal("R#kityaVicFlirt","GLOBAL",1)~ EXTERN VICONIJ VKitWantsToJoinFlirt
 +~Global("ViconiaRomanceActive","GLOBAL",2)~+@412 DO ~SetGlobal("R#kityaVicExclusive","GLOBAL",1)~ EXTERN VICONIJ VKitWantsToJoinExclusive
 ++@413+ ReturnKitRefused
END

IF ~~ THEN BEGIN ReturnIrenicus1
 SAY @414 = @415
 IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN ReturnWealth
 SAY @416
 +~GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~+@417+ ReturnImmy
 +~GlobalGT("Chapter","GLOBAL",%bg2_chapter_4%)~+@418+ ReturnIrenicus1
 ++@402+ ReturnIrenicus1
 ++@419 EXIT
END

IF ~~ THEN BEGIN ReturnQuestions
 SAY @420
 +~GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~+@421+ ReturnQuestionsCowled
 ++@422+ ReturnQuestionsIrenicus
 +~GlobalGT("Chapter","GLOBAL",%bg2_chapter_5%)~+@423+ ReturnQuestionsSulda
 +~GlobalGT("Chapter","GLOBAL",%bg2_chapter_5%)~+@424+ ReturnQuestionsRhynn
END

IF ~~ THEN BEGIN ReturnQuestionsCowled
 SAY @276 = @277 = @425
 ++@426+ ReturnQuestions
 ++@427 EXIT
END

IF ~~ THEN BEGIN ReturnQuestionsIrenicus
 SAY @428
 ++@84+ ReturnKitJoins
 ++@429+ ReturnKitJoins
 ++@430+ ReturnQuestions
END

IF ~~ THEN BEGIN ReturnKitJoins
 SAY @431
 +~!Global("AerieRomanceActive","GLOBAL",1)
   !Global("AerieRomanceActive","GLOBAL",2)
   !Global("JaheiraRomanceActive","GLOBAL",1)
   !Global("JaheiraRomanceActive","GLOBAL",2)
   !Global("ViconiaRomanceActive","GLOBAL",1)
   !Global("ViconiaRomanceActive","GLOBAL",2)~+@412 DO ~JoinParty()~ EXIT
 +~Global("AerieRomanceActive","GLOBAL",1)
   !Global("JaheiraRomanceActive","GLOBAL",1)
   !Global("JaheiraRomanceActive","GLOBAL",2)
   !Global("ViconiaRomanceActive","GLOBAL",1)
   !Global("ViconiaRomanceActive","GLOBAL",2)~+@412 DO ~SetGlobal("R#kityaAerieFlirt","GLOBAL",1)~ EXTERN AERIEJ AKitWantsToJoinFlirtChain
 +~Global("AerieRomanceActive","GLOBAL",2)
   !Global("JaheiraRomanceActive","GLOBAL",1)
   !Global("JaheiraRomanceActive","GLOBAL",2)
   !Global("ViconiaRomanceActive","GLOBAL",1)
   !Global("ViconiaRomanceActive","GLOBAL",2)~+@412 DO ~SetGlobal("R#kityaAerieObjects","GLOBAL",1)~ EXTERN AERIEJ AerieObjectsChain
 +~Global("JaheiraRomanceActive","GLOBAL",1)
   !Global("ViconiaRomanceActive","GLOBAL",1)
   !Global("ViconiaRomanceActive","GLOBAL",2)~+@412 DO ~SetGlobal("R#kityaJahFlirt","GLOBAL",1)~ EXTERN JAHEIRAJ JKitWantsToJoinChain
 +~Global("JaheiraRomanceActive","GLOBAL",2)
   !Global("ViconiaRomanceActive","GLOBAL",1)
   !Global("ViconiaRomanceActive","GLOBAL",2)~+@412 DO ~SetGlobal("R#kityaJahFlirt","GLOBAL",1)~ EXTERN JAHEIRAJ JKitWantsToJoinChain
 +~Global("ViconiaRomanceActive","GLOBAL",1)~+@412 DO ~SetGlobal("R#kityaVicFlirt","GLOBAL",1)~ EXTERN VICONIJ VKitWantsToJoinFlirt
 +~Global("ViconiaRomanceActive","GLOBAL",2)~+@412 DO ~SetGlobal("R#kityaVicExclusive","GLOBAL",1)~ EXTERN VICONIJ VKitWantsToJoinExclusive
 ++@413+ ReturnKitRefused
 ++@432 DO ~IncrementGlobal("KitLikes","GLOBAL",-3)~+ ReturnKitRefused
END

IF ~~ THEN BEGIN ReturnKitRefused
 SAY @37
 IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ReturnQuestionsSulda
 SAY @433
 +~ReputationGT(Player1,14)~+@434+ ReturnJoin
 +~ReputationLT(Player1,15)~+@434+ ReturnChallenge
 ++@435+ ReturnSuldaLayout
 ++@436+ ReturnQuestions
END

IF ~~ THEN BEGIN ReturnSuldaLayout
 SAY @437 = @438
 +~ReputationGT(Player1,14)~+@434+ ReturnJoin
 +~ReputationLT(Player1,15)~+@434+ ReturnChallenge
 ++@439+ReturnQuestions
END

IF ~~ THEN BEGIN ReturnQuestionsRhynn
 SAY @440
 ++@441+ ReturnQuestions
 ++@442 EXIT
END

// Starting here are the dialogues that will fire if the protagonist is female.  These are
// similar to the male ones, but I assume that women aren't going to make passes at Kitanya.

IF ~!Gender(Player1,MALE) // Okay, technically the player could be a "Neither" and still get these dialogues.
    NumTimesTalkedTo(0)~ THEN BEGIN FMeetKit
 SAY @443 = @444
 ++@445+FKitHello
 ++@446 EXIT
END

IF ~~ THEN BEGIN FKitHello
 SAY @447
 ++@448+FKitWho
 ++@449+FKitNoName
 ++@450+FKitAdventurer
END

IF ~~ THEN BEGIN FKitWho
 SAY @451
 +~OR(2)
    IsValidForPartyDialogue("Jaheira")
    IsGabber("Jaheira")~+@452 EXTERN JAHEIRAJ FJKitWhat
 +~!IsValidForPartyDialogue("Jaheira")
   !IsGabber("Jaheira")
   Race(Player1,ELF)~+@452+FKitWhatElf
 +~!IsValidForPartyDialogue("Jaheira")
   !IsGabber("Jaheira")
   !Race(Player1,ELF)~+@452+FKitWhat
 ++@453+FKitQuestions
 ++@454 EXIT
END

IF ~~ THEN BEGIN FKitWhatElf
 SAY @455
 ++@456+FKitQuestions
 ++@457+FKitNoble
 ++@458 EXIT
END

IF ~~ THEN BEGIN FKitWhat
 SAY @459
 ++@456+FKitQuestions
 ++@460+FKitNoble
 ++@458 EXIT
END

IF ~~ THEN BEGIN FKitNoName
 SAY @461
 ++@462+FKitNameBetter
 ++@463 DO ~SetGlobal("PCNotRevealName","LOCALS",1)~+FKitQuestions
 ++@464 EXIT
END

IF ~~ THEN BEGIN FKitAdventurer
 SAY @465 = @466
 ++@467+FKitNameBetter
 ++@468+FKitQuestions
END

IF ~~ THEN BEGIN FKitNameBetter
 SAY @469
 ++@470+FKitQuestions
 ++@471 EXIT
END

IF ~~ THEN BEGIN FKitNoble
 SAY @472
 ++@473+FKitQuestions
 ++@474 EXIT
END

IF ~~ THEN BEGIN FKitQuestions
 SAY @475
 +~Global("PCNotRevealName","LOCALS",1)~+@269+FKitNameQuest
 +~Global("PCNotRevealName","LOCALS",0)~+@269+FKitQuest
 +~Global("PCNotRevealName","LOCALS",1)~+@476+FKitNameCowled
 +~Global("PCNotRevealName","LOCALS",0)~+@476+FKitCowled
 +~Global("PCNotRevealName","LOCALS",1)~+@477+FKitNameJoin
 +~Global("PCNotRevealName","LOCALS",0)
   ReputationLT(Player1,10)~+@477+FKitJoinNo
 +~Global("PCNotRevealName","LOCALS",0)
   ReputationGT(Player1,10)~+@477+FKitJoinYes
 ++@422+FKitIrenicus
 ++@478 EXIT
END

IF ~~ THEN BEGIN FKitNameQuest
 SAY @479
 ++@480+FKitJon
 +~!Class(Player1,MAGE_ALL)~+@481+FKitNameHelp
 ++@482 EXIT
END

IF ~~ THEN BEGIN FKitQuest
 SAY @483
 ++@480+FKitJon
 +~!Class(Player1,MAGE_ALL)~+@481+FKitHelp
 ++@482 EXIT
END

IF ~~ THEN BEGIN FKitJon
 SAY @484
 ++@485+FKitJonLeave
 ++@486+FKitJonMess
 ++@487+FKitQuestions
END

IF ~~ THEN BEGIN FKitJonLeave
 SAY @488
 +~Global("PCNotRevealName","LOCALS",1)~+@489+FKitNameJonCrimes
 +~Global("PCNotRevealName","LOCALS",0)~+@489+FKitJonCrimes
 ++@490+FKitQuestions
END

IF ~~ THEN BEGIN FKitJonMess
 SAY @491
 ++@492+FKitWizardslayer
 +~Global("PCNotRevealName","LOCALS",1)~+@493+FKitNameJoin
 +~Global("PCNotRevealName","LOCALS",0)
   ReputationGT(Player1,9)~+@493+FKitJoinYes
 +~Global("PCNotRevealName","LOCALS",0)
   ReputationLT(Player1,10)~+@493+FKitJoinNo
 ++@494+FKitJonCrimes
 ++@495+FKitQuestions
END

IF ~~ THEN BEGIN FKitWizardslayer
 SAY @496
 +~Global("PCNotRevealName","LOCALS",1)~+@493+FKitNameJoin
 +~Global("PCNotRevealName","LOCALS",0)
   ReputationGT(Player1,9)~+@493+FKitJoinYes
 +~Global("PCNotRevealName","LOCALS",0)
   ReputationLT(Player1,10)~+@493+FKitJoinNo
 ++@494+FKitJonCrimes
 ++@495+FKitQuestions
END

IF ~~ THEN BEGIN FKitNameJonCrimes
 SAY @497 = @498
 ++@499+FKitNameHelp
 ++@500+FKitQuestions
 ++@501+25
END

IF ~~ THEN BEGIN FKitJonCrimes
 SAY @502 = @498
 ++@499+FKitHelp
 ++@500+FKitQuestions
 ++@501+25
END

IF ~~ THEN BEGIN FKitNameHelp
 SAY @503
 ++@504+FKitHelp
 ++@505 EXIT
END

IF ~~ THEN BEGIN FKitNameJoin
 SAY @503
 ++@504+FKitHelp
 ++@505 EXIT
END

IF ~~ THEN BEGIN FKitHelp
 SAY @506 = @153
 ++@507+FKitJoinYes
 ++@508+FKitJoinYes
 ++@509+FKitJoinNo
END

IF ~~ THEN BEGIN FKitJoinYes
 SAY @510
 IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN FKitJoinNo
 SAY @511 = @512
 IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN FKitNameCowled
 SAY @513
 ++@514+FKitFacility
 ++@515+FKitQuestions
 ++@516 EXIT
END

IF ~~ THEN BEGIN FKitCowled
 SAY @517
 ++@514+FKitFacility
 ++@515+FKitQuestions
 ++@516 EXIT
END

IF ~~ THEN BEGIN FKitFacility
 SAY @518 = @519
 ++@520+FKitQuestions
 ++@521 EXIT
END

IF ~~ THEN BEGIN FKitIrenicus
 SAY @522
 ++@288+FKitQuest
 ++@523+FKitQuest
END

APPEND ~AERIEJ~
  IF ~Global("R#kityaAerieExclusive","GLOBAL",1)~ THEN BEGIN KitJoinedExclusive
  SAY @524
  ++ @525 DO ~SetGlobal("R#kityaAerieExclusive","GLOBAL",2)~+ KitJoinedAerieHappy
  ++ @526 DO ~SetGlobal("R#kityaAerieExclusive","GLOBAL",2)~+ KitJoinedAerieJoke
  ++ @527 DO ~SetGlobal("R#kityaAerieExclusive","GLOBAL",2)~+ KitJoinedSerious
  ++ @528 DO ~SetGlobal("R#kityaAerieExclusive","GLOBAL",2)~ EXTERN R#kitya AeriePCHeartlessChain
  END

  IF ~~ THEN BEGIN KitJoinedAerieHappy
  SAY @529
  ++ @530 + KitJoinedAerieOnly
  ++ @531 + KitJoinedAerieBeautiful
  ++ @532 + KitJoinedAerieOnly2
  END

  IF ~~ THEN BEGIN KitJoinedAerieOnly
  SAY @533
  IF ~~ THEN DO ~ActionOverride("Kitanya",JoinParty())~ EXIT
  END

  IF ~~ THEN BEGIN KitJoinedAerieBeautiful
  SAY @534
  IF ~~ THEN DO ~ActionOverride("Kitanya",JoinParty())~ EXIT
  END

  IF ~~ THEN BEGIN KitJoinedAerieOnly2
  SAY @535
  ++ @536 DO ~ActionOverride("Kitanya",JoinParty())~ EXIT
  END

  IF ~~ THEN BEGIN KitJoinedAerieJoke
  SAY @537
  ++ @538 + KitJoinedAerieOnly
  ++ @539 + KitJoinedAerieKnows
  ++ @540 + KitJoinedAerieKnows
  END

  IF ~~ THEN BEGIN KitJoinedAerieKnows
  SAY @541
  IF ~~ THEN DO ~ActionOverride("Kitanya",JoinParty())~ EXIT
  END

  IF ~~ THEN BEGIN KitJoinedSerious
  SAY @542
  ++ @543 DO ~ActionOverride("Kitanya",JoinParty())~ EXIT
  ++ @544 DO ~ActionOverride("Kitanya",JoinParty())~ EXIT
  ++ @545 DO ~SetGlobal("AerieRomanceActive","GLOBAL",3)~ DO ~ActionOverride("Kitanya",JoinParty())~ EXIT
  END

  IF ~~ THEN BEGIN KitWho
  SAY @546
  IF ~~ THEN EXTERN R#kitya KitCorrect
  END
END // of APPEND

APPEND ~JAHEIRAJ~
  IF ~~ THEN BEGIN KitWho
  SAY @547
  IF ~~ THEN EXTERN R#kitya KitCorrect
  END

  IF ~Global("R#kityaJahExclusive2","GLOBAL",1)~ THEN BEGIN JKitWantsToJoinExclusive
  SAY @548
  ++ @549 + KitNoAffection
  ++ @550 + PCLikesKit
  ++ @551 + JaheiraInsane
  ++ @552 + JaheiraJealous
  END

  IF ~~ THEN BEGIN JaheiraJealous
  SAY @553
  ++ @554 + JaheiraComfort
  ++ @555 + JaheiraNotJealous
  END

  IF ~~ THEN BEGIN JaheiraComfort
  SAY @556
  ++ @557 + JaheiraOnly
  ++ @558 + KitUseful
  ++ @559 + JaheiraKiss
  END

  IF ~~ THEN BEGIN JaheiraOnly
  SAY @560
  ++ @561 DO ~ActionOverride("Kitanya",JoinParty())~ EXTERN R#kitya KitJoin
  ++ @562 EXTERN R#kitya 25
  ++ @563 EXTERN R#kitya SnowInHell
  END

  IF ~~ THEN BEGIN KitUseful
  SAY @564
  ++ @565 DO ~ActionOverride("Kitanya",JoinParty())~ EXTERN R#kitya KitJoin
  ++ @566 EXTERN R#kitya 25
  END

  IF ~~ THEN BEGIN JaheiraKiss
  SAY @567
  =
	@568
  ++ @565 DO ~ActionOverride("Kitanya",JoinParty())~ EXTERN R#kitya KitJoin
  ++ @566 EXTERN R#kitya 25
  END

  IF ~~ THEN BEGIN JaheiraNotJealous
  SAY @569
  ++ @37 EXIT
  ++ @570 DO ~ActionOverride("Kitanya",JoinParty())~ EXTERN R#kitya KitJoin
  END

  IF ~~ THEN BEGIN JaheiraInsane
  SAY @571
  ++ @572 + PCNaive
  ++ @573 EXTERN R#kitya JaheiraJealous
  ++ @574 EXTERN R#kitya PCAttractiveChain
  ++ @575 + PCLikesKit
  END

  IF ~~ THEN BEGIN PCLikesKit
  SAY @576
  ++ @577 DO ~SetGlobal("JaheiraRomanceActive","GLOBAL",3) ActionOverride("Kitanya",JoinParty())~ EXTERN R#kitya KitJoin
  ++ @578 + JaheiraMiserable
  ++ @579 DO ~LeaveParty()
                                               EscapeArea()
                                               ActionOverride("Kitanya",EscapeArea())~ EXIT
  END

  IF ~~ THEN BEGIN JaheiraMiserable
  SAY @580
  IF ~~ THEN EXIT
  END

  IF ~~ THEN BEGIN KitNoAffection
  SAY @581
  ++ @582 + JaheiraComfort
  ++ @583 + PCEasy
  END

  IF ~~ THEN BEGIN PCEasy
  SAY @584
  ++ @585 DO ~SetGlobal("JaheiraRomanceActive","GLOBAL",3) ActionOverride("Kitanya",JoinParty())~ EXTERN R#kitya KitJoin
  ++ @586 EXIT
  ++ @587 DO ~SetGlobal("JaheiraRomanceActive","GLOBAL",3)
                                                                  LeaveParty()
                                                                  ActionOverride("Kitanya",JoinParty())~ EXTERN R#kitya KitJoin
  END
END // of APPEND

APPEND ~VICONIJ~
  IF ~Global("R#kityaVicExclusive","GLOBAL",1)~ THEN BEGIN VKitWantsToJoinExclusive
  SAY @588
  ++ @589 DO ~SetGlobal("R#kityaVicExclusive","GLOBAL",2)~+ ThreeCompany
  ++ @590 DO ~SetGlobal("R#kityaVicExclusive","GLOBAL",2)~+ KitNoInterest
  ++ @591 DO ~ActionOverride("Kitanya",JoinParty()) SetGlobal("R#kityaVicExclusive","GLOBAL",2)~ EXIT
  END

  IF ~~ THEN BEGIN ThreeCompany
  SAY @592
  IF ~~ THEN EXTERN R#kitya ThreeCompany
  END

  IF ~~ THEN BEGIN KitNoInterest
  SAY @593
  ++ @594 + WhatGirl
  ++ @206 + VicRight
  ++ @595 + VicJealous
  END

  IF ~~ THEN BEGIN VicRight
  SAY @596
  ++ @597 DO ~ActionOverride("Kitanya",JoinParty())~ EXTERN R#kitya KitJoin
  ++ @598 EXTERN R#kitya 7
  END

  IF ~~ THEN BEGIN WhatGirl
  SAY @599
  ++ @600 + VKidding
  ++ @601 + VicOnly
  ++ @602 + VicNoKnow
  END

  IF ~~ THEN BEGIN VKidding
  SAY @603
  ++ @604 + LoveDrow
  ++ @605 + Tamoko
  ++ @601 + VicOnly
  END

  IF ~~ THEN BEGIN LoveDrow
  SAY @606
  ++ @607 DO ~ActionOverride("Kitanya",JoinParty())~ EXTERN R#kitya KitJoin
  ++ @608 EXTERN R#kitya 25
  END

  IF ~~ THEN BEGIN Tamoko
  SAY @609
  ++ @610 + WhatGirl
  ++ @611 + PCStupid
  END

  IF ~~ THEN BEGIN PCStupid
  SAY @612
  ++ @613 DO ~ActionOverride("Kitanya",JoinParty())~ EXTERN R#kitya KitJoin
  ++ @614 EXTERN R#kitya 25
  ++ @615 EXTERN R#kitya SnowInHell
  END

  IF ~~ THEN BEGIN VicOnly
  SAY @616
  IF ~~ THEN EXTERN R#kitya AllowKit
  END

  IF ~~ THEN BEGIN VicNoKnow
  SAY @617
  IF ~~ THEN EXTERN R#kitya AllowKit
  END

  IF ~~ THEN BEGIN VicJealous
  SAY @618
  ++ @619 + PCExplain
  ++ @620 + PCExplain
  ++ @621 + PCExplain
  ++ @622 DO ~ActionOverride("Kitanya",JoinParty())~ EXIT
  END  

  IF ~~ THEN BEGIN PCExplain
  SAY @623
  ++ @613 DO ~ActionOverride("Kitanya",JoinParty())~ EXTERN R#kitya KitJoin
  ++ @614 EXTERN R#kitya 25
  ++ @615 EXTERN R#kitya SnowInHell
  END
END // of APPEND

CHAIN R#kitya JaheiraJealous
  @624
  == JAHEIRAJ @625
  == R#kitya @626
  == JAHEIRAJ @627
  == R#kitya @628
  == JAHEIRAJ @629
  == R#kitya @630
END
++@631 EXIT
++@632 DO ~JoinParty()~ + KitJoin
++@633 + SnowInHell
 
CHAIN
  IF ~~ THEN AERIEJ KitWantsToJoinExclusiveChain @634
  DO ~SetGlobal("KitWants","LOCALS",1)~
  == R#kitya @635
  == AERIEJ @636
  == R#kitya @637
  == AERIEJ @638
END
++ @561 DO ~ActionOverride("Kitanya",JoinParty())~ EXTERN R#kitya KitJoin
++ @639 DO ~ActionOverride("Kitanya",JoinParty())~ EXTERN R#kitya KitJoin
++ @640 EXTERN R#kitya SnowInHell
++ @641 EXTERN R#kitya 25

CHAIN
  IF ~Global("R#kityaAerieFlirt2","GLOBAL",1)~ THEN AERIEJ KitJoinedFlirtChain @642
  DO ~SetGlobal("R#kityaAerieFlirt2","GLOBAL",2)~
  == R#kitya @643
  == AERIEJ @644
  == R#kitya @645 = @646
  == AERIEJ @647
  == R#kitya @648 = @649
  == AERIEJ @650
  == R#kitya @651 = @652
END
++ @653 EXTERN R#kitya KitQuestion
++ @654 EXTERN R#kitya SnowInHell
++ @655 EXTERN R#kitya PCKitQuestion


CHAIN
  IF ~Global("R#kityaAerieFlirt","GLOBAL",1)~ THEN AERIEJ AKitWantsToJoinFlirtChain @656
  DO ~SetGlobal("R#kityaAerieFlirt","GLOBAL",2)~
  == R#kitya @657
  == AERIEJ @658
  == R#kitya @659
  == AERIEJ @660
  == R#kitya IF ~CheckStatGT(Player1, 14, CHR)~ THEN @661
  == R#kitya IF ~CheckStatLT(Player1, 15, CHR)~ THEN @662
  == AERIEJ @663
  == R#kitya @664
END
++ @665 DO ~JoinParty()~ EXTERN R#kitya KitJoin
++ @666 EXTERN R#kitya SnowInHell 
++ @301 EXTERN R#kitya 6

CHAIN
  IF ~Global("R#kityaNaliaPoor","GLOBAL",1)~ THEN NALIAJ NaliaKitPoorAChain @667
  DO ~SetGlobal("R#kityaNaliaPoor","GLOBAL",2)~
  == R#kitya @668
  == NALIAJ @669
  == R#kitya @670
  == NALIAJ @671
  == R#kitya @672
END
+ ~Race(Player1, HUMAN)~+ @673 EXTERN R#kitya KitPCEvil
++ @674 EXTERN R#kitya PCAgrees
++ @675 EXTERN R#kitya PCLawlessness

CHAIN R#kitya AeriePCHeartlessChain @676
  == AERIEJ @677
  == R#kitya @678
EXIT

CHAIN IF ~Global("R#kityaNaive","GLOBAL",1)~ THEN JAHEIRAJ PCNaive @679
 DO ~SetGlobal("R#kityaNaive","GLOBAL",2)~
  == R#kitya @680
  == JAHEIRAJ @681
  == R#kitya @682
  == JAHEIRAJ @683
  == R#kitya IF ~CheckStatGT(Player1, 14, CHR)~ THEN @684
  == R#kitya IF ~CheckStatLT(Player1, 15, CHR)~ THEN @685
  == JAHEIRAJ @686
END
++ @687 DO ~ActionOverride("Kitanya",JoinParty())~ EXTERN R#kitya KitJoin
++ @688 EXTERN R#kitya 25

CHAIN
  IF ~Global("R#kityaJahFlirt","GLOBAL",1)~ THEN JAHEIRAJ JKitWantsToJoinChain @689
  DO ~SetGlobal("R#kityaJahFlirt","GLOBAL",2)~
  == R#kitya @690
  == JAHEIRAJ @691
  == R#kitya @692
  == JAHEIRAJ @693
  == R#kitya @694
  == JAHEIRAJ @695
  == R#kitya @696
END
++ @697 DO ~JoinParty()~ EXTERN R#kitya KitJoin
++ @698 EXTERN R#kitya 25
++ @699 DO ~IncrementGlobal("KitLikes","GLOBAL",-1) EscapeArea()~ EXIT

CHAIN R#kitya PCAttractiveChain @700
  == JAHEIRAJ @701
  == R#kitya @702
  = @703
  == JAHEIRAJ @704
END
++ @705 DO ~ActionOverride("Kitanya",JoinParty())~ EXTERN R#kitya KitJoin
++ @706 EXTERN R#kitya 25
++ @707 DO ~ActionOverride("Kitanya",JoinParty())~ EXIT

CHAIN IF ~Global("R#kityaVicFlirt","GLOBAL",1)~ THEN VICONIJ VKitWantsToJoinFlirt @708
 DO ~SetGlobal("R#kityaVicFlirt","GLOBAL",2)~
  == R#kitya @709
  == VICONIJ @710
  == R#kitya @711
  == VICONIJ @712
  == R#kitya @713
  == VICONIJ @714
  == R#kitya @715 = @716
END
++ @717 DO ~JoinParty()~ EXTERN R#kitya KitJoin
++ @718 EXTERN R#kitya 25
++ @719 EXTERN R#kitya SnowInHell

CHAIN VICONIJ KitSexy @720
  == R#kitya @721
END
 ++ @780 EXIT
 ++ @781 EXTERN R#kitya PCQuestions
 ++ @782 EXIT

CHAIN IF ~Global("R#kityaJahExclusive","GLOBAL",1)~ THEN JAHEIRAJ KitJoinedChain @722
 DO ~SetGlobal("R#kityaJahExclusive","GLOBAL",2)~
  == R#kitya @723
  == JAHEIRAJ @724
  == R#kitya @725
  == JAHEIRAJ @726
  == R#kitya @727
  == JAHEIRAJ @728
  == R#kitya @729
  == JAHEIRAJ @730
  == R#kitya @731 = @732
END
++ @653 EXTERN R#kitya KitQuestion
++ @654 EXTERN R#kitya 25
++ @655 EXTERN R#kitya PCKitQuestion

CHAIN IF ~Global("R#kityaVicFlirt2","GLOBAL",1)~ THEN VICONIJ KitJoinedFlirtChain @733 = @734
 DO ~SetGlobal("R#kityaVicFlirt2","GLOBAL",2)~
  == R#kitya @735
  == VICONIJ @736
  == R#kitya @737
  == VICONIJ @738
  == R#kitya @739
END
++ @653 EXTERN R#kitya KitQuestion
++ @654 EXTERN R#kitya 25
++ @655 EXTERN R#kitya PCKitQuestion

CHAIN IF ~Global("R#kityaVicExclusive2","GLOBAL",1)~ THEN VICONIJ KitJoinedExclusiveChain @740
 DO ~SetGlobal("R#kityaVicExclusive2","GLOBAL",2)~
  == R#kitya @741
  == VICONIJ @742
  == R#kitya @743 = @744
  == VICONIJ @745
  == R#kitya @746
END
++ @653 EXTERN R#kitya KitQuestion
++ @654 EXTERN R#kitya 25
++ @655 EXTERN R#kitya PCKitQuestion

CHAIN IF ~Global("R#kityaAerieObjects","GLOBAL",1)~ THEN AERIEJ AerieObjectsChain @747
 DO ~SetGlobal("R#kityaAerieObjects","GLOBAL",2)~
  == R#kitya @748
  == AERIEJ IF ~Global("AerieRomanceActive","GLOBAL",1)~ THEN @749
  == AERIEJ IF ~Global("AerieRomanceActive","GLOBAL",2)~ THEN @750
  == R#kitya @751 = @752
END
++ @753 DO ~JoinParty()~ EXIT
++ @754 EXTERN R#kitya 10
++ @755 EXTERN R#kitya 25

CHAIN IF ~Global("R#kityaJahObjects","GLOBAL",1)~ THEN JAHEIRAJ JaheiraObjectsChain @756
 DO ~SetGlobal("R#kityaJahObjects","GLOBAL",2)~
  == R#kitya @757
  == JAHEIRAJ @758
  == R#kitya @759
  == JAHEIRAJ @760
  == R#kitya @761
END
++ @762 DO ~JoinParty()~ EXIT
++ @754 EXTERN R#kitya 10
++ @763 EXTERN R#kitya 25

CHAIN IF ~Global("R#kityaVicObjects","GLOBAL",1)~ THEN VICONIJ ViccyObjectsChain @764
 DO ~SetGlobal("R#kityaVicObjects","GLOBAL",2)~
  == R#kitya @765
  == VICONIJ @766
  == R#kitya @767
END
++ @768 DO ~JoinParty()~ EXIT
++ @754 EXTERN R#kitya 10
++ @763 EXTERN R#kitya 25

CHAIN JAHEIRAJ FJKitWhat @769
  == R#kitya @770
  == JAHEIRAJ @771
  == R#kitya @772
  == JAHEIRAJ @773
  == R#kitya @774
END
++@775 EXTERN R#kitya FKitQuestions
++@776 EXIT
