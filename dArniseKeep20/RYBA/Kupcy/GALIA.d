BEGIN ~GALIA~ 2

IF ~true()~ THEN BEGIN Start
SAY ~Dzien dobry. Hanadluj� drogimi kamieniami i bu�uteri�.~
IF ~~ THEN REPLY ~Pokaz sw�j towar.~ DO ~StartStore("GALIA",LastTalkedToBy(Myself))~ EXIT
IF ~~ THEN REPLY ~Narazie dziekuj�.~ EXIT
END
