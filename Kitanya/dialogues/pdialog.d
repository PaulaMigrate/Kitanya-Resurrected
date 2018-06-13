// Using Weights is not the best way to make a dialogue file.

BEGIN ~R#kityP~

IF ~True()~ THEN BEGIN KitKicked
 SAY @2
 ++@3 DO ~SetGlobal("KickedOut","LOCALS",1)~+WhereTo
 ++@4 DO ~JoinParty()~+StayInGroup
END

IF ~~ THEN BEGIN WhereTo
 SAY @5
 ++@6 DO ~EscapeAreaMove("AR0406",1200,1350,0)~ EXIT
END

// If you kick her while in romance, It will terminate.

IF WEIGHT #1 ~Global("KitanyaRomanceActive","GLOBAL",2)~ THEN BEGIN KickedInRomance
 SAY @7 = @8
 ++@9 DO ~SetGlobal("KitanyaRomanceActive","GLOBAL",3) SetGlobal("KickedOut","LOCALS",1)~+WhereTo
 ++@10 DO ~JoinParty()~+StayInGroup
END

IF WEIGHT #2 ~Global("KitanyaRomanceActive","GLOBAL",1)~ THEN BEGIN KickedInFlirts
 SAY @11
 ++@12 DO ~SetGlobal("KitanyaRomanceActive","GLOBAL",3) SetGlobal("KickedOut","LOCALS",1)~+WhereTo
 ++@13+StayInGroup
END

// After reviving her from Bodhi's vampirism
IF WEIGHT #0 ~Global("KitVampire","GLOBAL",5)~ THEN BEGIN KitRevived
 SAY @14
 ++@15 DO ~EraseJournalEntry(@0)
EraseJournalEntry(@1)
EraseJournalEntry(32084)
EraseJournalEntry(32085)
EraseJournalEntry(16351)
EraseJournalEntry(7002)
EraseJournalEntry(3716)
EraseJournalEntry(5814)
EraseJournalEntry(16331)
EraseJournalEntry(15710)
EraseJournalEntry(6589)
EraseJournalEntry(11864)
EraseJournalEntry(3374)
EraseJournalEntry(3377)
EraseJournalEntry(3927)
SetGlobal("KitVampire","GLOBAL",6)
JoinParty()~ SOLVED_JOURNAL @16 EXIT
 ++@17 DO ~EraseJournalEntry(@0)
EraseJournalEntry(@1)
EraseJournalEntry(32084)
EraseJournalEntry(32085)
EraseJournalEntry(16351)
EraseJournalEntry(7002)
EraseJournalEntry(3716)
EraseJournalEntry(5814)
EraseJournalEntry(16331)
EraseJournalEntry(15710)
EraseJournalEntry(6589)
EraseJournalEntry(11864)
EraseJournalEntry(3374)
EraseJournalEntry(3377)
EraseJournalEntry(3927)
SetGlobal("KitVampire","GLOBAL",6)~ SOLVED_JOURNAL @16+ KitVampLeave
 ++@18 DO ~EraseJournalEntry(@0)
EraseJournalEntry(@1)
EraseJournalEntry(32084)
EraseJournalEntry(32085)
EraseJournalEntry(16351)
EraseJournalEntry(7002)
EraseJournalEntry(3716)
EraseJournalEntry(5814)
EraseJournalEntry(16331)
EraseJournalEntry(15710)
EraseJournalEntry(6589)
EraseJournalEntry(11864)
EraseJournalEntry(3374)
EraseJournalEntry(3377)
EraseJournalEntry(3927)
SetGlobal("KitVampire","GLOBAL",6)
JoinParty()~ SOLVED_JOURNAL @16+ KitVampRoom
END

IF ~~ THEN BEGIN KitVampLeave
 SAY @19 = @20
 ++@21 DO ~JoinParty()~+StayInGroup
 ++@22 DO ~SetGlobal("KickedOut","LOCALS",1) SetGlobal("KitanyaRomanceActive","GLOBAL",3)~+WhereTo
END

IF ~~ THEN BEGIN KitVampRoom
 SAY @23
 ++@24 DO ~JoinParty()~+StayInGroup
 ++@25 DO ~EscapeArea() DestroySelf()~ EXIT
END

IF ~~ THEN BEGIN StayInGroup
 SAY @26
 IF ~~ THEN EXIT
END

IF ~Global("KickedOut","LOCALS",1)~ THEN BEGIN PCReturns
 SAY @27 = @28
 ++@29+NeedHelp
 ++@30+PCQuestions
 ++@31 EXIT
END 

IF ~~ THEN BEGIN PCQuestions
 SAY @32
 +~GlobalGT("KitLikes","GLOBAL",-1)~+@33+KitRejoins
 +~GlobalLT("KitLikes","GLOBAL",0)~+@33+NoRejoin
 ++@34+KitCopperBored
 +~GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~+@35+KitCowled
 ++@36 EXIT
END

IF ~~ THEN BEGIN KitRejoins
 SAY @37
 IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN NoRejoin
 SAY @38 = @39
 IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KitCopperBored
 SAY @40
 ++@41+PCQuestions
 ++@42 EXIT
END

IF ~~ THEN BEGIN KitCowled
 SAY @43
 ++@44+PCQuestions
 ++@45 EXIT
END

IF ~~ THEN BEGIN NeedHelp
 SAY @46
 +~GlobalGT("KitLikes","GLOBAL",-1)~+@47+KitRejoins
 +~GlobalLT("KitLikes","GLOBAL",0)~+@47+NoRejoin
 ++@48+PCQuestions
 ++@49 EXIT
END
