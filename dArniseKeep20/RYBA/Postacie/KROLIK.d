BEGIN ~KROLIK~ 2

IF ~true()~ THEN BEGIN Konsola
SAY ~Co kr�lik mo�e dla ciebie zrobi�?~
IF ~~ THEN REPLY ~CernikWiad:=1~ DO ~setglobal("CernikWiad","GLOBAL",1)~ EXIT
IF ~~ THEN REPLY ~CernikWiad:=2~ DO ~setglobal("CernikWiad","GLOBAL",2)~ EXIT
IF ~~ THEN REPLY ~CernikWiad:=3~ DO ~setglobal("CernikWiad","GLOBAL",3)~ EXIT
IF ~~ THEN REPLY ~GoblinIDiamenty:=GoblinIDiamenty+30~ DO ~IncrementGlobal("GoblinIDiamenty","GLOBAL",30)~ EXIT
IF ~~ THEN REPLY ~GarlanOverride:=1~ DO ~setglobal("GarlanOverride","GLOBAL",1)~ EXIT
IF ~~ THEN REPLY ~Sko�czmy t� demonstracj�.~ DO ~DemoEnd()~ EXIT
IF ~~ THEN REPLY ~Tylko ci� odwiedzam dobry kr�liku.~ EXIT
END 