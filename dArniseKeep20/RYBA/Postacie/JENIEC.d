BEGIN ~JENIEC~

IF ~true()~ THEN BEGIN Gadanie
SAY ~To jest niedopuszczalne! ��dam �ebyscie mnie natychmiast uwolnili!~
IF ~~ THEN REPLY ~Dlaczego mia�by� zosta� uwolniony?~ GOTO 2
IF ~~ THEN REPLY ~Tak, zaraz ci� uwolni�, od twojego cia�a i twojej marnej egzystencji.~ DO ~enemy()~ EXIT
IF ~~ THEN REPLY ~Posiedzisz tu jeszcze baaardzo d�ugo. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN 2
SAY ~Jestem wa�nym cz�onkiem rodu Roenall�w! Przyjd� po mnie... albo zap�ac� za mnie.~
IF ~~ THEN REPLY ~W�tpie, aby ktokolwiek chcia� za ciebie p�aci�.~ GOTO 3
IF ~global("JeniecWiem","GLOBAL",1)~ THEN REPLY ~Nikt za ciebie nie zap�aci. Moi ludzie to sprawdzili.~ GOTO 3
IF ~~ THEN REPLY ~Nikt po ciebie nie przyjdzie, bo zginiesz teraz. Bro� si�!~ DO ~enemy()~ EXIT
IF ~~ THEN REPLY ~Posiedzisz tu jeszcze baaardzo d�ugo. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN 3
SAY ~Owszem, ale sam mog� za siebie zap�aci�! Musz� tylko st�d wyj��!~
IF ~~ THEN REPLY ~Wypuszcz� ci�, w zamian za informacje.~ GOTO Nie
IF ~~ THEN REPLY ~Jeste� wolny. Czekam na 10000 sztuk z�ota za najdalej tydzie�.~ DO ~escapearea()~ EXIT
IF ~~ THEN REPLY ~Jeste� wolny. Czekam na 20000 sztuk z�ota za najdalej tydzie�.~ DO ~escapearea()~ EXIT
IF ~~ THEN REPLY ~Zostaniesz st�d wyniesiony, martwy.~ DO ~enemy()~ EXIT
IF ~~ THEN REPLY ~Posiedzisz tu jeszcze baaardzo d�ugo. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Nie
SAY ~Nie posiadam �adnych informacji, kt�rych by�cie ju� nie znali.~
IF ~~ THEN REPLY ~W takim razie, nie przedstawiasz dla mnie warto�ci. Sta�e! Czy tamta skrzynia z kolcami w srodku w sali obok dzia�a?~ GOTO Tak
IF ~~ THEN REPLY ~W takim razie zostaniesz tutaj. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Tak
SAY ~CO?! Ja... Ja powiem wszystko!~
IF ~~ THEN REPLY ~S�ucham wi�c...~ GOTO 4
IF ~~ THEN REPLY ~Za p�no. Gi�!~ DO ~enemy()~ EXIT
END

IF ~~ THEN BEGIN 4
SAY ~(d�uga przekoloryzowana w wi�szko�ci zmy�lona opowie�� z ziarnkami m�dro�ci)~
IF ~~ THEN DO ~AddexperienceParty(70000)~ GOTO 5
END

IF ~~ THEN BEGIN 5
SAY ~Teraz jestem wolny, tak?~
IF ~~ THEN REPLY ~Jeste� wolny.~ DO ~AddexperienceParty(1000) escapearea()~ EXIT
IF ~~ THEN REPLY ~Jeste� martwy.~ DO ~enemy()~ EXIT
END