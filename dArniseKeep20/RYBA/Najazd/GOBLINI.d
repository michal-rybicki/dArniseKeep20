BEGIN ~GOBLINI~ 2

IF ~true()~ THEN BEGIN Gada
SAY ~Pozdrowienie. Jakie czeka nas zadanie in¿ynierskie?~
IF ~~ THEN REPLY ~Mam kilka pytañ.~ GOTO Pytania
IF ~!areacheck("AR1306")~ THEN REPLY ~Zróbcie sobie wolne.~ DO ~setglobal("GoblinIAr1306","GLOBAL",1) SetGlobal("GoblinIPraca","GLOBAL",0) SetGlobal("GoblinIUcieka","GLOBAL",0)~ GOTO Zgoda
IF ~!areacheck("AR1305")~ THEN REPLY ~Rozpocznijcie operacje górnicze w lochach.~ DO ~setglobal("GoblinIAr1305","GLOBAL",1) SetGlobal("GoblinIPraca","GLOBAL",1) SetGlobal("GoblinIUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~!areacheck("AR1304")~ THEN REPLY ~Do³¹czcie do obs³ugi katapult, by zwiekszyæ ich wydajnoœæ.~ DO ~setglobal("GoblinIAr1304","GLOBAL",1) SetGlobal("GoblinIPraca","GLOBAL",2) SetGlobal("GoblinIUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~~ THEN REPLY ~Obecnie niczego nie potrzebujê.~ EXIT
END

IF ~~ THEN BEGIN Gada1
SAY ~Jakie czeka nas zadanie in¿ynierskie?~
IF ~~ THEN REPLY ~Mam kilka pytañ.~ GOTO Pytania
IF ~!areacheck("AR1306")~ THEN REPLY ~Zróbcie sobie wolne.~ DO ~setglobal("GoblinIAr1306","GLOBAL",1) SetGlobal("GoblinIPraca","GLOBAL",0) SetGlobal("GoblinIUcieka","GLOBAL",0)~ GOTO Zgoda
IF ~!areacheck("AR1305")~ THEN REPLY ~Rozpocznijcie operacje górnicze w lochach.~ DO ~setglobal("GoblinIAr1305","GLOBAL",1) SetGlobal("GoblinIPraca","GLOBAL",1) SetGlobal("GoblinIUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~!areacheck("AR1304")~ THEN REPLY ~Do³¹czcie do obs³ugi katapult, by zwiekszyæ ich wydajnoœæ.~ DO ~setglobal("GoblinIAr1304","GLOBAL",1) SetGlobal("GoblinIPraca","GLOBAL",2) SetGlobal("GoblinIUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~~ THEN REPLY ~Obecnie niczego nie potrzebujê.~ EXIT
END

IF ~~ THEN BEGIN Zgoda
SAY ~Tak jest!~
IF ~~ THEN EXIT
END

IF ~~ THEN Pytania
SAY ~Oczywiœcie. Co chcesz wiedzieæ?~
IF ~~ THEN REPLY ~Jak poprawicie dzia³anie katapult?~ GOTO Katapulta
IF ~~ THEN REPLY ~Jak czêsto bêdziecie znajdowaæ diamenty?~ GOTO Diamenty
IF ~~ THEN REPLY ~Gdzie znajdê wydobyte przez was diamenty?~ GOTO Diamenty1
IF ~~ THEN REPLY ~Chcê prosiæ o coœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnajcie.~ EXIT
END

IF ~~ THEN Katapulta
SAY ~Kiedy do³¹czymy do obs³ugi katapult, dwukrotnie zwiêkszymy iloœæ strza³ów ka¿dej katapulty na dowoln¹ jednostkê czasu!~
IF ~~ THEN REPLY ~Mam inne pytania.~ GOTO Pytania
IF ~~ THEN REPLY ~Chcê prosiæ o coœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnajcie.~ EXIT
END

IF ~~ THEN Diamenty
SAY ~Powinniœmy odnajdywaæ po jednym w przeci¹gu tygodnia albo dwóch.~
IF ~~ THEN REPLY ~Mam inne pytania.~ GOTO Pytania
IF ~~ THEN REPLY ~Chcê prosiæ o coœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnajcie.~ EXIT
END

IF ~~ THEN Diamenty1
SAY ~W skrzyni tu¿ przy wyjœciu z lochów.~
IF ~~ THEN REPLY ~Mam inne pytania.~ GOTO Pytania
IF ~~ THEN REPLY ~Chcê prosiæ o coœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnajcie.~ EXIT
END