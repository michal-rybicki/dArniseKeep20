BEGIN ~EMIL~ 2

IF ~!global("EmilGra","GLOBAL",3)~ THEN BEGIN Gadanie
SAY ~Ech. Znowu mam z kimœ walczyæ? Ech.~
   IF ~~ THEN REPLY ~Tak, ze mn¹.~ GOTO Zgoda
   IF ~~ THEN REPLY ~Mo¿emy tu tylko sobie posiedzieæ.~ GOTO Nic
   IF ~~ THEN REPLY ~A co mielibyœmy robiæ?~ GOTO Gra
END

IF ~global("EmilGra","GLOBAL",3)~ THEN BEGIN Gadanie
SAY ~Pogramy w coœ jeszce?~
   IF ~~ THEN REPLY ~Nie. Bêdziemy teraz walczyæ.~ GOTO Zgoda
   IF ~~ THEN REPLY ~Mo¿emy tu tylko sobie posiedzieæ.~ GOTO Nic
   IF ~~ THEN REPLY ~W co chcesz zagraæ?~ GOTO Gra
END

IF ~~ THEN BEGIN Zgoda
SAY ~Ech. Jak chesz, ale to nudne jest. Ech. Teraz bêdê wydawaæ groŸne dŸwiêki i próbowa³ ciê zabiæ. Aaaaagrh.~
IF ~~ THEN DO ~setglobal("EmilGra","GLOBAL",0) Enemy()~ EXIT
END

IF ~~ THEN BEGIN Nic
SAY ~Dobrze. Jak ci siê znudzi, to pchnij pierwsz¹ tablicê. Tylko uwa¿aj. Z moich obliczeñ na podstawie badañ statystycznych, które prowadzê dzieki uprzejmoœci kolejnych w³adców tej warownii, wynika, ¿e masz 20% szans ¿e siê zatnie.~
IF ~~ THEN EXIT
END
   
IF ~~ THEN BEGIN Gra
SAY ~Mo¿e szachy?~
IF ~~ THEN REPLY ~Dobrze.~ GOTO Szachy
IF ~~ THEN REPLY ~Mo¿e coœ l¿ejszego, na przyk³ad warcaby?~ GOTO Warcaby
IF ~~ THEN REPLY ~Lepiej powalczmy.~ GOTO Zgoda
IF ~~ THEN REPLY ~Mo¿e lepiej tylko tu posiedzimy.~ GOTO Nic
END

IF ~~ THEN BEGIN Szachy
SAY ~Bia³e czy czarne?~
IF ~~ THEN REPLY ~Bia³e.~ DO ~setglobal("EmilGra","GLOBAL",1)~EXIT
IF ~~ THEN REPLY ~Czarne.~ DO ~setglobal("EmilGra","GLOBAL",1)~EXIT
END

IF ~~ THEN BEGIN Warcaby
SAY ~Mo¿e byæ. Bia³e czy czarne?~
IF ~~ THEN REPLY ~Bia³e.~ DO ~setglobal("EmilGra","GLOBAL",2)~EXIT
IF ~~ THEN REPLY ~Czarne.~ DO ~setglobal("EmilGra","GLOBAL",2)~EXIT
END