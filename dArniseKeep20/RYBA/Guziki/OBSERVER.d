BEGIN ~OBSERVER~ 2

IF ~global("ObserverKoniec","GLOBAL",0)~ THEN BEGIN Gadanie
SAY ~A wi�c chcesz sprawdzi� swoj� odporno��?~
   IF ~~ THEN REPLY ~Jakto odporno��?~ GOTO Wytlumaczenie
   IF ~~ THEN REPLY ~Tak, zaczynajmy.~ GOTO Test
   IF ~~ THEN REPLY ~Chc� tylko powalczy�.~ GOTO Atak
   IF ~~ THEN REPLY ~Nie. Testuj� tylko czy komnata przyzywa w�a�ciwe potwory. �egnaj.~ EXIT
END

IF ~global("ObserverKoniec","GLOBAL",1)~ THEN BEGIN Koniec
SAY ~Podoba�o si�? Kontynuujemy testy?.~
   IF ~~ THEN REPLY ~Tak, kontynuujmy.~ DO ~setglobal("ObserverKoniec","GLOBAL",0)~ GOTO Test
   IF ~~ THEN REPLY ~Chce zapyta� o co� innego.~ DO ~setglobal("ObserverKoniec","GLOBAL",0)~ GOTO Gadanie1
   IF ~~ THEN REPLY ~Moze innym razem. �egnaj.~ DO ~setglobal("ObserverKoniec","GLOBAL",0)~ EXIT
END

IF ~~ THEN BEGIN Gadanie1
SAY ~Co chesz wiedzie�?~
   IF ~~ THEN REPLY ~Jak dzia�a ten tw�j test na odporno��?~ GOTO Wytlumaczenie
   IF ~~ THEN REPLY ~Zaczynajmy testy.~ GOTO Test
   IF ~~ THEN REPLY ~Chc� tylko powalczy�.~ GOTO Atak
   IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Wytlumaczenie
SAY ~Zadam ci obra�enia wybranego przez ciebie typu, a ty os�dzisz czy twoja ochrona przed obra�eniami tego typu jest wystarcz�jaca.~
   IF ~~ THEN REPLY ~Dobrze, zadaj mi wi�c obra�enia.~ GOTO Test
   IF ~~ THEN REPLY ~Chc� zapyta� o co� innego.~ GOTO Gadanie1
   IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Test
SAY ~Wybierz typ obra�e�.~
   IF ~~ THEN REPLY ~Ogie�.~ GOTO A1
   IF ~~ THEN REPLY ~Zimno.~ GOTO A2
   IF ~~ THEN REPLY ~Kwas.~ GOTO A3
   IF ~~ THEN REPLY ~Elektryczno��.~ GOTO A4
   IF ~~ THEN REPLY ~Trucizna.~ GOTO A5
   IF ~~ THEN REPLY ~Obra�enia mia�dz�ce.~ GOTO A6
   IF ~~ THEN REPLY ~Obra�enia k�ute.~ GOTO A7
   IF ~~ THEN REPLY ~Obra�enia sieczne.~ GOTO A8
   IF ~~ THEN REPLY ~Obra�enia od pocisk�w.~ GOTO A9
   IF ~~ THEN REPLY ~Magia.~ GOTO A10
   IF ~~ THEN REPLY ~Magiczny ogie�.~ GOTO A11
   IF ~~ THEN REPLY ~Magiczne zimno.~ GOTO A12
   IF ~~ THEN REPLY ~Og�uszaj�ce.~ GOTO A13
   IF ~~ THEN REPLY ~Chc� zapyta� o co� innego.~ GOTO Gadanie1
   IF ~~ THEN REPLY ~To ju� koniec test�w. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Atak
SAY ~Dobrze. Dam ci pi�� sekund i stan� si� wrogi. Potem b�dziemy sie pr�bowali nawzajem pozabija�.~
   IF ~~ THEN DO ~SetGlobal("ObserverWalczy","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN A1
SAY ~Przygotuj si�!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,FIRE)~ EXIT
END

IF ~~ THEN BEGIN A2
SAY ~Przygotuj si�!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,COLD)~ EXIT
END

IF ~~ THEN BEGIN A3
SAY ~Przygotuj si�!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,ACID)~ EXIT
END

IF ~~ THEN BEGIN A4
SAY ~Przygotuj si�!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,ELECTRICITY)~ EXIT
END

IF ~~ THEN BEGIN A5
SAY ~Przygotuj si�!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,POISON)~ EXIT
END

IF ~~ THEN BEGIN A6
SAY ~Przygotuj si�!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,CRUSHING)~ EXIT
END

IF ~~ THEN BEGIN A7
SAY ~Przygotuj si�!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,PIERCING)~ EXIT
END

IF ~~ THEN BEGIN A8
SAY ~Przygotuj si�!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,SLASHING)~ EXIT
END

IF ~~ THEN BEGIN A9
SAY ~Przygotuj si�!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,MISSILE)~ EXIT
END

IF ~~ THEN BEGIN A10
SAY ~Przygotuj si�!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,MAGIC)~ EXIT
END

IF ~~ THEN BEGIN A11
SAY ~Przygotuj si�!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,MAGICFIRE)~ EXIT
END

IF ~~ THEN BEGIN A12
SAY ~Przygotuj si�!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,MAGICCOLD)~ EXIT
END

IF ~~ THEN BEGIN A13
SAY ~Przygotuj si�!~
   IF ~~ THEN DO ~setglobal("ObserverKoniec","GLOBAL",1) applydamage(LastTalkedToBy,50,STUNNING)~ EXIT
END