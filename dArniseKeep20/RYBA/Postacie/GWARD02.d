BEGIN ~GWARD02~ 2

IF ~global("CernikPozwolenie","GLOBAL",0) !InPartySlot(LastTalkedToBy,0)~ THEN BEGIN Nic
SAY ~Przykro mi, ale mogê przyjmowaæ rozkazy tylko od naszego przywódcy.~
IF ~~ THEN EXIT
END

IF ~true()~ THEN BEGIN Rozkazy
SAY ~Rozkazy?~
IF ~~ THEN REPLY ~Wracajcie do warowni.~ DO ~incrementglobal("DarniseRezerwy","GLOBAL",1) setglobal("MarkerUnicestwienia","GLOBAL",1)~ GOTO ~Koniec~
IF ~~ THEN REPLY ~Pod¹¿ajcie za mn¹.~ GOTO ~Koniec~
END

IF ~~ THEN BEGIN Koniec
SAY ~Tak jest!~
IF ~~ THEN EXIT
END