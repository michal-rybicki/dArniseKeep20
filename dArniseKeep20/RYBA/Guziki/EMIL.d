BEGIN ~EMIL~ 2

IF ~!global("EmilGra","GLOBAL",3)~ THEN BEGIN Gadanie
SAY ~Ech. Znowu mam z kim� walczy�? Ech.~
   IF ~~ THEN REPLY ~Tak, ze mn�.~ GOTO Zgoda
   IF ~~ THEN REPLY ~Mo�emy tu tylko sobie posiedzie�.~ GOTO Nic
   IF ~~ THEN REPLY ~A co mieliby�my robi�?~ GOTO Gra
END

IF ~global("EmilGra","GLOBAL",3)~ THEN BEGIN Gadanie
SAY ~Pogramy w co� jeszce?~
   IF ~~ THEN REPLY ~Nie. B�dziemy teraz walczy�.~ GOTO Zgoda
   IF ~~ THEN REPLY ~Mo�emy tu tylko sobie posiedzie�.~ GOTO Nic
   IF ~~ THEN REPLY ~W co chcesz zagra�?~ GOTO Gra
END

IF ~~ THEN BEGIN Zgoda
SAY ~Ech. Jak chesz, ale to nudne jest. Ech. Teraz b�d� wydawa� gro�ne d�wi�ki i pr�bowa� ci� zabi�. Aaaaagrh.~
IF ~~ THEN DO ~setglobal("EmilGra","GLOBAL",0) Enemy()~ EXIT
END

IF ~~ THEN BEGIN Nic
SAY ~Dobrze. Jak ci si� znudzi, to pchnij pierwsz� tablic�. Tylko uwa�aj. Z moich oblicze� na podstawie bada� statystycznych, kt�re prowadz� dzieki uprzejmo�ci kolejnych w�adc�w tej warownii, wynika, �e masz 20% szans �e si� zatnie.~
IF ~~ THEN EXIT
END
   
IF ~~ THEN BEGIN Gra
SAY ~Mo�e szachy?~
IF ~~ THEN REPLY ~Dobrze.~ GOTO Szachy
IF ~~ THEN REPLY ~Mo�e co� l�ejszego, na przyk�ad warcaby?~ GOTO Warcaby
IF ~~ THEN REPLY ~Lepiej powalczmy.~ GOTO Zgoda
IF ~~ THEN REPLY ~Mo�e lepiej tylko tu posiedzimy.~ GOTO Nic
END

IF ~~ THEN BEGIN Szachy
SAY ~Bia�e czy czarne?~
IF ~~ THEN REPLY ~Bia�e.~ DO ~setglobal("EmilGra","GLOBAL",1)~EXIT
IF ~~ THEN REPLY ~Czarne.~ DO ~setglobal("EmilGra","GLOBAL",1)~EXIT
END

IF ~~ THEN BEGIN Warcaby
SAY ~Mo�e by�. Bia�e czy czarne?~
IF ~~ THEN REPLY ~Bia�e.~ DO ~setglobal("EmilGra","GLOBAL",2)~EXIT
IF ~~ THEN REPLY ~Czarne.~ DO ~setglobal("EmilGra","GLOBAL",2)~EXIT
END