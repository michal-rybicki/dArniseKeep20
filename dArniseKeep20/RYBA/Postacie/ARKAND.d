BEGIN ~ARKAND~ 2

IF ~global("CernikPozwolenie","GLOBAL",0) !InPartySlot(LastTalkedToBy,0)~ THEN BEGIN Nic
SAY ~Witaj wierny kompanie naszego przywódcy! Czy kiedyœ staniemy ramiê w ramiê w boju? Ho! Ho! To by by³o coœ!~
IF ~~ THEN EXIT
END

IF ~Global("ArkandZabity","GLOBAL",1)~ THEN BEGIN Start1
SAY ~Obawiam siê, ¿e oddzia³ patroluj¹cy nasze ziemie przepad³ bez œladu. Nie wiemy co sie sta³o, musia³em za³o¿yæ, ¿e nie ¿yj¹.~
IF ~~ THEN DO ~setGlobal("ArkandZabity","GLOBAL",1)~ GOTO Start
END

IF ~Global("ArkandWpadka","GLOBAL",1)~ THEN BEGIN Start2
SAY ~Muszê poinformowaæ, ¿e by³a taka ma³a wpadka z udzia³em naszego oddzia³u w gospodzie i w wyniku zaistania³ej bójki twoja reputacja trochê podupad³a, prawdopodobnie dlatego, ¿e nasi doskonale przeze mnie wyszkoleni gwardziœci wygrali tê bójkê.~
IF ~~ THEN DO ~setGlobal("ArkandWpadka","GLOBAL",2)~ GOTO Start
END

IF ~Global("ArkandSukces","GLOBAL",1)~ THEN BEGIN Start3
SAY ~Z duma musze donieœæ, ze nasz oddzia³ w trakcie patrolu rozbi³ kryjówkê przemytników i zdoby³ dla nas 3000 sztuk z³ota!.~
IF ~~ THEN DO ~setGlobal("ArkandSukces","GLOBAL",2)~ GOTO Start
END

IF ~true()~ THEN BEGIN Start
SAY ~W czym mogê ci s³u¿yæ?~
IF ~~ THEN REPLY ~Czym siê zajmujesz?~ GOTO Powitanie
IF ~global("ArkandTrening","GLOBAL",0)~ THEN REPLY ~Chcê tylko popatrzeæ na trening.~ GOTO Trening 
IF ~global("GoblinDrogi","GLOBAL",0) global("ArkandArmia","GLOBAL",0) !globalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wyœlij oddzia³, aby patrolowa³ nasze ziemie. To zwiêkszy poczucie bezpieczeñstwa mieszkañców.~ DO ~setglobal("ArkandArmia","GLOBAL",1) SetGlobalTimer("ArkandPatrol","GLOBAL",SEVEN_DAYS) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Pytanie
IF ~globalGT("GoblinDrogi","GLOBAL",0) global("ArkandArmia","GLOBAL",0) !globalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wyœlij oddzia³, aby patrolowa³ nasze ziemie. To zwiêkszy poczucie bezpieczeñstwa mieszkañców.~ DO ~setglobal("ArkandArmia","GLOBAL",1) SetGlobalTimer("ArkandPatrol","GLOBAL",SEVEN_DAYS) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Pytanie1
IF ~global("ArkandArmia","GLOBAL",1)~ THEN REPLY ~Odwo³aj oddzia³, patroluj¹cy nasze ziemie.~ DO ~setglobal("ArkandArmia","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Armia
IF ~~ THEN REPLY ~Chcê omówiæ rozmieszczenie naszych oddzia³ów poza naszymi granicami.~ GOTO Lokacje
IF ~~ THEN REPLY ~Obecnie niczego nie potrzebujê.~ EXIT
END

IF ~~ THEN BEGIN Powitanie
SAY ~Trenujê gwardzistów oraz zajmujê sie dzia³aniami zbrojnymi poza terenem zamku, zarówno na naszych ziemiach jak i obcych.~
IF ~~ THEN REPLY ~Chcê prosiæ o coœ jeszcze.~ GOTO Start
IF ~~ THEN REPLY ~Doskonale. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia
SAY ~Tak jest.~
IF ~~ THEN REPLY ~Chcê prosiæ o coœ jeszcze.~ GOTO Start
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Pytanie
SAY ~Tak jest.~
IF ~~ THEN REPLY ~Chcê prosiæ o coœ jeszcze.~ GOTO Start
IF ~~ THEN REPLY ~Czy jest sens wys³aæ drugi oddzia³ do patrolu naszych ziem?~ GOTO Wyjasnienie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Pytanie1
SAY ~Tak jest. Patrole po nowych drogach to sama przyjemnoœæ dla naszych ludzi!~
IF ~~ THEN REPLY ~Chcê prosiæ o coœ jeszcze.~ GOTO Start
IF ~~ THEN REPLY ~Czy jest sens wys³aæ drugi oddzia³ do patrolu naszych ziem?~ GOTO Wyjasnienie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Wyjasnienie
SAY ~Nie, nie. Wiêksza iloœæ wojska mo¿e nawet bardziej przestraszyæ mieszkañców ni¿ uspokoiæ, a w razie inwazji rozproszone oddzia³y niewiele nam pomog¹.~
IF ~~ THEN REPLY ~Chcê prosiæ o coœ jeszcze.~ GOTO Start
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Trening
SAY ~To mnie cieszy! Tylko uwa¿ajcie na lataj¹ce wszêdzie ogniste strza³y!~
IF ~~ THEN REPLY ~Mo¿e jednak poczekaj, a¿ siê oddalê. Chcê prosiæ o coœ innego.~ GOTO Start
IF ~~ THEN REPLY ~Dobrze. Zaczynaj.~ DO ~setglobal("ArkandTrening","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Potwierdzenie
SAY ~Tak jest. Czy chesz zmieniæ po³o¿enie jeszcze jakiegoœ oddzia³u?~
IF ~~ THEN REPLY ~Tak.~ GOTO Lokacje
IF ~~ THEN REPLY ~Nie, ale chcê prosiæ o coœ jeszcze.~ GOTO Start
IF ~~ THEN REPLY ~Nie. To wszystko. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Miasto
SAY ~Formalnie nie mamy prawa operowaæ regularn¹ armi¹ wewn¹trz miasta, bez ryzyka wojny z Atkathl¹. Doki to wyj¹tek, bo musimy mieæ mo¿liwoœæ wysy³ania oddzia³ów drog¹ morsk¹, a w Slumsach nikt dodatkowych dzia³añ zbrojnych nie zauwa¿y, wiêc nikt nie przejmuje siê zakazem.~
IF ~~ THEN REPLY ~Rozumiem. Poka¿ jeszcze raz tê mapê.~ GOTO Lokacje
IF ~~ THEN REPLY ~Rozumiem, ale chcê prosiæ o coœ innego.~ GOTO Start
IF ~~ THEN REPLY ~No dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Lokacje
SAY ~Oczywiœcie. Oto mapa z miejscami gdzie nasze oddzia³y s¹ lub mo¿emy je wys³aæ.~
IF ~global("ArkandAr0300","GLOBAL",0) !globalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wyœlij oddzia³ do doków w Atkathli.~ DO ~setglobal("ArkandAr0300","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Potwierdzenie
IF ~global("ArkandAr0300","GLOBAL",1)~ THEN REPLY ~Wycofaj oddzia³ z doków w Atkathli.~ DO ~setglobal("ArkandAr0300","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Potwierdzenie
IF ~global("ArkandAr0400","GLOBAL",0) !globalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wyœlij oddzia³ do slumsów w Atkathli.~ DO ~setglobal("ArkandAr0400","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Potwierdzenie
IF ~global("ArkandAr0400","GLOBAL",1)~ THEN REPLY ~Wycofaj oddzia³ ze slumsów w Atkathli.~ DO ~setglobal("ArkandAr0400","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Potwierdzenie
IF ~global("ArkandAr1100","GLOBAL",0) !globalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wyœlij oddzia³ na Wzgórza Umar.~ DO ~setglobal("ArkandAr1100","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Potwierdzenie
IF ~global("ArkandAr1100","GLOBAL",1)~ THEN REPLY ~Wycofaj oddzia³ ze Wzgórz Umar.~ DO ~setglobal("ArkandAr1100","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Potwierdzenie
IF ~global("ArkandAr1200","GLOBAL",0) !globalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wyœlij oddzia³ na Wzgórza Wichrowych W³óczni.~ DO ~setglobal("ArkandAr1200","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Potwierdzenie
IF ~global("ArkandAr1200","GLOBAL",1)~ THEN REPLY ~Wycofaj oddzia³ ze Wzgórz Wichrowych W³óczni.~ DO ~setglobal("ArkandAr1200","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Potwierdzenie
IF ~global("ArkandAr2000","GLOBAL",0) !globalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wyœlij oddzia³ do Targowa.~ DO ~setglobal("ArkandAr2000","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Potwierdzenie
IF ~global("ArkandAr2000","GLOBAL",1)~ THEN REPLY ~Wycofaj oddzia³ z Targowa.~ DO ~setglobal("ArkandAr2000","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Potwierdzenie
IF ~global("ArkandAr1900","GLOBAL",0) !globalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wyœlij oddzia³ do Gaju Druidów.~ DO ~setglobal("ArkandAr1900","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Potwierdzenie
IF ~global("ArkandAr1900","GLOBAL",1)~ THEN REPLY ~Wycofaj oddzia³ z Gaju Druidów.~ DO ~setglobal("ArkandAr1900","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Potwierdzenie
IF ~global("ArkandAr1700","GLOBAL",0) !globalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wyœlij oddzia³ do Prze³êczy Ma³ego Zêba.~ DO ~setglobal("ArkandAr1700","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Potwierdzenie
IF ~global("ArkandAr1700","GLOBAL",1)~ THEN REPLY ~Wycofaj oddzia³ z Prze³êczy Ma³ego Zêba.~ DO ~setglobal("ArkandAr1700","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Potwierdzenie
IF ~global("ArkandAr3000","GLOBAL",0) !globalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wyœlij oddzia³ do Twierdzy Stra¿nika.~ DO ~setglobal("ArkandAr3000","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Potwierdzenie
IF ~global("ArkandAr3000","GLOBAL",1)~ THEN REPLY ~Wycofaj oddzia³ z Twierdzy Stra¿nika.~ DO ~setglobal("ArkandAr3000","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Potwierdzenie
IF ~~ THEN REPLY ~Dlaczego zaznaczy³eœ tylko dwie dzielnice Atkathli?~ GOTO Miasto
IF ~~ THEN REPLY ~Tak jest dobrze. Chcê prosiæ o coœ jeszcze.~ GOTO Start
IF ~~ THEN REPLY ~To wszystko. ¯egnaj.~ EXIT
END