BEGIN ~GINAZ~ 2

IF ~true()~ THEN BEGIN Start
SAY ~Witam! Musze przyzna�, �e gdyby nie te nowe drogi to nie do�aczy�bym do karawany!~
IF ~~ THEN REPLY ~Poka� sw�j towar.~ DO ~StartStore("GINAZ",LastTalkedToBy(Myself))~ EXIT
IF ~~ THEN REPLY ~Jak to si� sta�o, �e drow podr�uje razem z innymi kupcami? Drowy zwykle nie s� mile widziane w towarzystwie.~ GOTO Gadanie
IF ~~ THEN REPLY ~Poogl�dam towary innych kupc�w.~ EXIT
END

IF ~~ THEN BEGIN Gadanie
SAY ~Och! W interesach zwraca si� uwag� na ras� tylko je�eli to si� op�aca! Moje towary s� wa�niejsze od tego z jakiej jestem rasy!~
IF ~~ THEN REPLY ~Poka� sw�j towar.~ DO ~StartStore("GINAZ",LastTalkedToBy(Myself))~ EXIT
IF ~~ THEN REPLY ~Rozumiem. �eganj.~ EXIT
END