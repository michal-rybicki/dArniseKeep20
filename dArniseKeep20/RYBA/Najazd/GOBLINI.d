BEGIN ~GOBLINI~ 2

IF ~true()~ THEN BEGIN Gada
SAY ~Pozdrowienie. Jakie czeka nas zadanie in�ynierskie?~
IF ~~ THEN REPLY ~Mam kilka pyta�.~ GOTO Pytania
IF ~!areacheck("AR1306")~ THEN REPLY ~Zr�bcie sobie wolne.~ DO ~setglobal("GoblinIAr1306","GLOBAL",1) SetGlobal("GoblinIPraca","GLOBAL",0) SetGlobal("GoblinIUcieka","GLOBAL",0)~ GOTO Zgoda
IF ~!areacheck("AR1305")~ THEN REPLY ~Rozpocznijcie operacje g�rnicze w lochach.~ DO ~setglobal("GoblinIAr1305","GLOBAL",1) SetGlobal("GoblinIPraca","GLOBAL",1) SetGlobal("GoblinIUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~!areacheck("AR1304")~ THEN REPLY ~Do��czcie do obs�ugi katapult, by zwiekszy� ich wydajno��.~ DO ~setglobal("GoblinIAr1304","GLOBAL",1) SetGlobal("GoblinIPraca","GLOBAL",2) SetGlobal("GoblinIUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~~ THEN REPLY ~Obecnie niczego nie potrzebuj�.~ EXIT
END

IF ~~ THEN BEGIN Gada1
SAY ~Jakie czeka nas zadanie in�ynierskie?~
IF ~~ THEN REPLY ~Mam kilka pyta�.~ GOTO Pytania
IF ~!areacheck("AR1306")~ THEN REPLY ~Zr�bcie sobie wolne.~ DO ~setglobal("GoblinIAr1306","GLOBAL",1) SetGlobal("GoblinIPraca","GLOBAL",0) SetGlobal("GoblinIUcieka","GLOBAL",0)~ GOTO Zgoda
IF ~!areacheck("AR1305")~ THEN REPLY ~Rozpocznijcie operacje g�rnicze w lochach.~ DO ~setglobal("GoblinIAr1305","GLOBAL",1) SetGlobal("GoblinIPraca","GLOBAL",1) SetGlobal("GoblinIUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~!areacheck("AR1304")~ THEN REPLY ~Do��czcie do obs�ugi katapult, by zwiekszy� ich wydajno��.~ DO ~setglobal("GoblinIAr1304","GLOBAL",1) SetGlobal("GoblinIPraca","GLOBAL",2) SetGlobal("GoblinIUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~~ THEN REPLY ~Obecnie niczego nie potrzebuj�.~ EXIT
END

IF ~~ THEN BEGIN Zgoda
SAY ~Tak jest!~
IF ~~ THEN EXIT
END

IF ~~ THEN Pytania
SAY ~Oczywi�cie. Co chcesz wiedzie�?~
IF ~~ THEN REPLY ~Jak poprawicie dzia�anie katapult?~ GOTO Katapulta
IF ~~ THEN REPLY ~Jak cz�sto b�dziecie znajdowa� diamenty?~ GOTO Diamenty
IF ~~ THEN REPLY ~Gdzie znajd� wydobyte przez was diamenty?~ GOTO Diamenty1
IF ~~ THEN REPLY ~Chc� prosi� o co� innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnajcie.~ EXIT
END

IF ~~ THEN Katapulta
SAY ~Kiedy do��czymy do obs�ugi katapult, dwukrotnie zwi�kszymy ilo�� strza��w ka�dej katapulty na dowoln� jednostk� czasu!~
IF ~~ THEN REPLY ~Mam inne pytania.~ GOTO Pytania
IF ~~ THEN REPLY ~Chc� prosi� o co� innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnajcie.~ EXIT
END

IF ~~ THEN Diamenty
SAY ~Powinni�my odnajdywa� po jednym w przeci�gu tygodnia albo dw�ch.~
IF ~~ THEN REPLY ~Mam inne pytania.~ GOTO Pytania
IF ~~ THEN REPLY ~Chc� prosi� o co� innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnajcie.~ EXIT
END

IF ~~ THEN Diamenty1
SAY ~W skrzyni tu� przy wyj�ciu z loch�w.~
IF ~~ THEN REPLY ~Mam inne pytania.~ GOTO Pytania
IF ~~ THEN REPLY ~Chc� prosi� o co� innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnajcie.~ EXIT
END