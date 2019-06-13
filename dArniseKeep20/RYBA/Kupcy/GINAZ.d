BEGIN ~GINAZ~ 2

IF ~true()~ THEN BEGIN Start
SAY ~Witam! Musze przyznaæ, ¿e gdyby nie te nowe drogi to nie do³aczy³bym do karawany!~
IF ~~ THEN REPLY ~Poka¿ swój towar.~ DO ~StartStore("GINAZ",LastTalkedToBy(Myself))~ EXIT
IF ~~ THEN REPLY ~Jak to siê sta³o, ¿e drow podró¿uje razem z innymi kupcami? Drowy zwykle nie s¹ mile widziane w towarzystwie.~ GOTO Gadanie
IF ~~ THEN REPLY ~Poogl¹dam towary innych kupców.~ EXIT
END

IF ~~ THEN BEGIN Gadanie
SAY ~Och! W interesach zwraca siê uwagê na rasê tylko je¿eli to siê op³aca! Moje towary s¹ wa¿niejsze od tego z jakiej jestem rasy!~
IF ~~ THEN REPLY ~Poka¿ swój towar.~ DO ~StartStore("GINAZ",LastTalkedToBy(Myself))~ EXIT
IF ~~ THEN REPLY ~Rozumiem. ¯eganj.~ EXIT
END