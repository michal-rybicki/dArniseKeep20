BEGIN ~CALIA~ 2

IF ~!InPartySlot(LastTalkedToBy,0) global("GoblinSojusz","GLOBAL",0)~ THEN BEGIN Gada
SAY ~Witaj. Mi�o ci� pozna�.~
IF ~~ THEN EXIT
END

IF ~!InPartySlot(LastTalkedToBy,0) global("GoblinSojusz","GLOBAL",1)~ THEN BEGIN Gada1
SAY ~Pozdrowienie, jakby powiedzia� jeden z naszych mi�ych Goblin�w. Mi�o ci� pozna�.~
IF ~~ THEN EXIT
END

IF ~InPartySlot(LastTalkedToBy,0)~ THEN BEGIN Gada2
SAY ~Czego potrzebujesz?~
IF ~~ THEN REPLY ~Kim jeste�?~ GOTO Przedstawienie
IF ~~ THEN REPLY ~Poka� mi m�j sekretny magazyn.~ GOTO Magazyn
IF ~~ THEN REPLY ~Potrzebuj� co� z mojego osobistego sk�adu amunicji.~ GOTO Ammo
IF ~~ THEN REPLY ~Przyda�by mi si� masa�.~ GOTO Masaz
IF ~~ THEN REPLY ~Tylko ci� odwiedzam. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Zgoda
SAY ~Tak jest!~
IF ~~ THEN EXIT
END

IF ~~ THEN Przedstawienie
SAY ~Jestem twoj� osobist� s�u��c�. Zawsze znajdziesz mnie w swoich komnatach, a moje us�ugi dost�pne s� tylko dla ciebie.~
IF ~~ THEN REPLY ~Chc� prosi� o co� innego.~ GOTO Gada2
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN Magazyn
SAY ~Oczywi�cie. Pami�taj, �e magazyn mie�ci 500 przedmiot�w.~
IF ~~ THEN DO ~StartStore("MAGAZYN",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN Ammo
SAY ~Oczywi�cie. Mo�esz w nim przechowa� maksymalnie 2000 sztuk amunicji.~
IF ~~ THEN DO ~StartStore("AMMO5",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN Masaz
SAY ~Znam najnowsze techniki. Rozlu�nij si�...~
IF ~~ THEN DO ~setglobal("CaliaMasaz","GLOBAL",1)~ EXIT
END