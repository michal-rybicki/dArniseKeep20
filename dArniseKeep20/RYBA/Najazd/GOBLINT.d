BEGIN ~GOBLINT~ 2

IF ~areacheck("AR0400")~ THEN BEGIN Cebula
SAY ~CEBULA! �WIE�A CEBULA! Psst! To ja tw�j tragarz. Udaj� prostego sprzedawc� cebuli.~
IF ~~ THEN REPLY ~Poka� sw�je towary zupe�nie nieznajomy sprzedawco cebuli.~ DO ~StartStore("GOBLIN",LastTalkedToBy(Myself))~ EXIT
IF ~!areacheck("AR1305")~ THEN REPLY ~Potrzebuj� cebuli w warownii d'Arnise. Wracajcie do zamku.~ DO ~setglobal("GoblinAr1305","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~~ THEN REPLY ~Potrzebuj� cebuli w innej lokacji.~ GOTO Miejsca
IF ~~ THEN REPLY ~Obecnie nie potrzebuj� cebuli.~ EXIT
END

IF ~areacheck("AR2000")~ THEN BEGIN Warzywa
SAY ~WARZYWA! �WIE�E WARZYWA! Psst! To ja tw�j tragarz. Udaj� prostego sprzedawc� warzyw.~
IF ~~ THEN REPLY ~Poka� sw�je towary zupe�nie nieznajomy sprzedawco warzyw.~ DO ~StartStore("GOBLIN",LastTalkedToBy(Myself))~ EXIT
IF ~!areacheck("AR1305")~ THEN REPLY ~Potrzebuj� warzyw w warownii d'Arnise. Wracajcie do zamku.~ DO ~setglobal("GoblinAr1305","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~~ THEN REPLY ~Potrzebuj� warzyw w innej lokacji.~ GOTO Miejsca
IF ~~ THEN REPLY ~Obecnie nie potrzebuj� warzyw.~ EXIT
END

IF ~true()~ THEN BEGIN Gada
SAY ~Pozdrowienie. B�dziemy si� wymienia� gratami?~
IF ~~ THEN REPLY ~Poka�cie sw�j �adunek.~ DO ~StartStore("GOBLIN",LastTalkedToBy(Myself))~ EXIT
IF ~!areacheck("AR1305")~ THEN REPLY ~Wracajcie do zamku.~ DO ~setglobal("GoblinAr1305","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~~ THEN REPLY ~Id�cie do innej lokacji i poczekajcie tam na mnie.~ GOTO Miejsca
IF ~~ THEN REPLY ~Opowiedz mi o brygadzie transportowej.~ GOTO Witanie
IF ~~ THEN REPLY ~Nie. Obecnie niczego nie potrzebuje.~ EXIT
END

IF ~~ THEN BEGIN Gada1
SAY ~B�dziemy si� wymienia� gratami?~
IF ~~ THEN REPLY ~Poka�cie sw�j �adunek.~ DO ~StartStore("GOBLIN",LastTalkedToBy(Myself))~ EXIT
IF ~!areacheck("AR1305")~ THEN REPLY ~Wracajcie do zamku.~ DO ~setglobal("GoblinAr1305","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~~ THEN REPLY ~Id�cie do innej lokacji i poczekajcie tam na mnie.~ GOTO Miejsca
IF ~~ THEN REPLY ~Opowiedz mi o brygadzie transportowej.~ GOTO Witanie
IF ~~ THEN REPLY ~Nie. Obecnie niczego nie potrzebuje.~ EXIT
END

IF ~~ THEN BEGIN Zgoda
SAY ~Tak jest!~
IF ~~ THEN EXIT
END

IF ~~ THEN Miejsca
SAY ~Oczywi�cie. Porucznik Arkand da� nam map� z lokacjami, do kt�rych mamy prawo si� uda�. Oto ona. Gdzie mamy i��?~
IF ~!areacheck("AR0400")~ THEN REPLY ~Atkathla - Slumsy.~ DO ~setglobal("GoblinAr0400","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~!areacheck("AR0300")~ THEN REPLY ~Atkathla - Doki.~ DO ~setglobal("GoblinAr0300","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~!areacheck("AR1100")~ THEN REPLY ~Wzg�rza Umar.~ DO ~setglobal("GoblinAr1100","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~!areacheck("AR1200")~ THEN REPLY ~Wzg�rza Wichrowych W��czni.~ DO ~setglobal("GoblinAr1200","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~!areacheck("AR1700")~ THEN REPLY ~Prze��cz Ma�ego Z�ba.~ DO ~setglobal("GoblinAr1700","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~!areacheck("AR2000")~ THEN REPLY ~Targowo.~ DO ~setglobal("GoblinAr2000","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~!areacheck("AR1900")~ THEN REPLY ~Gaj Druid�w.~ DO ~setglobal("GoblinAr1900","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~!areacheck("AR3000")~ THEN REPLY ~Twierdza Stra�nika.~ DO ~setglobal("GoblinAr3000","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~~ THEN REPLY ~Chc� zapyta� o co� innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Zosta�cie tutaj.~ GOTO Zgoda
END

IF ~~ THEN BEGIN Witanie
SAY ~Nasz� brygad� za�o�ono by przenosi�a ekwipunek naszego klanu kiedy jeszcze nie mieli�my sta�ej siedziby. Mo�emy unie�� do 80 przedmiot�w. Cokolwiek nam dasz zabierzemy ze sob�, gdziekolwiek nas wy�lesz.~
IF ~~ THEN REPLY ~Chc� zapyta� o co� innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Dobrze. �egnaj.~ EXIT
END