BEGIN ~GWARD0M~ 2

IF ~global("CernikPozwolenie","GLOBAL",0) !InPartySlot(LastTalkedToBy,0)~ THEN BEGIN Nic
SAY ~Witaj. Magazynier jest bezpieczny pod nasz¹ ochron¹.~
IF ~~ THEN EXIT
END

IF ~true()~ THEN BEGIN Rozkazy
SAY ~DOstaliœmy rozkaz ochrony tego Goblina i wype³nimy go!~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Koniec
SAY ~Tak jest!~
IF ~~ THEN EXIT
END