BEGIN ~OBSERVER~ 2

IF ~global("ObserverKoniec","GLOBAL",0)~ THEN BEGIN Gadanie
SAY ~A wiêc chcesz sprawdziæ swoj¹ odpornoœæ?~
   IF ~~ THEN REPLY ~Jakto odpornoœæ?~ GOTO Wytlumaczenie
   IF ~~ THEN REPLY ~Tak, zaczynajmy.~ GOTO Test
   IF ~~ THEN REPLY ~Chcê tylko powalczyæ.~ GOTO Atak
   IF ~~ THEN REPLY ~Nie. Testujê tylko czy komnata przyzywa w³aœciwe potwory. ¯egnaj.~ EXIT
END

IF ~global("ObserverKoniec","GLOBAL",1)~ THEN BEGIN Koniec
SAY ~Podoba³o siê? Kontynuujemy testy?.~
   IF ~~ THEN REPLY ~Tak, kontynuujmy.~ DO ~setglobal("ObserverKoniec","GLOBAL",0)~ GOTO Test
   IF ~~ THEN REPLY ~Chce zapytaæ o coœ innego.~ DO ~setglobal("ObserverKoniec","GLOBAL",0)~ GOTO Gadanie1
   IF ~~ THEN REPLY ~Moze innym razem. ¯egnaj.~ DO ~setglobal("ObserverKoniec","GLOBAL",0)~ EXIT
END

IF ~~ THEN BEGIN Gadanie1
SAY ~Co chesz wiedzieæ?~
   IF ~~ THEN REPLY ~Jak dzia³a ten twój test na odpornoœæ?~ GOTO Wytlumaczenie
   IF ~~ THEN REPLY ~Zaczynajmy testy.~ GOTO Test
   IF ~~ THEN REPLY ~Chcê tylko powalczyæ.~ GOTO Atak
   IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Wytlumaczenie
SAY ~Zadam ci obra¿enia wybranego przez ciebie typu, a ty os¹dzisz czy twoja ochrona przed obra¿eniami tego typu jest wystarcz¹jaca.~
   IF ~~ THEN REPLY ~Dobrze, zadaj mi wiêc obra¿enia.~ GOTO Test
   IF ~~ THEN REPLY ~Chcê zapytaæ o coœ innego.~ GOTO Gadanie1
   IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Test
SAY ~Wybierz typ obra¿eñ.~
   IF ~~ THEN REPLY ~Ogieñ.~ GOTO A1
   IF ~~ THEN REPLY ~Zimno.~ GOTO A2
   IF ~~ THEN REPLY ~Kwas.~ GOTO A3
   IF ~~ THEN REPLY ~Elektrycznoœæ.~ GOTO A4
   IF ~~ THEN REPLY ~Trucizna.~ GOTO A5
   IF ~~ THEN REPLY ~Obra¿enia mia¿dz¹ce.~ GOTO A6
   IF ~~ THEN REPLY ~Obra¿enia k³ute.~ GOTO A7
   IF ~~ THEN REPLY ~Obra¿enia sieczne.~ GOTO A8
   IF ~~ THEN REPLY ~Obra¿enia od pocisków.~ GOTO A9
   IF ~~ THEN REPLY ~Magia.~ GOTO A10
   IF ~~ THEN REPLY ~Magiczny ogieñ.~ GOTO A11
   IF ~~ THEN REPLY ~Magiczne zimno.~ GOTO A12
   IF ~~ THEN REPLY ~Og³uszaj¹ce.~ GOTO A13
   IF ~~ THEN REPLY ~Chcê zapytaæ o coœ innego.~ GOTO Gadanie1
   IF ~~ THEN REPLY ~To ju¿ koniec testów. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Atak
SAY ~Dobrze. Dam ci piêæ sekund i stanê siê wrogi. Potem bêdziemy sie próbowali nawzajem pozabijaæ.~
   IF ~~ THEN DO ~SetGlobal("ObserverWalczy","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN A1
SAY ~Przygotuj siê!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,FIRE)~ EXIT
END

IF ~~ THEN BEGIN A2
SAY ~Przygotuj siê!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,COLD)~ EXIT
END

IF ~~ THEN BEGIN A3
SAY ~Przygotuj siê!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,ACID)~ EXIT
END

IF ~~ THEN BEGIN A4
SAY ~Przygotuj siê!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,ELECTRICITY)~ EXIT
END

IF ~~ THEN BEGIN A5
SAY ~Przygotuj siê!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,POISON)~ EXIT
END

IF ~~ THEN BEGIN A6
SAY ~Przygotuj siê!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,CRUSHING)~ EXIT
END

IF ~~ THEN BEGIN A7
SAY ~Przygotuj siê!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,PIERCING)~ EXIT
END

IF ~~ THEN BEGIN A8
SAY ~Przygotuj siê!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,SLASHING)~ EXIT
END

IF ~~ THEN BEGIN A9
SAY ~Przygotuj siê!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,MISSILE)~ EXIT
END

IF ~~ THEN BEGIN A10
SAY ~Przygotuj siê!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,MAGIC)~ EXIT
END

IF ~~ THEN BEGIN A11
SAY ~Przygotuj siê!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,MAGICFIRE)~ EXIT
END

IF ~~ THEN BEGIN A12
SAY ~Przygotuj siê!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,MAGICCOLD)~ EXIT
END

IF ~~ THEN BEGIN A13
SAY ~Przygotuj siê!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,STUNNING)~ EXIT
END