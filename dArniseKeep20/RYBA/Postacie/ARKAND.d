BEGIN ~ARKAND~ 2

IF ~global("CernikPozwolenie","GLOBAL",0) !InPartySlot(LastTalkedToBy,0)~ THEN BEGIN Nic
SAY ~Witaj wierny kompanie naszego przyw�dcy! Czy kiedy� staniemy rami� w rami� w boju? Ho! Ho! To by by�o co�!~
IF ~~ THEN EXIT
END

IF ~Global("ArkandZabity","GLOBAL",1)~ THEN BEGIN Start1
SAY ~Obawiam si�, �e oddzia� patroluj�cy nasze ziemie przepad� bez �ladu. Nie wiemy co sie sta�o, musia�em za�o�y�, �e nie �yj�.~
IF ~~ THEN DO ~setGlobal("ArkandZabity","GLOBAL",1)~ GOTO Start
END

IF ~Global("ArkandWpadka","GLOBAL",1)~ THEN BEGIN Start2
SAY ~Musz� poinformowa�, �e by�a taka ma�a wpadka z udzia�em naszego oddzia�u w gospodzie i w wyniku zaistania�ej b�jki twoja reputacja troch� podupad�a, prawdopodobnie dlatego, �e nasi doskonale przeze mnie wyszkoleni gwardzi�ci wygrali t� b�jk�.~
IF ~~ THEN DO ~setGlobal("ArkandWpadka","GLOBAL",2)~ GOTO Start
END

IF ~Global("ArkandSukces","GLOBAL",1)~ THEN BEGIN Start3
SAY ~Z duma musze donie��, ze nasz oddzia� w trakcie patrolu rozbi� kryj�wk� przemytnik�w i zdoby� dla nas 3000 sztuk z�ota!.~
IF ~~ THEN DO ~setGlobal("ArkandSukces","GLOBAL",2)~ GOTO Start
END

IF ~true()~ THEN BEGIN Start
SAY ~W czym mog� ci s�u�y�?~
IF ~~ THEN REPLY ~Czym si� zajmujesz?~ GOTO Powitanie
IF ~global("ArkandTrening","GLOBAL",0)~ THEN REPLY ~Chc� tylko popatrze� na trening.~ GOTO Trening 
IF ~global("GoblinDrogi","GLOBAL",0) global("ArkandArmia","GLOBAL",0) !globalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wy�lij oddzia�, aby patrolowa� nasze ziemie. To zwi�kszy poczucie bezpiecze�stwa mieszka�c�w.~ DO ~setglobal("ArkandArmia","GLOBAL",1) SetGlobalTimer("ArkandPatrol","GLOBAL",SEVEN_DAYS) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Pytanie
IF ~globalGT("GoblinDrogi","GLOBAL",0) global("ArkandArmia","GLOBAL",0) !globalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wy�lij oddzia�, aby patrolowa� nasze ziemie. To zwi�kszy poczucie bezpiecze�stwa mieszka�c�w.~ DO ~setglobal("ArkandArmia","GLOBAL",1) SetGlobalTimer("ArkandPatrol","GLOBAL",SEVEN_DAYS) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Pytanie1
IF ~global("ArkandArmia","GLOBAL",1)~ THEN REPLY ~Odwo�aj oddzia�, patroluj�cy nasze ziemie.~ DO ~setglobal("ArkandArmia","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Armia
IF ~~ THEN REPLY ~Chc� om�wi� rozmieszczenie naszych oddzia��w poza naszymi granicami.~ GOTO Lokacje
IF ~~ THEN REPLY ~Obecnie niczego nie potrzebuj�.~ EXIT
END

IF ~~ THEN BEGIN Powitanie
SAY ~Trenuj� gwardzist�w oraz zajmuj� sie dzia�aniami zbrojnymi poza terenem zamku, zar�wno na naszych ziemiach jak i obcych.~
IF ~~ THEN REPLY ~Chc� prosi� o co� jeszcze.~ GOTO Start
IF ~~ THEN REPLY ~Doskonale. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia
SAY ~Tak jest.~
IF ~~ THEN REPLY ~Chc� prosi� o co� jeszcze.~ GOTO Start
IF ~~ THEN REPLY ~Dobrze. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Pytanie
SAY ~Tak jest.~
IF ~~ THEN REPLY ~Chc� prosi� o co� jeszcze.~ GOTO Start
IF ~~ THEN REPLY ~Czy jest sens wys�a� drugi oddzia� do patrolu naszych ziem?~ GOTO Wyjasnienie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Pytanie1
SAY ~Tak jest. Patrole po nowych drogach to sama przyjemno�� dla naszych ludzi!~
IF ~~ THEN REPLY ~Chc� prosi� o co� jeszcze.~ GOTO Start
IF ~~ THEN REPLY ~Czy jest sens wys�a� drugi oddzia� do patrolu naszych ziem?~ GOTO Wyjasnienie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Wyjasnienie
SAY ~Nie, nie. Wi�ksza ilo�� wojska mo�e nawet bardziej przestraszy� mieszka�c�w ni� uspokoi�, a w razie inwazji rozproszone oddzia�y niewiele nam pomog�.~
IF ~~ THEN REPLY ~Chc� prosi� o co� jeszcze.~ GOTO Start
IF ~~ THEN REPLY ~Dobrze. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Trening
SAY ~To mnie cieszy! Tylko uwa�ajcie na lataj�ce wsz�dzie ogniste strza�y!~
IF ~~ THEN REPLY ~Mo�e jednak poczekaj, a� si� oddal�. Chc� prosi� o co� innego.~ GOTO Start
IF ~~ THEN REPLY ~Dobrze. Zaczynaj.~ DO ~setglobal("ArkandTrening","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Potwierdzenie
SAY ~Tak jest. Czy chesz zmieni� po�o�enie jeszcze jakiego� oddzia�u?~
IF ~~ THEN REPLY ~Tak.~ GOTO Lokacje
IF ~~ THEN REPLY ~Nie, ale chc� prosi� o co� jeszcze.~ GOTO Start
IF ~~ THEN REPLY ~Nie. To wszystko. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Miasto
SAY ~Formalnie nie mamy prawa operowa� regularn� armi� wewn�trz miasta, bez ryzyka wojny z Atkathl�. Doki to wyj�tek, bo musimy mie� mo�liwo�� wysy�ania oddzia��w drog� morsk�, a w Slumsach nikt dodatkowych dzia�a� zbrojnych nie zauwa�y, wi�c nikt nie przejmuje si� zakazem.~
IF ~~ THEN REPLY ~Rozumiem. Poka� jeszcze raz t� map�.~ GOTO Lokacje
IF ~~ THEN REPLY ~Rozumiem, ale chc� prosi� o co� innego.~ GOTO Start
IF ~~ THEN REPLY ~No dobrze. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Lokacje
SAY ~Oczywi�cie. Oto mapa z miejscami gdzie nasze oddzia�y s� lub mo�emy je wys�a�.~
IF ~global("ArkandAr0300","GLOBAL",0) !globalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wy�lij oddzia� do dok�w w Atkathli.~ DO ~setglobal("ArkandAr0300","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Potwierdzenie
IF ~global("ArkandAr0300","GLOBAL",1)~ THEN REPLY ~Wycofaj oddzia� z dok�w w Atkathli.~ DO ~setglobal("ArkandAr0300","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Potwierdzenie
IF ~global("ArkandAr0400","GLOBAL",0) !globalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wy�lij oddzia� do slums�w w Atkathli.~ DO ~setglobal("ArkandAr0400","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Potwierdzenie
IF ~global("ArkandAr0400","GLOBAL",1)~ THEN REPLY ~Wycofaj oddzia� ze slums�w w Atkathli.~ DO ~setglobal("ArkandAr0400","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Potwierdzenie
IF ~global("ArkandAr1100","GLOBAL",0) !globalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wy�lij oddzia� na Wzg�rza Umar.~ DO ~setglobal("ArkandAr1100","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Potwierdzenie
IF ~global("ArkandAr1100","GLOBAL",1)~ THEN REPLY ~Wycofaj oddzia� ze Wzg�rz Umar.~ DO ~setglobal("ArkandAr1100","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Potwierdzenie
IF ~global("ArkandAr1200","GLOBAL",0) !globalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wy�lij oddzia� na Wzg�rza Wichrowych W��czni.~ DO ~setglobal("ArkandAr1200","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Potwierdzenie
IF ~global("ArkandAr1200","GLOBAL",1)~ THEN REPLY ~Wycofaj oddzia� ze Wzg�rz Wichrowych W��czni.~ DO ~setglobal("ArkandAr1200","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Potwierdzenie
IF ~global("ArkandAr2000","GLOBAL",0) !globalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wy�lij oddzia� do Targowa.~ DO ~setglobal("ArkandAr2000","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Potwierdzenie
IF ~global("ArkandAr2000","GLOBAL",1)~ THEN REPLY ~Wycofaj oddzia� z Targowa.~ DO ~setglobal("ArkandAr2000","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Potwierdzenie
IF ~global("ArkandAr1900","GLOBAL",0) !globalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wy�lij oddzia� do Gaju Druid�w.~ DO ~setglobal("ArkandAr1900","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Potwierdzenie
IF ~global("ArkandAr1900","GLOBAL",1)~ THEN REPLY ~Wycofaj oddzia� z Gaju Druid�w.~ DO ~setglobal("ArkandAr1900","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Potwierdzenie
IF ~global("ArkandAr1700","GLOBAL",0) !globalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wy�lij oddzia� do Prze��czy Ma�ego Z�ba.~ DO ~setglobal("ArkandAr1700","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Potwierdzenie
IF ~global("ArkandAr1700","GLOBAL",1)~ THEN REPLY ~Wycofaj oddzia� z Prze��czy Ma�ego Z�ba.~ DO ~setglobal("ArkandAr1700","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Potwierdzenie
IF ~global("ArkandAr3000","GLOBAL",0) !globalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wy�lij oddzia� do Twierdzy Stra�nika.~ DO ~setglobal("ArkandAr3000","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Potwierdzenie
IF ~global("ArkandAr3000","GLOBAL",1)~ THEN REPLY ~Wycofaj oddzia� z Twierdzy Stra�nika.~ DO ~setglobal("ArkandAr3000","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Potwierdzenie
IF ~~ THEN REPLY ~Dlaczego zaznaczy�e� tylko dwie dzielnice Atkathli?~ GOTO Miasto
IF ~~ THEN REPLY ~Tak jest dobrze. Chc� prosi� o co� jeszcze.~ GOTO Start
IF ~~ THEN REPLY ~To wszystko. �egnaj.~ EXIT
END