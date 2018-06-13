BEGIN ~R#KITELE~

IF WEIGHT #1 ~NumTimesTalkedTo(0)
              OR(2)
		!InParty("R#Kitanya")
		!IsValidForPartyDialogue("R#Kitanya")~ THEN BEGIN PlayerFight
  SAY @0 = @1
  IF ~~ THEN DO ~Enemy()~ EXIT
END

CHAIN
  IF WEIGHT #0 ~IsValidForPartyDialogue("R#Kitanya")
                Global("TalkedToKit","LOCALS",0)~ THEN R#KITELE KitanyaStartChain @2
  DO ~SetGlobal("TalkedToKit","LOCALS",1)~
  == R#KITYJ @3
  == R#KITELE @4 = @5
  == R#KITYJ @6
  == R#KITELE @7
  == R#KITYJ @8
  == R#KITELE @9
  == R#KITYJ @10 = @11 = @12
  == R#KITELE @13
  == R#KITYJ @14
  DO ~ActionOverride("R#Elethial",Enemy())~
EXIT
