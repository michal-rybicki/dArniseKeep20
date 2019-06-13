BEGIN ~GOBLINT~ 2

IF ~areacheck("AR0400")~ THEN BEGIN Cebula
SAY ~CEBULA! ŒWIE¯A CEBULA! Psst! To ja twój tragarz. Udajê prostego sprzedawcê cebuli.~
IF ~~ THEN REPLY ~Poka¿ swóje towary zupe³nie nieznajomy sprzedawco cebuli.~ DO ~StartStore("GOBLIN",LastTalkedToBy(Myself))~ EXIT
IF ~!areacheck("AR1305")~ THEN REPLY ~Potrzebujê cebuli w warownii d'Arnise. Wracajcie do zamku.~ DO ~setglobal("GoblinAr1305","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~~ THEN REPLY ~Potrzebujê cebuli w innej lokacji.~ GOTO Miejsca
IF ~~ THEN REPLY ~Obecnie nie potrzebujê cebuli.~ EXIT
END

IF ~areacheck("AR2000")~ THEN BEGIN Warzywa
SAY ~WARZYWA! ŒWIE¯E WARZYWA! Psst! To ja twój tragarz. Udajê prostego sprzedawcê warzyw.~
IF ~~ THEN REPLY ~Poka¿ swóje towary zupe³nie nieznajomy sprzedawco warzyw.~ DO ~StartStore("GOBLIN",LastTalkedToBy(Myself))~ EXIT
IF ~!areacheck("AR1305")~ THEN REPLY ~Potrzebujê warzyw w warownii d'Arnise. Wracajcie do zamku.~ DO ~setglobal("GoblinAr1305","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~~ THEN REPLY ~Potrzebujê warzyw w innej lokacji.~ GOTO Miejsca
IF ~~ THEN REPLY ~Obecnie nie potrzebujê warzyw.~ EXIT
END

IF ~true()~ THEN BEGIN Gada
SAY ~Pozdrowienie. Bêdziemy siê wymieniaæ gratami?~
IF ~~ THEN REPLY ~Poka¿cie swój ³adunek.~ DO ~StartStore("GOBLIN",LastTalkedToBy(Myself))~ EXIT
IF ~!areacheck("AR1305")~ THEN REPLY ~Wracajcie do zamku.~ DO ~setglobal("GoblinAr1305","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~~ THEN REPLY ~IdŸcie do innej lokacji i poczekajcie tam na mnie.~ GOTO Miejsca
IF ~~ THEN REPLY ~Opowiedz mi o brygadzie transportowej.~ GOTO Witanie
IF ~~ THEN REPLY ~Nie. Obecnie niczego nie potrzebuje.~ EXIT
END

IF ~~ THEN BEGIN Gada1
SAY ~Bêdziemy siê wymieniaæ gratami?~
IF ~~ THEN REPLY ~Poka¿cie swój ³adunek.~ DO ~StartStore("GOBLIN",LastTalkedToBy(Myself))~ EXIT
IF ~!areacheck("AR1305")~ THEN REPLY ~Wracajcie do zamku.~ DO ~setglobal("GoblinAr1305","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~~ THEN REPLY ~IdŸcie do innej lokacji i poczekajcie tam na mnie.~ GOTO Miejsca
IF ~~ THEN REPLY ~Opowiedz mi o brygadzie transportowej.~ GOTO Witanie
IF ~~ THEN REPLY ~Nie. Obecnie niczego nie potrzebuje.~ EXIT
END

IF ~~ THEN BEGIN Zgoda
SAY ~Tak jest!~
IF ~~ THEN EXIT
END

IF ~~ THEN Miejsca
SAY ~Oczywiœcie. Porucznik Arkand da³ nam mapê z lokacjami, do których mamy prawo siê udaæ. Oto ona. Gdzie mamy iœæ?~
IF ~!areacheck("AR0400")~ THEN REPLY ~Atkathla - Slumsy.~ DO ~setglobal("GoblinAr0400","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~!areacheck("AR0300")~ THEN REPLY ~Atkathla - Doki.~ DO ~setglobal("GoblinAr0300","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~!areacheck("AR1100")~ THEN REPLY ~Wzgórza Umar.~ DO ~setglobal("GoblinAr1100","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~!areacheck("AR1200")~ THEN REPLY ~Wzgórza Wichrowych W³óczni.~ DO ~setglobal("GoblinAr1200","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~!areacheck("AR1700")~ THEN REPLY ~Prze³êcz Ma³ego Zêba.~ DO ~setglobal("GoblinAr1700","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~!areacheck("AR2000")~ THEN REPLY ~Targowo.~ DO ~setglobal("GoblinAr2000","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~!areacheck("AR1900")~ THEN REPLY ~Gaj Druidów.~ DO ~setglobal("GoblinAr1900","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~!areacheck("AR3000")~ THEN REPLY ~Twierdza Stra¿nika.~ DO ~setglobal("GoblinAr3000","GLOBAL",1) SetGlobal("GoblinTUcieka","GLOBAL",1)~ GOTO Zgoda
IF ~~ THEN REPLY ~Chcê zapytaæ o coœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Zostañcie tutaj.~ GOTO Zgoda
END

IF ~~ THEN BEGIN Witanie
SAY ~Nasz¹ brygadê za³o¿ono by przenosi³a ekwipunek naszego klanu kiedy jeszcze nie mieliœmy sta³ej siedziby. Mo¿emy unieœæ do 80 przedmiotów. Cokolwiek nam dasz zabierzemy ze sob¹, gdziekolwiek nas wyœlesz.~
IF ~~ THEN REPLY ~Chcê zapytaæ o coœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END