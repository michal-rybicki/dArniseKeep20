BEGIN ~KROLIK~ 2

IF ~true()~ THEN BEGIN Konsola
SAY ~Co królik mo¿e dla ciebie zrobiæ?~
IF ~~ THEN REPLY ~CernikWiad:=1~ DO ~setglobal("CernikWiad","GLOBAL",1)~ EXIT
IF ~~ THEN REPLY ~CernikWiad:=2~ DO ~setglobal("CernikWiad","GLOBAL",2)~ EXIT
IF ~~ THEN REPLY ~CernikWiad:=3~ DO ~setglobal("CernikWiad","GLOBAL",3)~ EXIT
IF ~~ THEN REPLY ~GoblinIDiamenty:=GoblinIDiamenty+30~ DO ~IncrementGlobal("GoblinIDiamenty","GLOBAL",30)~ EXIT
IF ~~ THEN REPLY ~GarlanOverride:=1~ DO ~setglobal("GarlanOverride","GLOBAL",1)~ EXIT
IF ~~ THEN REPLY ~Skoñczmy t¹ demonstracjê.~ DO ~DemoEnd()~ EXIT
IF ~~ THEN REPLY ~Tylko ciê odwiedzam dobry króliku.~ EXIT
END 