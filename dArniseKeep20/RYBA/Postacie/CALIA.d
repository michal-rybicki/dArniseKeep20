BEGIN ~CALIA~ 2

IF ~!InPartySlot(LastTalkedToBy,0) global("GoblinSojusz","GLOBAL",0)~ THEN BEGIN Gada
SAY ~Witaj. Mi³o ciê poznaæ.~
IF ~~ THEN EXIT
END

IF ~!InPartySlot(LastTalkedToBy,0) global("GoblinSojusz","GLOBAL",1)~ THEN BEGIN Gada1
SAY ~Pozdrowienie, jakby powiedzia³ jeden z naszych mi³ych Goblinów. Mi³o ciê poznaæ.~
IF ~~ THEN EXIT
END

IF ~InPartySlot(LastTalkedToBy,0)~ THEN BEGIN Gada2
SAY ~Czego potrzebujesz?~
IF ~~ THEN REPLY ~Kim jesteœ?~ GOTO Przedstawienie
IF ~~ THEN REPLY ~Poka¿ mi mój sekretny magazyn.~ GOTO Magazyn
IF ~~ THEN REPLY ~Potrzebujê coœ z mojego osobistego sk³adu amunicji.~ GOTO Ammo
IF ~~ THEN REPLY ~Przyda³by mi siê masa¿.~ GOTO Masaz
IF ~~ THEN REPLY ~Tylko ciê odwiedzam. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Zgoda
SAY ~Tak jest!~
IF ~~ THEN EXIT
END

IF ~~ THEN Przedstawienie
SAY ~Jestem twoj¹ osobist¹ s³u¿¹c¹. Zawsze znajdziesz mnie w swoich komnatach, a moje us³ugi dostêpne s¹ tylko dla ciebie.~
IF ~~ THEN REPLY ~Chcê prosiæ o coœ innego.~ GOTO Gada2
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN Magazyn
SAY ~Oczywiœcie. Pamiêtaj, ¿e magazyn mieœci 500 przedmiotów.~
IF ~~ THEN DO ~StartStore("MAGAZYN",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN Ammo
SAY ~Oczywiœcie. Mo¿esz w nim przechowaæ maksymalnie 2000 sztuk amunicji.~
IF ~~ THEN DO ~StartStore("AMMO5",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN Masaz
SAY ~Znam najnowsze techniki. RozluŸnij siê...~
IF ~~ THEN DO ~setglobal("CaliaMasaz","GLOBAL",1)~ EXIT
END