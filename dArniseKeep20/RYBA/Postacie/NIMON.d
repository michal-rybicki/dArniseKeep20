BEGIN NIMON

IF ~global("NimonPosi","GLOBAL",0)~ THEN BEGIN Lochy
SAY ~Cze����! Chcessszzz pohandlowa�?~
   IF ~~ THEN REPLY ~O ile wiem nie masz przy sobie niczego czym m�g�by� handlowa�.~ GOTO 2
   IF ~~ THEN REPLY ~Nie, nie chc�. Do widzenia.~ EXIT
   IF ~~ THEN REPLY ~Bra�e� udzia� w naje�dzie na zamek, musisz umrze�.~ DO ~setglobal("NimonPosi","GLOBAL",5) enemy()~ EXIT
   IF ~~ THEN REPLY ~Uciekaj. Jeste� wolny. I �eby� ju� si� tu nigdy wi�cej nie pokaza�!~DO~setglobal("NimonPosi","GLOBAL",5) AddexperienceParty(20000) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 2
SAY ~Jak by����cie mi co����� dali to bym m�g� tym handlowa�. Mog� sssprzeda� co� wassszego komu����� innemu. Ja pohandluje, wy zyssskacie.~
   IF ~~ THEN REPLY ~Zanim zaczniemy wchodzic w uk�ady, WIʏNIU, musz� wiedzie�, co robi�e� na terenie zamku kiedy by� naje�dzany przez twoich ziomk�w?~ GOTO 3
   IF ~~ THEN REPLY ~Nie mog� d�u�ej z tob� gada�. Do widzenia.~ EXIT
   IF ~~ THEN REPLY ~Bra�e� udzia� w naje�dzie na zamek, musisz umrze�.~ DO ~setglobal("NimonPosi","GLOBAL",5) enemy()~ EXIT
   IF ~~ THEN REPLY ~Uciekaj. Jeste� wolny. I �eby� ju� si� tu nigdy wi�cej nie pokaza�!~DO~setglobal("NimonPosi","GLOBAL",5) AddexperienceParty(60000) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 3
SAY ~Oni g�upi. Oni wsszzysssstko nissszzzcz� kiedy naje���d�aj� zamki. Oni mnie nie widz�, bo ja ssssprytniejsszzy. Ja nie nisszzcz� towar�w do handlu. Ja nie zabijam potencjalnych klient�w. Zbieram towary i handluj� z potencjalnymi klientami.~
   IF ~~ THEN REPLY ~No dobrze. Znajd� sobie pok�j w tym zamku i poczekaj tam na mnie, a ja pomysl� co z tob� zrobi�.~ DO ~setglobal("NimonPosi","GLOBAL",1) EscapeAreaMove("ar1307",1950,1200,12)~ EXIT
   IF ~~ THEN REPLY ~Nie mog� d�u�ej z tob� gada�. Do widzenia.~ EXIT
   IF ~~ THEN REPLY ~Nie wierz� ci, bra�e� udzia� w naje�dzie na zamek, musisz umrze�.~ DO ~setglobal("NimonPosi","GLOBAL",5) enemy()~ EXIT
   IF ~~ THEN REPLY ~Dobrze. Jeste� wolny. I �eby� ju� si� tu nigdy wi�cej nie pokaza�!~ DO~AddexperienceParty(90000) setglobal("NimonPosi","GLOBAL",5) EscapeArea() ~ EXIT
END

IF ~global("NimonPosi","GLOBAL",1)~ THEN BEGIN Zamek
SAY ~Cze����! Czy wiesszz ju� czym mog� dla ciebie handlowa�?~
   IF ~global("KuzniaHandel","GLOBAL",1) global("RatavaPosi","GLOBAL",0)~ THEN REPLY ~B�dziesz sprzedawa� wyroby ku�ni d'Arnise na Targu Przyg�d na Promenadzie Waukeen w Athkatli.~ GOTO Super
   IF ~~ THEN REPLY ~Nie, jeszcze nie wiem. Tylko ci� odwiedzam.~ EXIT
   IF ~~ THEN REPLY ~Nie i chyba si� nie dowiem. Mo�esz sobie i��.~ DO ~EscapeArea() setglobal("NimonPosi","GLOBAL",3)~ EXIT
END

IF ~!global("RatavaPosi","GLOBAL",0)~ THEN BEGIN Koniec
SAY ~Nie ma ku�ni. Nie ma handlu. Wracam do zamku.~
   IF ~~ THEN DO ~setglobal("NimonPosi","GLOBAL",1) EscapeAreaMove("ar1307",1950,1200,12) ~ EXIT
END

IF ~global("NimonPosi","GLOBAL",2)~ THEN BEGIN Sklep
SAY ~Najlepsszze towary! Z ku�ni d'Arnissssse! Tylko tu!...O! SSSzzef! Cze����.~
   IF ~~ THEN REPLY ~Cze��. Poka� swoje towary. Mo�e co� kupi�, �eby zrobi� nam reklam�.~ DO ~StartStore("Kuznia03",LastTalkedToBy(Myself))~EXIT
   IF ~global("GoblinKuznia","GLOBAL",0)~ THEN REPLY ~Cze��. Jak interesy?~ GOTO 4
   IF ~global("GoblinKuznia","GLOBAL",1)~ THEN REPLY ~Cze��. Jak interesy?~ GOTO 5
   IF ~~ THEN REPLY ~Wracaj do zamku d'Arnise. Pohandlowa�e� tu ju� swoje.~ DO ~ setglobal("NimonPosi","GLOBAL",1) EscapeAreaMove("ar1307",1950,1200,12)~ EXIT
   IF ~~ THEN REPLY ~Cze��. Tylko ci� odwiedzam.~ EXIT
   IF ~~ THEN REPLY ~Nie b�d� ju� potrzebowa� twoich us�ug, mozesz odej��.~ DO ~ setglobal("NimonPosi","GLOBAL",3) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 4
SAY ~Zarabiamy oko�o trrzzzysssta ssszzztuk z�ota na tydzie�. Kiedy zbiera sssi� 500 przekazujemy je majordomusssssowi w zamku, kt�ry wk�ada je tam gdzie zwykle wk�ada ssszztuki z�ota dla ciebie.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 5
SAY ~Zarabiamy oko�o czterysssta ssszzztuk z�ota na tydzie�. Nowa ku�nia lepsszza! Kiedy zbiera sssi� 500 przekazujemy je majordomusssssowi w zamku, kt�ry wk�ada je tam gdzie zwykle wk�ada ssszztuki z�ota dla ciebie.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Super
SAY ~SSSuper! B�d� handlowa� niekradzionymi towarami! Russzzam sszzefie!~
IF ~~ THEN DO ~setglobal("NimonPosi","GLOBAL",2) SetGlobalTimer("NimonHandel","GLOBAL",SEVEN_DAYS) EscapeAreaMove("ar0702",750,335,14)~ EXIT
END
