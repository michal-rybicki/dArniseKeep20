BEGIN ~GERALD~ 2

IF ~true()~ THEN BEGIN Start
SAY ~Witam! Nie kr�pujcie si� handlowa� z moimi kupcami. Ja sam sprzedaje szaty dla mag�w.~
IF ~~ THEN REPLY ~Poka� sw�j towar.~ DO ~StartStore("GERALD",LastTalkedToBy(Myself))~ EXIT
IF ~~ THEN REPLY ~Poogl�dam towary innych kupc�w.~ EXIT
END
