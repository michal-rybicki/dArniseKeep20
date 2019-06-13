BEGIN ~GOBLINM1~ 2

IF ~true()~ THEN BEGIN Gada
SAY ~Pozdrowienie. Do jakiej czeœci magazynu chcesz mieæ dostêp?~
IF ~~ THEN REPLY ~Magazyny uniwersalne.~ GOTO Magazyn
IF ~~ THEN REPLY ~Sk³ady amunicji.~ GOTO Ammo
IF ~~ THEN REPLY ~Opowiedz mi o magazynierach.~ GOTO Witanie
IF ~~ THEN REPLY ~Chcê zmieniæ etykiety magazynów uniwersalnych.~ GOTO Etykiety
IF ~~ THEN REPLY ~Obecnie niczego nie potrzebuje.~ EXIT
END

IF ~~ THEN BEGIN Gada1
SAY ~Do jakiej czeœci magazynu chcesz mieæ dostêp?~
IF ~~ THEN REPLY ~Magazyny uniwersalne.~ GOTO Magazyn
IF ~~ THEN REPLY ~Sk³ady amunicji.~ GOTO Ammo
IF ~~ THEN REPLY ~Opowiedz mi o magazynierach.~ GOTO Witanie
IF ~~ THEN REPLY ~Chcê zmieniæ etykiety magazynów uniwersalnych.~ GOTO Etykiety
IF ~~ THEN REPLY ~Obecnie niczego nie potrzebuje.~ EXIT
END

IF ~~ THEN BEGIN Witanie
SAY ~Jesteœmy now¹ brygad¹. Nie byliœmy potrzebni kiedy nie mieliœmy sta³ej siedziby. Podzieliliœmy przestrzenie magazynowe w zamku na 14 magazynów. Stworzyliœmy 4 sk³ady amunicji oraz 10 uniwersalnych magazynów, w których mo¿ecie przechowywaæ cokolwiek chcecie. Ka¿dy magazynier ma aktualny spis przedmiotów trzymanych w magazynach. Nasi goñcy natychmiat przynios¹ ci albo odnios¹ do magazynu ka¿dy przedmiot.~
IF ~~ THEN REPLY ~Chcê zapytaæ o coœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Zgoda
SAY ~Tak jest!~
IF ~~ THEN EXIT
END

IF ~~ THEN Ammo
SAY ~Oczywiscie. Ka¿dy sk³ad pomieœci 20000 pocisków. Zawartoœæ którego sk³adu chcesz obejrzeæ?~
IF ~~ THEN REPLY ~Strza³y.~ DO ~StartStore("AMMO1",LastTalkedToBy(Myself))~ EXIT
IF ~~ THEN REPLY ~Be³ty.~ DO ~StartStore("AMMO2",LastTalkedToBy(Myself))~ EXIT
IF ~~ THEN REPLY ~Pociski do procy.~ DO ~StartStore("AMMO3",LastTalkedToBy(Myself))~ EXIT
IF ~~ THEN REPLY ~Strza³ki do rzucania.~ DO ~StartStore("AMMO4",LastTalkedToBy(Myself))~ EXIT
IF ~~ THEN REPLY ~Potrzebujê jednak czegoœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Obecnie niczego nie potrzebuje.~ EXIT
END

IF ~~ THEN Magazyn
SAY ~Oczywiscie. Ka¿dy magazyn pomiesci 500 przedmiotów. Zawartoœæ którego magazynu chcesz obejrzeæ?~
IF ~Global("MAGAZYN1","GLOBAL",0)~ THEN REPLY ~Magazyn 1.~ DO ~StartStore("MAGAZYN1",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN1","GLOBAL",1)~ THEN REPLY ~Zbroje.~ DO ~StartStore("MAGAZYN1",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN1","GLOBAL",2)~ THEN REPLY ~Szaty maga.~ DO ~StartStore("MAGAZYN1",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN1","GLOBAL",3)~ THEN REPLY ~He³my.~ DO ~StartStore("MAGAZYN1",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN1","GLOBAL",4)~ THEN REPLY ~Zbroje i he³my.~ DO ~StartStore("MAGAZYN1",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN1","GLOBAL",5)~ THEN REPLY ~Tarcze.~ DO ~StartStore("MAGAZYN1",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN1","GLOBAL",6)~ THEN REPLY ~Zbroje, he³my i tarcze.~ DO ~StartStore("MAGAZYN1",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN1","GLOBAL",7)~ THEN REPLY ~Pasy, p³aszcze, buty i bransolety.~ DO ~StartStore("MAGAZYN1",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN1","GLOBAL",8)~ THEN REPLY ~Broñ strzelecka.~ DO ~StartStore("MAGAZYN1",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN1","GLOBAL",9)~ THEN REPLY ~Bron do walki wrêcz.~ DO ~StartStore("MAGAZYN1",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN1","GLOBAL",10)~ THEN REPLY ~Bronie niemagiczne.~ DO ~StartStore("MAGAZYN1",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN1","GLOBAL",11)~ THEN REPLY ~Magiczne zwoje.~ DO ~StartStore("MAGAZYN1",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN1","GLOBAL",12)~ THEN REPLY ~Mikstury.~ DO ~StartStore("MAGAZYN1",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN1","GLOBAL",13)~ THEN REPLY ~Bi¿uteria magiczna.~ DO ~StartStore("MAGAZYN1",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN1","GLOBAL",14)~ THEN REPLY ~Bi¿uteria zwyk³a.~ DO ~StartStore("MAGAZYN1",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN1","GLOBAL",15)~ THEN REPLY ~Drogie kamienie.~ DO ~StartStore("MAGAZYN1",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN1","GLOBAL",16)~ THEN REPLY ~Pami¹tki.~ DO ~StartStore("MAGAZYN1",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN1","GLOBAL",17)~ THEN REPLY ~Fragmenty broni.~ DO ~StartStore("MAGAZYN1",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN1","GLOBAL",18)~ THEN REPLY ~Ksi¹¿ki.~ DO ~StartStore("MAGAZYN1",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN1","GLOBAL",19)~ THEN REPLY ~Ró¿ne.~ DO ~StartStore("MAGAZYN1",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN2","GLOBAL",0)~ THEN REPLY ~Magazyn 2.~ DO ~StartStore("MAGAZYN2",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN2","GLOBAL",1)~ THEN REPLY ~Zbroje.~ DO ~StartStore("MAGAZYN2",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN2","GLOBAL",2)~ THEN REPLY ~Szaty maga.~ DO ~StartStore("MAGAZYN2",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN2","GLOBAL",3)~ THEN REPLY ~He³my.~ DO ~StartStore("MAGAZYN2",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN2","GLOBAL",4)~ THEN REPLY ~Zbroje i he³my.~ DO ~StartStore("MAGAZYN2",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN2","GLOBAL",5)~ THEN REPLY ~Tarcze.~ DO ~StartStore("MAGAZYN2",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN2","GLOBAL",6)~ THEN REPLY ~Zbroje, he³my i tarcze.~ DO ~StartStore("MAGAZYN2",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN2","GLOBAL",7)~ THEN REPLY ~Pasy, p³aszcze, buty i bransolety.~ DO ~StartStore("MAGAZYN2",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN2","GLOBAL",8)~ THEN REPLY ~Broñ strzelecka.~ DO ~StartStore("MAGAZYN2",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN2","GLOBAL",9)~ THEN REPLY ~Bron do walki wrêcz.~ DO ~StartStore("MAGAZYN2",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN2","GLOBAL",10)~ THEN REPLY ~Bronie niemagiczne.~ DO ~StartStore("MAGAZYN2",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN2","GLOBAL",11)~ THEN REPLY ~Magiczne zwoje.~ DO ~StartStore("MAGAZYN2",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN2","GLOBAL",12)~ THEN REPLY ~Mikstury.~ DO ~StartStore("MAGAZYN2",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN2","GLOBAL",13)~ THEN REPLY ~Bi¿uteria magiczna.~ DO ~StartStore("MAGAZYN2",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN2","GLOBAL",14)~ THEN REPLY ~Bi¿uteria zwyk³a.~ DO ~StartStore("MAGAZYN2",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN2","GLOBAL",15)~ THEN REPLY ~Drogie kamienie.~ DO ~StartStore("MAGAZYN2",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN2","GLOBAL",16)~ THEN REPLY ~Pami¹tki.~ DO ~StartStore("MAGAZYN2",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN2","GLOBAL",17)~ THEN REPLY ~Fragmenty broni.~ DO ~StartStore("MAGAZYN2",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN2","GLOBAL",18)~ THEN REPLY ~Ksi¹¿ki.~ DO ~StartStore("MAGAZYN2",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN2","GLOBAL",19)~ THEN REPLY ~Ró¿ne.~ DO ~StartStore("MAGAZYN2",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN3","GLOBAL",0)~ THEN REPLY ~Magazyn 3.~ DO ~StartStore("MAGAZYN3",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN3","GLOBAL",1)~ THEN REPLY ~Zbroje.~ DO ~StartStore("MAGAZYN3",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN3","GLOBAL",2)~ THEN REPLY ~Szaty maga.~ DO ~StartStore("MAGAZYN3",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN3","GLOBAL",3)~ THEN REPLY ~He³my.~ DO ~StartStore("MAGAZYN3",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN3","GLOBAL",4)~ THEN REPLY ~Zbroje i he³my.~ DO ~StartStore("MAGAZYN3",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN3","GLOBAL",5)~ THEN REPLY ~Tarcze.~ DO ~StartStore("MAGAZYN3",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN3","GLOBAL",6)~ THEN REPLY ~Zbroje, he³my i tarcze.~ DO ~StartStore("MAGAZYN3",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN3","GLOBAL",7)~ THEN REPLY ~Pasy, p³aszcze, buty i bransolety.~ DO ~StartStore("MAGAZYN3",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN3","GLOBAL",8)~ THEN REPLY ~Broñ strzelecka.~ DO ~StartStore("MAGAZYN3",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN3","GLOBAL",9)~ THEN REPLY ~Bron do walki wrêcz.~ DO ~StartStore("MAGAZYN3",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN3","GLOBAL",10)~ THEN REPLY ~Bronie niemagiczne.~ DO ~StartStore("MAGAZYN3",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN3","GLOBAL",11)~ THEN REPLY ~Magiczne zwoje.~ DO ~StartStore("MAGAZYN3",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN3","GLOBAL",12)~ THEN REPLY ~Mikstury.~ DO ~StartStore("MAGAZYN3",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN3","GLOBAL",13)~ THEN REPLY ~Bi¿uteria magiczna.~ DO ~StartStore("MAGAZYN3",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN3","GLOBAL",14)~ THEN REPLY ~Bi¿uteria zwyk³a.~ DO ~StartStore("MAGAZYN3",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN3","GLOBAL",15)~ THEN REPLY ~Drogie kamienie.~ DO ~StartStore("MAGAZYN3",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN3","GLOBAL",16)~ THEN REPLY ~Pami¹tki.~ DO ~StartStore("MAGAZYN3",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN3","GLOBAL",17)~ THEN REPLY ~Fragmenty broni.~ DO ~StartStore("MAGAZYN3",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN3","GLOBAL",18)~ THEN REPLY ~Ksi¹¿ki.~ DO ~StartStore("MAGAZYN3",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN3","GLOBAL",19)~ THEN REPLY ~Ró¿ne.~ DO ~StartStore("MAGAZYN3",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN4","GLOBAL",0)~ THEN REPLY ~Magazyn 4.~ DO ~StartStore("MAGAZYN4",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN4","GLOBAL",1)~ THEN REPLY ~Zbroje.~ DO ~StartStore("MAGAZYN4",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN4","GLOBAL",2)~ THEN REPLY ~Szaty maga.~ DO ~StartStore("MAGAZYN4",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN4","GLOBAL",3)~ THEN REPLY ~He³my.~ DO ~StartStore("MAGAZYN4",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN4","GLOBAL",4)~ THEN REPLY ~Zbroje i he³my.~ DO ~StartStore("MAGAZYN4",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN4","GLOBAL",5)~ THEN REPLY ~Tarcze.~ DO ~StartStore("MAGAZYN4",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN4","GLOBAL",6)~ THEN REPLY ~Zbroje, he³my i tarcze.~ DO ~StartStore("MAGAZYN4",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN4","GLOBAL",7)~ THEN REPLY ~Pasy, p³aszcze, buty i bransolety.~ DO ~StartStore("MAGAZYN4",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN4","GLOBAL",8)~ THEN REPLY ~Broñ strzelecka.~ DO ~StartStore("MAGAZYN4",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN4","GLOBAL",9)~ THEN REPLY ~Bron do walki wrêcz.~ DO ~StartStore("MAGAZYN4",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN4","GLOBAL",10)~ THEN REPLY ~Bronie niemagiczne.~ DO ~StartStore("MAGAZYN4",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN4","GLOBAL",11)~ THEN REPLY ~Magiczne zwoje.~ DO ~StartStore("MAGAZYN4",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN4","GLOBAL",12)~ THEN REPLY ~Mikstury.~ DO ~StartStore("MAGAZYN4",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN4","GLOBAL",13)~ THEN REPLY ~Bi¿uteria magiczna.~ DO ~StartStore("MAGAZYN4",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN4","GLOBAL",14)~ THEN REPLY ~Bi¿uteria zwyk³a.~ DO ~StartStore("MAGAZYN4",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN4","GLOBAL",15)~ THEN REPLY ~Drogie kamienie.~ DO ~StartStore("MAGAZYN4",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN4","GLOBAL",16)~ THEN REPLY ~Pami¹tki.~ DO ~StartStore("MAGAZYN4",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN4","GLOBAL",17)~ THEN REPLY ~Fragmenty broni.~ DO ~StartStore("MAGAZYN4",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN4","GLOBAL",18)~ THEN REPLY ~Ksi¹¿ki.~ DO ~StartStore("MAGAZYN4",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN4","GLOBAL",19)~ THEN REPLY ~Ró¿ne.~ DO ~StartStore("MAGAZYN4",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN5","GLOBAL",0)~ THEN REPLY ~Magazyn 5.~ DO ~StartStore("MAGAZYN5",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN5","GLOBAL",1)~ THEN REPLY ~Zbroje.~ DO ~StartStore("MAGAZYN5",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN5","GLOBAL",2)~ THEN REPLY ~Szaty maga.~ DO ~StartStore("MAGAZYN5",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN5","GLOBAL",3)~ THEN REPLY ~He³my.~ DO ~StartStore("MAGAZYN5",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN5","GLOBAL",4)~ THEN REPLY ~Zbroje i he³my.~ DO ~StartStore("MAGAZYN5",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN5","GLOBAL",5)~ THEN REPLY ~Tarcze.~ DO ~StartStore("MAGAZYN5",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN5","GLOBAL",6)~ THEN REPLY ~Zbroje, he³my i tarcze.~ DO ~StartStore("MAGAZYN5",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN5","GLOBAL",7)~ THEN REPLY ~Pasy, p³aszcze, buty i bransolety.~ DO ~StartStore("MAGAZYN5",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN5","GLOBAL",8)~ THEN REPLY ~Broñ strzelecka.~ DO ~StartStore("MAGAZYN5",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN5","GLOBAL",9)~ THEN REPLY ~Bron do walki wrêcz.~ DO ~StartStore("MAGAZYN5",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN5","GLOBAL",10)~ THEN REPLY ~Bronie niemagiczne.~ DO ~StartStore("MAGAZYN5",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN5","GLOBAL",11)~ THEN REPLY ~Magiczne zwoje.~ DO ~StartStore("MAGAZYN5",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN5","GLOBAL",12)~ THEN REPLY ~Mikstury.~ DO ~StartStore("MAGAZYN5",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN5","GLOBAL",13)~ THEN REPLY ~Bi¿uteria magiczna.~ DO ~StartStore("MAGAZYN5",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN5","GLOBAL",14)~ THEN REPLY ~Bi¿uteria zwyk³a.~ DO ~StartStore("MAGAZYN5",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN5","GLOBAL",15)~ THEN REPLY ~Drogie kamienie.~ DO ~StartStore("MAGAZYN5",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN5","GLOBAL",16)~ THEN REPLY ~Pami¹tki.~ DO ~StartStore("MAGAZYN5",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN5","GLOBAL",17)~ THEN REPLY ~Fragmenty broni.~ DO ~StartStore("MAGAZYN5",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN5","GLOBAL",18)~ THEN REPLY ~Ksi¹¿ki.~ DO ~StartStore("MAGAZYN5",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN5","GLOBAL",19)~ THEN REPLY ~Ró¿ne.~ DO ~StartStore("MAGAZYN5",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN6","GLOBAL",0)~ THEN REPLY ~Magazyn 6.~ DO ~StartStore("MAGAZYN6",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN6","GLOBAL",1)~ THEN REPLY ~Zbroje.~ DO ~StartStore("MAGAZYN6",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN6","GLOBAL",2)~ THEN REPLY ~Szaty maga.~ DO ~StartStore("MAGAZYN6",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN6","GLOBAL",3)~ THEN REPLY ~He³my.~ DO ~StartStore("MAGAZYN6",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN6","GLOBAL",4)~ THEN REPLY ~Zbroje i he³my.~ DO ~StartStore("MAGAZYN6",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN6","GLOBAL",5)~ THEN REPLY ~Tarcze.~ DO ~StartStore("MAGAZYN6",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN6","GLOBAL",6)~ THEN REPLY ~Zbroje, he³my i tarcze.~ DO ~StartStore("MAGAZYN6",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN6","GLOBAL",7)~ THEN REPLY ~Pasy, p³aszcze, buty i bransolety.~ DO ~StartStore("MAGAZYN6",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN6","GLOBAL",8)~ THEN REPLY ~Broñ strzelecka.~ DO ~StartStore("MAGAZYN6",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN6","GLOBAL",9)~ THEN REPLY ~Bron do walki wrêcz.~ DO ~StartStore("MAGAZYN6",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN6","GLOBAL",10)~ THEN REPLY ~Bronie niemagiczne.~ DO ~StartStore("MAGAZYN6",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN6","GLOBAL",11)~ THEN REPLY ~Magiczne zwoje.~ DO ~StartStore("MAGAZYN6",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN6","GLOBAL",12)~ THEN REPLY ~Mikstury.~ DO ~StartStore("MAGAZYN6",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN6","GLOBAL",13)~ THEN REPLY ~Bi¿uteria magiczna.~ DO ~StartStore("MAGAZYN6",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN6","GLOBAL",14)~ THEN REPLY ~Bi¿uteria zwyk³a.~ DO ~StartStore("MAGAZYN6",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN6","GLOBAL",15)~ THEN REPLY ~Drogie kamienie.~ DO ~StartStore("MAGAZYN6",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN6","GLOBAL",16)~ THEN REPLY ~Pami¹tki.~ DO ~StartStore("MAGAZYN6",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN6","GLOBAL",17)~ THEN REPLY ~Fragmenty broni.~ DO ~StartStore("MAGAZYN6",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN6","GLOBAL",18)~ THEN REPLY ~Ksi¹¿ki.~ DO ~StartStore("MAGAZYN6",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN6","GLOBAL",19)~ THEN REPLY ~Ró¿ne.~ DO ~StartStore("MAGAZYN6",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN7","GLOBAL",0)~ THEN REPLY ~Magazyn 7.~ DO ~StartStore("MAGAZYN7",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN7","GLOBAL",1)~ THEN REPLY ~Zbroje.~ DO ~StartStore("MAGAZYN7",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN7","GLOBAL",2)~ THEN REPLY ~Szaty maga.~ DO ~StartStore("MAGAZYN7",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN7","GLOBAL",3)~ THEN REPLY ~He³my.~ DO ~StartStore("MAGAZYN7",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN7","GLOBAL",4)~ THEN REPLY ~Zbroje i he³my.~ DO ~StartStore("MAGAZYN7",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN7","GLOBAL",5)~ THEN REPLY ~Tarcze.~ DO ~StartStore("MAGAZYN7",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN7","GLOBAL",6)~ THEN REPLY ~Zbroje, he³my i tarcze.~ DO ~StartStore("MAGAZYN7",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN7","GLOBAL",7)~ THEN REPLY ~Pasy, p³aszcze, buty i bransolety.~ DO ~StartStore("MAGAZYN7",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN7","GLOBAL",8)~ THEN REPLY ~Broñ strzelecka.~ DO ~StartStore("MAGAZYN7",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN7","GLOBAL",9)~ THEN REPLY ~Bron do walki wrêcz.~ DO ~StartStore("MAGAZYN7",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN7","GLOBAL",10)~ THEN REPLY ~Bronie niemagiczne.~ DO ~StartStore("MAGAZYN7",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN7","GLOBAL",11)~ THEN REPLY ~Magiczne zwoje.~ DO ~StartStore("MAGAZYN7",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN7","GLOBAL",12)~ THEN REPLY ~Mikstury.~ DO ~StartStore("MAGAZYN7",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN7","GLOBAL",13)~ THEN REPLY ~Bi¿uteria magiczna.~ DO ~StartStore("MAGAZYN7",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN7","GLOBAL",14)~ THEN REPLY ~Bi¿uteria zwyk³a.~ DO ~StartStore("MAGAZYN7",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN7","GLOBAL",15)~ THEN REPLY ~Drogie kamienie.~ DO ~StartStore("MAGAZYN7",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN7","GLOBAL",16)~ THEN REPLY ~Pami¹tki.~ DO ~StartStore("MAGAZYN7",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN7","GLOBAL",17)~ THEN REPLY ~Fragmenty broni.~ DO ~StartStore("MAGAZYN7",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN7","GLOBAL",18)~ THEN REPLY ~Ksi¹¿ki.~ DO ~StartStore("MAGAZYN7",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN7","GLOBAL",19)~ THEN REPLY ~Ró¿ne.~ DO ~StartStore("MAGAZYN7",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN8","GLOBAL",0)~ THEN REPLY ~Magazyn 8.~ DO ~StartStore("MAGAZYN8",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN8","GLOBAL",1)~ THEN REPLY ~Zbroje.~ DO ~StartStore("MAGAZYN8",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN8","GLOBAL",2)~ THEN REPLY ~Szaty maga.~ DO ~StartStore("MAGAZYN8",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN8","GLOBAL",3)~ THEN REPLY ~He³my.~ DO ~StartStore("MAGAZYN8",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN8","GLOBAL",4)~ THEN REPLY ~Zbroje i he³my.~ DO ~StartStore("MAGAZYN8",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN8","GLOBAL",5)~ THEN REPLY ~Tarcze.~ DO ~StartStore("MAGAZYN8",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN8","GLOBAL",6)~ THEN REPLY ~Zbroje, he³my i tarcze.~ DO ~StartStore("MAGAZYN8",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN8","GLOBAL",7)~ THEN REPLY ~Pasy, p³aszcze, buty i bransolety.~ DO ~StartStore("MAGAZYN8",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN8","GLOBAL",8)~ THEN REPLY ~Broñ strzelecka.~ DO ~StartStore("MAGAZYN8",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN8","GLOBAL",9)~ THEN REPLY ~Bron do walki wrêcz.~ DO ~StartStore("MAGAZYN8",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN8","GLOBAL",10)~ THEN REPLY ~Bronie niemagiczne.~ DO ~StartStore("MAGAZYN8",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN8","GLOBAL",11)~ THEN REPLY ~Magiczne zwoje.~ DO ~StartStore("MAGAZYN8",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN8","GLOBAL",12)~ THEN REPLY ~Mikstury.~ DO ~StartStore("MAGAZYN8",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN8","GLOBAL",13)~ THEN REPLY ~Bi¿uteria magiczna.~ DO ~StartStore("MAGAZYN8",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN8","GLOBAL",14)~ THEN REPLY ~Bi¿uteria zwyk³a.~ DO ~StartStore("MAGAZYN8",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN8","GLOBAL",15)~ THEN REPLY ~Drogie kamienie.~ DO ~StartStore("MAGAZYN8",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN8","GLOBAL",16)~ THEN REPLY ~Pami¹tki.~ DO ~StartStore("MAGAZYN8",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN8","GLOBAL",17)~ THEN REPLY ~Fragmenty broni.~ DO ~StartStore("MAGAZYN8",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN8","GLOBAL",18)~ THEN REPLY ~Ksi¹¿ki.~ DO ~StartStore("MAGAZYN8",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN8","GLOBAL",19)~ THEN REPLY ~Ró¿ne.~ DO ~StartStore("MAGAZYN8",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN9","GLOBAL",0)~ THEN REPLY ~Magazyn 9.~ DO ~StartStore("MAGAZYN9",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN9","GLOBAL",1)~ THEN REPLY ~Zbroje.~ DO ~StartStore("MAGAZYN9",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN9","GLOBAL",2)~ THEN REPLY ~Szaty maga.~ DO ~StartStore("MAGAZYN9",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN9","GLOBAL",3)~ THEN REPLY ~He³my.~ DO ~StartStore("MAGAZYN9",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN9","GLOBAL",4)~ THEN REPLY ~Zbroje i he³my.~ DO ~StartStore("MAGAZYN9",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN9","GLOBAL",5)~ THEN REPLY ~Tarcze.~ DO ~StartStore("MAGAZYN9",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN9","GLOBAL",6)~ THEN REPLY ~Zbroje, he³my i tarcze.~ DO ~StartStore("MAGAZYN9",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN9","GLOBAL",7)~ THEN REPLY ~Pasy, p³aszcze, buty i bransolety.~ DO ~StartStore("MAGAZYN9",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN9","GLOBAL",8)~ THEN REPLY ~Broñ strzelecka.~ DO ~StartStore("MAGAZYN9",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN9","GLOBAL",9)~ THEN REPLY ~Bron do walki wrêcz.~ DO ~StartStore("MAGAZYN9",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN9","GLOBAL",10)~ THEN REPLY ~Bronie niemagiczne.~ DO ~StartStore("MAGAZYN9",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN9","GLOBAL",11)~ THEN REPLY ~Magiczne zwoje.~ DO ~StartStore("MAGAZYN9",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN9","GLOBAL",12)~ THEN REPLY ~Mikstury.~ DO ~StartStore("MAGAZYN9",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN9","GLOBAL",13)~ THEN REPLY ~Bi¿uteria magiczna.~ DO ~StartStore("MAGAZYN9",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN9","GLOBAL",14)~ THEN REPLY ~Bi¿uteria zwyk³a.~ DO ~StartStore("MAGAZYN9",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN9","GLOBAL",15)~ THEN REPLY ~Drogie kamienie.~ DO ~StartStore("MAGAZYN9",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN9","GLOBAL",16)~ THEN REPLY ~Pami¹tki.~ DO ~StartStore("MAGAZYN9",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN9","GLOBAL",17)~ THEN REPLY ~Fragmenty broni.~ DO ~StartStore("MAGAZYN9",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN9","GLOBAL",18)~ THEN REPLY ~Ksi¹¿ki.~ DO ~StartStore("MAGAZYN9",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN9","GLOBAL",19)~ THEN REPLY ~Ró¿ne.~ DO ~StartStore("MAGAZYN9",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN0","GLOBAL",0)~ THEN REPLY ~Magazyn 10.~ DO ~StartStore("MAGAZYN0",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN0","GLOBAL",1)~ THEN REPLY ~Zbroje.~ DO ~StartStore("MAGAZYN0",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN0","GLOBAL",2)~ THEN REPLY ~Szaty maga.~ DO ~StartStore("MAGAZYN0",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN0","GLOBAL",3)~ THEN REPLY ~He³my.~ DO ~StartStore("MAGAZYN0",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN0","GLOBAL",4)~ THEN REPLY ~Zbroje i he³my.~ DO ~StartStore("MAGAZYN0",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN0","GLOBAL",5)~ THEN REPLY ~Tarcze.~ DO ~StartStore("MAGAZYN0",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN0","GLOBAL",6)~ THEN REPLY ~Zbroje, he³my i tarcze.~ DO ~StartStore("MAGAZYN0",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN0","GLOBAL",7)~ THEN REPLY ~Pasy, p³aszcze, buty i bransolety.~ DO ~StartStore("MAGAZYN0",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN0","GLOBAL",8)~ THEN REPLY ~Broñ strzelecka.~ DO ~StartStore("MAGAZYN0",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN0","GLOBAL",9)~ THEN REPLY ~Bron do walki wrêcz.~ DO ~StartStore("MAGAZYN0",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN0","GLOBAL",10)~ THEN REPLY ~Bronie niemagiczne.~ DO ~StartStore("MAGAZYN0",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN0","GLOBAL",11)~ THEN REPLY ~Magiczne zwoje.~ DO ~StartStore("MAGAZYN0",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN0","GLOBAL",12)~ THEN REPLY ~Mikstury.~ DO ~StartStore("MAGAZYN0",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN0","GLOBAL",13)~ THEN REPLY ~Bi¿uteria magiczna.~ DO ~StartStore("MAGAZYN0",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN0","GLOBAL",14)~ THEN REPLY ~Bi¿uteria zwyk³a.~ DO ~StartStore("MAGAZYN0",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN0","GLOBAL",15)~ THEN REPLY ~Drogie kamienie.~ DO ~StartStore("MAGAZYN0",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN0","GLOBAL",16)~ THEN REPLY ~Pami¹tki.~ DO ~StartStore("MAGAZYN0",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN0","GLOBAL",17)~ THEN REPLY ~Fragmenty broni.~ DO ~StartStore("MAGAZYN0",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN0","GLOBAL",18)~ THEN REPLY ~Ksi¹¿ki.~ DO ~StartStore("MAGAZYN0",LastTalkedToBy(Myself))~ EXIT
IF ~Global("MAGAZYN0","GLOBAL",19)~ THEN REPLY ~Ró¿ne.~ DO ~StartStore("MAGAZYN0",LastTalkedToBy(Myself))~ EXIT
IF ~~ THEN REPLY ~Potrzebujê jednak czegoœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Obecnie niczego nie potrzebuje.~ EXIT
END

IF ~~ THEN BEGIN Etykiety
SAY ~Etykietê którego magazynu chcesz zmieniæ?~
IF ~~ THEN REPLY ~Magazynu 1.~ GOTO MAGAZYN1
IF ~~ THEN REPLY ~Magazynu 2.~ GOTO MAGAZYN2
IF ~~ THEN REPLY ~Magazynu 3.~ GOTO MAGAZYN3
IF ~~ THEN REPLY ~Magazynu 4.~ GOTO MAGAZYN4
IF ~~ THEN REPLY ~Magazynu 5.~ GOTO MAGAZYN5
IF ~~ THEN REPLY ~Magazynu 6.~ GOTO MAGAZYN6
IF ~~ THEN REPLY ~Magazynu 7.~ GOTO MAGAZYN7
IF ~~ THEN REPLY ~Magazynu 8.~ GOTO MAGAZYN8
IF ~~ THEN REPLY ~Magazynu 9.~ GOTO MAGAZYN9
IF ~~ THEN REPLY ~Magazynu 10.~ GOTO MAGAZYN0
IF ~~ THEN REPLY ~Potrzebujê czegoœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~To ju¿ wszystko. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN MAGAZYN0
SAY ~Jak ma brzemieæ etykieta?~
IF ~!Global("MAGAZYN0","GLOBAL",0)~ THEN REPLY ~Magazyn 10.~ DO ~SetGlobal("MAGAZYN0","GLOBAL",0)~ GOTO Etykiety
IF ~!Global("MAGAZYN0","GLOBAL",1)~ THEN REPLY ~Zbroje.~ DO ~SetGlobal("MAGAZYN0","GLOBAL",1)~ GOTO Etykiety
IF ~!Global("MAGAZYN0","GLOBAL",2)~ THEN REPLY ~Szaty maga.~ DO ~SetGlobal("MAGAZYN0","GLOBAL",2)~ GOTO Etykiety
IF ~!Global("MAGAZYN0","GLOBAL",3)~ THEN REPLY ~He³my.~ DO ~SetGlobal("MAGAZYN0","GLOBAL",3)~ GOTO Etykiety
IF ~!Global("MAGAZYN0","GLOBAL",4)~ THEN REPLY ~Zbroje i he³my.~ DO ~SetGlobal("MAGAZYN0","GLOBAL",4)~ GOTO Etykiety
IF ~!Global("MAGAZYN0","GLOBAL",5)~ THEN REPLY ~Tarcze.~ DO ~SetGlobal("MAGAZYN0","GLOBAL",5)~ GOTO Etykiety
IF ~!Global("MAGAZYN0","GLOBAL",6)~ THEN REPLY ~Zbroje, he³my i tarcze.~ DO ~SetGlobal("MAGAZYN0","GLOBAL",6)~ GOTO Etykiety
IF ~!Global("MAGAZYN0","GLOBAL",7)~ THEN REPLY ~Pasy, p³aszcze, buty i bransolety.~ DO ~SetGlobal("MAGAZYN0","GLOBAL",7)~ GOTO Etykiety
IF ~!Global("MAGAZYN0","GLOBAL",8)~ THEN REPLY ~Broñ strzelecka.~ DO ~SetGlobal("MAGAZYN0","GLOBAL",8)~ GOTO Etykiety
IF ~!Global("MAGAZYN0","GLOBAL",9)~ THEN REPLY ~Bron do walki wrêcz.~ DO ~SetGlobal("MAGAZYN0","GLOBAL",9)~ GOTO Etykiety
IF ~!Global("MAGAZYN0","GLOBAL",10)~ THEN REPLY ~Bronie niemagiczne.~ DO ~SetGlobal("MAGAZYN0","GLOBAL",10)~ GOTO Etykiety
IF ~!Global("MAGAZYN0","GLOBAL",11)~ THEN REPLY ~Magiczne zwoje.~ DO ~SetGlobal("MAGAZYN0","GLOBAL",11)~ GOTO Etykiety
IF ~!Global("MAGAZYN0","GLOBAL",12)~ THEN REPLY ~Mikstury.~ DO ~SetGlobal("MAGAZYN0","GLOBAL",12)~ GOTO Etykiety
IF ~!Global("MAGAZYN0","GLOBAL",13)~ THEN REPLY ~Bi¿uteria magiczna.~ DO ~SetGlobal("MAGAZYN0","GLOBAL",13)~ GOTO Etykiety
IF ~!Global("MAGAZYN0","GLOBAL",14)~ THEN REPLY ~Bi¿uteria zwyk³a.~ DO ~SetGlobal("MAGAZYN0","GLOBAL",14)~ GOTO Etykiety
IF ~!Global("MAGAZYN0","GLOBAL",15)~ THEN REPLY ~Drogie kamienie.~DO ~SetGlobal("MAGAZYN0","GLOBAL",15)~ GOTO Etykiety
IF ~!Global("MAGAZYN0","GLOBAL",16)~ THEN REPLY ~Pami¹tki.~ DO ~SetGlobal("MAGAZYN0","GLOBAL",16)~ GOTO Etykiety
IF ~!Global("MAGAZYN0","GLOBAL",17)~ THEN REPLY ~Fragmenty broni.~ DO ~SetGlobal("MAGAZYN0","GLOBAL",17)~ GOTO Etykiety
IF ~!Global("MAGAZYN0","GLOBAL",18)~ THEN REPLY ~Ksi¹¿ki.~ DO ~SetGlobal("MAGAZYN0","GLOBAL",18)~ GOTO Etykiety
IF ~!Global("MAGAZYN0","GLOBAL",19)~ THEN REPLY ~Ró¿ne.~ DO ~SetGlobal("MAGAZYN0","GLOBAL",19)~ GOTO Etykiety
IF ~~ THEN REPLY ~Chcê zmieniæ inn¹ etykietê.~ GOTO Etykiety
IF ~~ THEN REPLY ~Potrzebujê jednak czegoœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Tak jest dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN MAGAZYN1
SAY ~Jak ma brzemieæ etykieta?~
IF ~!Global("MAGAZYN1","GLOBAL",0)~ THEN REPLY ~Magazyn 1.~ DO ~SetGlobal("MAGAZYN1","GLOBAL",0)~ GOTO Etykiety
IF ~!Global("MAGAZYN1","GLOBAL",1)~ THEN REPLY ~Zbroje.~ DO ~SetGlobal("MAGAZYN1","GLOBAL",1)~ GOTO Etykiety
IF ~!Global("MAGAZYN1","GLOBAL",2)~ THEN REPLY ~Szaty maga.~ DO ~SetGlobal("MAGAZYN1","GLOBAL",2)~ GOTO Etykiety
IF ~!Global("MAGAZYN1","GLOBAL",3)~ THEN REPLY ~He³my.~ DO ~SetGlobal("MAGAZYN1","GLOBAL",3)~ GOTO Etykiety
IF ~!Global("MAGAZYN1","GLOBAL",4)~ THEN REPLY ~Zbroje i he³my.~ DO ~SetGlobal("MAGAZYN1","GLOBAL",4)~ GOTO Etykiety
IF ~!Global("MAGAZYN1","GLOBAL",5)~ THEN REPLY ~Tarcze.~ DO ~SetGlobal("MAGAZYN1","GLOBAL",5)~ GOTO Etykiety
IF ~!Global("MAGAZYN1","GLOBAL",6)~ THEN REPLY ~Zbroje, he³my i tarcze.~ DO ~SetGlobal("MAGAZYN1","GLOBAL",6)~ GOTO Etykiety
IF ~!Global("MAGAZYN1","GLOBAL",7)~ THEN REPLY ~Pasy, p³aszcze, buty i bransolety.~ DO ~SetGlobal("MAGAZYN1","GLOBAL",7)~ GOTO Etykiety
IF ~!Global("MAGAZYN1","GLOBAL",8)~ THEN REPLY ~Broñ strzelecka.~ DO ~SetGlobal("MAGAZYN1","GLOBAL",8)~ GOTO Etykiety
IF ~!Global("MAGAZYN1","GLOBAL",9)~ THEN REPLY ~Bron do walki wrêcz.~ DO ~SetGlobal("MAGAZYN1","GLOBAL",9)~ GOTO Etykiety
IF ~!Global("MAGAZYN1","GLOBAL",10)~ THEN REPLY ~Bronie niemagiczne.~ DO ~SetGlobal("MAGAZYN1","GLOBAL",10)~ GOTO Etykiety
IF ~!Global("MAGAZYN1","GLOBAL",11)~ THEN REPLY ~Magiczne zwoje.~ DO ~SetGlobal("MAGAZYN1","GLOBAL",11)~ GOTO Etykiety
IF ~!Global("MAGAZYN1","GLOBAL",12)~ THEN REPLY ~Mikstury.~ DO ~SetGlobal("MAGAZYN1","GLOBAL",12)~ GOTO Etykiety
IF ~!Global("MAGAZYN1","GLOBAL",13)~ THEN REPLY ~Bi¿uteria magiczna.~ DO ~SetGlobal("MAGAZYN1","GLOBAL",13)~ GOTO Etykiety
IF ~!Global("MAGAZYN1","GLOBAL",14)~ THEN REPLY ~Bi¿uteria zwyk³a.~ DO ~SetGlobal("MAGAZYN1","GLOBAL",14)~ GOTO Etykiety
IF ~!Global("MAGAZYN1","GLOBAL",15)~ THEN REPLY ~Drogie kamienie.~DO ~SetGlobal("MAGAZYN1","GLOBAL",15)~ GOTO Etykiety
IF ~!Global("MAGAZYN1","GLOBAL",16)~ THEN REPLY ~Pami¹tki.~ DO ~SetGlobal("MAGAZYN1","GLOBAL",16)~ GOTO Etykiety
IF ~!Global("MAGAZYN1","GLOBAL",17)~ THEN REPLY ~Fragmenty broni.~ DO ~SetGlobal("MAGAZYN1","GLOBAL",17)~ GOTO Etykiety
IF ~!Global("MAGAZYN1","GLOBAL",18)~ THEN REPLY ~Ksi¹¿ki.~ DO ~SetGlobal("MAGAZYN1","GLOBAL",18)~ GOTO Etykiety
IF ~!Global("MAGAZYN1","GLOBAL",19)~ THEN REPLY ~Ró¿ne.~ DO ~SetGlobal("MAGAZYN1","GLOBAL",19)~ GOTO Etykiety
IF ~~ THEN REPLY ~Chcê zmieniæ inn¹ etykietê.~ GOTO Etykiety
IF ~~ THEN REPLY ~Potrzebujê jednak czegoœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Tak jest dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN MAGAZYN2
SAY ~Jak ma brzemieæ etykieta?~
IF ~!Global("MAGAZYN2","GLOBAL",0)~ THEN REPLY ~Magazyn 2.~ DO ~SetGlobal("MAGAZYN2","GLOBAL",0)~ GOTO Etykiety
IF ~!Global("MAGAZYN2","GLOBAL",1)~ THEN REPLY ~Zbroje.~ DO ~SetGlobal("MAGAZYN2","GLOBAL",1)~ GOTO Etykiety
IF ~!Global("MAGAZYN2","GLOBAL",2)~ THEN REPLY ~Szaty maga.~ DO ~SetGlobal("MAGAZYN2","GLOBAL",2)~ GOTO Etykiety
IF ~!Global("MAGAZYN2","GLOBAL",3)~ THEN REPLY ~He³my.~ DO ~SetGlobal("MAGAZYN2","GLOBAL",3)~ GOTO Etykiety
IF ~!Global("MAGAZYN2","GLOBAL",4)~ THEN REPLY ~Zbroje i he³my.~ DO ~SetGlobal("MAGAZYN2","GLOBAL",4)~ GOTO Etykiety
IF ~!Global("MAGAZYN2","GLOBAL",5)~ THEN REPLY ~Tarcze.~ DO ~SetGlobal("MAGAZYN2","GLOBAL",5)~ GOTO Etykiety
IF ~!Global("MAGAZYN2","GLOBAL",6)~ THEN REPLY ~Zbroje, he³my i tarcze.~ DO ~SetGlobal("MAGAZYN2","GLOBAL",6)~ GOTO Etykiety
IF ~!Global("MAGAZYN2","GLOBAL",7)~ THEN REPLY ~Pasy, p³aszcze, buty i bransolety.~ DO ~SetGlobal("MAGAZYN2","GLOBAL",7)~ GOTO Etykiety
IF ~!Global("MAGAZYN2","GLOBAL",8)~ THEN REPLY ~Broñ strzelecka.~ DO ~SetGlobal("MAGAZYN2","GLOBAL",8)~ GOTO Etykiety
IF ~!Global("MAGAZYN2","GLOBAL",9)~ THEN REPLY ~Bron do walki wrêcz.~ DO ~SetGlobal("MAGAZYN2","GLOBAL",9)~ GOTO Etykiety
IF ~!Global("MAGAZYN2","GLOBAL",10)~ THEN REPLY ~Bronie niemagiczne.~ DO ~SetGlobal("MAGAZYN2","GLOBAL",10)~ GOTO Etykiety
IF ~!Global("MAGAZYN2","GLOBAL",11)~ THEN REPLY ~Magiczne zwoje.~ DO ~SetGlobal("MAGAZYN2","GLOBAL",11)~ GOTO Etykiety
IF ~!Global("MAGAZYN2","GLOBAL",12)~ THEN REPLY ~Mikstury.~ DO ~SetGlobal("MAGAZYN2","GLOBAL",12)~ GOTO Etykiety
IF ~!Global("MAGAZYN2","GLOBAL",13)~ THEN REPLY ~Bi¿uteria magiczna.~ DO ~SetGlobal("MAGAZYN2","GLOBAL",13)~ GOTO Etykiety
IF ~!Global("MAGAZYN2","GLOBAL",14)~ THEN REPLY ~Bi¿uteria zwyk³a.~ DO ~SetGlobal("MAGAZYN2","GLOBAL",14)~ GOTO Etykiety
IF ~!Global("MAGAZYN2","GLOBAL",15)~ THEN REPLY ~Drogie kamienie.~DO ~SetGlobal("MAGAZYN2","GLOBAL",15)~ GOTO Etykiety
IF ~!Global("MAGAZYN2","GLOBAL",16)~ THEN REPLY ~Pami¹tki.~ DO ~SetGlobal("MAGAZYN2","GLOBAL",16)~ GOTO Etykiety
IF ~!Global("MAGAZYN2","GLOBAL",17)~ THEN REPLY ~Fragmenty broni.~ DO ~SetGlobal("MAGAZYN2","GLOBAL",17)~ GOTO Etykiety
IF ~!Global("MAGAZYN2","GLOBAL",18)~ THEN REPLY ~Ksi¹¿ki.~ DO ~SetGlobal("MAGAZYN2","GLOBAL",18)~ GOTO Etykiety
IF ~!Global("MAGAZYN2","GLOBAL",19)~ THEN REPLY ~Ró¿ne.~ DO ~SetGlobal("MAGAZYN2","GLOBAL",19)~ GOTO Etykiety
IF ~~ THEN REPLY ~Chcê zmieniæ inn¹ etykietê.~ GOTO Etykiety
IF ~~ THEN REPLY ~Potrzebujê jednak czegoœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Tak jest dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN MAGAZYN3
SAY ~Jak ma brzemieæ etykieta?~
IF ~!Global("MAGAZYN3","GLOBAL",0)~ THEN REPLY ~Magazyn 3.~ DO ~SetGlobal("MAGAZYN3","GLOBAL",0)~ GOTO Etykiety
IF ~!Global("MAGAZYN3","GLOBAL",1)~ THEN REPLY ~Zbroje.~ DO ~SetGlobal("MAGAZYN3","GLOBAL",1)~ GOTO Etykiety
IF ~!Global("MAGAZYN3","GLOBAL",2)~ THEN REPLY ~Szaty maga.~ DO ~SetGlobal("MAGAZYN3","GLOBAL",2)~ GOTO Etykiety
IF ~!Global("MAGAZYN3","GLOBAL",3)~ THEN REPLY ~He³my.~ DO ~SetGlobal("MAGAZYN3","GLOBAL",3)~ GOTO Etykiety
IF ~!Global("MAGAZYN3","GLOBAL",4)~ THEN REPLY ~Zbroje i he³my.~ DO ~SetGlobal("MAGAZYN3","GLOBAL",4)~ GOTO Etykiety
IF ~!Global("MAGAZYN3","GLOBAL",5)~ THEN REPLY ~Tarcze.~ DO ~SetGlobal("MAGAZYN3","GLOBAL",5)~ GOTO Etykiety
IF ~!Global("MAGAZYN3","GLOBAL",6)~ THEN REPLY ~Zbroje, he³my i tarcze.~ DO ~SetGlobal("MAGAZYN3","GLOBAL",6)~ GOTO Etykiety
IF ~!Global("MAGAZYN3","GLOBAL",7)~ THEN REPLY ~Pasy, p³aszcze, buty i bransolety.~ DO ~SetGlobal("MAGAZYN3","GLOBAL",7)~ GOTO Etykiety
IF ~!Global("MAGAZYN3","GLOBAL",8)~ THEN REPLY ~Broñ strzelecka.~ DO ~SetGlobal("MAGAZYN3","GLOBAL",8)~ GOTO Etykiety
IF ~!Global("MAGAZYN3","GLOBAL",9)~ THEN REPLY ~Bron do walki wrêcz.~ DO ~SetGlobal("MAGAZYN3","GLOBAL",9)~ GOTO Etykiety
IF ~!Global("MAGAZYN3","GLOBAL",10)~ THEN REPLY ~Bronie niemagiczne.~ DO ~SetGlobal("MAGAZYN3","GLOBAL",10)~ GOTO Etykiety
IF ~!Global("MAGAZYN3","GLOBAL",11)~ THEN REPLY ~Magiczne zwoje.~ DO ~SetGlobal("MAGAZYN3","GLOBAL",11)~ GOTO Etykiety
IF ~!Global("MAGAZYN3","GLOBAL",12)~ THEN REPLY ~Mikstury.~ DO ~SetGlobal("MAGAZYN3","GLOBAL",12)~ GOTO Etykiety
IF ~!Global("MAGAZYN3","GLOBAL",13)~ THEN REPLY ~Bi¿uteria magiczna.~ DO ~SetGlobal("MAGAZYN3","GLOBAL",13)~ GOTO Etykiety
IF ~!Global("MAGAZYN3","GLOBAL",14)~ THEN REPLY ~Bi¿uteria zwyk³a.~ DO ~SetGlobal("MAGAZYN3","GLOBAL",14)~ GOTO Etykiety
IF ~!Global("MAGAZYN3","GLOBAL",15)~ THEN REPLY ~Drogie kamienie.~DO ~SetGlobal("MAGAZYN3","GLOBAL",15)~ GOTO Etykiety
IF ~!Global("MAGAZYN3","GLOBAL",16)~ THEN REPLY ~Pami¹tki.~ DO ~SetGlobal("MAGAZYN3","GLOBAL",16)~ GOTO Etykiety
IF ~!Global("MAGAZYN3","GLOBAL",17)~ THEN REPLY ~Fragmenty broni.~ DO ~SetGlobal("MAGAZYN3","GLOBAL",17)~ GOTO Etykiety
IF ~!Global("MAGAZYN3","GLOBAL",18)~ THEN REPLY ~Ksi¹¿ki.~ DO ~SetGlobal("MAGAZYN3","GLOBAL",18)~ GOTO Etykiety
IF ~!Global("MAGAZYN3","GLOBAL",19)~ THEN REPLY ~Ró¿ne.~ DO ~SetGlobal("MAGAZYN3","GLOBAL",19)~ GOTO Etykiety
IF ~~ THEN REPLY ~Chcê zmieniæ inn¹ etykietê.~ GOTO Etykiety
IF ~~ THEN REPLY ~Potrzebujê jednak czegoœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Tak jest dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN MAGAZYN4
SAY ~Jak ma brzemieæ etykieta?~
IF ~!Global("MAGAZYN4","GLOBAL",0)~ THEN REPLY ~Magazyn 4.~ DO ~SetGlobal("MAGAZYN4","GLOBAL",0)~ GOTO Etykiety
IF ~!Global("MAGAZYN4","GLOBAL",1)~ THEN REPLY ~Zbroje.~ DO ~SetGlobal("MAGAZYN4","GLOBAL",1)~ GOTO Etykiety
IF ~!Global("MAGAZYN4","GLOBAL",2)~ THEN REPLY ~Szaty maga.~ DO ~SetGlobal("MAGAZYN4","GLOBAL",2)~ GOTO Etykiety
IF ~!Global("MAGAZYN4","GLOBAL",3)~ THEN REPLY ~He³my.~ DO ~SetGlobal("MAGAZYN4","GLOBAL",3)~ GOTO Etykiety
IF ~!Global("MAGAZYN4","GLOBAL",4)~ THEN REPLY ~Zbroje i he³my.~ DO ~SetGlobal("MAGAZYN4","GLOBAL",4)~ GOTO Etykiety
IF ~!Global("MAGAZYN4","GLOBAL",5)~ THEN REPLY ~Tarcze.~ DO ~SetGlobal("MAGAZYN4","GLOBAL",5)~ GOTO Etykiety
IF ~!Global("MAGAZYN4","GLOBAL",6)~ THEN REPLY ~Zbroje, he³my i tarcze.~ DO ~SetGlobal("MAGAZYN4","GLOBAL",6)~ GOTO Etykiety
IF ~!Global("MAGAZYN4","GLOBAL",7)~ THEN REPLY ~Pasy, p³aszcze, buty i bransolety.~ DO ~SetGlobal("MAGAZYN4","GLOBAL",7)~ GOTO Etykiety
IF ~!Global("MAGAZYN4","GLOBAL",8)~ THEN REPLY ~Broñ strzelecka.~ DO ~SetGlobal("MAGAZYN4","GLOBAL",8)~ GOTO Etykiety
IF ~!Global("MAGAZYN4","GLOBAL",9)~ THEN REPLY ~Bron do walki wrêcz.~ DO ~SetGlobal("MAGAZYN4","GLOBAL",9)~ GOTO Etykiety
IF ~!Global("MAGAZYN4","GLOBAL",10)~ THEN REPLY ~Bronie niemagiczne.~ DO ~SetGlobal("MAGAZYN4","GLOBAL",10)~ GOTO Etykiety
IF ~!Global("MAGAZYN4","GLOBAL",11)~ THEN REPLY ~Magiczne zwoje.~ DO ~SetGlobal("MAGAZYN4","GLOBAL",11)~ GOTO Etykiety
IF ~!Global("MAGAZYN4","GLOBAL",12)~ THEN REPLY ~Mikstury.~ DO ~SetGlobal("MAGAZYN4","GLOBAL",12)~ GOTO Etykiety
IF ~!Global("MAGAZYN4","GLOBAL",13)~ THEN REPLY ~Bi¿uteria magiczna.~ DO ~SetGlobal("MAGAZYN4","GLOBAL",13)~ GOTO Etykiety
IF ~!Global("MAGAZYN4","GLOBAL",14)~ THEN REPLY ~Bi¿uteria zwyk³a.~ DO ~SetGlobal("MAGAZYN4","GLOBAL",14)~ GOTO Etykiety
IF ~!Global("MAGAZYN4","GLOBAL",15)~ THEN REPLY ~Drogie kamienie.~DO ~SetGlobal("MAGAZYN4","GLOBAL",15)~ GOTO Etykiety
IF ~!Global("MAGAZYN4","GLOBAL",16)~ THEN REPLY ~Pami¹tki.~ DO ~SetGlobal("MAGAZYN4","GLOBAL",16)~ GOTO Etykiety
IF ~!Global("MAGAZYN4","GLOBAL",17)~ THEN REPLY ~Fragmenty broni.~ DO ~SetGlobal("MAGAZYN4","GLOBAL",17)~ GOTO Etykiety
IF ~!Global("MAGAZYN4","GLOBAL",18)~ THEN REPLY ~Ksi¹¿ki.~ DO ~SetGlobal("MAGAZYN4","GLOBAL",18)~ GOTO Etykiety
IF ~!Global("MAGAZYN4","GLOBAL",19)~ THEN REPLY ~Ró¿ne.~ DO ~SetGlobal("MAGAZYN4","GLOBAL",19)~ GOTO Etykiety
IF ~~ THEN REPLY ~Chcê zmieniæ inn¹ etykietê.~ GOTO Etykiety
IF ~~ THEN REPLY ~Potrzebujê jednak czegoœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Tak jest dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN MAGAZYN5
SAY ~Jak ma brzemieæ etykieta?~
IF ~!Global("MAGAZYN5","GLOBAL",0)~ THEN REPLY ~Magazyn 5.~ DO ~SetGlobal("MAGAZYN5","GLOBAL",0)~ GOTO Etykiety
IF ~!Global("MAGAZYN5","GLOBAL",1)~ THEN REPLY ~Zbroje.~ DO ~SetGlobal("MAGAZYN5","GLOBAL",1)~ GOTO Etykiety
IF ~!Global("MAGAZYN5","GLOBAL",2)~ THEN REPLY ~Szaty maga.~ DO ~SetGlobal("MAGAZYN5","GLOBAL",2)~ GOTO Etykiety
IF ~!Global("MAGAZYN5","GLOBAL",3)~ THEN REPLY ~He³my.~ DO ~SetGlobal("MAGAZYN5","GLOBAL",3)~ GOTO Etykiety
IF ~!Global("MAGAZYN5","GLOBAL",4)~ THEN REPLY ~Zbroje i he³my.~ DO ~SetGlobal("MAGAZYN5","GLOBAL",4)~ GOTO Etykiety
IF ~!Global("MAGAZYN5","GLOBAL",5)~ THEN REPLY ~Tarcze.~ DO ~SetGlobal("MAGAZYN5","GLOBAL",5)~ GOTO Etykiety
IF ~!Global("MAGAZYN5","GLOBAL",6)~ THEN REPLY ~Zbroje, he³my i tarcze.~ DO ~SetGlobal("MAGAZYN5","GLOBAL",6)~ GOTO Etykiety
IF ~!Global("MAGAZYN5","GLOBAL",7)~ THEN REPLY ~Pasy, p³aszcze, buty i bransolety.~ DO ~SetGlobal("MAGAZYN5","GLOBAL",7)~ GOTO Etykiety
IF ~!Global("MAGAZYN5","GLOBAL",8)~ THEN REPLY ~Broñ strzelecka.~ DO ~SetGlobal("MAGAZYN5","GLOBAL",8)~ GOTO Etykiety
IF ~!Global("MAGAZYN5","GLOBAL",9)~ THEN REPLY ~Bron do walki wrêcz.~ DO ~SetGlobal("MAGAZYN5","GLOBAL",9)~ GOTO Etykiety
IF ~!Global("MAGAZYN5","GLOBAL",10)~ THEN REPLY ~Bronie niemagiczne.~ DO ~SetGlobal("MAGAZYN5","GLOBAL",10)~ GOTO Etykiety
IF ~!Global("MAGAZYN5","GLOBAL",11)~ THEN REPLY ~Magiczne zwoje.~ DO ~SetGlobal("MAGAZYN5","GLOBAL",11)~ GOTO Etykiety
IF ~!Global("MAGAZYN5","GLOBAL",12)~ THEN REPLY ~Mikstury.~ DO ~SetGlobal("MAGAZYN5","GLOBAL",12)~ GOTO Etykiety
IF ~!Global("MAGAZYN5","GLOBAL",13)~ THEN REPLY ~Bi¿uteria magiczna.~ DO ~SetGlobal("MAGAZYN5","GLOBAL",13)~ GOTO Etykiety
IF ~!Global("MAGAZYN5","GLOBAL",14)~ THEN REPLY ~Bi¿uteria zwyk³a.~ DO ~SetGlobal("MAGAZYN5","GLOBAL",14)~ GOTO Etykiety
IF ~!Global("MAGAZYN5","GLOBAL",15)~ THEN REPLY ~Drogie kamienie.~DO ~SetGlobal("MAGAZYN5","GLOBAL",15)~ GOTO Etykiety
IF ~!Global("MAGAZYN5","GLOBAL",16)~ THEN REPLY ~Pami¹tki.~ DO ~SetGlobal("MAGAZYN5","GLOBAL",16)~ GOTO Etykiety
IF ~!Global("MAGAZYN5","GLOBAL",17)~ THEN REPLY ~Fragmenty broni.~ DO ~SetGlobal("MAGAZYN5","GLOBAL",17)~ GOTO Etykiety
IF ~!Global("MAGAZYN5","GLOBAL",18)~ THEN REPLY ~Ksi¹¿ki.~ DO ~SetGlobal("MAGAZYN5","GLOBAL",18)~ GOTO Etykiety
IF ~!Global("MAGAZYN5","GLOBAL",19)~ THEN REPLY ~Ró¿ne.~ DO ~SetGlobal("MAGAZYN5","GLOBAL",19)~ GOTO Etykiety
IF ~~ THEN REPLY ~Chcê zmieniæ inn¹ etykietê.~ GOTO Etykiety
IF ~~ THEN REPLY ~Potrzebujê jednak czegoœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Tak jest dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN MAGAZYN6
SAY ~Jak ma brzemieæ etykieta?~
IF ~!Global("MAGAZYN6","GLOBAL",0)~ THEN REPLY ~Magazyn 6.~ DO ~SetGlobal("MAGAZYN6","GLOBAL",0)~ GOTO Etykiety
IF ~!Global("MAGAZYN6","GLOBAL",1)~ THEN REPLY ~Zbroje.~ DO ~SetGlobal("MAGAZYN6","GLOBAL",1)~ GOTO Etykiety
IF ~!Global("MAGAZYN6","GLOBAL",2)~ THEN REPLY ~Szaty maga.~ DO ~SetGlobal("MAGAZYN6","GLOBAL",2)~ GOTO Etykiety
IF ~!Global("MAGAZYN6","GLOBAL",3)~ THEN REPLY ~He³my.~ DO ~SetGlobal("MAGAZYN6","GLOBAL",3)~ GOTO Etykiety
IF ~!Global("MAGAZYN6","GLOBAL",4)~ THEN REPLY ~Zbroje i he³my.~ DO ~SetGlobal("MAGAZYN6","GLOBAL",4)~ GOTO Etykiety
IF ~!Global("MAGAZYN6","GLOBAL",5)~ THEN REPLY ~Tarcze.~ DO ~SetGlobal("MAGAZYN6","GLOBAL",5)~ GOTO Etykiety
IF ~!Global("MAGAZYN6","GLOBAL",6)~ THEN REPLY ~Zbroje, he³my i tarcze.~ DO ~SetGlobal("MAGAZYN6","GLOBAL",6)~ GOTO Etykiety
IF ~!Global("MAGAZYN6","GLOBAL",7)~ THEN REPLY ~Pasy, p³aszcze, buty i bransolety.~ DO ~SetGlobal("MAGAZYN6","GLOBAL",7)~ GOTO Etykiety
IF ~!Global("MAGAZYN6","GLOBAL",8)~ THEN REPLY ~Broñ strzelecka.~ DO ~SetGlobal("MAGAZYN6","GLOBAL",8)~ GOTO Etykiety
IF ~!Global("MAGAZYN6","GLOBAL",9)~ THEN REPLY ~Bron do walki wrêcz.~ DO ~SetGlobal("MAGAZYN6","GLOBAL",9)~ GOTO Etykiety
IF ~!Global("MAGAZYN6","GLOBAL",10)~ THEN REPLY ~Bronie niemagiczne.~ DO ~SetGlobal("MAGAZYN6","GLOBAL",10)~ GOTO Etykiety
IF ~!Global("MAGAZYN6","GLOBAL",11)~ THEN REPLY ~Magiczne zwoje.~ DO ~SetGlobal("MAGAZYN6","GLOBAL",11)~ GOTO Etykiety
IF ~!Global("MAGAZYN6","GLOBAL",12)~ THEN REPLY ~Mikstury.~ DO ~SetGlobal("MAGAZYN6","GLOBAL",12)~ GOTO Etykiety
IF ~!Global("MAGAZYN6","GLOBAL",13)~ THEN REPLY ~Bi¿uteria magiczna.~ DO ~SetGlobal("MAGAZYN6","GLOBAL",13)~ GOTO Etykiety
IF ~!Global("MAGAZYN6","GLOBAL",14)~ THEN REPLY ~Bi¿uteria zwyk³a.~ DO ~SetGlobal("MAGAZYN6","GLOBAL",14)~ GOTO Etykiety
IF ~!Global("MAGAZYN6","GLOBAL",15)~ THEN REPLY ~Drogie kamienie.~DO ~SetGlobal("MAGAZYN6","GLOBAL",15)~ GOTO Etykiety
IF ~!Global("MAGAZYN6","GLOBAL",16)~ THEN REPLY ~Pami¹tki.~ DO ~SetGlobal("MAGAZYN6","GLOBAL",16)~ GOTO Etykiety
IF ~!Global("MAGAZYN6","GLOBAL",17)~ THEN REPLY ~Fragmenty broni.~ DO ~SetGlobal("MAGAZYN6","GLOBAL",17)~ GOTO Etykiety
IF ~!Global("MAGAZYN6","GLOBAL",18)~ THEN REPLY ~Ksi¹¿ki.~ DO ~SetGlobal("MAGAZYN6","GLOBAL",18)~ GOTO Etykiety
IF ~!Global("MAGAZYN6","GLOBAL",19)~ THEN REPLY ~Ró¿ne.~ DO ~SetGlobal("MAGAZYN6","GLOBAL",19)~ GOTO Etykiety
IF ~~ THEN REPLY ~Chcê zmieniæ inn¹ etykietê.~ GOTO Etykiety
IF ~~ THEN REPLY ~Potrzebujê jednak czegoœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Tak jest dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN MAGAZYN7
SAY ~Jak ma brzemieæ etykieta?~
IF ~!Global("MAGAZYN7","GLOBAL",0)~ THEN REPLY ~Magazyn 7.~ DO ~SetGlobal("MAGAZYN7","GLOBAL",0)~ GOTO Etykiety
IF ~!Global("MAGAZYN7","GLOBAL",1)~ THEN REPLY ~Zbroje.~ DO ~SetGlobal("MAGAZYN7","GLOBAL",1)~ GOTO Etykiety
IF ~!Global("MAGAZYN7","GLOBAL",2)~ THEN REPLY ~Szaty maga.~ DO ~SetGlobal("MAGAZYN7","GLOBAL",2)~ GOTO Etykiety
IF ~!Global("MAGAZYN7","GLOBAL",3)~ THEN REPLY ~He³my.~ DO ~SetGlobal("MAGAZYN7","GLOBAL",3)~ GOTO Etykiety
IF ~!Global("MAGAZYN7","GLOBAL",4)~ THEN REPLY ~Zbroje i he³my.~ DO ~SetGlobal("MAGAZYN7","GLOBAL",4)~ GOTO Etykiety
IF ~!Global("MAGAZYN7","GLOBAL",5)~ THEN REPLY ~Tarcze.~ DO ~SetGlobal("MAGAZYN7","GLOBAL",5)~ GOTO Etykiety
IF ~!Global("MAGAZYN7","GLOBAL",6)~ THEN REPLY ~Zbroje, he³my i tarcze.~ DO ~SetGlobal("MAGAZYN7","GLOBAL",6)~ GOTO Etykiety
IF ~!Global("MAGAZYN7","GLOBAL",7)~ THEN REPLY ~Pasy, p³aszcze, buty i bransolety.~ DO ~SetGlobal("MAGAZYN7","GLOBAL",7)~ GOTO Etykiety
IF ~!Global("MAGAZYN7","GLOBAL",8)~ THEN REPLY ~Broñ strzelecka.~ DO ~SetGlobal("MAGAZYN7","GLOBAL",8)~ GOTO Etykiety
IF ~!Global("MAGAZYN7","GLOBAL",9)~ THEN REPLY ~Bron do walki wrêcz.~ DO ~SetGlobal("MAGAZYN7","GLOBAL",9)~ GOTO Etykiety
IF ~!Global("MAGAZYN7","GLOBAL",10)~ THEN REPLY ~Bronie niemagiczne.~ DO ~SetGlobal("MAGAZYN7","GLOBAL",10)~ GOTO Etykiety
IF ~!Global("MAGAZYN7","GLOBAL",11)~ THEN REPLY ~Magiczne zwoje.~ DO ~SetGlobal("MAGAZYN7","GLOBAL",11)~ GOTO Etykiety
IF ~!Global("MAGAZYN7","GLOBAL",12)~ THEN REPLY ~Mikstury.~ DO ~SetGlobal("MAGAZYN7","GLOBAL",12)~ GOTO Etykiety
IF ~!Global("MAGAZYN7","GLOBAL",13)~ THEN REPLY ~Bi¿uteria magiczna.~ DO ~SetGlobal("MAGAZYN7","GLOBAL",13)~ GOTO Etykiety
IF ~!Global("MAGAZYN7","GLOBAL",14)~ THEN REPLY ~Bi¿uteria zwyk³a.~ DO ~SetGlobal("MAGAZYN7","GLOBAL",14)~ GOTO Etykiety
IF ~!Global("MAGAZYN7","GLOBAL",15)~ THEN REPLY ~Drogie kamienie.~DO ~SetGlobal("MAGAZYN7","GLOBAL",15)~ GOTO Etykiety
IF ~!Global("MAGAZYN7","GLOBAL",16)~ THEN REPLY ~Pami¹tki.~ DO ~SetGlobal("MAGAZYN7","GLOBAL",16)~ GOTO Etykiety
IF ~!Global("MAGAZYN7","GLOBAL",17)~ THEN REPLY ~Fragmenty broni.~ DO ~SetGlobal("MAGAZYN7","GLOBAL",17)~ GOTO Etykiety
IF ~!Global("MAGAZYN7","GLOBAL",18)~ THEN REPLY ~Ksi¹¿ki.~ DO ~SetGlobal("MAGAZYN7","GLOBAL",18)~ GOTO Etykiety
IF ~!Global("MAGAZYN7","GLOBAL",19)~ THEN REPLY ~Ró¿ne.~ DO ~SetGlobal("MAGAZYN7","GLOBAL",19)~ GOTO Etykiety
IF ~~ THEN REPLY ~Chcê zmieniæ inn¹ etykietê.~ GOTO Etykiety
IF ~~ THEN REPLY ~Potrzebujê jednak czegoœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Tak jest dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN MAGAZYN8
SAY ~Jak ma brzemieæ etykieta?~
IF ~!Global("MAGAZYN8","GLOBAL",0)~ THEN REPLY ~Magazyn 8.~ DO ~SetGlobal("MAGAZYN8","GLOBAL",0)~ GOTO Etykiety
IF ~!Global("MAGAZYN8","GLOBAL",1)~ THEN REPLY ~Zbroje.~ DO ~SetGlobal("MAGAZYN8","GLOBAL",1)~ GOTO Etykiety
IF ~!Global("MAGAZYN8","GLOBAL",2)~ THEN REPLY ~Szaty maga.~ DO ~SetGlobal("MAGAZYN8","GLOBAL",2)~ GOTO Etykiety
IF ~!Global("MAGAZYN8","GLOBAL",3)~ THEN REPLY ~He³my.~ DO ~SetGlobal("MAGAZYN8","GLOBAL",3)~ GOTO Etykiety
IF ~!Global("MAGAZYN8","GLOBAL",4)~ THEN REPLY ~Zbroje i he³my.~ DO ~SetGlobal("MAGAZYN8","GLOBAL",4)~ GOTO Etykiety
IF ~!Global("MAGAZYN8","GLOBAL",5)~ THEN REPLY ~Tarcze.~ DO ~SetGlobal("MAGAZYN8","GLOBAL",5)~ GOTO Etykiety
IF ~!Global("MAGAZYN8","GLOBAL",6)~ THEN REPLY ~Zbroje, he³my i tarcze.~ DO ~SetGlobal("MAGAZYN8","GLOBAL",6)~ GOTO Etykiety
IF ~!Global("MAGAZYN8","GLOBAL",7)~ THEN REPLY ~Pasy, p³aszcze, buty i bransolety.~ DO ~SetGlobal("MAGAZYN8","GLOBAL",7)~ GOTO Etykiety
IF ~!Global("MAGAZYN8","GLOBAL",8)~ THEN REPLY ~Broñ strzelecka.~ DO ~SetGlobal("MAGAZYN8","GLOBAL",8)~ GOTO Etykiety
IF ~!Global("MAGAZYN8","GLOBAL",9)~ THEN REPLY ~Bron do walki wrêcz.~ DO ~SetGlobal("MAGAZYN8","GLOBAL",9)~ GOTO Etykiety
IF ~!Global("MAGAZYN8","GLOBAL",10)~ THEN REPLY ~Bronie niemagiczne.~ DO ~SetGlobal("MAGAZYN8","GLOBAL",10)~ GOTO Etykiety
IF ~!Global("MAGAZYN8","GLOBAL",11)~ THEN REPLY ~Magiczne zwoje.~ DO ~SetGlobal("MAGAZYN8","GLOBAL",11)~ GOTO Etykiety
IF ~!Global("MAGAZYN8","GLOBAL",12)~ THEN REPLY ~Mikstury.~ DO ~SetGlobal("MAGAZYN8","GLOBAL",12)~ GOTO Etykiety
IF ~!Global("MAGAZYN8","GLOBAL",13)~ THEN REPLY ~Bi¿uteria magiczna.~ DO ~SetGlobal("MAGAZYN8","GLOBAL",13)~ GOTO Etykiety
IF ~!Global("MAGAZYN8","GLOBAL",14)~ THEN REPLY ~Bi¿uteria zwyk³a.~ DO ~SetGlobal("MAGAZYN8","GLOBAL",14)~ GOTO Etykiety
IF ~!Global("MAGAZYN8","GLOBAL",15)~ THEN REPLY ~Drogie kamienie.~DO ~SetGlobal("MAGAZYN8","GLOBAL",15)~ GOTO Etykiety
IF ~!Global("MAGAZYN8","GLOBAL",16)~ THEN REPLY ~Pami¹tki.~ DO ~SetGlobal("MAGAZYN8","GLOBAL",16)~ GOTO Etykiety
IF ~!Global("MAGAZYN8","GLOBAL",17)~ THEN REPLY ~Fragmenty broni.~ DO ~SetGlobal("MAGAZYN8","GLOBAL",17)~ GOTO Etykiety
IF ~!Global("MAGAZYN8","GLOBAL",18)~ THEN REPLY ~Ksi¹¿ki.~ DO ~SetGlobal("MAGAZYN8","GLOBAL",18)~ GOTO Etykiety
IF ~!Global("MAGAZYN8","GLOBAL",19)~ THEN REPLY ~Ró¿ne.~ DO ~SetGlobal("MAGAZYN8","GLOBAL",19)~ GOTO Etykiety
IF ~~ THEN REPLY ~Chcê zmieniæ inn¹ etykietê.~ GOTO Etykiety
IF ~~ THEN REPLY ~Potrzebujê jednak czegoœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Tak jest dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN MAGAZYN9
SAY ~Jak ma brzemieæ etykieta?~
IF ~!Global("MAGAZYN9","GLOBAL",0)~ THEN REPLY ~Magazyn 9.~ DO ~SetGlobal("MAGAZYN9","GLOBAL",0)~ GOTO Etykiety
IF ~!Global("MAGAZYN9","GLOBAL",1)~ THEN REPLY ~Zbroje.~ DO ~SetGlobal("MAGAZYN9","GLOBAL",1)~ GOTO Etykiety
IF ~!Global("MAGAZYN9","GLOBAL",2)~ THEN REPLY ~Szaty maga.~ DO ~SetGlobal("MAGAZYN9","GLOBAL",2)~ GOTO Etykiety
IF ~!Global("MAGAZYN9","GLOBAL",3)~ THEN REPLY ~He³my.~ DO ~SetGlobal("MAGAZYN9","GLOBAL",3)~ GOTO Etykiety
IF ~!Global("MAGAZYN9","GLOBAL",4)~ THEN REPLY ~Zbroje i he³my.~ DO ~SetGlobal("MAGAZYN9","GLOBAL",4)~ GOTO Etykiety
IF ~!Global("MAGAZYN9","GLOBAL",5)~ THEN REPLY ~Tarcze.~ DO ~SetGlobal("MAGAZYN9","GLOBAL",5)~ GOTO Etykiety
IF ~!Global("MAGAZYN9","GLOBAL",6)~ THEN REPLY ~Zbroje, he³my i tarcze.~ DO ~SetGlobal("MAGAZYN9","GLOBAL",6)~ GOTO Etykiety
IF ~!Global("MAGAZYN9","GLOBAL",7)~ THEN REPLY ~Pasy, p³aszcze, buty i bransolety.~ DO ~SetGlobal("MAGAZYN9","GLOBAL",7)~ GOTO Etykiety
IF ~!Global("MAGAZYN9","GLOBAL",8)~ THEN REPLY ~Broñ strzelecka.~ DO ~SetGlobal("MAGAZYN9","GLOBAL",8)~ GOTO Etykiety
IF ~!Global("MAGAZYN9","GLOBAL",9)~ THEN REPLY ~Bron do walki wrêcz.~ DO ~SetGlobal("MAGAZYN9","GLOBAL",9)~ GOTO Etykiety
IF ~!Global("MAGAZYN9","GLOBAL",10)~ THEN REPLY ~Bronie niemagiczne.~ DO ~SetGlobal("MAGAZYN9","GLOBAL",10)~ GOTO Etykiety
IF ~!Global("MAGAZYN9","GLOBAL",11)~ THEN REPLY ~Magiczne zwoje.~ DO ~SetGlobal("MAGAZYN9","GLOBAL",11)~ GOTO Etykiety
IF ~!Global("MAGAZYN9","GLOBAL",12)~ THEN REPLY ~Mikstury.~ DO ~SetGlobal("MAGAZYN9","GLOBAL",12)~ GOTO Etykiety
IF ~!Global("MAGAZYN9","GLOBAL",13)~ THEN REPLY ~Bi¿uteria magiczna.~ DO ~SetGlobal("MAGAZYN9","GLOBAL",13)~ GOTO Etykiety
IF ~!Global("MAGAZYN9","GLOBAL",14)~ THEN REPLY ~Bi¿uteria zwyk³a.~ DO ~SetGlobal("MAGAZYN9","GLOBAL",14)~ GOTO Etykiety
IF ~!Global("MAGAZYN9","GLOBAL",15)~ THEN REPLY ~Drogie kamienie.~DO ~SetGlobal("MAGAZYN9","GLOBAL",15)~ GOTO Etykiety
IF ~!Global("MAGAZYN9","GLOBAL",16)~ THEN REPLY ~Pami¹tki.~ DO ~SetGlobal("MAGAZYN9","GLOBAL",16)~ GOTO Etykiety
IF ~!Global("MAGAZYN9","GLOBAL",17)~ THEN REPLY ~Fragmenty broni.~ DO ~SetGlobal("MAGAZYN9","GLOBAL",17)~ GOTO Etykiety
IF ~!Global("MAGAZYN9","GLOBAL",18)~ THEN REPLY ~Ksi¹¿ki.~ DO ~SetGlobal("MAGAZYN9","GLOBAL",18)~ GOTO Etykiety
IF ~!Global("MAGAZYN9","GLOBAL",19)~ THEN REPLY ~Ró¿ne.~ DO ~SetGlobal("MAGAZYN9","GLOBAL",19)~ GOTO Etykiety
IF ~~ THEN REPLY ~Chcê zmieniæ inn¹ etykietê.~ GOTO Etykiety
IF ~~ THEN REPLY ~Potrzebujê jednak czegoœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Tak jest dobrze. ¯egnaj.~ EXIT
END