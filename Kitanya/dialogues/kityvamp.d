// This file includes my attempt to cater to the fans of Solaufein, but also includes the Bioware-style code if you chose not to.
// All dialogue for vampire Solaufein is straight out of Weimer's code.  I have changed nothing, and it's only here so that this is still compatible.

BEGIN R#KITVMP

IF ~~ THEN BEGIN PowerExplain
 SAY @12
 IF ~~ THEN EXTERN C6BODHI 28
END

EXTEND_BOTTOM C6BODHI 23
  IF ~Global("KitVampire","GLOBAL",2)~ THEN REPLY @0 GOTO KitThreatenChain
  IF ~Global("KitVampire","GLOBAL",2)~ THEN REPLY @1 GOTO KitThreatenChain
END

CHAIN C6BODHI KitThreatenChain @2 = @3
  == R#KITVMP @4
  == C6BODHI @5
END
++@6+ThreatenedByPC
++@7+ThreatenedByPC

APPEND C6BODHI
 IF ~~ THEN BEGIN ThreatenedByPC
  SAY @8 = @9 = @10
  IF ~~ THEN UNSOLVED_JOURNAL @11 EXTERN R#KITVMP PowerExplain
 END

 IF WEIGHT #-999 ~Global("SolaVampire","GLOBAL",2)~ THEN BEGIN SolaKitTalk 
  SAY @13 
  COPY_TRANS C6BODHI 0
 END

 IF ~~ THEN BEGIN KitSolaHand
  SAY @14
  IF ~OR(2)
       IsValidForPartyDialogue("Valygar")
       IsGabber("Valygar")~ THEN EXTERN VALYGARJ ValygarHates
  IF ~!IsValidForPartyDialogue("Valygar")
      !IsGabber("Valygar")~ THEN GOTO KitSolaMoon
 END

 IF ~~ THEN BEGIN KitSolaHush
  SAY @15
  COPY_TRANS C6BODHI 23
 END
END // APPEND

EXTEND_BOTTOM C6BODHI 23
  IF ~Global("SolaVampire","GLOBAL",2) Global("KitVampire","GLOBAL",2)~ THEN REPLY @16 GOTO KitSolaHand
  IF ~Global("SolaVampire","GLOBAL",2) Global("KitVampire","GLOBAL",2)~ THEN REPLY @17  GOTO KitSolaHand
END

APPEND VALYGARJ
 IF ~~ THEN BEGIN ValygarHates
  SAY @18 = @19
  IF ~~ THEN EXTERN C6BODHI KitSolaMoon
 END
END // APPEND

CHAIN C6BODHI KitSolaMoon
  @20
  == SOLAVAMP @21 = @22 = @23 = @24 = @25
END
++@26 EXTERN SOLAVAMP KitSolaWhat
++@27 EXTERN SOLAVAMP KitSolaShadow

APPEND SOLAVAMP
 IF ~~ THEN BEGIN KitSolaWhat
  SAY @28 = @29 = @30 = @31 = @32 = @33 = @34 = @35
  IF ~~ THEN EXTERN ~C6BODHI~ KitSolaHush
 END

 IF ~~ THEN BEGIN KitSolaShadow
  SAY @36
  IF ~~ THEN GOTO KitSolaDream
 END

 IF ~~ THEN BEGIN KitSolaDream
  SAY @37=@38=@39=@40=@41=@42=@43
  IF ~~ THEN EXTERN C6BODHI KitSolaHush
 END 
END
