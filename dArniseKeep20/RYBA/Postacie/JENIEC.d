BEGIN ~JENIEC~

IF ~true()~ THEN BEGIN Gadanie
SAY ~To jest niedopuszczalne! ¯¹dam ¿ebyscie mnie natychmiast uwolnili!~
IF ~~ THEN REPLY ~Dlaczego mia³byœ zostaæ uwolniony?~ GOTO 2
IF ~~ THEN REPLY ~Tak, zaraz ciê uwolniê, od twojego cia³a i twojej marnej egzystencji.~ DO ~enemy()~ EXIT
IF ~~ THEN REPLY ~Posiedzisz tu jeszcze baaardzo d³ugo. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN 2
SAY ~Jestem wa¿nym cz³onkiem rodu Roenallów! Przyjd¹ po mnie... albo zap³ac¹ za mnie.~
IF ~~ THEN REPLY ~W¹tpie, aby ktokolwiek chcia³ za ciebie p³aciæ.~ GOTO 3
IF ~global("JeniecWiem","GLOBAL",1)~ THEN REPLY ~Nikt za ciebie nie zap³aci. Moi ludzie to sprawdzili.~ GOTO 3
IF ~~ THEN REPLY ~Nikt po ciebie nie przyjdzie, bo zginiesz teraz. Broñ siê!~ DO ~enemy()~ EXIT
IF ~~ THEN REPLY ~Posiedzisz tu jeszcze baaardzo d³ugo. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN 3
SAY ~Owszem, ale sam mogê za siebie zap³aciæ! Muszê tylko st¹d wyjœæ!~
IF ~~ THEN REPLY ~Wypuszczê ciê, w zamian za informacje.~ GOTO Nie
IF ~~ THEN REPLY ~Jesteœ wolny. Czekam na 10000 sztuk z³ota za najdalej tydzieñ.~ DO ~escapearea()~ EXIT
IF ~~ THEN REPLY ~Jesteœ wolny. Czekam na 20000 sztuk z³ota za najdalej tydzieñ.~ DO ~escapearea()~ EXIT
IF ~~ THEN REPLY ~Zostaniesz st¹d wyniesiony, martwy.~ DO ~enemy()~ EXIT
IF ~~ THEN REPLY ~Posiedzisz tu jeszcze baaardzo d³ugo. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Nie
SAY ~Nie posiadam ¿adnych informacji, których byœcie ju¿ nie znali.~
IF ~~ THEN REPLY ~W takim razie, nie przedstawiasz dla mnie wartoœci. Sta¿e! Czy tamta skrzynia z kolcami w srodku w sali obok dzia³a?~ GOTO Tak
IF ~~ THEN REPLY ~W takim razie zostaniesz tutaj. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Tak
SAY ~CO?! Ja... Ja powiem wszystko!~
IF ~~ THEN REPLY ~S³ucham wiêc...~ GOTO 4
IF ~~ THEN REPLY ~Za póŸno. Giñ!~ DO ~enemy()~ EXIT
END

IF ~~ THEN BEGIN 4
SAY ~(d³uga przekoloryzowana w wiêszkoœci zmyœlona opowieœæ z ziarnkami m¹droœci)~
IF ~~ THEN DO ~AddexperienceParty(70000)~ GOTO 5
END

IF ~~ THEN BEGIN 5
SAY ~Teraz jestem wolny, tak?~
IF ~~ THEN REPLY ~Jesteœ wolny.~ DO ~AddexperienceParty(1000) escapearea()~ EXIT
IF ~~ THEN REPLY ~Jesteœ martwy.~ DO ~enemy()~ EXIT
END