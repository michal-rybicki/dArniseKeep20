BEGIN ~GALIA~ 2

IF ~true()~ THEN BEGIN Start
SAY ~Dzien dobry. Hanadlujê drogimi kamieniami i bu¿uteri¹.~
IF ~~ THEN REPLY ~Pokaz swój towar.~ DO ~StartStore("GALIA",LastTalkedToBy(Myself))~ EXIT
IF ~~ THEN REPLY ~Narazie dziekujê.~ EXIT
END
