BEGIN ~GERALD~ 2

IF ~true()~ THEN BEGIN Start
SAY ~Witam! Nie krêpujcie siê handlowaæ z moimi kupcami. Ja sam sprzedaje szaty dla magów.~
IF ~~ THEN REPLY ~Poka¿ swój towar.~ DO ~StartStore("GERALD",LastTalkedToBy(Myself))~ EXIT
IF ~~ THEN REPLY ~Poogl¹dam towary innych kupców.~ EXIT
END
