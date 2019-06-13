BEGIN ~GWARD08~ 2

IF ~global("CernikPozwolenie","GLOBAL",0) !InPartySlot(LastTalkedToBy,0)~ THEN BEGIN Nic
SAY ~Przykro mi, ale mogê przyjmowaæ rozkazy tylko od naszego przywódcy.~
IF ~~ THEN EXIT
END

IF ~true()~ THEN BEGIN Rozkazy
SAY ~Rozkazy?~
IF ~~ THEN REPLY ~Wracajcie do warowni.~ DO ~incrementglobal("DarniseRezerwy","GLOBAL",1) setglobal("DinaraKatapultS","GLOBAL",0) SetGlobal("DinaraKatapultSTu","GLOBAL",0)  setglobal("KatapultySON","GLOBAL",0)~ GOTO ~Koniec~
IF ~global("KatapultySON","GLOBAL",0)~ THEN REPLY ~Otworzyæ ogieñ!~ DO ~setglobal("KatapultySON","GLOBAL",1)~ GOTO Koniec
IF ~global("KatapultySON","GLOBAL",1)~ THEN REPLY ~Wstrzymaæ ogieñ!~ DO ~setglobal("KatapultySON","GLOBAL",0)~ GOTO Koniec
IF ~global("DinaraKatapultN","GLOBAL",1)~ THEN REPLY ~Niech obs³uga katapult na wschodniej wie¿y wraca do warownii.~ DO ~incrementglobal("DarniseRezerwy","GLOBAL",1) setglobal("DinaraKatapultN","GLOBAL",0) SetGlobal("DinaraKatapultNTu","GLOBAL",0) setglobal("KatapultyNON","GLOBAL",0)~ GOTO ~Koniec~
IF ~global("DinaraKatapultN","GLOBAL",1) global("KatapultyNON","GLOBAL",0)~ THEN REPLY ~Niech katapulty na wschodniej wie¿y rozpoczn¹ ostrza³.~ DO ~setglobal("KatapultyNON","GLOBAL",1)~ GOTO Koniec
IF ~global("DinaraKatapultN","GLOBAL",1) global("KatapultyNON","GLOBAL",1)~ THEN REPLY ~Niech katapulty na wschodniej wie¿y wstrzymaj¹ ostrza³.~ DO ~setglobal("KatapultyNON","GLOBAL",0)~ GOTO Koniec
IF ~global("DinaraMost","GLOBAL",1)~ THEN REPLY ~Niech oddzia³ broni¹cy podejœcia do mostu wycofa siê do warownii.~ DO ~incrementglobal("DarniseRezerwy","GLOBAL",1) setglobal("DinaraMost","GLOBAL",0) SetGlobal("DinaraMostTu","GLOBAL",0)~ GOTO ~Koniec~
IF ~global("DinaraPlac","GLOBAL",1)~ THEN REPLY ~Niech oddzia³ broni¹cy dziedziñca wycofa siê do warownii.~ DO ~incrementglobal("DarniseRezerwy","GLOBAL",1) setglobal("DinaraPlac","GLOBAL",0) SetGlobal("DinaraPlacTu","GLOBAL",0)~ GOTO ~Koniec~
IF ~OpenState("Bridge01",TRUE)~ THEN REPLY ~Podnieœæ most!~ DO ~CloseDoor("Bridge01")~ GOTO ~Koniec~
IF ~!OpenState("Bridge01",TRUE) !Global("KeepPlot","GLOBAL",11)~ THEN REPLY ~Opuœciæ most!~ DO ~OpenDoor("Bridge01")~ GOTO ~Koniec~
IF ~~ THEN REPLY ~Trzymajcie pozycjê.~ GOTO ~Koniec~
END

IF ~~ THEN BEGIN Koniec
SAY ~Tak jest!~
IF ~~ THEN EXIT
END