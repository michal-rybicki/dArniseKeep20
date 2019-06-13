// creator  : weidu (version 199)
// argument : NALIAJ.DLG
// game     : .
// source   : ./override/NALIAJ.DLG
// dialog   : ./Dialog.tlk
// dialogF  : ./DialogF.tlk

BEGIN ~NALIAJ~
//////////////////////////////////////////////////
// WARNING: this file contains non-trivial WEIGHTs
//////////////////////////////////////////////////

IF WEIGHT #1 /* Triggers after states #: 339 even though they appear after this state */
~AreaCheck("AR1300")
Global("EnteredAR1300","GLOBAL",0)
~ THEN BEGIN 0 // from:
  SAY #24282 /* ~To tu... zaczekaj, jest tu palisada? Nasze stra�e wycofa�y si� wtedy i... twierdza pad�a. Trudno j� b�dzie teraz uratowa�. Palisada znajduje si� na zach�d st�d.~ */
  IF ~~ THEN REPLY #24290 /* ~My�l�, �e powinna� mi w ko�cu powiedzie�, przeciwko komu stajemy.~ */ DO ~SetGlobal("EnteredAR1300","GLOBAL",1)
SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",ONE_DAY)
~ GOTO 149
  IF ~~ THEN REPLY #24291 /* ~A niech to! Dobra, musz� wiedzie�, przeciwko komu stajemy, i to zaraz!~ */ DO ~SetGlobal("EnteredAR1300","GLOBAL",1)
SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",ONE_DAY)
~ GOTO 149
  IF ~~ THEN REPLY #24292 /* ~Nie p�jd� ani kroku dalej, nie wiedz�c, z kim mamy do czynienia. Nie wpl�cz� si� w to na o�lep.~ */ DO ~SetGlobal("EnteredAR1300","GLOBAL",1)
SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",ONE_DAY)
~ GOTO 149
  IF ~Global("NaliaCash","GLOBAL",1)~ THEN REPLY #49212 /* ~W takim razie cena w�a�nie wzros�a. Chc� dodatkowych 500 sztuk z�ota za moje us�ugi.~ */ DO ~SetGlobal("EnteredAR1300","GLOBAL",1)
SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",ONE_DAY)~ GOTO 248
END

IF ~~ THEN BEGIN 1 // from: 222.0
  SAY #24283 /* ~Mo�e uciek�y tu przed elfami, albo zwabi�y je nowe osady na po�udnie od Tethyru. Nie... nie znam ich liczby, wiem tylko, �e musimy uratowa� moj� rodzin�...~ */
  IF ~~ THEN REPLY #24293 /* ~Potrzebujemy wi�cej informacji. Frontalny atak sko�czy�by si� masakr�.~ */ GOTO 4
  IF ~~ THEN REPLY #24294 /* ~Nie wiemy ilu ich jest, ani nawet czy jest jeszcze ktokolwiek do uratowania.~ */ GOTO 3
  IF ~~ THEN REPLY #24295 /* ~Nie wydaje mi si�, by stanowi�o to przedmiot naszej umowy. B�dziesz musia�a znale�� kogo� innego do pomocy.~ */ GOTO 269
END

IF ~~ THEN BEGIN 2 // from: 270.0
  SAY #24284 /* ~Musisz si� zakra�� i kogo� uratowa�, kogokolwiek. By� mo�e... Dalesona! Stajenny Daleson m�g� prze�y�! Znajdziesz go?~ */
  IF ~~ THEN REPLY #24296 /* ~Dobrze, ale nie zamierzam nadstawia� karku. Potrzebne mi bezpieczne wej�cie.~ */ GOTO 4
  IF ~~ THEN REPLY #24297 /* ~Wol� bezpo�redni atak od skradania si�. Tylko tch�rze unikaj� walki!~ */ GOTO 6
  IF ~~ THEN REPLY #24298 /* ~Nie, zmieniam zdanie. Nie wezm� udzia�u w twojej ma�ej wojnie.~ */ GOTO 5
END

IF ~~ THEN BEGIN 3 // from: 1.1
  SAY #24285 /* ~Wiem. Zaczekaj! Daleson nikomu nie zagra�a. Prawdopodobnie pozostawili go przy �yciu by opiekowa� si� zwierz�tami. Mo�e zna� ich liczebno�� i si��.~ */
  IF ~~ THEN REPLY #24299 /* ~By� mo�e jest jakie� bezpieczne wej�cie do �rodka? Nie chc� puka� do frontowych drzwi.~ */ GOTO 4
  IF ~~ THEN REPLY #24300 /* ~Wol� bezpo�redni atak od ca�ego tego lawirowania. Chowanie si� w cieniu zdaje si� by� nieco tch�rzliwe.~ */ GOTO 6
  IF ~~ THEN REPLY #24301 /* ~Brzmi rozs�dnie. Poszukam go, gdy b�d� bada� to miejsce.~ ~Brzmi rozs�dnie. Poszukam go, gdy b�d� bada�a to miejsce.~ */ GOTO 7
END

IF ~~ THEN BEGIN 4 // from: 3.0 2.0 1.0
  SAY #24286 /* ~Na p�noc od palisady, w �cianie twierdzy znajduj� si� sekretne drzwi, przejd� przez nie. U�ywa�am ich by wymyka� si� noc� na zewn�trz. Ciotunia nigdy tego nie pochwala�a, ale ja o to nie dba�am.~ */
  IF ~~ THEN GOTO 8
END

IF ~~ THEN BEGIN 5 // from: 2.2
  SAY #24287 /* ~Ale... ale ty... Nie, nie b�d� si� bezowocnie spiera�. Rozumujesz tak jak miejscowa arystokracja. Mia�am o tobie lepsze mniemanie. Id� sobie. Zrobi� to sama.~ */
  IF ~~ THEN DO ~LeaveParty()
SetGlobal("NaliaMove","GLOBAL",4)
SetGlobal("SPRITE_IS_DEADNalia","GLOBAL",1)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 6 // from: 3.1 2.1
  SAY #24288 /* ~Czy� tch�rzostwem jest prze�y� dzie�? Mo�emy przypu�ci� szturm na frontowe wrota, ale co b�dzie jak trolle zdadz� sobie spraw�, �e tam jeste�my?~ */
  IF ~~ THEN GOTO 295
END

IF ~~ THEN BEGIN 7 // from: 3.2
  SAY #24289 /* ~Najlepiej unika� frontowego ataku. Na p�noc od palisady znajduj� si� sekretne drzwi. U�ywam ich od czasu do czasu, gdy chc� pom�c wie�niakom.~ */
  IF ~~ THEN GOTO 8
END

IF ~~ THEN BEGIN 8 // from: 295.0 7.0 4.0
  SAY #24252 /* ~Powinni�my wkr�tce rusza�. Czekanie tylko pogarsza spraw�. Gdy dostaniemy si� do �rodka, postaram si� wskazywa� drog�. Jak znajdziemy Dalesona, skoncentrujemy si� na trollach.~ */
  IF ~~ THEN UNSOLVED_JOURNAL #10074 /* ~Napa�� na zamek d'Arnise.

Nalia powiedzia�a nam o napa�ci na jej rodzinny zamek. Zaj�y go trolle wspierane przez jak�� "w�owat� kreatur�". Nieliczni ocaleni stra�nicy schronili si� za palisad� ko�o zamku. Ale rodzina Nalii zosta�a w pu�apce. Daleson, s�uga z zamku mo�e nam pom�c, o ile jeszcze �yje. Nalia poradzi�a, �eby�my po wej�ciu do zamku najpierw go poszukali.
Lepiej nie wchodzi� przez g��wn� bram� zamku, i tak jest zapewne zamkni�ta. Na p�noc od palisady, za krzakiem przy murach znajduje si� ukryte wej�cie do zamku.~ */ EXIT
END

IF WEIGHT #2 /* Triggers after states #: 339 even though they appear after this state */
~Global("EnteredAR1300","GLOBAL",0)
Global("Complain","LOCALS",1)
~ THEN BEGIN 9 // from:
  SAY #24376 /* ~Prosz�, przecie� pami�tam twoj� obietnic�. Musimy uda� si� na ziemie mojej rodziny i stan�� w ich obronie. Je�li chcesz zmieni� zdanie, powiedz mi prosz�.~ [NALIA69] */
  IF ~~ THEN REPLY #24377 /* ~Przykro mi za op�nienie. P�jdziemy tam teraz i zrobimy co w naszej mocy.~ */ DO ~IncrementGlobal("Complain","LOCALS",1)
SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",ONE_DAY)
~ GOTO 10
  IF ~~ THEN REPLY #24378 /* ~Taak, taak, ju� id�. Trzymaj szyj� z dala od stryczka.~ */ DO ~IncrementGlobal("Complain","LOCALS",1)
SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",ONE_DAY)
~ GOTO 10
  IF ~CheckStatGT(LastTalkedToBy,13,CHR)
~ THEN REPLY #24379 /* ~Obawiam si�, �e musz� najpierw za�atwi� kilka spraw i mo�e to spowodowa� op�nienie. Wyrusz� wkr�tce.~ */ DO ~IncrementGlobal("Complain","LOCALS",1)
SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",ONE_DAY)
~ GOTO 11
  IF ~CheckStatLT(LastTalkedToBy,14,CHR)
~ THEN REPLY #24380 /* ~Zrobi�em co w mojej mocy. Wci�� musz� jednak za�atwi� kilka spraw i mo�emy by� op�nieni. Wyrusz� wkr�tce.~ ~Zrobi�am co w mojej mocy. Wci�� musz� jednak za�atwi� kilka spraw i mo�emy by� op�nieni. Wyrusz� wkr�tce.~ */ DO ~IncrementGlobal("Complain","LOCALS",1)
SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",ONE_DAY)
~ GOTO 12
  IF ~~ THEN REPLY #24381 /* ~W�a�ciwie nie zamierzam ci pom�c. Staram si� tylko zabi� czas.~ */ DO ~IncrementGlobal("Complain","LOCALS",1)
SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",ONE_DAY)
~ GOTO 13
  IF ~~ THEN REPLY #24382 /* ~Przykro mi, ale nie mog� ci pom�c. Musz� odm�wi�.~ */ DO ~IncrementGlobal("Complain","LOCALS",1)
SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",ONE_DAY)
~ GOTO 14
END

IF ~~ THEN BEGIN 10 // from: 9.1 9.0
  SAY #24383 /* ~Dzi�kuj� ci. Musimy si� jednak naprawd� pospieszy�.~ */
  IF ~~ THEN DO ~SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",THREE_DAYS)
SetGlobal("Complain","LOCALS",2)
~ EXIT
END

IF ~~ THEN BEGIN 11 // from: 9.2
  SAY #24384 /* ~Zdaj� sobie spraw�, �e musisz mi�dzy innymi uzupe�ni� zapasy, ale je�li wkr�tce nie wyruszymy, nie b�dzie w og�le po co i��. Prosz� pospiesz si�.~ */
  IF ~~ THEN DO ~SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",THREE_DAYS)
SetGlobal("Complain","LOCALS",2)
~ EXIT
END

IF ~~ THEN BEGIN 12 // from: 9.3
  SAY #24385 /* ~Przykro mi, ale nie mog� ju� d�u�ej czeka�. P�jd� tam i zaczekam na ciebie. Prosz�, pospiesz si�, sama niewiele mog� zdzia�a�.~ [NALIA70] */
  IF ~~ THEN DO ~SetGlobal("Complain","LOCALS",4)
LeaveParty()
SetDialog("Nalia")
ChangeAIScript("",DEFAULT)
SetGlobal("NaliaMove","GLOBAL",1)
EscapeAreaMove("AR1300",748,3227,14)
~ EXIT
END

IF ~~ THEN BEGIN 13 // from: 9.4
  SAY #24386 /* ~Sk�d w tobie tyle okrucie�stwa?! Do widzenia, baba z wozu koniom l�ej! Je�li kiedykolwiek odwiedzisz moj� spalon� do cna twierdz� wspomnij na to, co si� tu dzisiaj przez ciebie wydarzy�o!~ */
  IF ~~ THEN DO ~SetGlobal("NaliaMove","GLOBAL",4)
SetGlobal("SPRITE_IS_DEADNalia","GLOBAL",1)
EscapeArea()
~ EXIT
END

IF ~~ THEN BEGIN 14 // from: 9.5
  SAY #24387 /* ~Nie mo�na by�o wcze�niej powiedzie�?! Musz� tam by�! Oni mog� by� ju�... Do widzenia i dzi�ki za nic!~ */
  IF ~~ THEN DO ~SetGlobal("Complain","LOCALS",4)
LeaveParty()
SetDialog("Nalia")
ChangeAIScript("",DEFAULT)
SetGlobal("NaliaMove","GLOBAL",1)
EscapeAreaMove("AR1300",748,3227,14)
~ EXIT
END

IF WEIGHT #3 /* Triggers after states #: 339 even though they appear after this state */
~Global("EnteredAR1300","GLOBAL",0)
Global("Complain","LOCALS",3)
~ THEN BEGIN 15 // from:
  SAY #24388 /* ~Przykro mi, ale nie mog� ju� d�u�ej czeka�. Um�wili�my si�, �e pomo�esz ochroni� ziemie mojej rodziny, ale zbyt d�ugo z tym zwlekamy. Id� za mn�, je�li chcesz, ale ja nie b�d� ju� d�u�ej czeka�.~ */
  IF ~~ THEN DO ~SetGlobal("Complain","LOCALS",4)
LeaveParty()
SetDialog("Nalia")
ChangeAIScript("",DEFAULT)
SetGlobal("NaliaMove","GLOBAL",1)
EscapeAreaMove("AR1300",748,3227,14)
~ UNSOLVED_JOURNAL #10073 /* ~Napa�� na zamek d'Arnise.

Nalia odesz�a z dru�yny i uda�a si� do rodzinnego zamku. Prosi�a, �eby�my te� si� tam udali, ale nie mog�a na nas czeka�.~ */ EXIT
END

IF WEIGHT #4 /* Triggers after states #: 339 even though they appear after this state */
~Global("EnteredAR1300","GLOBAL",1)
Global("Complain","LOCALS",5)
!Dead("Torgal")
~ THEN BEGIN 16 // from:
  SAY #24389 /* ~Musimy szybko dotrze� do Dalesona. Je�li go zabij�, nigdy nie dowiemy si� z czym mamy do czynienia. Musi by� wewn�trz, w pobli�u sekretnych drzwi.~ [NALIA71] */
  IF ~~ THEN DO ~SetGlobal("Complain","LOCALS",6)
~ EXIT
END

IF ~~ THEN BEGIN 17 // from:
  SAY #24596 /* ~Ciotuniu, prosz�! Przybywamy by ci� uratowa�!~ [NALIA92] */
  IF ~~ THEN EXTERN ~DELCIA~ 18
END

IF ~~ THEN BEGIN 18 // from:
  SAY #24600 /* ~Tak, tak, tak, sto albo i wi�cej razy ju� mi m�wi�a� o �mierci mojej matki. By�abym ci wdzi�czna gdyby� wi�cej tego nie robi�a.~ */
  IF ~~ THEN EXTERN ~DELCIA~ 19
END

IF ~~ THEN BEGIN 19 // from:
  SAY #24602 /* ~Ciotuniu! Traktuj ich z szacunkiem! Wola�aby� raczej umrze� ni� przyj�� pomoc od prostak�w? Mo�emy si� od tych ludzi uczy� wsp�czucia.~ */
  IF ~~ THEN EXTERN ~DELCIA~ 20
END

IF ~~ THEN BEGIN 20 // from:
  SAY #24608 /* ~Och, prosz�, nie daj jej zacz��...~ */
  IF ~~ THEN EXTERN ~DELCIA~ 44
END

IF ~~ THEN BEGIN 21 // from:
  SAY #24615 /* ~Och nie, prosz� nie daj jej kontynuowa�...~ */
  IF ~~ THEN EXTERN ~DELCIA~ 46
END

IF ~~ THEN BEGIN 22 // from:
  SAY #24620 /* ~Nie zrobisz tego! Nie b�d� tego tolerowa�! Powiedz, �e to by� �art, kt�rego nie zrozumieli�my. Powiedz...~ */
  IF ~~ THEN REPLY #24633 /* ~Przepraszam. Powinni�my jednak ruszy� dalej. Natychmiast. Zanim co�... si� stanie.~ */ GOTO 24
  IF ~~ THEN REPLY #24635 /* ~Moim �yczeniem by�o jedynie pokaza� jej, �e jej status jest nic niewarty w tej chwili. To wszystko.~ */ GOTO 26
  IF ~~ THEN REPLY #24636 /* ~Nie znosz� �atwo zniewag. Powinna zgin�� wraz z ca�ym swoim zarozumialstwem!~ */ EXTERN ~DELCIA~ 25
END

IF ~~ THEN BEGIN 23 // from:
  SAY #24640 /* ~Ciotuniu!~ */
  IF ~~ THEN EXTERN ~DELCIA~ 23
END

IF ~~ THEN BEGIN 24 // from: 22.0
  SAY #24643 /* ~Hmm? Och! Tak, powinni�my... rzeczywi�cie ruszy� dalej. Wr�cisz bezpiecznie drog�, kt�r� przybyli�my, Ciotuniu, ale nie mog� jeszcze p�j�� z tob�.~ */
  IF ~~ THEN EXTERN ~DELCIA~ 24
END

IF ~~ THEN BEGIN 25 // from:
  SAY #24646 /* ~Oni nie s� tacy! Wielu jest zas�u�onych, i... uwa�a�am ich za godnych, ale... S� tak nietolerancyjni jak... my sami. My�l�... my�l�, �e wola�abym raczej zostawi� to wszystko...~ */
  IF ~~ THEN DO ~SetGlobal("NaliaMove","GLOBAL",4)
SetGlobal("SPRITE_IS_DEADNalia","GLOBAL",1)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 26 // from: 22.1
  SAY #24647 /* ~Zrozumia�e, ale i tak do�� trudno przekona� j� o warto�ci innych tak, aby jej nie zagra�ali. Nie to �eby nie powinna by� przyzwyczajona do tego...~ */
  IF ~~ THEN EXTERN ~DELCIA~ 26
END

IF WEIGHT #5 /* Triggers after states #: 339 even though they appear after this state */
~Global("DelciaLeave","GLOBAL",1)
~ THEN BEGIN 27 // from:
  SAY #24648 /* ~Zupe�nie niezwyk�y przyk�ad opanowania z twojej strony. Doceniam to. Ciotunia jest poczciwa, ale bardzo nieust�pliwa i trudna w obej�ciu. Chod�, musimy uratowa� mojego ojca.~ [NALIA72] */
  IF ~~ THEN DO ~SetGlobal("DelciaLeave","GLOBAL",2)
~ EXIT
END

IF WEIGHT #6 /* Triggers after states #: 339 even though they appear after this state */
~!Dead("Torgal")
Global("TalkedToDaleson","GLOBAL",1)~ THEN BEGIN 28 // from:
  SAY #186 /* ~Je�li tego w�a�nie chcesz. B�d� czeka�a na zewn�trz, przy palisadzie. Tam b�dzie bezpieczniej ni� tutaj.~ [NALIA95] */
  IF ~~ THEN DO ~LeaveParty()
ChangeAIScript("",DEFAULT)
SetDialog("Nalia")
EscapeAreaMove("AR1300",748,3227,14)
~ EXIT
END

IF ~~ THEN BEGIN 29 // from:
  SAY #187 /* ~Dzi�kuj� ci, Dalesonie, ale teraz nie czas na tajemnice. Ci ludzie nie s� moj� rodzin�; to moi najemnicy. Nie musisz tu niczego skrywa�.~ */
  IF ~~ THEN EXTERN ~DALESON~ 18
END

IF ~~ THEN BEGIN 30 // from:
  SAY #188 /* ~Prosz�, nie musisz okazywa� wobec mnie a� takiego szacunku. Moja Ciotunia by� mo�e woli by jej s�udzy p�aszczyli si� przed ni�, ale ja nie.~ */
  IF ~~ THEN REPLY #571 /* ~Dlaczego ten cz�owiek k�amie dla ciebie? Co masz do ukrycia?~ */ GOTO 31
  IF ~~ THEN REPLY #572 /* ~Zadajesz si� z... ch�opcem stajennym? Co on mo�e zaoferowa� kobiecie o twojej pozycji?~ */ GOTO 32
  IF ~~ THEN REPLY #573 /* ~Cz�sto chodzisz do stajni, prawda? Jak mniemam wolisz towarzystwo... prostych ludzi?~ */ EXTERN ~DALESON~ 19
  IF ~~ THEN REPLY #621 /* ~Nie mam w og�le s�u�by. Lepiej jest, gdy ludzie mog� pracowa� dla samych siebie.~ */ GOTO 43
END

IF ~~ THEN BEGIN 31 // from: 30.0
  SAY #583 /* ~Dobre pytanie. U�ywam tych drzwi by niepostrze�enie wychodzi�. Ciotunia woli bym nie zadawa�a si� z lud�mi, kt�rzy nam s�u��, ale brak dobrego pochodzenia nie mo�e by� przyczyn� z�ego traktowania.~ */
  IF ~~ THEN GOTO 36
END

IF ~~ THEN BEGIN 32 // from: 30.1
  SAY #584 /* ~Nie chodzi o to, co on mo�e zaoferowa�, ale o to, co ja powinnam zaoferowa� jemu podobnym. U�ywam tych drzwi by niepostrze�enie wychodzi�, by sprawowa� mi�osierne uczynki bez wiedzy Ciotuni.~ */
  IF ~~ THEN GOTO 150
END

IF ~~ THEN BEGIN 33 // from:
  SAY #591 /* ~W porz�dku, Dalesonie. To dla mnie nic nowego, s�ysza�am ju� to wszystko od Ciotuni.~ */
  IF ~~ THEN EXTERN ~DALESON~ 20
END

IF ~~ THEN BEGIN 34 // from:
  SAY #611 /* ~Do�� tego, Dalesonie! Nie b�dziesz o niej m�wi� w ten spos�b!~ */
  IF ~~ THEN EXTERN ~DALESON~ 21
END

IF ~~ THEN BEGIN 35 // from:
  SAY #615 /* ~Jestem tego pewna. Bez wzgl�du na swoje nastawienie, jest ona wci�� wielk� pani� tego domu. Musimy zatem przyst�pi� do odzyskania tego miejsca.~ */
  IF ~~ THEN EXTERN ~DALESON~ 22
END

IF ~~ THEN BEGIN 36 // from: 297.0 150.0 31.0
  SAY #626 /* ~Przekona�am si�, �e Ciotunia nie jest podatna na te pomys�y. Pochodzi ze starej szko�y i uwa�a, �e najlepiej nieustannie przypomina� ni�szym stanom o nale�nym im miejscu.~ */
  IF ~~ THEN EXTERN ~DALESON~ 20
END

IF ~~ THEN BEGIN 37 // from:
  SAY #628 /* ~Piwnic! To s� 'piwnice'. Nie b�d� inaczej nazywane, pomimo ich historii. Zgodnie z rozkazem mego ojca.~ */
  IF ~~ THEN EXTERN ~DALESON~ 23
END

IF ~~ THEN BEGIN 38 // from:
  SAY #630 /* ~Tak. Jeste� dobrym cz�owiekiem, Dalesonie.~ */
  IF ~~ THEN REPLY #631 /* ~Do�� gadania! Musimy rusza� zanim odkryj� nasz� obecno��.~ */ UNSOLVED_JOURNAL #16336 /* ~Napa�� na zamek d'Arnise.

Spotkali�my w zamku Dalesona. Powiedzia� nam, �e ojciec Nalii jeszcze �yje... ale zosta� pojmany i zamkni�ty w "piwnicach", czyli starych lochach tego zamku. Chyba pr�bowa� zebra� g�owice cepa bojowego, kt�re trzymano oddzielnie z nieznanych Nalii powod�w... ale poradzi�a, �e dobrze by�oby znale�� te cz�ci, je�li jej ojciec nie zd��y� tego zrobi�.~ */ GOTO 39
  IF ~~ THEN REPLY #632 /* ~Musimy rusza�. Skoro ju� tutaj jeste�my powinni�my si� dosta� do tych piwnic.~ */ UNSOLVED_JOURNAL #16336 /* ~Napa�� na zamek d'Arnise.

Spotkali�my w zamku Dalesona. Powiedzia� nam, �e ojciec Nalii jeszcze �yje... ale zosta� pojmany i zamkni�ty w "piwnicach", czyli starych lochach tego zamku. Chyba pr�bowa� zebra� g�owice cepa bojowego, kt�re trzymano oddzielnie z nieznanych Nalii powod�w... ale poradzi�a, �e dobrze by�oby znale�� te cz�ci, je�li jej ojciec nie zd��y� tego zrobi�.~ */ GOTO 39
  IF ~~ THEN REPLY #633 /* ~A zatem mamy odnale�� twojego ojca? Musz� wiedzie� z jak licznym przeciwnikiem b�dziemy mie� do czynienia.~ */ UNSOLVED_JOURNAL #16336 /* ~Napa�� na zamek d'Arnise.

Spotkali�my w zamku Dalesona. Powiedzia� nam, �e ojciec Nalii jeszcze �yje... ale zosta� pojmany i zamkni�ty w "piwnicach", czyli starych lochach tego zamku. Chyba pr�bowa� zebra� g�owice cepa bojowego, kt�re trzymano oddzielnie z nieznanych Nalii powod�w... ale poradzi�a, �e dobrze by�oby znale�� te cz�ci, je�li jej ojciec nie zd��y� tego zrobi�.~ */ EXTERN ~DALESON~ 24
  IF ~~ THEN REPLY #634 /* ~Kolejni g�upcy do uratowania? Cudownie. Mo�esz powiedzie� cokolwiek, co mog�oby nam w czym� pom�c?~ */ UNSOLVED_JOURNAL #16336 /* ~Napa�� na zamek d'Arnise.

Spotkali�my w zamku Dalesona. Powiedzia� nam, �e ojciec Nalii jeszcze �yje... ale zosta� pojmany i zamkni�ty w "piwnicach", czyli starych lochach tego zamku. Chyba pr�bowa� zebra� g�owice cepa bojowego, kt�re trzymano oddzielnie z nieznanych Nalii powod�w... ale poradzi�a, �e dobrze by�oby znale�� te cz�ci, je�li jej ojciec nie zd��y� tego zrobi�.~ */ EXTERN ~DALESON~ 24
END

IF ~~ THEN BEGIN 39 // from: 38.1 38.0
  SAY #636 /* ~Jak sobie �yczysz. Zgadzam si�, �e musimy jak najszybciej uratowa� mojego ojca. Ciotunia r�wnie� mo�e by� przy �yciu i by�oby najlepiej gdyby�my dostali si� r�wnie� do niej. Chod�my wi�c.~ */
  IF ~~ THEN GOTO 296
END

IF ~~ THEN BEGIN 40 // from:
  SAY #655 /* ~Do��, Dalesonie! Ja... ja powiem. Piwnica jest reliktem, pozosta�o�ci� po czasach, gdy nasza rodzina... nie by�a tak �yczliwa jak by� mog�a.~ */
  IF ~~ THEN EXTERN ~DALESON~ 25
END

IF ~~ THEN BEGIN 41 // from:
  SAY #657 /* ~Jak �miesz! Zrobi�am tak wiele, aby poprawi� co si� da... nie, nie, masz racj�. Ta 'piwnica' jest... lochem. M�j ojciec zamurowa� j�, ale by�a w u�yciu przez d�ugi czas...~ */
  IF ~~ THEN GOTO 151
END

IF ~~ THEN BEGIN 42 // from:
  SAY #659 /* ~Zgoda, wierz� ci, ale sk�d oni wiedzieli? Ojciec by nie powiedzia�. Chod�, musimy i��. Dalesonie, przygotuj tych, kt�rzy mog� powr�ci� do s�u�by.~ */
  IF ~~ THEN EXTERN ~DALESON~ 27
END

IF ~~ THEN BEGIN 43 // from: 30.3
  SAY #635 /* ~Osobliwy zamiar, i to taki, kt�ry bym popar�a. My�l� jednak, �e trudno by�oby przekona� kogo� ze starej szko�y o zaletach takiej zmiany.~ */
  IF ~~ THEN GOTO 297
END

IF WEIGHT #7 /* Triggers after states #: 339 even though they appear after this state */
~Global("NaliaInLibrary","GLOBAL",1)
!Dead("kpglai01")
~ THEN BEGIN 44 // from:
  SAY #716 /* ~Nie rozumiem. Poza paroma s�u��cymi, widzieli�my bardzo niewielu martwych. Gdzie s� stra�e? Stra�nicy walczyliby do ostatniej kropli krwi. Osobisty ochroniarz mojego ojca, Glaicus, powinien by� tutaj w sypialni, a mimo to nie widz� �adnego cia�a.~ [NALIA73] */
  IF ~~ THEN REPLY #717 /* ~Ci tch�rze prawdopodobnie uciekli. Za�o�� si�, �e zepsu� ich do cna bogaty styl �ycia.~ */ DO ~SetGlobal("NaliaInLibrary","GLOBAL",2)
~ GOTO 49
  IF ~~ THEN REPLY #718 /* ~Mogli pos�u�y� za po�ywienie. By� mo�e cia�a sk�adowane s� gdzie� indziej?~ */ DO ~SetGlobal("NaliaInLibrary","GLOBAL",2)
~ GOTO 50
  IF ~~ THEN REPLY #719 /* ~Jak bardzo byli oddani? By� mo�e doszli po prostu do wniosku, �e nie warto walczy�.~ */ DO ~SetGlobal("NaliaInLibrary","GLOBAL",2)
~ GOTO 51
  IF ~~ THEN REPLY #720 /* ~By� mo�e nie byli tak skuteczni jak s�dzi�a�.~ */ DO ~SetGlobal("NaliaInLibrary","GLOBAL",2)
~ GOTO 52
END

IF ~~ THEN BEGIN 45 // from:
  SAY #722 /* ~Przybywamy by wygna� ci� z mojego domu, potworze! Opu�cisz to miejsce, albo zginiesz tutaj!~ [NALIA86] */
  IF ~~ THEN EXTERN ~TORGAL~ 16
END

IF ~~ THEN BEGIN 46 // from:
  SAY #724 /* ~Jestem tutaj, poniewa� jest to m�j dom! Zap�acisz za zniewa�enie tego miejsca!~ [NALIA87] */
  IF ~~ THEN EXTERN ~TORGAL~ 17
END

IF ~~ THEN BEGIN 47 // from:
  SAY #726 /* ~Co?! Jaka umowa?! Kto� ci� tu nas�a�? Kto to by�? M�j ojciec ich po�wiartuje!~ [NALIA88] */
  IF ~~ THEN EXTERN ~TORGAL~ 18
END

IF ~~ THEN BEGIN 48 // from:
  SAY #728 /* ~Nie! Powiedz, kto to zrobi�? Skoro jeste�cie tylko wynaj�tymi �otrami, kto� musi za tym sta�! Do stu piorun�w, ty mi powiesz! Zmu� go do m�wienia, <CHARNAME>!~ [NALIA89] */
  IF ~~ THEN EXTERN ~TORGAL~ 19
END

IF ~~ THEN BEGIN 49 // from: 44.0
  SAY #730 /* ~Zapewniam ci�, �e s�u�ba nie by�a zepsuta. Ciotunia nie tolerowa�aby tego. Mog� r�czy� za oddanie s�u�by. Stra�e jednak, to co innego.~ */
  IF ~~ THEN UNSOLVED_JOURNAL #23491 /* ~Twierdza d'Arnise zosta�a zaatakowana.

Nalia ze zdziwieniem zauwa�y�a, �e w twierdzy nie mo�na znale�� �adnych zw�ok. By�o tu wielu stra�nik�w, a tak�e Glaicus, wierny ochroniarz jej ojca, jednak wszyscy znikn�li.~ */ GOTO 298
END

IF ~~ THEN BEGIN 50 // from: 44.1
  SAY #731 /* ~Nie chcia�abym tak my�le�. Niekt�rzy ze s�u�by byli dobrymi znajomymi. Doceniali moje mi�osierdzie, tak s�dz�.~ */
  IF ~~ THEN UNSOLVED_JOURNAL #23491 /* ~Twierdza d'Arnise zosta�a zaatakowana.

Nalia ze zdziwieniem zauwa�y�a, �e w twierdzy nie mo�na znale�� �adnych zw�ok. By�o tu wielu stra�nik�w, a tak�e Glaicus, wierny ochroniarz jej ojca, jednak wszyscy znikn�li.~ */ GOTO 299
END

IF ~~ THEN BEGIN 51 // from: 44.2
  SAY #732 /* ~Nie s�dz� by tak si� sta�o. Stra�nicy byli dobrze op�acani. Bardziej prawdopodobne jest, �e nie �yj�. Glaicus odda�by �ycie za mojego ojca.~ */
  IF ~~ THEN UNSOLVED_JOURNAL #23491 /* ~Twierdza d'Arnise zosta�a zaatakowana.

Nalia ze zdziwieniem zauwa�y�a, �e w twierdzy nie mo�na znale�� �adnych zw�ok. By�o tu wielu stra�nik�w, a tak�e Glaicus, wierny ochroniarz jej ojca, jednak wszyscy znikn�li.~ */ EXIT
END

IF ~~ THEN BEGIN 52 // from: 44.3
  SAY #733 /* ~Zapewniam ci�, �e nie brakowa�o im zdolno�ci. Ojciec jest czu�y na takie sprawy, a poza tym pochodzili z pewnego �r�d�a. Nie, oni byli bardzo kompetentni.~ */
  IF ~~ THEN UNSOLVED_JOURNAL #23491 /* ~Twierdza d'Arnise zosta�a zaatakowana.

Nalia ze zdziwieniem zauwa�y�a, �e w twierdzy nie mo�na znale�� �adnych zw�ok. By�o tu wielu stra�nik�w, a tak�e Glaicus, wierny ochroniarz jej ojca, jednak wszyscy znikn�li.~ */ GOTO 300
END

IF WEIGHT #8 /* Triggers after states #: 339 even though they appear after this state */
~Dead("Torgal")
Global("NaliaKeepPlot","GLOBAL",0)
AreaCheck("AR1300")
Global("NaliaRaised","GLOBAL",0)
Global("PlayerHasStronghold","GLOBAL",0)
~ THEN BEGIN 53 // from: 191.1 191.0
  SAY #734 /* ~M�j... m�j dom. M�j ojciec... i co pozosta�o? Kto� to zrobi�... ale kto...~ [NALIA74] */
  IF ~~ THEN REPLY #735 /* ~Jak mniemam moje zadanie tutaj jest zako�czone. Mog� ju� i��?~ */ DO ~EraseJournalEntry(5083)
EraseJournalEntry(5825)
EraseJournalEntry(6549)
EraseJournalEntry(6576)
EraseJournalEntry(7025)
EraseJournalEntry(7079)
EraseJournalEntry(7262)
EraseJournalEntry(9920)
EraseJournalEntry(10073)
EraseJournalEntry(10074)
EraseJournalEntry(11648)
EraseJournalEntry(16002)
EraseJournalEntry(16336)
EraseJournalEntry(16354)
EraseJournalEntry(16542)
EraseJournalEntry(20986)
EraseJournalEntry(23395)
EraseJournalEntry(23489)
EraseJournalEntry(23491)
EraseJournalEntry(40131)
EraseJournalEntry(42371)
EraseJournalEntry(49487)
AddXPObject(Player1,45500)
AddXPObject(Player2,45500)
AddXPObject(Player3,45500)
AddXPObject(Player4,45500)
AddXPObject(Player5,45500)
AddXPObject(Player6,45500)
SetGlobal("NaliaKeepPlot","GLOBAL",1)
TakePartyItem("Key10")
~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta� odbity.

Po ci�kiej walce zamek d'Arnise zosta� oczyszczony z trolli. Niestety, nie uda�o nam si� uratowa� Lorda i zabi� go TorGal, przyw�dca trolli. Ale Nalia �yje... tyle �e przysz�o�� jej i zamku jest niepewna.~ */ GOTO 54
  IF ~~ THEN REPLY #736 /* ~Nie mog� z�agodzi� twojego b�lu. Zrobi�em wszystko, co w mojej mocy, ale niewiele wi�cej mog� tutaj zdzia�a�.~ ~Nie mog� z�agodzi� twojego b�lu. Zrobi�am wszystko, co w mojej mocy, ale niewiele wi�cej mog� tutaj zdzia�a�.~ */ DO ~EraseJournalEntry(5083)
EraseJournalEntry(5825)
EraseJournalEntry(6549)
EraseJournalEntry(6576)
EraseJournalEntry(7025)
EraseJournalEntry(7079)
EraseJournalEntry(7262)
EraseJournalEntry(9920)
EraseJournalEntry(10073)
EraseJournalEntry(10074)
EraseJournalEntry(11648)
EraseJournalEntry(16002)
EraseJournalEntry(16336)
EraseJournalEntry(16354)
EraseJournalEntry(16542)
EraseJournalEntry(20986)
EraseJournalEntry(23395)
EraseJournalEntry(23489)
EraseJournalEntry(23491)
EraseJournalEntry(40131)
EraseJournalEntry(42371)
EraseJournalEntry(49487)
AddXPObject(Player1,45500)
AddXPObject(Player2,45500)
AddXPObject(Player3,45500)
AddXPObject(Player4,45500)
AddXPObject(Player5,45500)
AddXPObject(Player6,45500)
SetGlobal("NaliaKeepPlot","GLOBAL",1)
TakePartyItem("Key10")
~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta� odbity.

Po ci�kiej walce zamek d'Arnise zosta� oczyszczony z trolli. Niestety, nie uda�o nam si� uratowa� Lorda i zabi� go TorGal, przyw�dca trolli. Ale Nalia �yje... tyle �e przysz�o�� jej i zamku jest niepewna.~ */ GOTO 54
  IF ~~ THEN REPLY #737 /* ~Czuj�, �e moje zadanie nie zosta�o wype�nione. Nie uda�o mi si� uratowa� twojego ojca i przykro mi z tego powodu.~ */ DO ~EraseJournalEntry(5083)
EraseJournalEntry(5825)
EraseJournalEntry(6549)
EraseJournalEntry(6576)
EraseJournalEntry(7025)
EraseJournalEntry(7079)
EraseJournalEntry(7262)
EraseJournalEntry(9920)
EraseJournalEntry(10073)
EraseJournalEntry(10074)
EraseJournalEntry(11648)
EraseJournalEntry(16002)
EraseJournalEntry(16336)
EraseJournalEntry(16354)
EraseJournalEntry(16542)
EraseJournalEntry(20986)
EraseJournalEntry(23395)
EraseJournalEntry(23489)
EraseJournalEntry(23491)
EraseJournalEntry(40131)
EraseJournalEntry(42371)
EraseJournalEntry(49487)
AddXPObject(Player1,45500)
AddXPObject(Player2,45500)
AddXPObject(Player3,45500)
AddXPObject(Player4,45500)
AddXPObject(Player5,45500)
AddXPObject(Player6,45500)
SetGlobal("NaliaKeepPlot","GLOBAL",1)
TakePartyItem("Key10")
~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta� odbity.

Po ci�kiej walce zamek d'Arnise zosta� oczyszczony z trolli. Niestety, nie uda�o nam si� uratowa� Lorda i zabi� go TorGal, przyw�dca trolli. Ale Nalia �yje... tyle �e przysz�o�� jej i zamku jest niepewna.~ */ GOTO 55
  IF ~~ THEN REPLY #738 /* ~Przykro mi, �e nie mog� zosta� d�u�ej by to wyja�ni�. Wspomina�a� co� o nagrodzie?~ */ DO ~EraseJournalEntry(5083)
EraseJournalEntry(5825)
EraseJournalEntry(6549)
EraseJournalEntry(6576)
EraseJournalEntry(7025)
EraseJournalEntry(7079)
EraseJournalEntry(7262)
EraseJournalEntry(9920)
EraseJournalEntry(10073)
EraseJournalEntry(10074)
EraseJournalEntry(11648)
EraseJournalEntry(16002)
EraseJournalEntry(16336)
EraseJournalEntry(16354)
EraseJournalEntry(16542)
EraseJournalEntry(20986)
EraseJournalEntry(23395)
EraseJournalEntry(23489)
EraseJournalEntry(23491)
EraseJournalEntry(40131)
EraseJournalEntry(42371)
EraseJournalEntry(49487)
AddXPObject(Player1,45500)
AddXPObject(Player2,45500)
AddXPObject(Player3,45500)
AddXPObject(Player4,45500)
AddXPObject(Player5,45500)
AddXPObject(Player6,45500)
SetGlobal("NaliaKeepPlot","GLOBAL",1)
TakePartyItem("Key10")
~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta� odbity.

Po ci�kiej walce zamek d'Arnise zosta� oczyszczony z trolli. Niestety, nie uda�o nam si� uratowa� Lorda i zabi� go TorGal, przyw�dca trolli. Ale Nalia �yje... tyle �e przysz�o�� jej i zamku jest niepewna.~ */ GOTO 56
  IF ~~ THEN REPLY #739 /* ~Zrobi�em, co w mojej mocy. Mog� oczekiwa� jakiej� nagrody? Nie chc� by to zabrzmia�o nietaktownie.~ ~Zrobi�am, co w mojej mocy. Mog� oczekiwa� jakiej� nagrody? Nie chc� by to zabrzmia�o nietaktownie.~ */ DO ~EraseJournalEntry(5083)
EraseJournalEntry(5825)
EraseJournalEntry(6549)
EraseJournalEntry(6576)
EraseJournalEntry(7025)
EraseJournalEntry(7079)
EraseJournalEntry(7262)
EraseJournalEntry(9920)
EraseJournalEntry(10073)
EraseJournalEntry(10074)
EraseJournalEntry(11648)
EraseJournalEntry(16002)
EraseJournalEntry(16336)
EraseJournalEntry(16354)
EraseJournalEntry(16542)
EraseJournalEntry(20986)
EraseJournalEntry(23395)
EraseJournalEntry(23489)
EraseJournalEntry(23491)
EraseJournalEntry(40131)
EraseJournalEntry(42371)
EraseJournalEntry(49487)
AddXPObject(Player1,45500)
AddXPObject(Player2,45500)
AddXPObject(Player3,45500)
AddXPObject(Player4,45500)
AddXPObject(Player5,45500)
AddXPObject(Player6,45500)
SetGlobal("NaliaKeepPlot","GLOBAL",1)
TakePartyItem("Key10")
~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta� odbity.

Po ci�kiej walce zamek d'Arnise zosta� oczyszczony z trolli. Niestety, nie uda�o nam si� uratowa� Lorda i zabi� go TorGal, przyw�dca trolli. Ale Nalia �yje... tyle �e przysz�o�� jej i zamku jest niepewna.~ */ GOTO 56
END

IF ~~ THEN BEGIN 54 // from: 53.1 53.0
  SAY #740 /* ~Mo�esz i��, je�li chcesz. Ja zostaj�... och nie. Zaczekaj! Hm, mo�esz zosta� d�u�ej? Musz�... och niewa�ne. Niech to wszystko szlag, jak nie jedna sprawa, to inna!~ */
  IF ~~ THEN REPLY #741 /* ~�egnaj wi�c. Uwa�aj na siebie.~ */ GOTO 57
  IF ~~ THEN REPLY #742 /* ~O co chodzi tym razem? No m�w�e, nie b�d� tu stercze� przez ca�y dzie�!~ */ DO ~GiveGoldForce(10650)~ GOTO 58
  IF ~~ THEN REPLY #743 /* ~O co chodzi? Mog� ci jeszcze w czym� pom�c?~ */ DO ~GiveGoldForce(10650)~ GOTO 58
END

IF ~~ THEN BEGIN 55 // from: 53.2
  SAY #744 /* ~Jestem wdzi�czna i nagrodz� ci� w miar� moich mo�liwo�ci. Teraz, gdy nie ma ju� ojca musz�... och nie. Och, mog� ci� w jaki� spos�b przekona� do... och... nie. Nie, niewa�ne.~ */
  IF ~~ THEN REPLY #745 /* ~Dzi�kuj� ci. Wezm� tylko moj� nagrod� i ju� mnie nie ma. �egnaj i powodzenia.~ */ GOTO 57
  IF ~~ THEN REPLY #746 /* ~O co chodzi tym razem? No m�w�e, nie mam zamiaru siedzie� ca�� noc i zastanawia� si�, co chcia�a� powiedzie�.~ */ DO ~GiveGoldForce(10650)~ GOTO 58
  IF ~~ THEN REPLY #747 /* ~Mog� jeszcze co� dla ciebie zrobi�? Ch�tnie pos�ucham.~ */ DO ~GiveGoldForce(10650)~ GOTO 58
END

IF ~~ THEN BEGIN 56 // from: 53.4 53.3
  SAY #748 /* ~Zobacz�, co si� da zrobi�. Teraz skoro ojca ju� nie ma musz�... och nie. Och, zaczekaj! Mo�esz... nie. Zapomnij, �e cokolwiek m�wi�am. Lepiej ju� id�.~ */
  IF ~~ THEN REPLY #749 /* ~Dzi�kuj� ci. �ycz� ci powodzenia.~ */ GOTO 57
  IF ~~ THEN REPLY #750 /* ~Doko�cz to, co zacz�a�, Nalio. Nie mam zamiaru siedzie� ca�� noc i zastanawia� si�, co chcia�a� powiedzie�.~ */ DO ~GiveGoldForce(10650)~ GOTO 58
  IF ~~ THEN REPLY #751 /* ~Mog� jeszcze co� dla ciebie zrobi�? M�w �mia�o.~ */ DO ~GiveGoldForce(10650)~ GOTO 58
END

IF ~~ THEN BEGIN 57 // from: 66.4 66.3 56.0 55.0 54.0
  SAY #752 /* ~Oto nagroda, we� z�oto z mojej d�oni. Nie dbam o nie. W tej chwili si� nie liczy. Do widzenia. �ycz� ci powodzenia.~ */
  IF ~~ THEN DO ~GiveGoldForce(650)
SetGlobal("RoenalControl","GLOBAL",1)
CreateCreature("QUINT",[3306.2412],14)
LeaveParty()
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
EscapeAreaMove("AR1300",3234,2477,14)
~ EXIT
END

IF ~~ THEN BEGIN 58 // from: 56.2 56.1 55.2 55.1 54.2 54.1
  SAY #753 /* ~To... to zale�y od tego, co si� teraz stanie. Jestem zar�czona z cz�owiekiem, kt�rego nie chc� po�lubi�. Ojciec powiedzia�, �e nie dopu�ci�by do tego, dop�ki taka by�aby moja wola, ale teraz go nie ma.~ */
  IF ~Gender(Player1,MALE)
~ THEN REPLY #754 /* ~Rozumiem. Pragniesz ma��e�stwa z rozs�dku by zapobiec zalotom twojego narzeczonego.~ */ GOTO 59
  IF ~Gender(Player1,FEMALE)
~ THEN REPLY #755 /* ~Chcesz ma��e�stwa z rozs�dku? Ciekawe, ale w�tpi� by tw�j narzeczony da� si� w ten spos�b oszuka�.~ */ GOTO 60
  IF ~~ THEN REPLY #756 /* ~Mog� zabi� tego cz�owieka. Rozwi�za�oby to tw�j problem.~ */ GOTO 61
  IF ~~ THEN REPLY #757 /* ~M�w dalej. Co proponujesz by unikn�� tych o�wiadczyn? Znikni�cie?~ */ GOTO 62
END

IF ~~ THEN BEGIN 59 // from: 58.0
  SAY #758 /* ~Z tob�? Nic tak przykrego. By�by to �aden post�p; nikt by nie uwierzy�, �e znalaz�am upodobanie w kim� takim jak ty. Eee, bez urazy. Naprawd�.~ */
  IF ~~ THEN GOTO 63
END

IF ~~ THEN BEGIN 60 // from: 58.1
  SAY #759 /* ~Wyobra� sobie ten skandal. Kto by uwierzy�, �e ��cz� mnie z tob� jakie� zwi�zki, nawet gdyby� by�a odpowiedniej p�ci? Znaczy si�, jestem dobroczynna, ale doprawdy... eee, bez urazy.~ */
  IF ~~ THEN GOTO 63
END

IF ~~ THEN BEGIN 61 // from: 58.2
  SAY #760 /* ~To rozwi�zanie jest nie do przyj�cia! Nie wezm� w tym udzia�u! Chocia� gdyby to mia�o wygl�da� jak wypadek... NIE! Nie, nie s�dz�, �eby to by�o konieczne.~ */
  IF ~~ THEN GOTO 63
END

IF ~~ THEN BEGIN 62 // from: 58.3
  SAY #761 /* ~Nie, to by nic nie da�o. Kiedy� i tak do tego dojdzie, a unikanie tradycyjnych obowi�zk�w �le by o mnie �wiadczy�o.~ */
  IF ~~ THEN GOTO 63
END

IF ~~ THEN BEGIN 63 // from: 62.0 61.0 60.0 59.0
  SAY #763 /* ~Nie, mam inn� propozycj�. Nie s�dz� by wielu ludzi da�o si� na to nabra�, ale mog�oby to uratowa� m�j dom od z�ego gospodarza, jaki z pewno�ci� tu nadejdzie.~ */
  IF ~~ THEN GOTO 158
END

IF ~~ THEN BEGIN 64 // from: 158.0
  SAY #764 /* ~S� perfekcyjnym przyk�adem tego, czego nienawidz� u arystokracji. Ka�dy jest dla nich ni�ej sytuowany, i je�li chcesz by ci� szanowano, musisz by� jednym z nich.~ */
  IF ~~ THEN GOTO 159
END

IF ~~ THEN BEGIN 65 // from: 159.0
  SAY #765 /* ~M�j ojciec odziedziczy� przy urodzeniu tytu�, ale wymaga� by ludzie wyr�niali si� dzi�ki swoim czynom. Przestrzega� etykiety, ale nie kry� swojej niech�ci do niej.~ */
  IF ~~ THEN GOTO 160
END

IF ~~ THEN BEGIN 66 // from: 160.0
  SAY #770 /* ~Przyrzeczono moj� r�k� okropnemu cz�owiekowi o imieniu Isaea Roenall. Teraz b�dzie on z pewno�ci� d��y� do jak najszybszych za�lubin, a ja zostan� zmuszona na prowadzenie �ycia spokojnej arystokratki.~ */
  IF ~~ THEN REPLY #771 /* ~C�, to z pewno�ci� brzmi okropnie. Ca�y ten przepych. Wybacz, �e nie wylej� dla ciebie potoku �ez.~ */ GOTO 67
  IF ~~ THEN REPLY #772 /* ~W ten spos�b staniesz si� cz�ci� systemu, kt�rego tak nienawidzisz. Jakie masz wyj�cie?~ */ GOTO 161
  IF ~~ THEN REPLY #773 /* ~D�uga i m�cz�ca opowie��, Nalio. Przejd�, je�li �aska do sedna sprawy.~ */ GOTO 68
  IF ~~ THEN REPLY #774 /* ~Naprawd� chcia�bym ci pom�c, zaklinam si�. Je�li ju� sko�czy�a� wezm� moj� nagrod� i p�jd�.~ ~Naprawd� chcia�abym ci pom�c, zaklinam si�. Je�li ju� sko�czy�a� wezm� moj� nagrod� i p�jd�.~ */ GOTO 57
  IF ~~ THEN REPLY #775 /* ~Przykro mi z powodu twoich k�opot�w, ale naprawd� musz� ju� i��. Powodzenia, Nalio.~ */ GOTO 57
END

IF ~~ THEN BEGIN 67 // from: 66.0
  SAY #766 /* ~Z pewno�ci� dla ciebie nie wygl�da to na kryzys, ale ja sp�dzi�am ca�e �ycie pr�buj�c poprawi� z�o, kt�re wyrz�dzono tym o ni�szym pochodzeniu.~ */
  IF ~~ THEN GOTO 301
END

IF ~~ THEN BEGIN 68 // from: 66.2
  SAY #767 /* ~Zapewniam ci�, �e nie musisz si� o nic martwi� zawczasu. Mo�esz tylko na tym zyska�, praktycznie nic przy tym nie robi�c.~ */
  IF ~~ THEN GOTO 161
END

IF ~~ THEN BEGIN 69 // from: 161.0
  SAY #768 /* ~Jako dziedziczka mam prawo wybra� g�ow� tego miejsca. Nie mog�abym skutecznie przeciwstawi� si� Roenallom. Ty, ze swoimi... talentami, mo�esz si� okaza� postaci� budz�c� postrach.~ */
  IF ~~ THEN REPLY #776 /* ~Roenallowie zgodziliby si� na to? Trudno mi w to uwierzy�.~ */ GOTO 162
  IF ~~ THEN REPLY #777 /* ~Co musz� zrobi�, aby wzi�� na siebie t� rol�? Czego by ode mnie wymagano?~ */ GOTO 163
  IF ~
~ THEN REPLY #778 /* ~Podoba mi si� ten pomys�.~ */ GOTO 73
  IF ~~ THEN REPLY #780 /* ~Po prostu pr�bujesz obarczy� mnie swoimi problemami!~ */ GOTO 164
END

IF ~~ THEN BEGIN 70 // from: 162.0
  SAY #781 /* ~Prosz�, to zapewni, �e Roenallowie nie przejm� w�adzy. S� ciemi�zcami i nie zajm� si� tym miejscem w spos�b oddaj�cy cze�� memu ojcu.~ */
  IF ~~ THEN REPLY #785 /* ~Opiekowanie si� tym miejscem w tak niespokojnych czasach b�dzie zaszczytem. Do�o�� stara� by to miejsce rozkwit�o.~ */ GOTO 74
  IF ~~ THEN REPLY #786 /* ~Przyjm� twoj� ofert� i biada tym, kt�rzy wejd� nam w drog�. Dopilnuj� by to miejsce funkcjonowa�o jak nale�y.~ */ GOTO 74
  IF ~~ THEN REPLY #787 /* ~Nie mog� si� na to zgodzi�. Z pewno�ci� s� inni, kt�rzy lepiej nadaj� si� na moje miejsce. Przykro mi.~ */ GOTO 75
  IF ~~ THEN REPLY #792 /* ~Nie chc� mie� z tym nic wsp�lnego. Znajd� sobie innego frajera.~ */ GOTO 75
END

IF ~~ THEN BEGIN 71 // from: 163.0
  SAY #782 /* ~Zajmiesz si� ceremonia�ami, ale niczym zbyt stresuj�cym. Prosz�, Roenallowie nie zaj�liby si� tym miejscem w spos�b oddaj�cy cze�� memu ojcu.~ */
  IF ~~ THEN REPLY #788 /* ~Zgadzam si�. Opiekowanie si� tym miejscem w tak niespokojnych czasach b�dzie zaszczytem.~ */ GOTO 74
  IF ~~ THEN REPLY #789 /* ~Przyjm� twoj� ofert� i biada tym, kt�rzy wejd� nam w drog�. Dopilnuj� by to miejsce funkcjonowa�o jak nale�y.~ */ GOTO 74
  IF ~~ THEN REPLY #790 /* ~Nie mog� si� na to zgodzi�. Z pewno�ci� s� inni, kt�rzy lepiej nadaj� si� na moje miejsce. Przykro mi.~ */ GOTO 75
  IF ~~ THEN REPLY #791 /* ~Nie chc� mie� z tym nic wsp�lnego. Znajd� sobie innego frajera.~ */ GOTO 75
END

IF ~~ THEN BEGIN 72 // from: 164.0
  SAY #783 /* ~Oka�esz si� postaci� budz�c� postrach, a moi s�udzy i ja b�dziemy chronieni przed Roenallami. Prosz�, nawet Ciotunia b�dzie nalega� na ich przybycie, je�li nie b�d� szybko dzia�a�.~ */
  IF ~~ THEN REPLY #793 /* ~Zgadzam si�. Opiekowanie si� tym miejscem w tak niespokojnych czasach b�dzie zaszczytem.~ */ GOTO 74
  IF ~~ THEN REPLY #794 /* ~Przyjm� twoj� ofert� i biada tym, kt�rzy wejd� nam w drog�. Dopilnuj� by to miejsce funkcjonowa�o jak nale�y.~ */ GOTO 74
  IF ~~ THEN REPLY #795 /* ~Nie mog� si� na to zgodzi�. Z pewno�ci� s� inni, kt�rzy lepiej nadaj� si� na moje miejsce. Przykro mi.~ */ GOTO 75
  IF ~~ THEN REPLY #796 /* ~Nie chc� mie� z tym nic wsp�lnego. Znajd� sobie innego frajera.~ */ GOTO 75
END

IF ~~ THEN BEGIN 73 // from: 69.2
  SAY #784 /* ~Nie jest rzecz� niezwyk��, kiedy wojownik przejmuje w�asno�� pana dworu, gdy ten jest... martwy. Je�li b�dziesz przewodzi� temu miejscu, przyniesie to cze�� memu ojcu.~ */
  IF ~~ THEN REPLY #797 /* ~Zgadzam si�. Opiekowanie si� tym miejscem w tak niespokojnych czasach b�dzie zaszczytem.~ */ GOTO 74
  IF ~~ THEN REPLY #798 /* ~Przyjm� twoj� ofert� i biada tym, kt�rzy wejd� nam w drog�. Dopilnuj� by to miejsce funkcjonowa�o jak nale�y.~ */ GOTO 74
  IF ~~ THEN REPLY #799 /* ~Nie mog� si� na to zgodzi�. Z pewno�ci� s� inni, kt�rzy lepiej nadaj� si� na moje miejsce. Przykro mi.~ */ GOTO 75
  IF ~~ THEN REPLY #800 /* ~Nie chc� mie� z tym nic wsp�lnego. Znajd� sobie innego frajera.~ */ GOTO 75
END

IF ~~ THEN BEGIN 74 // from: 73.1 73.0 72.1 72.0 71.1 71.0 70.1 70.0
  SAY #801 /* ~Cudownie! Nie mog� mnie teraz zmusi� do opuszczenia tego miejsca, za� Isaea mo�e zapomnie� o tych przekl�tych zar�czynach. Przewodzisz tu teraz, oczywi�cie w granicach rozs�dku. Ja zachowuj� dziedzictwo krwi i mog� je odebra�.~ */
  IF ~~ THEN GOTO 165
END

IF ~~ THEN BEGIN 75 // from: 73.3 73.2 72.3 72.2 71.3 71.2 70.3 70.2
  SAY #802 /* ~Ale... dobrze. Pozostan� tutaj, aby zrobi� to, co musi by� zrobione. Je�li zmienisz zdanie jest jeszcze czas zanim Roenallowie b�d� w stanie przej�� w�adz�. Pomy�l o tym.~ */
  IF ~~ THEN DO ~SetGlobal("NaliaAtKeep","GLOBAL",1)
LeaveParty()
ChangeAIScript("",DEFAULT)
SetDialog("Nalia")
EscapeAreaMove("AR1300",3234,2477,14)
~ EXIT
END

IF ~~ THEN BEGIN 76 // from:
  SAY #803 /* ~Tak? Tak mam na imi�, co mog� zrobi� dla ciebie, synu?~ */
  IF ~~ THEN EXTERN ~NALIAMES~ 1
END

IF ~~ THEN BEGIN 77 // from:
  SAY #1701 /* ~Oczywi�cie. Dobrze si� spisa�e�.~ */
  IF ~~ THEN EXTERN ~NALIAMES~ 2
END

IF ~~ THEN BEGIN 78 // from:
  SAY #1703 /* ~Zobaczmy zatem co tu jest napisane...~ */
  IF ~~ THEN GOTO 79
END

IF ~~ THEN BEGIN 79 // from: 78.0
  SAY #1704 /* ~A niech mnie...~ */
  IF ~~ THEN DO ~SetGlobalTimer("NaliaGraveyardTimer","GLOBAL",THREE_DAYS)~ GOTO 80
END

IF ~~ THEN BEGIN 80 // from: 79.0
  SAY #1705 /* ~Musz� si� natychmiast uda� do Dzielnicy Cmentarnej w Athkatli. Wszystkie inne sprawy musz� zaczeka�. Przykro mi, ale nie mog� zmieni� zdania.~ */
  IF ~~ THEN REPLY #1706 /* ~Co si� sta�o? Musi to by� co� wa�nego, skoro tak ci� zasmuci�o.~ */ GOTO 81
  IF ~~ THEN REPLY #1707 /* ~Nie mog� odej��, nie znaj�c wcze�niej powod�w.~ */ GOTO 82
  IF ~~ THEN REPLY #1708 /* ~Jestem pewien, �e w ko�cu zawr�cimy t� drog�. Cierpliwo�ci, mamy du�o do zrobienia.~ ~Jestem pewna, �e w ko�cu zawr�cimy t� drog�. Cierpliwo�ci, mamy du�o do zrobienia.~ */ GOTO 83
  IF ~~ THEN REPLY #1709 /* ~Bez w�tpienia kolejna z twoich spraw, kt�ra rozro�nie si� w zbrojny konflikt. O co chodzi tym razem?~ */ GOTO 84
END

IF ~~ THEN BEGIN 81 // from: 80.0
  SAY #1710 /* ~Masz wi�cej racji ni� mog�oby ci si� zdawa�, ale wybaczam ci ignorancj�. Wiadomo�� ta dotyczy pogrzebu mego ojca. Musz� si� uda� do Dzielnicy Cmentarnej.~ */
  IF ~~ THEN REPLY #1714 /* ~W takim razie powinni�my wyruszy� najszybciej jak to mo�liwe. Nie mam najmniejszego zamiaru pozwoli� ci na sp�nienie si� na pogrzeb.~ */ GOTO 85
  IF ~~ THEN REPLY #1715 /* ~Dobrze, udam si� w tym kierunku przy najbli�szej nadarzaj�cej si� okazji.~ */ GOTO 86
  IF ~~ THEN REPLY #1716 /* ~Wsp�czuj�, ale to nie mog�o si� zdarzy� w gorszym momencie. Trzeba za�atwi� inne sprawy.~ */ GOTO 87
  IF ~~ THEN REPLY #1726 /* ~To po prostu nie wchodzi w rachub�. Nie mam ani czasu, ani ochoty.~ */ GOTO 87
END

IF ~~ THEN BEGIN 82 // from: 80.1
  SAY #1711 /* ~List ten powiadamia� o pogrzebie mojego ojca, kt�rego nie mam zamiaru opu�ci�. Musz� ruszy� w drog� jak najszybciej.~ */
  IF ~~ THEN REPLY #1717 /* ~W takim razie ruszajmy. Nie pozwol� by� si� sp�ni�a na pogrzeb z mojego powodu.~ */ GOTO 85
  IF ~~ THEN REPLY #1718 /* ~Zaniecham moich plan�w. Przypuszczam, �e zajmie nam to sporo czasu, gdy ju� b�dziemy tam na miejscu?~ */ GOTO 86
  IF ~~ THEN REPLY #1719 /* ~Wsp�czuj� ci, ale, z drugiej strony, nie mog� teraz i��.~ */ GOTO 87
  IF ~~ THEN REPLY #1727 /* ~To nie jest �adne rozwi�zanie w tej chwili. Mamy na g�owie sprawy, kt�re nie mog� czeka�.~ */ GOTO 87
END

IF ~~ THEN BEGIN 83 // from: 80.2
  SAY #1712 /* ~W normalnych warunkach by� mo�e, ale to nie s� zwyk�e czasy. List ten powiadamia o pogrzebie mojego ojca. Musz� jak najszybciej dosta� si� do Athkatli.~ */
  IF ~~ THEN REPLY #1720 /* ~W takim razie powinni�my wyruszy� najszybciej jak to mo�liwe. Nie mam najmniejszego zamiaru pozwoli� ci na sp�nienie si� na pogrzeb.~ */ GOTO 85
  IF ~~ THEN REPLY #1721 /* ~Dobrze, udam si� w tym kierunku przy najbli�szej nadarzaj�cej si� okazji.~ */ GOTO 86
  IF ~~ THEN REPLY #1722 /* ~Wsp�czuj�, ale to nie mog�o si� zdarzy� w gorszym momencie. Trzeba za�atwi� inne sprawy.~ */ GOTO 87
  IF ~~ THEN REPLY #1728 /* ~To po prostu nie wchodzi w rachub�. Sama sk�adaj honory, ja nie mam na to czasu.~ */ GOTO 88
END

IF ~~ THEN BEGIN 84 // from: 80.3
  SAY #1713 /* ~Przykro mi, �e wa�ne dla mnie sprawy s� ci tak nie na r�k�. List ten powiadamia o pogrzebie mojego ojca. Musz� jak najszybciej dosta� si� do Athkatli.~ */
  IF ~~ THEN REPLY #1723 /* ~W takim razie ruszajmy. Nie pozwol� by� si� sp�ni�a na pogrzeb z mojego powodu.~ */ GOTO 85
  IF ~~ THEN REPLY #1724 /* ~W porz�dku, porzuc� wszelkie moje zaj�cia i wyruszymy najszybciej jak to mo�liwe. Przypuszczam, �e zajmie nam to sporo czasu, gdy ju� b�dziemy tam na miejscu?~ */ GOTO 86
  IF ~~ THEN REPLY #1725 /* ~Wsp�czuj� ci, ale, z drugiej strony, nie mog� teraz i��.~ */ GOTO 87
  IF ~~ THEN REPLY #1729 /* ~To nie jest �adne rozwi�zanie w tej chwili. Mamy na g�owie du�o wa�niejsze sprawy, kt�rych nie mo�na od�o�y� na p�niej.~ */ GOTO 87
END

IF ~~ THEN BEGIN 85 // from: 87.2 84.0 83.0 82.0 81.0
  SAY #1730 /* ~Dzi�kuj� ci, doceniam to. Wygl�da na to, �e m�j d�ug wdzi�czno�ci wobec ciebie powi�kszy� si�.~ */
  IF ~~ THEN UNSOLVED_JOURNAL #7036 /* ~Pogrzeb ojca Nalii

Przyby� pos�aniec, kt�ry powiedzia�, �e Nalia musi si� uda� jak najszybciej do Dzielnicy Grobowej w Athkatli na pogrzeb ojca. Postanowili�my jej towarzyszy�.~ */ EXIT
END

IF ~~ THEN BEGIN 86 // from: 88.0 87.1 84.1 83.1 82.1 81.1
  SAY #1731 /* ~Wiem, �e nie jest ci to na r�k�, ale nie martw si�. Zajmie nam to tylko chwilk�. Dzi�kuj� ci za zrozumienie, nawet je�li nie przysz�o �atwo.~ */
  IF ~~ THEN UNSOLVED_JOURNAL #7036 /* ~Pogrzeb ojca Nalii

Przyby� pos�aniec, kt�ry powiedzia�, �e Nalia musi si� uda� jak najszybciej do Dzielnicy Grobowej w Athkatli na pogrzeb ojca. Postanowili�my jej towarzyszy�.~ */ EXIT
END

IF ~~ THEN BEGIN 87 // from: 84.3 84.2 83.2 82.3 82.2 81.3 81.2
  SAY #1732 /* ~To s� szczeg�lne okoliczno�ci. Nie prosz� o wiele... c�, poza uratowaniem mojego domu i rozgromieniem legionu trolli. Prosz�, mo�emy przynajmniej wkr�tce wyruszy�?~ */
  IF ~~ THEN REPLY #1733 /* ~Nie, przykro mi, ale nie zmieni� swojej decyzji. Nie mamy czasu na wycieczki na pogrzeby.~ */ GOTO 88
  IF ~~ THEN REPLY #1734 /* ~To jest do przyj�cia. Wyruszymy przy najbli�szej sposobno�ci.~ */ GOTO 86
  IF ~~ THEN REPLY #1735 /* ~Skoro tak ci na tym zale�y, powinni�my rusza� od razu.~ */ GOTO 85
END

IF ~~ THEN BEGIN 88 // from: 87.0 83.3
  SAY #1736 /* ~Nie pozostawiasz mi wielkiego wyboru. Dobrze wi�c... Oto wi�kszo�� twoich rzeczy. Je�li zapragniesz mnie odszuka�, powinnam by� Pod Miedzianym Diademem w dzie� po pogrzebie.~ */
  IF ~~ THEN REPLY #1737 /* ~Co? Zaczekaj! W porz�dku, pojedziemy, ale nie w tej chwili. Cho� wkr�tce.~ */ GOTO 86
  IF ~~ THEN REPLY #1738 /* ~By� mo�e tak b�dzie najlepiej. Tam si� spotkamy.~ */ GOTO 89
  IF ~~ THEN REPLY #1739 /* ~Id� wi�c! Musz� oczekiwa� lojalno�ci, a to po prostu nie wystarczy!~ */ GOTO 90
END

IF ~~ THEN BEGIN 89 // from: 88.1
  SAY #1740 /* ~Dobrze. Mam nadziej�, �e do mnie do��czysz. Rozumiesz chyba, dlaczego musz� i��, prawda? Mam tak� nadziej�. Do zobaczenia?~ */
  IF ~~ THEN DO ~GivePartyAllEquipment()
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
SetGlobal("NaliaWentToFuneral","GLOBAL",1)
SetGlobalTimer("NaliaReturnsFromFuneral","GLOBAL",ONE_DAY)
LeaveParty()
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 90 // from: 88.2
  SAY #1741 /* ~Pod��am z t� grup� ze wzgl�du na pomoc, jakiej udzielamy. Nie jestem �o�nierzem, ani ty genera�em. Zosta�, je�li chcesz, ale ja musz� i��.~ */
  IF ~~ THEN DO ~GivePartyAllEquipment()
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
SetGlobal("NaliaWentToFuneral","GLOBAL",1)
SetGlobalTimer("NaliaReturnsFromFuneral","GLOBAL",ONE_DAY)
LeaveParty()
EscapeArea()~ EXIT
END

IF WEIGHT #9 /* Triggers after states #: 339 even though they appear after this state */
~GlobalTimerExpired("NaliaGraveyardTimer","GLOBAL")
Global("NaliaGraveComplain","GLOBAL",0)
!AreaCheck("AR0800")
Global("NaliaWentToFuneral","GLOBAL",0)
!Global("IsaeaNalia","GLOBAL",1)~ THEN BEGIN 91 // from:
  SAY #1742 /* ~Musz� nalega�, aby�my natychmiast udali si� do Athkatli. Przykro mi, ale tak si� umawiali�my. P�jd� sama, je�li b�d� musia�a.~ [NALIA75] */
  IF ~~ THEN REPLY #1743 /* ~Przepraszam za tak d�ug� zw�ok�. Wyruszamy natychmiast.~ */ DO ~SetGlobalTimer("NaliaGraveyardTimer","GLOBAL",THREE_DAYS)
SetGlobal("NaliaGraveComplain","GLOBAL",1)~ GOTO 92
  IF ~~ THEN REPLY #1744 /* ~Jeszcze tylko chwil�, Nalio. Nie martw si�, zaprowadz� ci� tam.~ */ DO ~SetGlobalTimer("NaliaGraveyardTimer","GLOBAL",THREE_DAYS)
SetGlobal("NaliaGraveComplain","GLOBAL",1)~ GOTO 93
  IF ~~ THEN REPLY #1745 /* ~Naprawd� nie uwa�am by�my mieli na to czas. Rzeczywi�cie musisz tam by�?~ */ DO ~SetGlobalTimer("NaliaGraveyardTimer","GLOBAL",THREE_DAYS)
SetGlobal("NaliaGraveComplain","GLOBAL",1)~ GOTO 94
END

IF ~~ THEN BEGIN 92 // from: 91.0
  SAY #1746 /* ~Jest to dla mnie bardzo wa�ne. Dzi�kuj� ci za pomoc.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 93 // from: 91.1
  SAY #1747 /* ~Nie martwi� si� poniewa� odchodz�. Przykro mi, ale jest to dla mnie bardzo wa�ne i nie mog� tego przegapi�. Powinnam by� w 'Pod Miedzianym Diademem' w dzie� po pogrzebie.~ */
  IF ~~ THEN DO ~GivePartyAllEquipment()
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
SetGlobal("NaliaWentToFuneral","GLOBAL",1)
SetGlobalTimer("NaliaReturnsFromFuneral","GLOBAL",ONE_DAY)
LeaveParty()
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 94 // from: 91.2
  SAY #1748 /* ~Na pogrzebie mojego ojca? No, my�l�, �e tak! Nie mog� si� d�u�ej godzi� na te op�nienia. B�d� w 'Pod Miedzianym Diademem' w dzie� po pogrzebie, je�li chcesz mnie jeszcze zobaczy�.~ */
  IF ~~ THEN DO ~GivePartyAllEquipment()
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
SetGlobal("NaliaWentToFuneral","GLOBAL",1)
SetGlobalTimer("NaliaReturnsFromFuneral","GLOBAL",ONE_DAY)
LeaveParty()
EscapeArea()~ EXIT
END

IF WEIGHT #10 /* Triggers after states #: 339 even though they appear after this state */
~GlobalTimerExpired("NaliaGraveyardTimer","GLOBAL")
Global("NaliaGraveComplain","GLOBAL",1)
!AreaCheck("AR0800")
Global("NaliaWentToFuneral","GLOBAL",0)
!Global("IsaeaNalia","GLOBAL",1)~ THEN BEGIN 95 // from:
  SAY #1749 /* ~Nie mog� ju� d�u�ej czeka�. Musz� wyruszy� w tej chwili, niezale�nie od tego czy to komu� odpowiada, czy nie! B�d� w gospodzie Pod Miedzianym Diademem w dzie� po pogrzebie, je�li chcesz mnie jeszcze zobaczy�.~ [NALIA76] */
  IF ~~ THEN DO ~setGlobal("NaliaGraveComplain","GLOBAL",2)
GivePartyAllEquipment()
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
SetGlobal("NaliaWentToFuneral","GLOBAL",1)
SetGlobalTimer("NaliaReturnsFromFuneral","GLOBAL",ONE_DAY)
LeaveParty()
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 96 // from:
  SAY #1769 /* ~Och nie! To Isaea! Wyno�my si� st�d.~ [NALIA90] */
  IF ~~ THEN EXTERN ~ISAEA~ 1
END

IF ~~ THEN BEGIN 97 // from:
  SAY #1771 /* ~Przesta�, Isaea. Ja si� nie 'tu�am' jak wystrojeni g�upcy szukaj�cy wra�e�. Ja pomagam ludziom.~ */
  IF ~~ THEN EXTERN ~ISAEA~ 2
END

IF ~~ THEN BEGIN 98 // from:
  SAY #1773 /* ~Na czele mojego domu stoi kto�, kto nie jest ci winny pos�usze�stwa. Czy takie umowy utrzymuj� wa�no�� po �mierci ich tw�rc�w? Nie, wojownik mo�e obj�� tytu� do...~ */
  IF ~~ THEN EXTERN ~ISAEA~ 4
END

IF ~~ THEN BEGIN 99 // from:
  SAY #1775 /* ~Mojego domu? Jakiego domu? Twoja rodzina rozporz�dza posiad�o�ci� mojego ojca jak swoj�. To oznacza, �e moje imi� straci�o... straci�o wszelk� szlachetno�� jak� mia�o.~ */
  IF ~~ THEN GOTO 166
END

IF ~~ THEN BEGIN 100 // from:
  SAY #1778 /* ~Tak w�a�nie s�dzi�am. Nie, nie s�dz� bym ci� mia�a po�lubi�, Isaea. Nie musz�, ani nie potrzebuj�, a poza tym, i co najwa�niejsze, nie czuj� si� dobrze w twoim towarzystwie.~ */
  IF ~~ THEN EXTERN ~ISAEA~ 5
END

IF ~~ THEN BEGIN 101 // from:
  SAY #1780 /* ~Nie ma nic bardziej absurdalnego ni� ty, forsuj�cy pomys� tych 'zar�czyn'. Nie, Isaea, nie wyjd� za ciebie. Przede wszystkim nie czuj� si� dobrze w twoim towarzystwie.~ */
  IF ~~ THEN EXTERN ~ISAEA~ 5
END

IF ~~ THEN BEGIN 102 // from:
  SAY #1787 /* ~Dzi�kuj� ci, Lordzie Roenall. By�by zadowolony s�ysz�c tak� pochwa��.~ */
  IF ~~ THEN EXTERN ~FARTHIN~ 1
END

IF ~~ THEN BEGIN 103 // from:
  SAY #1789 /* ~Lordzie Roenall, jeste� sko�czonym �ajdakiem!~ */
  IF ~Global("PCKeepOwner","GLOBAL",1)~ THEN EXTERN ~FARTHIN~ 2
  IF ~Global("PCKeepOwner","GLOBAL",0)~ THEN EXTERN ~FARTHIN~ 3
END

IF ~~ THEN BEGIN 104 // from:
  SAY #1793 /* ~CO powiedzia� Isaea?! Opu�ci�am?! Wyrwano mi go! Co...~ */
  IF ~~ THEN EXTERN ~ISAEA~ 8
END

IF ~~ THEN BEGIN 105 // from:
  SAY #1794 /* ~Obawiam si�, �e jeste� �le poinformowany, panie. Nie, po �mierci mojego ojca najlepiej by�o odda� si� pod opiek� wojownika, kt�ry uratowa� t� twierdz�. Znasz stare zwyczaje, nieprawda�?~ */
  IF ~~ THEN EXTERN ~FARTHIN~ 4
END

IF ~~ THEN BEGIN 106 // from:
  SAY #1799 /* ~Co mu powiedzia�e�, Isaea? �e mnie przegoniono i ba�am si� wr�ci�? Czy to w ten spos�b zamierzasz zaw�adn�� mym domem, moim �yciem? Nie pozwol� na to!~ */
  IF ~~ THEN EXTERN ~ISAEA~ 9
END

IF ~~ THEN BEGIN 107 // from:
  SAY #1801 /* ~M�wi�... m�wi� by� wzi�� swoje imi� i si� nim ud�awi�! Nie b�d� twoj� maskotk�!~ */
  IF ~~ THEN EXTERN ~ISAEA~ 10
END

IF WEIGHT #11 /* Triggers after states #: 339 even though they appear after this state */
~Global("IsaeaNalia","GLOBAL",1)
Global("NaliaComplainsIsaea","LOCALS",0)
GlobalTimerExpired("FuneralLeaveTimer","GLOBAL")
CombatCounter(0)
~ THEN BEGIN 108 // from:
  SAY #1811 /* ~Przepraszam za t� przyd�ug� wymian� zda�, ale on jest takim �obuzem, takim... takim manipuluj�cym... takim... och, do diab�a z manierami, on jest sko�czonym draniem, a nazwanie go w ten spos�b obra�a wszystkich innych drani!~ [NALIA77] */
  IF ~~ THEN REPLY #1812 /* ~Czy on zawsze by� taki... napalony? Wygl�da na zdeterminowanego by wprowadzi� w �ycie wasze zar�czyny.~ */ DO ~SetGlobal("NaliaComplainsIsaea","LOCALS",1)~ GOTO 109
  IF ~~ THEN REPLY #1813 /* ~Powiedzia�, �e mo�e 'pom�c lub zaszkodzi�', i �e 'ju� to robi�'. Co to znaczy?~ */ DO ~SetGlobal("NaliaComplainsIsaea","LOCALS",1)~ GOTO 110
  IF ~~ THEN REPLY #1814 /* ~Po�lubienie go mog�oby by� ca�kiem op�acalne. My�la�a� o tym, prawda?~ */ DO ~SetGlobal("NaliaComplainsIsaea","LOCALS",1)~ GOTO 111
  IF ~~ THEN REPLY #1815 /* ~Nie chc� bra� udzia�u w tym zamieszaniu. Spotkamy si� znowu z tym wymuskanym prostakiem?~ */ DO ~SetGlobal("NaliaComplainsIsaea","LOCALS",1)~ GOTO 112
  IF ~Global("azucarCR38","GLOBAL",0)
See("Chloe")
!Dead("Chloe")
InParty("Chloe")
~ THEN DO ~SetGlobal("azucarCR38","GLOBAL",1)~ EXTERN ~CHLOEJ~ 1004
END

IF ~~ THEN BEGIN 109 // from: 346.0 108.0
  SAY #1816 /* ~Nie rozumiem go. Gdyby nie by� synem Lorda Roenalla pomy�la�abym, �e jest zdolny do wszystkiego. Wszystkiego co najgorsze, ma si� rozumie�.~ */
  IF ~~ THEN GOTO 204
END

IF ~~ THEN BEGIN 110 // from: 346.1 108.1
  SAY #1817 /* ~Co to znaczy? To, �e jest �ajdakiem, i �e gdyby nie by� synem Lorda Roenalla pomy�la�abym, �e jest zdolny do wszystkiego co najgorsze.~ */
  IF ~~ THEN GOTO 204
END

IF ~~ THEN BEGIN 111 // from: 346.2 108.2
  SAY #1818 /* ~Przypominam sobie o tym ka�dego dnia, gdy si� budz� i zdaj� sobie spraw� z tego, co si� zmieni�o. Ojciec trzyma� wszystko w r�wnowadze i porz�dku. Teraz wszystko jest do g�ry nogami.~ */
  IF ~~ THEN GOTO 204
END

IF ~~ THEN BEGIN 112 // from: 346.3 108.3
  SAY #1819 /* ~Mam nadziej�, �e da mi teraz swobod�. W�a�ciwie by� to pierwszy raz, gdy otwarcie powiedziano "nie". Ojciec zawsze dawa� sobie z tym rad�. Za�o�� si�, �e doprowadza� Isae� do sza�u tak jak i ja.~ */
  IF ~~ THEN GOTO 204
END

IF ~~ THEN BEGIN 113 // from:
  SAY #14316 /* ~Biedne dziecko. Da�abym ci wszystko, co mog�a, gdybym mia�a wiele na zbyciu. Nie mog� si� pogodzi� z tym, �e tak wielu cierpi tak� bied�.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 114 // from:
  SAY #14482 /* ~To jest spos�b na rozwi�zanie tego problemu, nieprawda�? I�� i zabi� wszystkich biedak�w, poniewa� ONI za tym stoj�, hm?~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 115 // from:
  SAY #14490 /* ~Nie, my�l�, �e nie. Jeste�my �miertelni jak wszyscy inni. Lekcja, jakiej powinny nauczy� si� inne Rodziny, cho� nie �yczy�abym tego mojemu najgorszemu wrogowi.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 116 // from:
  SAY #15021 /* ~S� moimi przyjaci�mi. Za� ich uczynki sprawiaj�, �e s� o wiele godniejsi od czegokolwiek, co jest zwi�zane ze szlacheckim urodzeniem.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 117 // from:
  SAY #22385 /* ~Ty biedaku! Jakby nie by�o do�� bogaczy w Athkatli, kt�rym mo�na by kra��. Hm.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 118 // from:
  SAY #14724 /* ~Sp�ywaj, Salvanas. Wiesz, �e stale tu przychodz�.~ */
  IF ~~ THEN EXTERN ~SALVANAS~ 4
END

IF ~~ THEN BEGIN 119 // from:
  SAY #19747 /* ~�adne, ale to samo powiedzia�e� Priss w zesz�ym tygodniu.~ */
  IF ~~ THEN EXTERN ~SALVANAS~ 5
END

IF ~~ THEN BEGIN 120 // from:
  SAY #19750 /* ~Trzymaj tak dalej, a zrani ci� co� wi�cej ni� moje s�owa, g�upcze.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 121 // from:
  SAY #25408 /* ~Dlaczego to m�wisz, starcze?~ */
  IF ~~ THEN EXTERN ~YARIN~ 11
END

IF ~~ THEN BEGIN 122 // from:
  SAY #25410 /* ~Mo�e nie by�e� w tym wystarczaj�co dobry.~ */
  IF ~~ THEN EXTERN ~YARIN~ 12
END

IF ~~ THEN BEGIN 123 // from:
  SAY #25413 /* ~C�, zamierzam wykorzysta� moje umiej�tno�ci w jakim� dobrym celu. Jest wielu biedak�w, kt�rym mog� pom�c... <CHARNAME> te� mo�e otrzyma� ode mnie wsparcie.~ */
  IF ~~ THEN EXTERN ~YARIN~ 14
END

IF ~~ THEN BEGIN 124 // from:
  SAY #25688 /* ~A ja mog�abym ci ogoli� stopy moim sztyletem szybciej ni�by� zdo�a� bekn��, ma�y nizio�ku. Ale nie mam z�ych zamiar�w... wi�c si� wyluzuj.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 125 // from:
  SAY #25702 /* ~Id� i zanurz na troch� d�u�ej �eb w morskiej wodzie, marynarzyku.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 126 // from:
  SAY #25721 /* ~Nie... nie o to mi chodzi�o. Zastanawia�am si� tylko, czy rzeczywi�cie zamierzasz uczyni� rybie flaki cz�ci� swojego stroju.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 127 // from:
  SAY #25823 /* ~Er... my�l�, �e kto� powinien usi��� i uci�� sobie d�ug� pogaw�dk� z twoj� matk�...~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 128 // from:
  SAY #27643 /* ~Je�li masz na tyle w sakiewce by wydawa� na towary zamiast na dodatkow� ochron�, z pewno�ci� zas�ugujesz na to by ci� oskubano przynajmniej z cz�ci pi�rek, w jakie obros�e�, kupcze.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 129 // from:
  SAY #28452 /* ~Hm. To pewnie dlatego z�odziejstwo nigdy nie by�o zbyt ryzykownym zaj�ciem w Athkatli.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 130 // from:
  SAY #29536 /* ~A dlaczego nie jeste� jeszcze porz�dnie martwy?~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 131 // from:
  SAY #29610 /* ~Chodzi tylko o to, �e nie mog� si� oprze� wra�eniu, panie, �e na sw�j spos�b tkwimy w tym samym interesie.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 132 // from:
  SAY #29691 /* ~(westchnienie) Nie przejmuj si�. Naprawd�.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 133 // from:
  SAY #30076 /* ~Sp�jrz na to z tej strony: by� mo�e jest to po prostu spos�b, w jaki bogowie chc� ci powiedzie�, �e jest wiele wi�cej biednych, kt�rzy o wiele bardziej potrzebuj� tych pieni�dzy od ciebie, co?~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 134 // from:
  SAY #30094 /* ~Wiem jak si� czujesz, ch�opcze. Jestem pewna, �e znajdziesz podobny do mojego spos�b by to wyrazi�.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 135 // from:
  SAY #38736 /* ~C�, nie zamierzam ci odm�wi� jednej czy dw�ch sztuk z�ota, biedna duszo. Mamy ich pod dostatkiem, jak s�dz�... a te kilka sztuk z�ota znaczy dla nich wiele wi�cej ni� dla ciebie, <CHARNAME>!~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 136 // from:
  SAY #38740 /* ~Mi�e to by�o z twojej strony, <CHARNAME>! Chocia� jestem pewna, �e mo�na im by�o ofiarowa� o wiele wi�cej... na co zbierasz? Na z�oty miecz?~ */
  IF ~True()~ THEN EXIT
  IF ~IsValidForPartyDialog("Anomen")
RandomNum(2,1)~ THEN EXTERN ~ANOMENJ~ 156
  IF ~IsValidForPartyDialog("Jaheira")
RandomNum(2,2)~ THEN EXTERN ~JAHEIRAJ~ 310
  IF ~IsValidForPartyDialog("Jan")
RandomNum(2,1)~ THEN EXTERN ~JANJ~ 79
  IF ~IsValidForPartyDialog("Keldorn")
RandomNum(2,2)~ THEN EXTERN ~KELDORJ~ 89
  IF ~IsValidForPartyDialog("Yoshimo")
RandomNum(2,1)~ THEN EXTERN ~YOSHJ~ 21
END

IF ~~ THEN BEGIN 137 // from:
  SAY #38870 /* ~Jestem pewna, �e to nie jest tak... tak straszne... jak to opisujesz.~ */
  IF ~~ THEN EXTERN ~WCUST03~ 3
END

IF ~~ THEN BEGIN 138 // from:
  SAY #38914 /* ~Nie mog� uwierzy� w panuj�ce tutaj warunki. Mo�ni godz� si� by biedota tak mieszka�a, gdy tylko strac� j� z oczu... to... to doprowadza mnie do sza�u!~ */
  IF ~!IsValidForPartyDialog("Anomen")~ THEN EXIT
  IF ~IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ 157
END

IF ~~ THEN BEGIN 139 // from:
  SAY #38917 /* ~Nie mog� uwierzy�, �e jeste� tak wyprany z uczu�, Anomenie!~ */
  IF ~~ THEN EXTERN ~ANOMENJ~ 158
END

IF ~~ THEN BEGIN 140 // from:
  SAY #38929 /* ~C�, to nie jest do ko�ca prawd�, nieprawda� <CHARNAME>? Zapomnijmy, �e nasze kieszenie wypchane s� z�otem, tu w domu Boga Mi�osierdzia. Hm.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 141 // from:
  SAY #38956 /* ~�adna...? Chyba nie m�wisz do mnie, co?~ */
  IF ~~ THEN EXTERN ~WAYLANE~ 24
END

IF ~~ THEN BEGIN 142 // from:
  SAY #38959 /* ~Powiedzia�abym, �e jeste� �a�osnym cz�owiekiem, kt�ry powinien dla odmiany poszuka� jakiego� uczciwego zaj�cia. Szczerze m�wi�c... kto wed�ug ciebie da si� na to nabra�?~ */
  IF ~!IsValidForPartyDialog("Minsc")
!IsValidForPartyDialog("Jan")~ THEN EXIT
  IF ~IsValidForPartyDialog("Minsc")~ THEN EXTERN ~MINSCJ~ 73
  IF ~!IsValidForPartyDialog("Minsc")
IsValidForPartyDialog("Jan")~ THEN EXTERN ~JANJ~ 85
END

IF ~~ THEN BEGIN 143 // from:
  SAY #38963 /* ~Och, mniejsza z tym...~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 144 // from:
  SAY #39175 /* ~On jest tylko ch�opcem, <CHARNAME>, kt�ry nie mo�e ci zrobi� �adnej krzywdy. Nie ma powodu by go traktowa� tak ostro, nieprawda�? On tylko szuka pomocy.~ */
  IF ~!IsValidForPartyDialog("Korgan")~ THEN EXIT
  IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ 42
END

IF ~~ THEN BEGIN 145 // from:
  SAY #39279 /* ~Czy� nie masz serca, rycerzu? Ci ludzie nic nie maj�! A my jeste�my w stanie im pom�c!~ */
  IF ~~ THEN EXTERN ~ANOMENJ~ 163
END

IF ~~ THEN BEGIN 146 // from:
  SAY #39354 /* ~S�ysza�am ju� wcze�niej... pog�oski na temat w�a�ciciela tego miejsca, ale nigdy bym nie s�dzi�a, �e jest w nich tyle prawdy. To miejsce... jest odra�aj�ce. Musimy co� zrobi�!~ */
  IF ~~ THEN EXTERN ~HENDAK~ 6
END

IF ~~ THEN BEGIN 147 // from:
  SAY #39417 /* ~Ci�ko mi zada� to pytanie... co jest w�a�ciwie z�ego w k�pielach w mleku?~ */
  IF ~~ THEN EXTERN ~JANJ~ 88
END

IF WEIGHT #12 /* Triggers after states #: 339 even though they appear after this state */
~Dead("Torgal")
Global("NaliaKeepPlot","GLOBAL",0)
AreaCheck("AR1300")
Global("NaliaRaised","GLOBAL",0)
~ THEN BEGIN 148 // from: 191.3 191.2
  SAY #39770 /* ~Ju� po wszystkim... zgadza si�? Ale co zosta�o dla... M�j ojciec, nie �yje. M�j dom, w gruzach. Kto� nam�wi� do tego te stwory... ale... ale kto...~ [NALIA78] */
  IF ~~ THEN REPLY #39929 /* ~Jak mniemam moje zadanie tutaj jest zako�czone. Mog� ju� i��?~ */ DO ~EraseJournalEntry(5083)
EraseJournalEntry(5825)
EraseJournalEntry(6549)
EraseJournalEntry(6576)
EraseJournalEntry(7025)
EraseJournalEntry(7079)
EraseJournalEntry(7262)
EraseJournalEntry(9920)
EraseJournalEntry(10073)
EraseJournalEntry(10074)
EraseJournalEntry(11648)
EraseJournalEntry(16002)
EraseJournalEntry(16336)
EraseJournalEntry(16354)
EraseJournalEntry(16542)
EraseJournalEntry(20986)
EraseJournalEntry(23395)
EraseJournalEntry(23489)
EraseJournalEntry(23491)
EraseJournalEntry(40131)
EraseJournalEntry(42371)
EraseJournalEntry(49487)
AddXPObject(Player1,45500)
AddXPObject(Player2,45500)
AddXPObject(Player3,45500)
AddXPObject(Player4,45500)
AddXPObject(Player5,45500)
AddXPObject(Player6,45500)
SetGlobal("NaliaKeepPlot","GLOBAL",1)
TakePartyItem("Key10")
~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta� odbity.

Po ci�kiej walce zamek d'Arnise zosta� oczyszczony z trolli. Niestety, nie uda�o nam si� uratowa� Lorda i zabi� go TorGal, przyw�dca trolli. Ale Nalia �yje... tyle �e przysz�o�� jej i zamku jest niepewna.~ */ GOTO 167
  IF ~~ THEN REPLY #39930 /* ~Nie mog� z�agodzi� twojego b�lu. Zrobi�em wszystko, co w mojej mocy, ale niewiele wi�cej mog� tutaj zdzia�a�.~ */ DO ~EraseJournalEntry(5083)
EraseJournalEntry(5825)
EraseJournalEntry(6549)
EraseJournalEntry(6576)
EraseJournalEntry(7025)
EraseJournalEntry(7079)
EraseJournalEntry(7262)
EraseJournalEntry(9920)
EraseJournalEntry(10073)
EraseJournalEntry(10074)
EraseJournalEntry(11648)
EraseJournalEntry(16002)
EraseJournalEntry(16336)
EraseJournalEntry(16354)
EraseJournalEntry(16542)
EraseJournalEntry(20986)
EraseJournalEntry(23395)
EraseJournalEntry(23489)
EraseJournalEntry(23491)
EraseJournalEntry(40131)
EraseJournalEntry(42371)
EraseJournalEntry(49487)
AddXPObject(Player1,45500)
AddXPObject(Player2,45500)
AddXPObject(Player3,45500)
AddXPObject(Player4,45500)
AddXPObject(Player5,45500)
AddXPObject(Player6,45500)
SetGlobal("NaliaKeepPlot","GLOBAL",1)
TakePartyItem("Key10")
~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta� odbity.

Po ci�kiej walce zamek d'Arnise zosta� oczyszczony z trolli. Niestety, nie uda�o nam si� uratowa� Lorda i zabi� go TorGal, przyw�dca trolli. Ale Nalia �yje... tyle �e przysz�o�� jej i zamku jest niepewna.~ */ GOTO 167
  IF ~~ THEN REPLY #39931 /* ~Czuj�, �e moje zadanie nie zosta�o wype�nione. Nie uda�o mi si� uratowa� twojego ojca i przykro mi z tego powodu.~ */ DO ~EraseJournalEntry(5083)
EraseJournalEntry(5825)
EraseJournalEntry(6549)
EraseJournalEntry(6576)
EraseJournalEntry(7025)
EraseJournalEntry(7079)
EraseJournalEntry(7262)
EraseJournalEntry(9920)
EraseJournalEntry(10073)
EraseJournalEntry(10074)
EraseJournalEntry(11648)
EraseJournalEntry(16002)
EraseJournalEntry(16336)
EraseJournalEntry(16354)
EraseJournalEntry(16542)
EraseJournalEntry(20986)
EraseJournalEntry(23395)
EraseJournalEntry(23489)
EraseJournalEntry(23491)
EraseJournalEntry(40131)
EraseJournalEntry(42371)
EraseJournalEntry(49487)
AddXPObject(Player1,45500)
AddXPObject(Player2,45500)
AddXPObject(Player3,45500)
AddXPObject(Player4,45500)
AddXPObject(Player5,45500)
AddXPObject(Player6,45500)
SetGlobal("NaliaKeepPlot","GLOBAL",1)
TakePartyItem("Key10")
~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta� odbity.

Po ci�kiej walce zamek d'Arnise zosta� oczyszczony z trolli. Niestety, nie uda�o nam si� uratowa� Lorda i zabi� go TorGal, przyw�dca trolli. Ale Nalia �yje... tyle �e przysz�o�� jej i zamku jest niepewna.~ */ GOTO 167
  IF ~~ THEN REPLY #39932 /* ~Przykro mi, �e nie mog� zosta� d�u�ej by to wyja�ni�. Wspomina�a� co� o nagrodzie?~ */ DO ~EraseJournalEntry(5083)
EraseJournalEntry(5825)
EraseJournalEntry(6549)
EraseJournalEntry(6576)
EraseJournalEntry(7025)
EraseJournalEntry(7079)
EraseJournalEntry(7262)
EraseJournalEntry(9920)
EraseJournalEntry(10073)
EraseJournalEntry(10074)
EraseJournalEntry(11648)
EraseJournalEntry(16002)
EraseJournalEntry(16336)
EraseJournalEntry(16354)
EraseJournalEntry(16542)
EraseJournalEntry(20986)
EraseJournalEntry(23395)
EraseJournalEntry(23489)
EraseJournalEntry(23491)
EraseJournalEntry(40131)
EraseJournalEntry(42371)
EraseJournalEntry(49487)
AddXPObject(Player1,45500)
AddXPObject(Player2,45500)
AddXPObject(Player3,45500)
AddXPObject(Player4,45500)
AddXPObject(Player5,45500)
AddXPObject(Player6,45500)
SetGlobal("NaliaKeepPlot","GLOBAL",1)
TakePartyItem("Key10")
~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta� odbity.

Po ci�kiej walce zamek d'Arnise zosta� oczyszczony z trolli. Niestety, nie uda�o nam si� uratowa� Lorda i zabi� go TorGal, przyw�dca trolli. Ale Nalia �yje... tyle �e przysz�o�� jej i zamku jest niepewna.~ */ GOTO 167
  IF ~~ THEN REPLY #39933 /* ~Zrobi�em, co w mojej mocy. Mog� oczekiwa� jakiej� nagrody? Nie chc� by to zabrzmia�o nietaktownie.~ ~Zrobi�am, co w mojej mocy. Mog� oczekiwa� jakiej� nagrody? Nie chc� by to zabrzmia�o nietaktownie.~ */ DO ~EraseJournalEntry(5083)
EraseJournalEntry(5825)
EraseJournalEntry(6549)
EraseJournalEntry(6576)
EraseJournalEntry(7025)
EraseJournalEntry(7079)
EraseJournalEntry(7262)
EraseJournalEntry(9920)
EraseJournalEntry(10073)
EraseJournalEntry(10074)
EraseJournalEntry(11648)
EraseJournalEntry(16002)
EraseJournalEntry(16336)
EraseJournalEntry(16354)
EraseJournalEntry(16542)
EraseJournalEntry(20986)
EraseJournalEntry(23395)
EraseJournalEntry(23489)
EraseJournalEntry(23491)
EraseJournalEntry(40131)
EraseJournalEntry(42371)
EraseJournalEntry(49487)
AddXPObject(Player1,45500)
AddXPObject(Player2,45500)
AddXPObject(Player3,45500)
AddXPObject(Player4,45500)
AddXPObject(Player5,45500)
AddXPObject(Player6,45500)
SetGlobal("NaliaKeepPlot","GLOBAL",1)
TakePartyItem("Key10")
~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta� odbity.

Po ci�kiej walce zamek d'Arnise zosta� oczyszczony z trolli. Niestety, nie uda�o nam si� uratowa� Lorda i zabi� go TorGal, przyw�dca trolli. Ale Nalia �yje... tyle �e przysz�o�� jej i zamku jest niepewna.~ */ GOTO 167
END

IF ~~ THEN BEGIN 149 // from: 248.0 0.2 0.1 0.0
  SAY #39792 /* ~Powinnam by�a ci powiedzie� wcze�niej, ale inni opu�cili mnie, gdy si� dowiedzieli. Jeste�my otoczeni przez trolle. G��wny atak zacz�� si� zaledwie kilka nocy temu.~ */
  IF ~~ THEN GOTO 318
END

IF ~~ THEN BEGIN 150 // from: 32.0
  SAY #39820 /* ~Niedobrze si� dzieje, �e mamy tak wiele tylko ze wzgl�du na urodzenie. Wie�niacy zas�uguj� na t� odrobin�, kt�r� mog� im ofiarowa�. S�u�� dobrze i zas�uguj� na sw� godno��.~ */
  IF ~~ THEN GOTO 36
END

IF ~~ THEN BEGIN 151 // from: 41.0
  SAY #39830 /* ~Nie pozwol� by j� zn�w wykorzystywano do tych cel�w. Nie ma �adnej wym�wki. Jak oni... Dalesonie, powiedzia�e� tym bestiom o piwnicy?~ */
  IF ~~ THEN EXTERN ~DALESON~ 26
END

IF ~~ THEN BEGIN 152 // from:
  SAY #39852 /* ~I ja mam tak� nadziej�. Moi nowi przyjaciele i ja zamierzamy si� dowiedzie�, i upewni� si�, �e nic podejrzanego nie ma w moim domu. Nie martw si�, Kapitanie Aracie, wr�cisz na swoje stanowisko ani si� obejrzysz.~ */
  IF ~~ THEN EXTERN ~KPCAPT01~ 32
END

IF ~~ THEN BEGIN 153 // from:
  SAY #39903 /* ~Hendronie? �yjesz! Co tu robisz?~ */
  IF ~~ THEN EXTERN ~KPSOLD01~ 9
END

IF ~~ THEN BEGIN 154 // from:
  SAY #39904 /* ~Jeste�my tutaj by si� rozprawi� z naje�d�cami, Hendronie, i ocali� tych, kt�rzy jeszcze �yj�. Ciesz� si�... �e Ciotunia jest wci�� bezpieczna. Udasz si� z ni� pod palisad�, Hendronie?~ */
  IF ~~ THEN EXTERN ~KPSOLD01~ 10
END

IF ~~ THEN BEGIN 155 // from:
  SAY #39905 /* ~Ciotunia daje si� prawdziwie we znaki, co?~ */
  IF ~~ THEN EXTERN ~KPSOLD01~ 11
END

IF ~~ THEN BEGIN 156 // from:
  SAY #39906 /* ~Nie martw si�. Porozmawiam z ni�.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 157 // from:
  SAY #39908 /* ~G-glaicusie? Czy to ty? Och, nie, <CHARNAME>... on musia� zosta� zauroczony! Jest jednym z najlojalniejszych stra�nik�w mojego ojca, inaczej nigdy by tego nie zrobi�!!~ */
  IF ~~ THEN UNSOLVED_JOURNAL #7079 /* ~Napa�� na zamek d'Arnise.

Znale�li�my Glaicusa, wiernego stra�nika Lorda d'Arnise. Nalia jest przekonana, �e musia� zosta� zauroczony lub poddany dzia�aniu jakiej� innej magii.~ */ EXIT
END

IF ~~ THEN BEGIN 158 // from: 63.0
  SAY #39910 /* ~Tutaj tkwi problem, wed�ug mnie. M�j ojciec... utrzymywa� regularn� wsp�prac� z Roenallami, chocia� jestem pewna, �e czasami czu� do nich niesmak r�wny mojemu.~ */
  IF ~~ THEN GOTO 64
END

IF ~~ THEN BEGIN 159 // from: 64.0
  SAY #39911 /* ~Wszyscy inni s� traktowani jak �miecie. M�j ojciec wsp�pracowa� z nimi, ale nie by� taki jak oni. Tolerowali go ze wzgl�du na jego maj�tek i sk�onno�� do ugody.~ */
  IF ~~ THEN GOTO 65
END

IF ~~ THEN BEGIN 160 // from: 65.0
  SAY #39916 /* ~M�j ojciec ci�ko pracowa� na siebie, podczas gdy inni trwonili maj�tki. Roenallowie chcieli zacie�ni� z nim wi�zy przez ma��e�stwo. S� pot�ni, przyzna� z niech�ci�.~ */
  IF ~~ THEN GOTO 66
END

IF ~~ THEN BEGIN 161 // from: 301.0 68.0 66.1
  SAY #39920 /* ~Proponuj� uk�ad, w tajemnicy rzecz jasna, na mocy, kt�rego ty obejmiesz prawo do tego miejsca. Staniesz si� nominalnym przyw�dc� tej twierdzy, a ja b�d� swego rodzaju wychowankiem.~ */
  IF ~~ THEN GOTO 69
END

IF ~~ THEN BEGIN 162 // from: 69.0
  SAY #39923 /* ~Czy zgodziliby si�? Nie, ale niewiele mogliby zrobi�. Nie jest rzecz� niezwyk��, kiedy wojownik przejmuje w�asno�� pana dworu, gdy ten jest... martwy.~ */
  IF ~~ THEN GOTO 70
END

IF ~~ THEN BEGIN 163 // from: 69.1
  SAY #39925 /* ~Niczego opr�cz si�y... charakteru. Nie jest rzecz� niezwyk�� przej�� w�adz� nad twierdz�, gdy jej pan jest... martwy. Spadkobiercy musz� jedynie publicznie to og�osi�.~ */
  IF ~~ THEN GOTO 71
END

IF ~~ THEN BEGIN 164 // from: 69.3
  SAY #39926 /* ~To b�dzie z po�ytkiem dla nas wszystkich! Ty otrzymasz pozycj� spo�eczn�, za� ja zachowam m�j dom, zgodnie z �yczeniem mojego ojca. Nie jest rzecz� niezwyk�� przej�� w�adz� nad twierdz�, gdy jej pan jest... martwy.~ */
  IF ~~ THEN GOTO 72
END

IF ~~ THEN BEGIN 165 // from: 74.0
  SAY #39927 /* ~Chod�my ju�, chocia� mo�esz si� tu rozejrze�. S�u�ba przywr�ci to miejsce do porz�dku. Dzi�kuj� ci raz jeszcze.~ */
  IF ~~ THEN DO ~SetGlobal("PCKeepOwner","GLOBAL",1)
SetGlobal("PlayerHasStronghold","GLOBAL",1)
RevealAreaOnMap("AR1304")
HideAreaOnMap("AR1300")
StartCutSceneMode()
StartCutScene("Cut32a")
~ EXIT
END

IF ~~ THEN BEGIN 166 // from: 99.0
  SAY #39928 /* ~Skoro moje prawa do kontrolowania uk�ad�w mojego ojca wygas�y, dlaczego utrzymywane s� w mocy warunki, na kt�rych powsta�y te uk�ady? Zamierzasz odda� mi kontrol� nad twierdz�?~ */
  IF ~~ THEN EXTERN ~ISAEA~ 3
END

IF ~~ THEN BEGIN 167 // from: 148.4 148.3 148.2 148.1 148.0
  SAY #39934 /* ~Och, oczywi�cie. Zadanie uda�o ci si� wype�ni� zgodnie z pro�b�. �ycz� ci powodzenia. Dopilnuj� twojej zap�aty, a potem... potem... och nie. Mog� ci� prosi� o...~ */
  IF ~~ THEN GOTO 168
END

IF ~~ THEN BEGIN 168 // from: 167.0
  SAY #39935 /* ~Nie, g�upstwem jest tak my�le�. Zap�ac� ci i wr�c� do �ycia, kt�re musz� prowadzi�.~ */
  IF ~~ THEN REPLY #39936 /* ~M�w, Nalio. Nie mam zamiaru siedzie� ca�� noc i si� zastanawia�, co chcia�a� powiedzie�.~ */ DO ~GiveGoldForce(10650)~ GOTO 169
  IF ~~ THEN REPLY #39937 /* ~O co chodzi? Nic nie szkodzi zapyta�.~ */ DO ~GiveGoldForce(10650)~ GOTO 169
END

IF ~~ THEN BEGIN 169 // from: 168.1 168.0
  SAY #39938 /* ~To zale�y od tego, co si� ma ze mn� sta�. M�j... m�j ojciec, Lord w tym domu, nie �yje. W arystokratycznych kr�gach tytu� przechodzi na m�skiego spadkobierc�.~ */
  IF ~Gender(Player1,MALE)
~ THEN REPLY #39939 /* ~A zatem bez w�tpienia chcesz bym wcieli� si� w t� rol�. Co� w rodzaju ma��e�stwa z rozs�dku?~ */ GOTO 170
  IF ~Gender(Player1,FEMALE)
~ THEN REPLY #39940 /* ~Przyj�abym t� rol�, gdybym mog�a, ale oczywi�cie nie mog� ci pom�c w tej sprawie.~ */ GOTO 170
  IF ~~ THEN REPLY #39941 /* ~Czego chcesz ode mnie?~ */ GOTO 171
  IF ~~ THEN REPLY #39942 /* ~Niewiele wiem o tych rzeczach. M�w, co masz na my�li i wyra�aj si� jasno.~ */ GOTO 171
END

IF ~~ THEN BEGIN 170 // from: 169.1 169.0
  SAY #39943 /* ~Co? Och, nie, nie, nie, nic podobnego. Wielkie nieba, nie. Porzu� t� my�l. Naprawd�. To by spowodowa�o nie ko�cz�cy si� skandal.~ */
  IF ~~ THEN GOTO 171
END

IF ~~ THEN BEGIN 171 // from: 170.0 169.3 169.2
  SAY #39944 /* ~Zamierzam st�d odej��. Nic wi�cej mnie tu nie czeka. Jestem... zar�czona z �ajdakiem, kt�ry z pewno�ci� b�dzie pr�bowa� odebra� mi kontrol� nad tym miejscem.~ */
  IF ~~ THEN GOTO 172
END

IF ~~ THEN BEGIN 172 // from: 171.0
  SAY #39945 /* ~By� mo�e najlepszym rozwi�zaniem b�dzie odej�cie. M�j ojciec zawsze mawia�, �e cz�owieka mo�na pozna� po czynach, a nie po maj�tno�ci. Osobliwe, ale pomo�e mi to dzisiaj zasn��.~ */
  IF ~~ THEN REPLY #39946 /* ~Nie chcesz walczy� o sw�j dom? Nie mog� nic dla ciebie zrobi�?~ */ GOTO 173
  IF ~~ THEN REPLY #39947 /* ~Twoje towarzystwo b�dzie mile widziane, je�li zechcesz do mnie do��czy�. Oni nie b�d� ci� niepokoi� w drodze.~ */ GOTO 175
  IF ~~ THEN REPLY #39948 /* ~Nie potrzebuj� ci� ju�. Musisz zrobi�, co w twojej mocy tutaj, na miejscu.~ */ GOTO 176
END

IF ~~ THEN BEGIN 173 // from: 172.0
  SAY #39949 /* ~Oni nie s� przest�pcami, s� jedynie odpychaj�cy. Gdyby� by�<PRO_HESHE> wojownikiem, mo�naby ci by�o przyzna� stanowisko dow�dcze.~ */
  IF ~~ THEN GOTO 174
END

IF ~~ THEN BEGIN 174 // from: 173.0
  SAY #39950 /* ~Nie, powinnam st�d odej��. Czy mog� si� schroni� przy tobie? Pragn� wyj�� do potrzebuj�cych i pomaga� im. �ycie tutaj by�o takie spokojne.~ */
  IF ~~ THEN REPLY #39951 /* ~Znajdziesz przy mnie schronienie, je�li tego chcesz. �ycie w ci�g�ej drodze jest jednak ci�kie.~ */ GOTO 175
  IF ~~ THEN REPLY #39952 /* ~By�a� mi potrzebna w grupie tylko do czasu, gdy twoja twierdza zostanie odbita. Teraz powinna� p�j�� sobie.~ */ GOTO 202
END

IF ~~ THEN BEGIN 175 // from: 174.0 172.1
  SAY #39953 /* ~Dobrze wi�c. P�jd� z tob�. Smutno patrze� jak to miejsce dostaje si� w z�e r�ce, ale nie mam wyboru. Nie b�d� pomaga� Roenallom w wype�nianiu ich snobistycznych plan�w.~ */
  IF ~~ THEN DO ~SetGlobal("RoenalControl","GLOBAL",1)
CreateCreature("QUINT",[3306.2412],14)
~ EXIT
END

IF ~~ THEN BEGIN 176 // from: 202.0 172.2
  SAY #39954 /* ~Moja przysz�o�� jest zagro�ona. B�d� rozpieszczana, a� stan� si� tym, czego nienawidz�. Id� wi�c i prowad� �ycie podr�nika. Ja zmarniej� tutaj.~ */
  IF ~~ THEN DO ~SetGlobal("NaliaAtKeep","GLOBAL",1)
LeaveParty()
ChangeAIScript("",DEFAULT)
SetDialog("Nalia")
~ EXIT
END

IF ~~ THEN BEGIN 177 // from:
  SAY #39962 /* ~To wspania�y pomys�! Dzi�kuj� ci, Kapitanie Aracie, dobrze si� przys�u�y�e� mojemu ojcu. <CHARNAME>, zaraz po wej�ciu powinni�my szybko opu�ci� most.~ */
  IF ~~ THEN EXTERN ~KPCAPT01~ 11
END

IF ~~ THEN BEGIN 178 // from:
  SAY #39980 /* ~Mog� za niego r�czy�, <CHARNAME>. Od dawna s�u�y mojej rodzinie, a poza tym... i tak nie ma tu w okolicy nikogo innego, kto m�g�by podj�� si� tego zadania.~ */
  IF ~~ THEN EXTERN ~KPDOMO01~ 2
END

IF ~~ THEN BEGIN 179 // from:
  SAY #40001 /* ~Ludzie nie wytrzymaj� teraz d�ugo z nowymi podatkami, <CHARNAME>... nie zapominaj, �e dopiero co odparli�my inwazj� trolli.~ */
  IF ~~ THEN EXTERN ~KPDOMO01~ 12
END

IF ~~ THEN BEGIN 180 // from:
  SAY #40037 /* ~Ciotuniu! Nasza twierdza zosta�a uchroniona przed trollami tylko dzi�ki j<PRO_HISHER> pomocy! Na dodatek <CHARNAME> chroni dom przed wpadni�ciem w r�ce Roenall�w!~ */
  IF ~~ THEN EXTERN ~DELCIA~ 28
END

IF ~~ THEN BEGIN 181 // from:
  SAY #40044 /* ~Przykro mi, <CHARNAME>... moim... moim prawem jest zrobi� z ziemi� co zechc�, i wierz� ci. Ona jako� to przeboleje.~ */
  IF ~~ THEN EXTERN ~KPDOMO01~ 20
END

IF ~~ THEN BEGIN 182 // from:
  SAY #40111 /* ~Nie wydaje mi si� by by� to wielki problem, <CHARNAME>... po prostu nie r�b tego zbyt cz�sto, taka jest moja rada.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 183 // from:
  SAY #40112 /* ~Ludzie ju� zaczynaj� by� niezadowoleni z ciebie, <CHARNAME>. Musisz uwa�a� z tymi podatkami!~ */
  IF ~~ THEN EXTERN ~KPDOMO01~ 29
END

IF ~~ THEN BEGIN 184 // from:
  SAY #40113 /* ~S�ysza�am, �e ludzie si� burz�. Nie nak�ada�abym ju� nowych podatk�w, <CHARNAME>... chyba nie chcesz by wybuch�a rewolta? Ojciec zawsze dobrze ich traktowa�.~ */
  IF ~~ THEN EXTERN ~KPDOMO01~ 29
END

IF ~~ THEN BEGIN 185 // from:
  SAY #40114 /* ~Nie mo�esz nak�ada� na nich kolejnych podatk�w! Ludzie s� bliscy powstania i wcale si� im nie dziwi�, zwa�ywszy na to, co z nimi wyprawiasz!~ */
  IF ~~ THEN EXTERN ~KPDOMO01~ 29
END

IF WEIGHT #13 /* Triggers after states #: 339 even though they appear after this state */
~!Dead("Torgal")
Global("NaliaRaised","GLOBAL",2)
~ THEN BEGIN 186 // from:
  SAY #40116 /* ~Co... co si� sta�o... pami�tam, �e poczu�am b�l i... i wtedy przewr�ci�am si�... gdzie...~ */
  IF ~~ THEN GOTO 188
END

IF WEIGHT #14 /* Triggers after states #: 339 even though they appear after this state */
~Dead("Torgal")
Global("TalkedDaleson","GLOBAL",1)
Global("NaliaRaised","GLOBAL",2)
~ THEN BEGIN 187 // from:
  SAY #40117 /* ~*KASZEL* Co... co si� sta�o... pami�tam, �e poczu�am b�l i... i wtedy przewr�ci�am si�... gdzie...~ */
  IF ~~ THEN GOTO 190
END

IF ~~ THEN BEGIN 188 // from: 186.0
  SAY #40118 /* ~Ja... ja by�am martwa... czy� nie? To z pewno�ci� nie by�o przyjemne do�wiadczenie. D�ugo by�am nieprzytomna?~ */
  IF ~~ THEN REPLY #40119 /* ~Odzyska�a� przytomno�� i tylko to si� liczy.~ */ GOTO 189
  IF ~~ THEN REPLY #40120 /* ~Tak, tak, to na pewno by�o bolesne. Mo�emy ju� rusza�?~ */ GOTO 189
END

IF ~~ THEN BEGIN 189 // from: 188.1 188.0
  SAY #40121 /* ~Co... co z moim domem? Czy ci naje�d�cy opu�cili ju� moj� rodzinn� twierdz�? Prosz�, je�li wci�� istnieje jakie� zagro�enie musimy si� tam jak najpr�dzej uda�.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 190 // from: 187.0
  SAY #40122 /* ~Ja... ja by�am martwa... czy� nie? To z pewno�ci� nie by�o przyjemne do�wiadczenie. D�ugo by�am nieprzytomna?~ */
  IF ~~ THEN REPLY #40123 /* ~Odzyska�a� przytomno�� i tylko to si� liczy.~ */ GOTO 191
  IF ~~ THEN REPLY #40124 /* ~Tak, tak, to na pewno by�o bolesne. Mo�emy ju� rusza�?~ */ GOTO 191
END

IF ~~ THEN BEGIN 191 // from: 190.1 190.0
  SAY #40125 /* ~Co... co z moim rodzinnym domem... moje wspomnienia s� zamazane, co si� sta�o? Czy naje�d�cy zostali rozgromieni?~ */
  IF ~OR(7)
Class(Player1,FIGHTER)
Class(Player1,FIGHTER_MAGE)
Class(Player1,FIGHTER_CLERIC)
Class(Player1,FIGHTER_THIEF)
Class(Player1,FIGHTER_MAGE_THIEF)
Class(Player1,FIGHTER_DRUID)
Class(Player1,FIGHTER_MAGE_CLERIC)
~ THEN REPLY #40126 /* ~Wszystkim si� zaj�to. Tw�j dom zosta� uratowany. Jednak tw�j ojciec... nie �yje.~ */ DO ~EraseJournalEntry(5083)
EraseJournalEntry(5825)
EraseJournalEntry(6549)
EraseJournalEntry(6576)
EraseJournalEntry(7025)
EraseJournalEntry(7079)
EraseJournalEntry(7262)
EraseJournalEntry(9920)
EraseJournalEntry(10073)
EraseJournalEntry(10074)
EraseJournalEntry(11648)
EraseJournalEntry(16002)
EraseJournalEntry(16336)
EraseJournalEntry(16354)
EraseJournalEntry(16542)
EraseJournalEntry(20986)
EraseJournalEntry(23395)
EraseJournalEntry(23489)
EraseJournalEntry(23491)
EraseJournalEntry(40131)
EraseJournalEntry(42371)~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta� odbity.

Po ci�kiej walce zamek d'Arnise zosta� oczyszczony z trolli. Niestety, nie uda�o nam si� uratowa� Lorda i zabi� go TorGal, przyw�dca trolli. Ale Nalia �yje... tyle �e przysz�o�� jej i zamku jest niepewna.~ */ GOTO 53
  IF ~OR(7)
Class(Player1,FIGHTER)
Class(Player1,FIGHTER_MAGE)
Class(Player1,FIGHTER_CLERIC)
Class(Player1,FIGHTER_THIEF)
Class(Player1,FIGHTER_MAGE_THIEF)
Class(Player1,FIGHTER_DRUID)
Class(Player1,FIGHTER_MAGE_CLERIC)
~ THEN REPLY #40127 /* ~Stare wie�ci. Tw�j dom zosta� uratowany, ale tw�j ojciec nie �yje.~ */ DO ~EraseJournalEntry(5083)
EraseJournalEntry(5825)
EraseJournalEntry(6549)
EraseJournalEntry(6576)
EraseJournalEntry(7025)
EraseJournalEntry(7079)
EraseJournalEntry(7262)
EraseJournalEntry(9920)
EraseJournalEntry(10073)
EraseJournalEntry(10074)
EraseJournalEntry(11648)
EraseJournalEntry(16002)
EraseJournalEntry(16336)
EraseJournalEntry(16354)
EraseJournalEntry(16542)
EraseJournalEntry(20986)
EraseJournalEntry(23395)
EraseJournalEntry(23489)
EraseJournalEntry(23491)
EraseJournalEntry(40131)
EraseJournalEntry(42371)~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta� odbity.

Po ci�kiej walce zamek d'Arnise zosta� oczyszczony z trolli. Niestety, nie uda�o nam si� uratowa� Lorda i zabi� go TorGal, przyw�dca trolli. Ale Nalia �yje... tyle �e przysz�o�� jej i zamku jest niepewna.~ */ GOTO 53
  IF ~!Class(Player1,FIGHTER)
!Class(Player1,FIGHTER_MAGE)
!Class(Player1,FIGHTER_CLERIC)
!Class(Player1,FIGHTER_THIEF)
!Class(Player1,FIGHTER_MAGE_THIEF)
!Class(Player1,FIGHTER_DRUID)
!Class(Player1,FIGHTER_MAGE_CLERIC)
~ THEN REPLY #40133 /* ~Wszystkim si� zaj�to. Tw�j dom zosta� uratowany. Jednak tw�j ojciec... nie �yje.~ */ DO ~EraseJournalEntry(5083)
EraseJournalEntry(5825)
EraseJournalEntry(6549)
EraseJournalEntry(6576)
EraseJournalEntry(7025)
EraseJournalEntry(7079)
EraseJournalEntry(7262)
EraseJournalEntry(9920)
EraseJournalEntry(10073)
EraseJournalEntry(10074)
EraseJournalEntry(11648)
EraseJournalEntry(16002)
EraseJournalEntry(16336)
EraseJournalEntry(16354)
EraseJournalEntry(16542)
EraseJournalEntry(20986)
EraseJournalEntry(23395)
EraseJournalEntry(23489)
EraseJournalEntry(23491)
EraseJournalEntry(40131)
EraseJournalEntry(42371)~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta� odbity.

Po ci�kiej walce zamek d'Arnise zosta� oczyszczony z trolli. Niestety, nie uda�o nam si� uratowa� Lorda i zabi� go TorGal, przyw�dca trolli. Ale Nalia �yje... tyle �e przysz�o�� jej i zamku jest niepewna.~ */ GOTO 148
  IF ~!Class(Player1,FIGHTER)
!Class(Player1,FIGHTER_MAGE)
!Class(Player1,FIGHTER_CLERIC)
!Class(Player1,FIGHTER_THIEF)
!Class(Player1,FIGHTER_MAGE_THIEF)
!Class(Player1,FIGHTER_DRUID)
!Class(Player1,FIGHTER_MAGE_CLERIC)
~ THEN REPLY #40134 /* ~Stare wie�ci. Tw�j dom zosta� uratowany, ale tw�j ojciec nie �yje.~ */ DO ~EraseJournalEntry(5083)
EraseJournalEntry(5825)
EraseJournalEntry(6549)
EraseJournalEntry(6576)
EraseJournalEntry(7025)
EraseJournalEntry(7079)
EraseJournalEntry(7262)
EraseJournalEntry(9920)
EraseJournalEntry(10073)
EraseJournalEntry(10074)
EraseJournalEntry(11648)
EraseJournalEntry(16002)
EraseJournalEntry(16336)
EraseJournalEntry(16354)
EraseJournalEntry(16542)
EraseJournalEntry(20986)
EraseJournalEntry(23395)
EraseJournalEntry(23489)
EraseJournalEntry(23491)
EraseJournalEntry(40131)
EraseJournalEntry(42371)~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta� odbity.

Po ci�kiej walce zamek d'Arnise zosta� oczyszczony z trolli. Niestety, nie uda�o nam si� uratowa� Lorda i zabi� go TorGal, przyw�dca trolli. Ale Nalia �yje... tyle �e przysz�o�� jej i zamku jest niepewna.~ */ GOTO 148
END

IF WEIGHT #15 /* Triggers after states #: 339 even though they appear after this state */
~GlobalGT("KPRevolt","GLOBAL",9)
~ THEN BEGIN 192 // from:
  SAY #40187 /* ~Ja... ja nie zgadzam si�! Chyba wol�, �eby Roenallowie przej�li nasze posiad�o�ci! Nie pozwol� ci na przej�cie moich rodzinnych ziem i zamienienie ich w ruin�!~ [NALIA79] */
  IF ~~ THEN DO ~ChangeAIScript("",DEFAULT)
LeaveParty()
EscapeArea()~ EXIT
END

IF WEIGHT #16 /* Triggers after states #: 339 even though they appear after this state */
~Global("KilledKeepServants","GLOBAL",1)
~ THEN BEGIN 193 // from:
  SAY #40188 /* ~Nie mo�esz... nie mo�esz tak po prostu kogo� zabi�! My�lisz, �e masz do tego prawo, poniewa� zarz�dzasz twierdz�?! C� z ciebie za POTW�R?! Ja... ja na to nie p�jd�!~ [NALIA80] */
  IF ~~ THEN DO ~SetGlobal("KilledKeepServants","GLOBAL",2)
LeaveParty()
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 194 // from:
  SAY #40201 /* ~Dzi�kuj� ci, Dalesonie. A teraz id� ju�. Nie chc�, �eby ci si� co� sta�o.~ */
  IF ~~ THEN EXTERN ~DALESON~ 42
END

IF ~~ THEN BEGIN 195 // from:
  SAY #40210 /* ~Nigdy nie widzia�am go w u�yciu. Nigdy nie powiedzia�, dlaczego nie dzier�y� go cz�ciej. Powinni�my go odnale�� skoro nie mia� go przy sobie. Wi�c zabrano go do 'piwnic', tak?~ */
  IF ~~ THEN EXTERN ~DALESON~ 44
END

IF ~~ THEN BEGIN 196 // from:
  SAY #40447 /* ~Nie! <CHARNAME>, nie mo�esz mu na to pozwoli�! Nie mo�esz mu po prostu odda� twierdzy mojego ojca! Prosz�!~ */
  IF ~~ THEN REPLY #40448 /* ~Nie zamierzam wdawa� si� z tego powodu w wojn�, Nalio. Zapomnij o tym.~ */ GOTO 197
  IF ~~ THEN REPLY #40449 /* ~My�l�, �e masz racj�... Przypuszczam, �e odpowied� musi brzmie� nie, Lordzie Roenall. Twoja strata.~ */ EXTERN ~KPROEN01~ 3
END

IF ~~ THEN BEGIN 197 // from: 196.0
  SAY #40451 /* ~S�dz�, �e... �e moja wiara w ciebie by�a wtedy przesadna. C�... nie zamierzam sta� i si� temu przygl�da�! Dzi�kuj� za nic, <CHARNAME>!~ */
  IF ~~ THEN DO ~LeaveParty()
EscapeArea()~ EXTERN ~KPROEN01~ 4
END

IF ~~ THEN BEGIN 198 // from:
  SAY #40651 /* ~Ten... ten b�kart! Nie uda�o mu si� nas oszuka� podst�pem, wi�c chce to zrobi� si��?! A rada nie zrobi nic, je�li ju� j� zawojowa�!~ */
  IF ~~ THEN EXTERN ~KPDOMO01~ 116
END

IF ~~ THEN BEGIN 199 // from:
  SAY #40682 /* ~Tego w�a�nie chc� i wszystkim to powiedzia�am, <CHARNAME>. Gdyby nie ty, nie mia�abym w og�le tego zamku. To jest m�j dom... ale ty masz prawo tu rz�dzi�.~ */
  IF ~~ THEN EXTERN ~KPDOMO01~ 119
END

IF WEIGHT #17 /* Triggers after states #: 339 even though they appear after this state */
~Global("NaliaAR1302","LOCALS",0)
Global("TalkedDaleson","GLOBAL",0)
AreaCheck("AR1302")
~ THEN BEGIN 200 // from:
  SAY #40851 /* ~Jeste�my w �rodku. Najpierw powinni�my znale�� Dalesona, je�li wci�� �yje, a potem dosta� si� na dziedziniec i opu�ci� zwodzony most.~ [NALIA81] */
  IF ~~ THEN DO ~SetGlobal("NaliaAR1302","LOCALS",1)~ EXIT
END

IF WEIGHT #18 /* Triggers after states #: 339 even though they appear after this state */
~Global("NaliaAR1303","LOCALS",0)
AreaCheck("AR1303")
~ THEN BEGIN 201 // from:
  SAY #40853 /* ~Je�li chcemy dosta� si� do piwnic i znale�� TorGala, musimy najpierw znale�� sypialni� mojej ciotki. Jest tam sekretne przej�cie, kt�re prowadzi do piwnic.~ [NALIA82] */
  IF ~~ THEN DO ~SetGlobal("NaliaAR1303","LOCALS",1)~ UNSOLVED_JOURNAL #5083 /* ~Napa�� na zamek d'Arnise.

Nalia powiedzia�a mi, �e do loch�w zamku prowadzi ukryte przej�cie z sypialni jej ciotki, na pierwszym pi�trze.~ */ EXIT
END

IF ~~ THEN BEGIN 202 // from: 174.1
  SAY #42680 /* ~Roenallowie czekaj� jak s�py na padlin�. Nie zdziwi�abym si� gdyby mieli za�adowane wozy i byli gotowi do wprowadzenia si� tu.~ */
  IF ~~ THEN GOTO 176
END

IF ~~ THEN BEGIN 203 // from:
  SAY #44112 /* ~Wygl�da... dziwnie. Tak jakby co� kierowa�o jego wol�. Uwa�aj na siebie, nie wydaje mi si� by on my�la� za siebie.~ */
  IF ~~ THEN EXTERN ~PPCOWLED~ 2
END

IF ~~ THEN BEGIN 204 // from: 112.0 111.0 110.0 109.0
  SAY #46102 /* ~Tego wszystkiego nie da si� poj��. Wyno�my si� daleko od tego miejsca i od niego. Prowad�.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 205 // from:
  SAY #46161 /* ~I on dobrze si� o tobie wypowiada�, Lordzie Farthington.~ */
  IF ~~ THEN EXTERN ~FARTHIN~ 9
END

IF ~~ THEN BEGIN 206 // from:
  SAY #46171 /* ~Mam nadziej�. Jestem pewna, �e niejeden z jego partner�w od interes�w wola�by mnie nie widzie�.~ */
  IF ~~ THEN EXTERN ~FUMIN~ 1
END

IF ~~ THEN BEGIN 207 // from:
  SAY #46173 /* ~Spr�buj�, Pastorze Adelain.~ */
  IF ~~ THEN EXTERN ~FUMIN~ 2
END

IF ~~ THEN BEGIN 208 // from:
  SAY #46181 /* ~Panno Tandolan? Nie jestem pewna, czy rozumiem, co masz na my�li.~ */
  IF ~~ THEN EXTERN ~FULADY~ 2
END

IF ~~ THEN BEGIN 209 // from:
  SAY #46182 /* ~Rzeczywi�cie? On gada za du�o jak na m�j gust, Panno Tandolan. Mo�esz mi teraz wybaczy�?~ */
  IF ~~ THEN EXTERN ~FULADY~ 3
END

IF ~~ THEN BEGIN 210 // from:
  SAY #46186 /* ~Mam wra�enie, �e mogli po�wi�ci� nieco czasu.~ */
  IF ~~ THEN EXTERN ~FULORD~ 1
END

IF ~~ THEN BEGIN 211 // from:
  SAY #46188 /* ~Dzi�kuj� ci za to, Lordzie Donderbeg.~ */
  IF ~~ THEN EXTERN ~FULORD~ 2
END

IF ~~ THEN BEGIN 212 // from:
  SAY #46190 /* ~Zawsze by�e� jednym z rozs�dniejszych przyjaci� ojca.~ */
  IF ~~ THEN EXTERN ~FULORD~ 3
END

IF ~~ THEN BEGIN 213 // from:
  SAY #46195 /* ~Bonchy? Czy to ty?~ */
  IF ~~ THEN EXTERN ~FUAGNON~ 1
END

IF ~~ THEN BEGIN 214 // from:
  SAY #46197 /* ~Nie przepraszaj. Ojciec ucieszy�by si� z twojego przybycia. Arystokraci czuj� przed tob� respekt.~ */
  IF ~~ THEN EXTERN ~FUAGNON~ 2
END

IF ~~ THEN BEGIN 215 // from:
  SAY #46199 /* ~Bonchy!~ */
  IF ~~ THEN EXTERN ~FUAGNON~ 3
END

IF ~~ THEN BEGIN 216 // from:
  SAY #46201 /* ~Dzi�ki, Bonchy. Sprawiasz mi rado��.~ */
  IF ~~ THEN EXTERN ~FUAGNON~ 4
END

IF ~~ THEN BEGIN 217 // from:
  SAY #46203 /* ~Skoro musisz, Bonchy. Szcz�liwej podr�y.~ */
  IF ~~ THEN EXTERN ~FUAGNON~ 5
END

IF ~~ THEN BEGIN 218 // from:
  SAY #46236 /* ~Wyrobi�am ju� sobie opini� na tw�j temat, Isaea. Nie zmieni� teraz zdania.~ [NALIA91] */
  IF ~~ THEN EXTERN ~ISAEA~ 22
END

IF ~~ THEN BEGIN 219 // from:
  SAY #46238 /* ~Co!!~ */
  IF ~~ THEN EXTERN ~ISAEA~ 23
END

IF ~~ THEN BEGIN 220 // from:
  SAY #46240 /* ~Kim jeste� by o tym decydowa�! Jakim prawem!~ */
  IF ~~ THEN EXTERN ~ISAEA~ 24
END

IF ~~ THEN BEGIN 221 // from:
  SAY #46243 /* ~To szale�stwo! <CHARNAME> ci� powstrzyma!~ */
  IF ~~ THEN EXTERN ~ISAEA~ 26
END

IF ~~ THEN BEGIN 222 // from: 318.0
  SAY #47200 /* ~Ju� same trolle s� wystarczaj�co niebezpieczne... s�ysza�am, �e mo�na je zg�adzi� tylko za pomoc� ognia lub kwasu. O pozosta�ych stworach nie wiem nic.~ */
  IF ~~ THEN GOTO 1
END

IF WEIGHT #19 /* Triggers after states #: 339 even though they appear after this state */
~Dead("Torgal")
Global("TorgalDies","LOCALS",0)
~ THEN BEGIN 223 // from:
  SAY #47533 /* ~�mier�! Gi� bestio! Usun� z tego miejsca wszelki �lad, jaki po sobie pozostawi�a�! Zrobi� to... zrobi�...~ [NALIA83] */
  IF ~~ THEN DO ~SetGlobal("TorgalDies","LOCALS",1)
~ GOTO 224
END

IF ~~ THEN BEGIN 224 // from: 223.0
  SAY #47534 /* ~Wyno�my si� st�d. Nie chc� ogl�da� mojego domu w takim stanie. Zrobili�my, co w naszej mocy...~ */
  IF ~~ THEN GOTO 225
END

IF ~~ THEN BEGIN 225 // from: 224.0
  SAY #47535 /* ~Niech pomy�l�... powiem co� wi�cej, gdy opu�cimy to miejsce...~ */
  IF ~~ THEN UNSOLVED_JOURNAL #7025 /* ~Napa�� na zamek d'Arnise.

TorGal nie �yje i wszystkie pozbawione przyw�dcy pozosta�e trolle i yuan-ti wkr�tce uciekn�. Czas odej�� i pozwoli�, �eby wszystko by�o tak jak dawniej.~ */ EXIT
END

IF ~~ THEN BEGIN 226 // from:
  SAY #48461 /* ~Uda�o ci si� dokona� wspania�ej rzeczy, <CHARNAME>. Cz�owiek mniejszego serca pozwoli�by tym dzieciom tu�a� si� po ulicach, w g�odzie i bez grosza w kieszeni.~ */
  IF ~!IsValidForPartyDialog("Yoshimo")
!IsValidForPartyDialog("Korgan")~ THEN EXIT
  IF ~IsValidForPartyDialog("Yoshimo")~ THEN EXTERN ~YOSHJ~ 38
  IF ~!IsValidForPartyDialog("Yoshimo")
IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ 57
END

IF ~~ THEN BEGIN 227 // from:
  SAY #48467 /* ~To straszne s�owa! Jestem pewna, �e mamy do�� z�ota, aby si� nim troch� podzieli�... dla nich jest to du�a r�nica, za� ty nawet nie odczujesz straty swojej dzia�ki!~ */
  IF ~~ THEN EXTERN ~KORGANJ~ 58
END

IF ~~ THEN BEGIN 228 // from:
  SAY #48468 /* ~Jeste� ohydn� besti�, Korganie!~ */
  IF ~~ THEN EXTERN ~KORGANJ~ 59
END

IF ~~ THEN BEGIN 229 // from:
  SAY #48502 /* ~Hm. �atwo ci m�wi�, <CHARNAME>. On si� nie gapi przez ca�y dzie� na twoje siedzenie.~ */
  IF ~~ THEN EXTERN ~KORGANJ~ 65
END

IF ~~ THEN BEGIN 230 // from:
  SAY #48514 /* ~C�... teraz jest wolny, w ko�cu. Zastanawiam si� jak d�ugo przebywa� tu na dole... w �ciekach. Co za okropna rzecz ci si� przytrafi�a!~ */
  IF ~~ THEN DO ~ActionOverride("quallo",EscapeArea())~ EXIT
END

IF ~~ THEN BEGIN 231 // from:
  SAY #48533 /* ~Ja... ja nie wiem, Jaheiro, s�ysza�am o tym Lordzie Jierdanie. To brutal; opieka nad swoimi lud�mi nie jest w jego stylu. Nie podoba mi si� to.~ */
  IF ~!IsValidForPartyDialog("Korgan")
!IsValidForPartyDialog("Anomen")~ THEN EXIT
  IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ 70
  IF ~!IsValidForPartyDialog("Korgan")
IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ 182
END

IF ~~ THEN BEGIN 232 // from:
  SAY #48581 /* ~Teraz sobie przypominam, dlaczego o nim s�ysza�am! Wzbogaci� si� i zdoby� w�adz� zbyt szybko by mog�o to by� legalne. Zastanawiam si�, dlaczego si� nami zainteresowa�?~ */
  IF ~~ THEN EXTERN ~GARREN~ 19
END

IF ~~ THEN BEGIN 233 // from:
  SAY #48604 /* ~Czuj� si� brudna, <CHARNAME>. Nie zdawa�am sobie sprawy, �e podr�uj�c z tob� wdam si� w tak ponure sprawki. Spr�bujmy... spr�bujmy unika� tego rodzaju rzeczy w przysz�o�ci, dobrze?~ */
  IF ~!IsValidForPartyDialog("Jan")~ THEN EXIT
  IF ~IsValidForPartyDialog("Jan")~ THEN EXTERN ~JANJ~ 99
END

IF ~~ THEN BEGIN 234 // from:
  SAY #48612 /* ~Oni... oni chc� ci� wykorzysta� by si� dosta� do sfery. Wiedzia�am, �e nie mo�na ufa� tym Zakapturzonym Czarodziejom! Ale... b�d� nas trzyma� za s�owo, nieprawda�?~ */
  IF ~!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Mazzy")
!IsValidForPartyDialog("Minsc")~ THEN EXTERN ~VALYGAR~ 9
  IF ~IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ 109
  IF ~!IsValidForPartyDialog("Keldorn")
IsValidForPartyDialog("Mazzy")~ THEN EXTERN ~MAZZYJ~ 127
  IF ~!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Mazzy")
IsValidForPartyDialog("Minsc")
~ THEN EXTERN ~MINSCJ~ 100
END

IF ~~ THEN BEGIN 235 // from:
  SAY #48637 /* ~Nie rozumiem... dlaczego w�a�ciwie mia�by nie chcie� by�my poszli i uzdrowili jego matk�? Wtedy nie musia�by tu wystawa� i �ebra�, zgadza si�?~ */
  IF ~!IsValidForPartyDialog("Yoshimo")
!IsValidForPartyDialog("Valygar")
!IsValidForPartyDialog("Viconia")~ THEN EXIT
  IF ~IsValidForPartyDialog("Yoshimo")~ THEN EXTERN ~YOSHJ~ 47
  IF ~!IsValidForPartyDialog("Yoshimo")
IsValidForPartyDialog("Valygar")~ THEN EXTERN ~VALYGARJ~ 45
  IF ~!IsValidForPartyDialog("Yoshimo")
!IsValidForPartyDialog("Valygar")
IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ 42
END

IF ~~ THEN BEGIN 236 // from:
  SAY #48655 /* ~Widzieli�cie... widzieli�cie to?! Zabra� nasze z�oto! Co za bezczelno��!~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 237 // from:
  SAY #48659 /* ~Dachy! Mog� si� porusza� wzd�u� �cian, ale nigdy nie mia�am ochoty by p�j�� wy�ej.~ */
  IF ~~ THEN EXTERN ~ARNMAN03~ 15
END

IF ~~ THEN BEGIN 238 // from:
  SAY #48661 /* ~Ee, nie, dzi�kuj�.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 239 // from:
  SAY #48677 /* ~Bez w�tpienia s�dzi�e�, �e b�d� ta�si ni� zwyk�y lud. Budzisz we mnie odraz�. Prawie �a�uj�, �e ogry nie doko�czy�y roboty.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 240 // from:
  SAY #48707 /* ~Hm. Dawniej lubi�am czyta� w zamku; tak zrodzi�o si� moje zainteresowanie magi�. Nie mog� sobie wyobrazi� zniszczenia wiedzy... to wydaje si� takie z�e!~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 241 // from:
  SAY #48818 /* ~Tak. Wci�� jeste� aroganckim, bezwarto�ciowym, ma�ostkowym arystokrat�, co? Wsad� to sobie w ucho, m�j 'panie'.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 242 // from:
  SAY #48829 /* ~Przypominam sobie jak Ciotunia wspomina�a, �e podczas waszego ostatniego spotkania specjalnie wyla�e� jej na sukni� herbat�. Twoje zapytanie o ni� traktuj� teraz jako obraz�. Przepraszam.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 243 // from:
  SAY #48885 /* ~By� mo�e... powinni�my po prostu spr�bowa� znale�� ten gong, <CHARNAME>. Jak d�ugo mog�oby to zaj��? Nie chc� by komu� sta�a si� krzywda, je�li mo�emy co� z tym zrobi�.~ */
  IF ~~ THEN EXTERN ~LOUTCAPT~ 19
END

IF ~~ THEN BEGIN 244 // from:
  SAY #48950 /* ~Wygl�da to na robot� bardzo sadystycznej osoby. Powinni�my si� temu przyjrze�, <CHARNAME>... by� mo�e uda nam si� znale�� wskaz�wki, kt�re inni przeoczyli.~ */
  IF ~!IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~INSPECT~ 14
  IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ 375
END

IF ~~ THEN BEGIN 245 // from:
  SAY #48954 /* ~<CHARNAME>! Jak mo�esz odwraca� si� plecami do bardziej potrzebuj�cych? Zas�uguj� na nasz� pomoc.~ */
  IF ~~ THEN EXIT
END

IF WEIGHT #20 /* Triggers after states #: 339 even though they appear after this state */
~AreaCheck("AR0502")
Global("EnteredTanner2","AR0502",0)~ THEN BEGIN 246 // from:
  SAY #48981 /* ~To miejsce jest... straszne! Jakiego rodzaju 'prac�' zajmuje si� ten cz�owiek?! Czy... czy to s� cia�a?! Fu! Ten s-smr�d!!~ */
  IF ~~ THEN DO ~SetGlobal("EnteredTanner2","AR0502",1)
~ EXIT
END

IF WEIGHT #21 /* Triggers after states #: 339 even though they appear after this state */
~PartyHasItem("misc5m")
OR(3)
!InParty("Keldorn")
Dead("Keldorn")
!StateCheck("Keldorn",STATE_SLEEPING)
OR(3)
!InParty("Anomen")
Dead("Anomen")
!StateCheck("Anomen",STATE_SLEEPING)
OR(3)
!InParty("Yoshimo")
Dead("Yoshimo")
!StateCheck("Yoshimo",STATE_SLEEPING)
See(Player1)
Global("FoundAegis","GLOBAL",0)~ THEN BEGIN 247 // from:
  SAY #48988 /* ~Jeste�my... jeste�my cz�ciowo odpowiedzialni za to. Wys�ali�my go tutaj, <CHARNAME>. Powinni�my... przekaza� go komu�, mo�e komu� z Dzielnicy Rz�dowej, sama nie wiem.~ */
  IF ~~ THEN DO ~SetGlobal("FoundAegis","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN 248 // from: 0.3
  SAY #49213 /* ~Prosz�! Nie mam wi�cej z�ota! Wszystko co mam, znajduje si� w twierdzy. Jestem pewna, �e znajdziesz tam dosy�, by si� tym zadowoli�.~ */
  IF ~!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("Minsc")~ THEN REPLY #49214 /* ~Powiedz mi, zatem przeciwko czemu stajemy. Musz� wiedzie�, z czym mam do czynienia.~ */ GOTO 149
  IF ~!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("Minsc")~ THEN REPLY #49215 /* ~To nie wystarczy. B�dziesz musia�a znale�� kogo� innego do pomocy.~ */ GOTO 269
  IF ~IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ 184
  IF ~!IsValidForPartyDialog("Keldorn")
IsValidForPartyDialog("Aerie")~ THEN EXTERN ~AERIEJ~ 127
  IF ~!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Aerie")
IsValidForPartyDialog("Minsc")~ THEN EXTERN ~MINSCJ~ 150
END

IF ~~ THEN BEGIN 249 // from:
  SAY #49260 /* ~My�l�, �e... ju� gdzie� o nim s�ysza�am, <CHARNAME>. Przelotnie. Podobno ma wiele powi�za�... ale poza tym wiem niewiele wi�cej.~ */
  IF ~~ THEN EXTERN ~GAELAN~ 8
END

IF ~~ THEN BEGIN 250 // from:
  SAY #49381 /* ~Chce... chce by�my okradli �wi�tyni�? Nawet gdy chodzi o �wi�tyni� Talosa, to mam g�si� sk�rk�, gdy o tym pomy�l�. Jak... jak bardzo mamy si� jeszcze pogr��y� by uratowa� twoj� przyjaci�k�, <CHARNAME>?~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 251 // from:
  SAY #49509 /* ~Po tych wszystkich zadaniach... obracasz si� przeciwko swojemu panu? Nie to �ebym my�la�a, �e Mae'Var na to nie zas�uguje, czy co� takiego, chodzi tylko o to... jeste� bardzo z�ym cz�owiekiem.~ */
  IF ~~ THEN EXTERN ~EDWIN~ 27
END

IF ~~ THEN BEGIN 252 // from:
  SAY #49551 /* ~Zw�aszcza nie z t� wojn�, o kt�rej s�yszeli�my, zgadza si�? Za�o�� si�, �e nie udaliby�cie si� do obcych, gdyby inna gildia powa�nie wam nie zagrozi�a.~ */
  IF ~~ THEN EXTERN ~RENAL~ 58
END

IF ~~ THEN BEGIN 253 // from:
  SAY #49588 /* ~Nie mo�emy go tak po prostu zostawi�. Powinni�my przynajmniej dowiedzie� si�, o kim m�wi albo... albo sprowadzi� dla niego jak�� pomoc? Prosz�, <CHARNAME>! Nie mo�emy pozwoli� by kto� po prostu umar�...~ */
  IF ~!IsValidForPartyDialog("Keldorn")~ THEN DO ~SetGlobalTimer("RenfeldDeath","LOCALS",TWO_DAYS)~ EXIT
  IF ~IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ 150
END

IF ~~ THEN BEGIN 254 // from:
  SAY #49815 /* ~Mog�o by� o wiele gorzej. S�dz�c po tym, jak wszystkie w�osy stoj� mi d�ba, oczekiwa�am, �e zostaniemy wys�ani do o wiele gorszej roboty. Spr�bujmy... jako� si� z tym upora�.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 255 // from:
  SAY #49854 /* ~A wi�c do tego d��yli�my przez ca�y ten czas? Nies�ychane! Jak... jak mamy to zrobi�? Mistrz Cienia ma na swoje skinienie ca�� hord� zab�jc�w!~ */
  IF ~~ THEN EXTERN ~BODHI~ 73
END

IF ~~ THEN BEGIN 256 // from:
  SAY #49869 /* ~Zakopany �ywcem? Ja... ja po prostu nie wyobra�am sobie niczego okropniejszego. I wszystko to za gar�� pieni�dzy. Fuj!~ */
  IF ~~ THEN EXTERN ~TIRDIR~ 3
END

IF ~~ THEN BEGIN 257 // from:
  SAY #50050 /* ~Chcesz by�my zeszli do kana��w... ku �wi�tyni Talosa? C�... jestem gotowa pom�c, je�li dzi�ki temu ludzie przestan� si� okalecza�.~ */
  IF ~!IsValidForPartyDialog("Anomen")
!IsValidForPartyDialog("Viconia")
!IsValidForPartyDialog("Jaheira")~ THEN EXIT
  IF ~IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ 236
  IF ~!IsValidForPartyDialog("Anomen")
IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ 71
  IF ~!IsValidForPartyDialog("Anomen")
!IsValidForPartyDialog("Viconia")
IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ 424
END

IF ~~ THEN BEGIN 258 // from:
  SAY #50088 /* ~Uwa�aj na siebie, <CHARNAME>. Je�li obserwator potrzebuje pomocy, musi by� jaki� tego pow�d, niebezpieczny pow�d, i nie wydaje mi si� by�my mogli zaufa� temu kap�anowi.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 259 // from:
  SAY #50165 /* ~W takim razie dajcie spok�j swoim g�upim petycjom. Zanim wy ludzie zebraliby�cie si� by co� zdzia�a�, moja twierdza rozsypa�aby si� ze staro�ci.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 260 // from:
  SAY #50189 /* ~To odpowiada tym, kt�rzy maja z�oto, ale co z biednymi? Cierpi�, poniewa� nie mog� nape�ni� kieszeni kogo�, kto i tak dostaje zap�at� za swoj� prac�? To jest niesprawiedliwe!~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 261 // from:
  SAY #50213 /* ~Nie! On jest tylko niewinnym, biednym cz�owiekiem, pr�buj�cym przetrwa�!~ */
  IF ~Global("Gavegbegg","AR1000",0)~ THEN GOTO 262
  IF ~Global("Gavegbegg","AR1000",1)~ THEN EXTERN ~GGUARD01~ 4
END

IF ~~ THEN BEGIN 262 // from: 261.0
  SAY #50217 /* ~Widzisz to? Daj� mu te monety w darze, a nie dlatego, �e o nie �ebrze. Jestem pewna, �e masz do zrobienia wa�niejsze rzeczy ni� zawracanie g�owy temu biedakowi!~ */
  IF ~~ THEN DO ~ActionOverride("Gbegg01",TakePartyGold(5))~ EXTERN ~GGUARD01~ 4
END

IF ~~ THEN BEGIN 263 // from:
  SAY #50353 /* ~Zobaczy� znowu Filberta? (westchnienie) Jedli�my raz lunch. Twoje pr�by z��czenia nas razem podoba�y mu si� nawet mniej ni� mnie. Poza tym nadepn�� mi na odcisk.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 264 // from:
  SAY #50452 /* ~Za nic mam twoje s�owa, Oriono. Mog�abym przez ca�y dzie� tarza� si� w krowich odchodach, a i tak by�abym czystsza ni� ma�ostkowa dziwka z wy�szych klas.~ */
  IF ~~ THEN EXTERN ~ORIONA~ 10
END

IF ~~ THEN BEGIN 265 // from:
  SAY #50536 /* ~S�ysza�am o... drowach, ale czy ona pope�ni�a jakie� przest�pstwo? Chc� j� spali� tylko dlatego, �e jest drowem. <CHARNAME>, to nie jest w porz�dku! Zr�b co�!~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 266 // from:
  SAY #52284 /* ~Tak w�a�nie... szkol� tutaj z�odziei? Ciesz� si�, �e nigdy nie wybra�am tej drogi. Jakie to straszne, gdy twoi nauczyciele nie zwracaj� na ciebie w og�le uwagi...~ */
  IF ~!IsValidForPartyDialog("Yoshimo")~ THEN EXIT
  IF ~IsValidForPartyDialog("Yoshimo")~ THEN EXTERN ~YOSHJ~ 88
END

IF ~~ THEN BEGIN 267 // from:
  SAY #55201 /* ~To jest nasze zwyci�stwo po tym wszystkim, co przeszli�my? On jest martwy, i to wszystko? Ha... martwy. Tak jak ka�dy inny. Wydaje si� to takie dziwne.~ */
  IF ~~ THEN EXTERN ~PLAYER1~ 17
END

IF ~~ THEN BEGIN 268 // from:
  SAY #55226 /* ~Ja... och, czuj� si� tak dziwnie. Umarli�my, nieprawda�? By� ten b�l, a potem szarpni�cie, jak... Jak gdyby wci�gn�� mnie wir wodny...~ [NALIA85] */
  IF ~!IsValidForPartyDialog("Edwin")~ THEN EXIT
  IF ~IsValidForPartyDialog("Edwin")~ THEN EXTERN ~EDWINJ~ 95
END

IF ~~ THEN BEGIN 269 // from: 248.1 1.2
  SAY #55234 /* ~Prosz�! Nie ma nikogo innego! Pomy�l o mojej rodzinie! Pomy�l o s�ugach i ich rodzinach! S�udzy! Mo�e trolle nie zabi�y ca�ej s�u�by...~ */
  IF ~~ THEN GOTO 270
END

IF ~~ THEN BEGIN 270 // from: 269.0
  SAY #55235 /* ~Stra�nicy pewnie nie �yj�, ale s�u�ba widzia�a pewnie ten atak i b�dzie wiedzie� jak liczni s� naje�d�cy. Prosz�, je�li zostaniesz, mo�emy mie� szans�.~ */
  IF ~~ THEN GOTO 2
END

IF ~~ THEN BEGIN 271 // from:
  SAY #55302 /* ~Naprawd�? Przyjdzie ci pilnowa� pustej skrzyni? Dlaczego? Jaki m�g�by by� tego cel? Nawet szalony drow musia�by *to* widzie�.~ */
  IF ~~ THEN EXTERN ~SAHBEH01~ 39
END

IF ~~ THEN BEGIN 272 // from:
  SAY #55663 /* ~Wspaniale dotrzymali towarzystwa? Ten statek jest brudny, rozpada si�, za� twoja za�oga to banda gbur�w. Nigdy tak bardzo nie potrzebowa�am dobrej k�pieli!~ */
  IF ~!IsValidForPartyDialog("Jan")
!IsValidForPartyDialog("Yoshimo")
!IsValidForPartyDialog("Korgan")
Global("ThiefGroup","GLOBAL",2)~ THEN EXTERN ~PPBODHI3~ 12
  IF ~!IsValidForPartyDialog("Jan")
!IsValidForPartyDialog("Yoshimo")
!IsValidForPartyDialog("Korgan")
Global("ThiefGroup","GLOBAL",1)~ THEN EXTERN ~PPSIME~ 1
  IF ~IsValidForPartyDialog("Jan")~ THEN EXTERN ~JANJ~ 150
  IF ~!IsValidForPartyDialog("Jan")
IsValidForPartyDialog("Yoshimo")~ THEN EXTERN ~YOSHJ~ 92
  IF ~!IsValidForPartyDialog("Jan")
!IsValidForPartyDialog("Yoshimo")
IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ 117
END

IF ~~ THEN BEGIN 273 // from:
  SAY #55708 /* ~Klara zas�uguje na lepsze �ycie, podobnie jak wszystkie kurtyzany Galveny, ale my wmieszali�my si� w to, by znale�� drog� do przytu�ku... Sanik zosta� zabity zanim m�g� cokolwiek powiedzie�.~ */
  IF ~~ THEN EXTERN ~PIRMUR09~ 0
END

IF ~~ THEN BEGIN 274 // from:
  SAY #55713 /* ~Biedny cz�owiek. Ci�ko musi by�, gdy ko�czy si� jako szaleniec, po tym jak przez ca�e �ycie leczy�o si� szale�c�w. Zak�adam, �e to miejsce mia�o s�u�y� leczeniu, a nie tylko odosabnianiu.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 275 // from:
  SAY #55721 /* ~Zostaw... zostaw go w spokoju. Szkoda m�wi�, przez co przeszed� ten cz�owiek.~ */
  IF ~~ THEN EXTERN ~KORGANJ~ 124
END

IF ~~ THEN BEGIN 276 // from:
  SAY #55757 /* ~Twoje nawr�cenie jest bardzo wygodne, piracie. Co wiesz o planach Irenicusa? Z tego, co widz� nie by� zbyt rozmowny na te tematy.~ */
  IF ~~ THEN EXTERN ~PPSAEM2~ 22
END

IF ~~ THEN BEGIN 277 // from:
  SAY #55764 /* ~To za ma�o powiedziane. Dlaczego po prostu nie zaoferujemy mu ca�ego Faerunu i uznamy rachunki za wyr�wnane?~ */
  IF ~~ THEN EXTERN ~PPSAEM2~ 12
END

IF ~~ THEN BEGIN 278 // from:
  SAY #55827 /* ~Och. Nigdy do tej pory nie zwraca�am specjalnie uwagi na ryby, ale ten zapach... uch, jakby co� umar�o...~ */
  IF ~~ THEN EXTERN ~SAHBAR03~ 0
END

IF ~~ THEN BEGIN 279 // from:
  SAY #55850 /* ~Nie wiem na ile powinni�my zaufa� temu stworowi, <CHARNAME>. Podejrzewam, �e z�ar�by nas na przystawk� tylko dlatego, �e komponowaliby�my si� dobrze z g��wnym daniem.~ */
  IF ~~ THEN EXTERN ~SAHKNG01~ 37
END

IF ~~ THEN BEGIN 280 // from:
  SAY #55912 /* ~C-co robisz, <CHARNAME>?! Sprowadzasz na nas... gniew smoka? I po co?! Nie... nie, nie b�d� si� temu przygl�da�, z pewno�ci�!~ */
  IF ~!IsValidForPartyDialog("Cernd")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Valygar")
!IsValidForPartyDialog("Mazzy")
OR(2)
!IsValidForPartyDialog("Anomen")
!Alignment("Anomen",LAWFUL_GOOD)
!IsValidForPartyDialog("Jaheira")
!IsValidForPartyDialog("Minsc")~ THEN DO ~LeaveParty()
EscapeArea()~ EXTERN ~UDDEMON~ 8
  IF ~IsValidForPartyDialog("Cernd")~ THEN DO ~LeaveParty()
EscapeArea()~ EXTERN ~CERNDJ~ 111
  IF ~!IsValidForPartyDialog("Cernd")
IsValidForPartyDialog("Aerie")~ THEN DO ~LeaveParty()
EscapeArea()~ EXTERN ~AERIEJ~ 149
  IF ~!IsValidForPartyDialog("Cernd")
!IsValidForPartyDialog("Aerie")
IsValidForPartyDialog("Keldorn")~ THEN DO ~LeaveParty()
EscapeArea()~ EXTERN ~KELDORJ~ 201
  IF ~!IsValidForPartyDialog("Cernd")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("Keldorn")
IsValidForPartyDialog("Valygar")~ THEN DO ~LeaveParty()
EscapeArea()~ EXTERN ~VALYGARJ~ 85
  IF ~!IsValidForPartyDialog("Cernd")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Valygar")
IsValidForPartyDialog("Mazzy")~ THEN DO ~LeaveParty()
EscapeArea()~ EXTERN ~MAZZYJ~ 175
  IF ~!IsValidForPartyDialog("Cernd")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Valygar")
!IsValidForPartyDialog("Mazzy")
IsValidForPartyDialog("Anomen")
Alignment("Anomen",LAWFUL_GOOD)~ THEN DO ~LeaveParty()
EscapeArea()~ EXTERN ~ANOMENJ~ 271
  IF ~!IsValidForPartyDialog("Cernd")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Valygar")
!IsValidForPartyDialog("Mazzy")
OR(2)
!IsValidForPartyDialog("Anomen")
!Alignment("Anomen",LAWFUL_GOOD)
IsValidForPartyDialog("Jaheira")~ THEN DO ~LeaveParty()
EscapeArea()~ EXTERN ~JAHEIRAJ~ 470
  IF ~!IsValidForPartyDialog("Cernd")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Valygar")
!IsValidForPartyDialog("Mazzy")
OR(2)
!IsValidForPartyDialog("Anomen")
!Alignment("Anomen",LAWFUL_GOOD)
!IsValidForPartyDialog("Jaheira")
IsValidForPartyDialog("Minsc")~ THEN DO ~LeaveParty()
EscapeArea()~ EXTERN ~MINSCJ~ 170
END

IF ~~ THEN BEGIN 281 // from:
  SAY #55960 /* ~Nie cierpi� sposobu, w jaki arystokraci m�wi� o biednych. Twoje stereotypy na temat mag�w to niemal identyczny przypadek.~ */
  IF ~~ THEN EXTERN ~VALYGARJ~ 88
END

IF ~~ THEN BEGIN 282 // from:
  SAY #56005 /* ~Zapewniam ci�, �e nie sprawimy ci k�opotu.~ */
  IF ~!IsValidForPartyDialogue("HAERDALIS")
!IsValidForPartyDialogue("CERND")~ THEN EXIT
  IF ~IsValidForPartyDialogue("HAERDALIS")~ THEN EXTERN ~HAERDAJ~ 117
  IF ~!IsValidForPartyDialogue("HAERDALIS")
IsValidForPartyDialogue("CERND")~ THEN EXTERN ~CERNDJ~ 113
END

IF ~~ THEN BEGIN 283 // from:
  SAY #56011 /* ~Spodziewam si� najlepszego, nawet je�li to ma�o prawdopodobne.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 284 // from:
  SAY #56031 /* ~Mimo to zabra�e� ca�e nasze z�oto i wynaj��e� go... nie m�wi�c nam nawet, jaka z niego kanalia! Zmusi�e� nas nawet by�my dla ciebie zapracowali na ten przywilej!~ */
  IF ~~ THEN EXTERN ~ARAN~ 78
END

IF ~~ THEN BEGIN 285 // from:
  SAY #56075 /* ~Haer'dalisie! Co ci si� sta�o?~ */
  IF ~~ THEN EXTERN ~HAERDAJ~ 121
END

IF ~~ THEN BEGIN 286 // from:
  SAY #56096 /* ~Robi mi si� od tego niedobrze. Te drowy maj� nad wszystkimi tyle w�adzy.~ */
  IF ~~ THEN EXTERN ~EDWINJ~ 125
END

IF ~~ THEN BEGIN 287 // from:
  SAY #56100 /* ~Przybyli�my, a� do Piek�a by ci� powstrzyma�, Irenicusie, i zrobimy to! <CHARNAME> jest naszym przyjacielem i b�dzie �y�!!~ [NALIA84] */
  IF ~!IsValidForPartyDialog("Korgan")
!IsValidForPartyDialog("Anomen")
!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("HaerDalis")
!IsValidForPartyDialog("Viconia")
!IsValidForPartyDialog("Edwin")
!IsValidForPartyDialog("Jan")
!IsValidForPartyDialog("Mazzy")
!IsValidForPartyDialog("Valygar")
!IsValidForPartyDialog("Jaheira")
!IsValidForPartyDialog("Minsc")
!IsValidForPartyDialog("Imoen2")~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("cut85c")
~ EXIT
  IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ 150
  IF ~!IsValidForPartyDialog("Korgan")
IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ 276
  IF ~!IsValidForPartyDialog("Korgan")
!IsValidForPartyDialog("Anomen")
IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ 214
  IF ~!IsValidForPartyDialog("Korgan")
!IsValidForPartyDialog("Anomen")
!IsValidForPartyDialog("Keldorn")
IsValidForPartyDialog("Aerie")~ THEN EXTERN ~AERIEJ~ 159
  IF ~!IsValidForPartyDialog("Korgan")
!IsValidForPartyDialog("Anomen")
!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Aerie")
IsValidForPartyDialog("HaerDalis")~ THEN EXTERN ~HAERDAJ~ 123
  IF ~!IsValidForPartyDialog("Korgan")
!IsValidForPartyDialog("Anomen")
!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("HaerDalis")
IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ 159
  IF ~!IsValidForPartyDialog("Korgan")
!IsValidForPartyDialog("Anomen")
!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("HaerDalis")
!IsValidForPartyDialog("Viconia")
IsValidForPartyDialog("Edwin")~ THEN EXTERN ~EDWINJ~ 126
  IF ~!IsValidForPartyDialog("Korgan")
!IsValidForPartyDialog("Anomen")
!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("HaerDalis")
!IsValidForPartyDialog("Viconia")
!IsValidForPartyDialog("Edwin")
IsValidForPartyDialog("Jan")~ THEN EXTERN ~JANJ~ 168
  IF ~!IsValidForPartyDialog("Korgan")
!IsValidForPartyDialog("Anomen")
!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("HaerDalis")
!IsValidForPartyDialog("Viconia")
!IsValidForPartyDialog("Edwin")
!IsValidForPartyDialog("Jan")
IsValidForPartyDialog("Mazzy")~ THEN EXTERN ~MAZZYJ~ 180
  IF ~!IsValidForPartyDialog("Korgan")
!IsValidForPartyDialog("Anomen")
!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("HaerDalis")
!IsValidForPartyDialog("Viconia")
!IsValidForPartyDialog("Edwin")
!IsValidForPartyDialog("Jan")
!IsValidForPartyDialog("Mazzy")
IsValidForPartyDialog("Valygar")~ THEN EXTERN ~VALYGARJ~ 90
  IF ~!IsValidForPartyDialog("Korgan")
!IsValidForPartyDialog("Anomen")
!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("HaerDalis")
!IsValidForPartyDialog("Viconia")
!IsValidForPartyDialog("Edwin")
!IsValidForPartyDialog("Jan")
!IsValidForPartyDialog("Mazzy")
!IsValidForPartyDialog("Valygar")
IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ 482
  IF ~!IsValidForPartyDialog("Korgan")
!IsValidForPartyDialog("Anomen")
!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("HaerDalis")
!IsValidForPartyDialog("Viconia")
!IsValidForPartyDialog("Edwin")
!IsValidForPartyDialog("Jan")
!IsValidForPartyDialog("Mazzy")
!IsValidForPartyDialog("Valygar")
!IsValidForPartyDialog("Jaheira")
IsValidForPartyDialog("Minsc")~ THEN EXTERN ~MINSCJ~ 179
  IF ~!IsValidForPartyDialog("Korgan")
!IsValidForPartyDialog("Anomen")
!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("HaerDalis")
!IsValidForPartyDialog("Viconia")
!IsValidForPartyDialog("Edwin")
!IsValidForPartyDialog("Jan")
!IsValidForPartyDialog("Mazzy")
!IsValidForPartyDialog("Valygar")
!IsValidForPartyDialog("Jaheira")
!IsValidForPartyDialog("Minsc")
IsValidForPartyDialog("Imoen2")~ THEN EXTERN ~IMOEN2J~ 31
END

IF ~~ THEN BEGIN 288 // from:
  SAY #56161 /* ~Nigdy... nie mia�am przed sob� podobnego stworzenia... twoje uroda jest zachwycaj�ca.~ */
  IF ~~ THEN EXTERN ~UDSILVER~ 58
END

IF ~~ THEN BEGIN 289 // from:
  SAY #56408 /* ~To niemo�liwe, prawda? Ca�e miasto, zw�aszcza tak staro�ytne jak twoje, nie mo�e po prostu znikn��.~ */
  IF ~~ THEN EXTERN ~C6ELHAN2~ 29
END

IF ~~ THEN BEGIN 290 // from:
  SAY #56436 /* ~Dlaczego od razu ��da� pieni�dzy? My�la�am, �e jeste�my tutaj, by pom�c tym ludziom, a nie zastrasza� ich jak bandyci. Je�li takie s� twoje metody dzia�ania, nie interesuje mnie to.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 291 // from:
  SAY #56441 /* ~Nie wiem za wiele o Umar, ale to wszystko kojarzy mi si� z jak�� z�� magi�. By� mo�e ta ogr to jaki� pot�ny mag? Nie powinni�my wyklucza� takiej mo�liwo�ci.~ */
  IF ~!IsValidForPartyDialog("Jan")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("Minsc")~ THEN EXTERN ~UHMAY01~ 19
  IF ~IsValidForPartyDialog("Jan")~ THEN EXTERN ~JANJ~ 171
  IF ~!IsValidForPartyDialog("Jan")
IsValidForPartyDialog("Aerie")~ THEN EXTERN ~AERIEJ~ 170
  IF ~!IsValidForPartyDialog("Jan")
!IsValidForPartyDialog("Aerie")
IsValidForPartyDialog("Minsc")~ THEN EXTERN ~MINSCJ~ 228
END

IF ~~ THEN BEGIN 292 // from:
  SAY #56449 /* ~Ten... ten cz�owiek... zosta� pozbawiony umys�u przez jakie� zakl�cie. Nie mam poj�cia, czy... czy mo�na by zdj�� ten urok. Nie zazdroszcz� mu.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 293 // from:
  SAY #56494 /* ~Uff, czuj� ulg�! B�d�c tam przez chwil� my�la�am, �e to jest normalne. Nie mamy u nas zbyt wielu teatr�w i zaczyna�am rozumie� dlaczego!~ */
  IF ~~ THEN EXTERN ~RAELIS~ 34
END

IF ~~ THEN BEGIN 294 // from:
  SAY #56503 /* ~S�ysza�am o... o Lady Jysstev. Nie mog� poj��, w jaki spos�b mog�aby by� zamieszana... zawsze uwa�a�am j� za przyzwoit� i zarozumia��. To mo�e by� ciekawe.~ */
  IF ~!IsValidForPartyDialog("Anomen")~ THEN EXIT
  IF ~IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ 286
END

IF ~~ THEN BEGIN 295 // from: 6.0
  SAY #56699 /* ~By� mo�e lepsze by�oby jakie� strategiczne przej�cie. Na p�noc od palisady, znajduj� si� w murach zamkowych sekretne drzwi. Ja... cz�sto ich u�ywa�am by m�c niepostrze�enie pomaga� innym.~ */
  IF ~~ THEN GOTO 8
END

IF ~~ THEN BEGIN 296 // from: 39.0
  SAY #56700 /* ~Udaj si� w bezpieczne miejsce, Dalesonie, i przygotuj tych, kt�rzy pozostali, do powrotu do s�u�by. To miejsce b�dzie wymaga�o sporo pracy, gdy b�dzie ju� po wszystkim.~ */
  IF ~~ THEN EXTERN ~DALESON~ 27
END

IF ~~ THEN BEGIN 297 // from: 43.0
  SAY #56701 /* ~Sama s�u�ba te� mo�e by� zaniepokojona. Czy doceni ci�ar sprawowania w�adzy? Warto by spr�bowa�, ale nie b�dzie to tutaj popularne.~ */
  IF ~~ THEN GOTO 36
END

IF ~~ THEN BEGIN 298 // from: 49.0
  SAY #56702 /* ~Byli najemnikami, ale zostali poleceni z dobrego �r�d�a. Trenowali w Amn. Glaicus jednak�e by� przyjacielem mojego ojca. By� mo�e zosta� zabity gdzie� w zamku.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 299 // from: 50.0
  SAY #56703 /* ~Stra�nicy zawsze zachowywali pewn� rezerw�. Byli nieco nieprzyja�ni, za wyj�tkiem Glaicusa, ale zostali poleceni z dobrego �r�d�a. Trenowali w Amn.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 300 // from: 52.0
  SAY #56704 /* ~Skoro ich tu nie ma, walki musia�y by� krwawe. Ale gdzie s� cia�a... spodziewa�abym si�, �e przynajmniej Glaicus walczy�, a� do �mierci...~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 301 // from: 67.0
  SAY #56705 /* ~Nie podoba mi si� my�l, �e znajd� si� pod wp�ywem Roenall�w, po tym jak pracowa�am ci�ko by zdoby� to, co mam. Wola�abym �eby nie po�o�yli swoich �ap na dobytku mojego ojca.~ */
  IF ~~ THEN GOTO 161
END

IF ~~ THEN BEGIN 302 // from:
  SAY #57156 /* ~Chwileczk�! Powiedzia�e�, �e... �e dusze twoich ludzi zosta�y uwi�zione w tych klejnotach! My�la�am, �e ich ratujemy!~ */
  IF ~~ THEN EXTERN ~JARLAXLE~ 25
END

IF ~~ THEN BEGIN 303 // from:
  SAY #57398 /* ~Ummm... przypuszczam, �e to jest lepsze od tego co mia�y im zrobi� drowy. Nie o wiele jednak.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 304 // from:
  SAY #57661 /* ~Potrzebujesz chwili odpoczynku? Nie wahaj si� poprosi� o rami�, na kt�rym mo�esz spocz��.~ */
  IF ~~ THEN REPLY #57662 /* ~Nic mi nie jest. Zachowaj si�y dla tych 'biednych ludzi', kt�rych tak lubisz rozpieszcza�.~ */ GOTO 305
  IF ~~ THEN REPLY #57663 /* ~Twoja pomoc jest mile widziana, ale jako� sobie poradz�. To uczucie ju� przesz�o.~ */ GOTO 306
  IF ~~ THEN REPLY #57664 /* ~Nie wiem. To by�o bardzo dziwne. W og�le nie czu�em si� sob�.~ ~Nie wiem. To by�o bardzo dziwne. W og�le nie czu�am si� sob�.~ */ GOTO 307
END

IF ~~ THEN BEGIN 305 // from: 304.0
  SAY #57665 /* ~Mam za swoje. Moje zdolno�ci zarezerwuj� dla tych, kt�rzy zas�uguj� na moj� pomoc. Phi!~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 306 // from: 304.1
  SAY #57666 /* ~Daj mi zna�, je�li to si� powt�rzy. Powinni�my si� z tob� obchodzi� delikatnie, dop�ki nie dowiemy si� dok�adnie, jaki wp�yw mia� na ciebie ten rytua�.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 307 // from: 304.2
  SAY #57667 /* ~B�d� mie� na ciebie oko przez jaki� czas. Kto wie jaki wp�yw mia� na ciebie ten rytua�. Nigdy nie widzia�am czego� podobnego.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 308 // from:
  SAY #57724 /* ~<CHARNAME>, to nie mo�e by� nic dobrego. Nigdy nie widzia�am takiego...~ */
  IF ~~ THEN GOTO 309
END

IF ~~ THEN BEGIN 309 // from: 308.0
  SAY #57725 /* ~Ciotunia zwyk�a mi opowiada� historie o bogach, kt�rych si� nauczy�a, gdy by�a w szkole w Calimshanie. Opowiada�a o wielu przera�aj�cych rzeczach, ale nie by�o to nic podobnego do tego.~ */
  IF ~~ THEN GOTO 310
END

IF ~~ THEN BEGIN 310 // from: 309.0
  SAY #57726 /* ~<CHARNAME>, gdybym ci� nie zna�a, krzycza�abym ze strachu. Musimy odzyska� twoj� dusz� zanim... zanim zupe�nie si� w tym zatracisz...~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 311 // from:
  SAY #58151 /* ~S�dz�, �e nie mamy wielkiego wyboru, chocia� trudno mi uwierzy�... tym ludziom. Wcale nie wygl�daj� na zmuszonych do prowadzenia tego rodzaju �ycia.~ */
  IF ~!IsValidForPartyDialogue("EDWIN")
!IsValidForPartyDialogue("HAERDALIS")~ THEN EXIT
  IF ~IsValidForPartyDialogue("EDWIN")~ THEN EXTERN ~EDWINJ~ 156
  IF ~IsValidForPartyDialogue("HAERDALIS")
!IsValidForPartyDialogue("EDWIN")~ THEN EXTERN ~HAERDAJ~ 146
END

IF ~~ THEN BEGIN 312 // from:
  SAY #58152 /* ~Zamknij si�, Edwinie. Robi mi si� niedobrze od twojego pompatycznego tonu.~ */
  IF ~~ THEN EXTERN ~EDWINJ~ 157
END

IF ~~ THEN BEGIN 313 // from:
  SAY #58155 /* ~Ach! Nie mo�na z tob� rozmawia�!~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 314 // from:
  SAY #58157 /* ~Ale jest tak wielu, kt�rzy nie maj� �adnego wyboru.~ */
  IF ~~ THEN EXTERN ~HAERDAJ~ 147
END

IF ~~ THEN BEGIN 315 // from:
  SAY #58160 /* ~Przyby�am... tak daleko, zgadza si�? Nie zgadzam si� by kto� taki jak Irenicus robi� co chcia�. Je�li on zdob�dzie moc, kt�rej pragnie, cierpienie tylko si� powi�kszy. Nie, jestem gotowa do walki, <CHARNAME>.~ */
  IF ~True()~ THEN EXTERN ~PLAYER1~ 53
  IF ~IsValidForPartyDialog("Anomen")
Global("AnomenRomanceActive","GLOBAL",2)~ THEN EXTERN ~PLAYER1~ 52
  IF ~IsValidForPartyDialog("Aerie")
Global("AerieRomanceActive","GLOBAL",2)~ THEN EXTERN ~PLAYER1~ 51
  IF ~IsValidForPartyDialog("Viconia")
Global("ViconiaRomanceActive","GLOBAL",2)~ THEN EXTERN ~PLAYER1~ 50
  IF ~IsValidForPartyDialog("Jaheira")
Global("JaheiraRomanceActive","GLOBAL",2)~ THEN EXTERN ~PLAYER1~ 49
  IF ~IsValidForPartyDialog("Anomen")
!Global("AnomenRomanceActive","GLOBAL",2)~ THEN EXTERN ~PLAYER1~ 48
  IF ~IsValidForPartyDialog("Aerie")
!Global("AerieRomanceActive","GLOBAL",2)~ THEN EXTERN ~PLAYER1~ 47
  IF ~IsValidForPartyDialog("Viconia")
!Global("ViconiaRomanceActive","GLOBAL",2)~ THEN EXTERN ~PLAYER1~ 46
  IF ~IsValidForPartyDialog("Jaheira")
!Global("JaheiraRomanceActive","GLOBAL",2)~ THEN EXTERN ~PLAYER1~ 45
  IF ~IsValidForPartyDialog("Cernd")~ THEN EXTERN ~PLAYER1~ 44
END

IF ~~ THEN BEGIN 316 // from:
  SAY #58522 /* ~Nie wiem, <CHARNAME>... to nie wygl�da w porz�dku. Tolgerias z pewno�ci� nas ok�ama� w sprawie Valygara. Nie pracujemy ju� dla niego, prawda?~ */
  IF ~!IsValidForPartyDialog("Korgan")~ THEN EXTERN ~TOLGER~ 82
  IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ 189
END

IF ~~ THEN BEGIN 317 // from:
  SAY #58740 /* ~Zachowujesz si� jak arystokraci, z kt�rymi nie chc� mie� nic wsp�lnego. Wyrzekaj� si� swych ojc�w, je�li tego wymagaj� ich plany. Mia�am o tobie wy�sze mniemanie, Yoshimo.~ */
  IF ~!IsValidForPartyDialogue("KELDORN")
!IsValidForPartyDialogue("KORGAN")
!IsValidForPartyDialogue("EDWIN")
!IsValidForPartyDialogue("MAZZY")
!IsValidForPartyDialogue("JAN")
!IsValidForPartyDialogue("VALYGAR")
!IsValidForPartyDialogue("HAERDALIS")
!IsValidForPartyDialogue("CERND")
!IsValidForPartyDialogue("MINSC")~ THEN EXTERN ~YOSHJ~ 114
  IF ~IsValidForPartyDialogue("KELDORN")~ THEN EXTERN ~KELDORJ~ 250
  IF ~IsValidForPartyDialogue("KORGAN")
!IsValidForPartyDialogue("KELDORN")~ THEN EXTERN ~KORGANJ~ 190
  IF ~IsValidForPartyDialogue("EDWIN")
!IsValidForPartyDialogue("KORGAN")
!IsValidForPartyDialogue("KELDORN")~ THEN EXTERN ~EDWINJ~ 161
  IF ~IsValidForPartyDialogue("MAZZY")
!IsValidForPartyDialogue("EDWIN")
!IsValidForPartyDialogue("KORGAN")
!IsValidForPartyDialogue("KELDORN")~ THEN EXTERN ~MAZZYJ~ 201
  IF ~IsValidForPartyDialogue("JAN")
!IsValidForPartyDialogue("MAZZY")
!IsValidForPartyDialogue("EDWIN")
!IsValidForPartyDialogue("KORGAN")
!IsValidForPartyDialogue("KELDORN")~ THEN EXTERN ~JANJ~ 182
  IF ~IsValidForPartyDialogue("VALYGAR")
!IsValidForPartyDialogue("JAN")
!IsValidForPartyDialogue("MAZZY")
!IsValidForPartyDialogue("EDWIN")
!IsValidForPartyDialogue("KORGAN")
!IsValidForPartyDialogue("KELDORN")~ THEN EXTERN ~VALYGARJ~ 119
  IF ~IsValidForPartyDialogue("HAERDALIS")
!IsValidForPartyDialogue("VALYGAR")
!IsValidForPartyDialogue("JAN")
!IsValidForPartyDialogue("MAZZY")
!IsValidForPartyDialogue("EDWIN")
!IsValidForPartyDialogue("KORGAN")
!IsValidForPartyDialogue("KELDORN")~ THEN EXTERN ~HAERDAJ~ 150
  IF ~IsValidForPartyDialogue("CERND")
!IsValidForPartyDialogue("HAERDALIS")
!IsValidForPartyDialogue("VALYGAR")
!IsValidForPartyDialogue("JAN")
!IsValidForPartyDialogue("MAZZY")
!IsValidForPartyDialogue("EDWIN")
!IsValidForPartyDialogue("KORGAN")
!IsValidForPartyDialogue("KELDORN")~ THEN EXTERN ~CERNDJ~ 137
  IF ~IsValidForPartyDialogue("MINSC")
!IsValidForPartyDialogue("CERND")
!IsValidForPartyDialogue("HAERDALIS")
!IsValidForPartyDialogue("VALYGAR")
!IsValidForPartyDialogue("JAN")
!IsValidForPartyDialogue("MAZZY")
!IsValidForPartyDialogue("EDWIN")
!IsValidForPartyDialogue("KORGAN")
!IsValidForPartyDialogue("KELDORN")~ THEN EXTERN ~MINSCJ~ 211
END

IF ~~ THEN BEGIN 318 // from: 149.0
  SAY #59894 /* ~Co gorsza, wygl�da na to, �e maj� ze sob�... co� w rodzaju w�y. Nigdy nie widzia�am czego� podobnego, ale chyba w og�le nie widzia�am wielu rzeczy.~ */
  IF ~~ THEN GOTO 222
END

IF ~~ THEN BEGIN 319 // from:
  SAY #85783 /* ~Tak jak wtedy, gdy okrutny szlachcic wywo�uje cierpienie i strach poddanych uprawiaj�cych jego ziemi�, by pracowali wydajniej. To z pewno�ci� jest z�e.~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 183
END

IF ~~ THEN BEGIN 320 // from:
  SAY #85890 /* ~Ja zacz�am uczy� si� z ksi�g. Kiedy podpali�am bibliotek� w Twierdzy, moi rodzice zdecydowali si� wynaj�� mi nauczyciela. (Chichocze)~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 237
END

IF ~~ THEN BEGIN 321 // from:
  SAY #86154 /* ~To mi przypomina jak w�a�nie zaczyna�am si� uczy� i s�dzi�am, �e rzucam zakl�cie niewidzialno�ci... w zamian przypadkowo sama si� o�lepi�am. W panice prawie wypad�am przez okno. (Chichocze)~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 375
END

IF ~~ THEN BEGIN 322 // from:
  SAY #86511 /* ~Mam takie dziwne wra�enie, �e to podchwytliwe pytanie, Chloe.~ */
  IF ~~ THEN EXTERN ~AERIEJ~ 231
END

IF ~~ THEN BEGIN 323 // from:
  SAY #86517 /* ~Aerie... on my�li o ...~ */
  IF ~~ THEN EXTERN ~VICONIJ~ 197
END

IF ~~ THEN BEGIN 324 // from:
  SAY #86521 /* ~Z ca�� pewno�ci� w tej grupie jest za wiele napi�cia. Byc mo�e *pomog�oby*, gdyby�my wszystkie...~ */
  IF ~~ THEN EXTERN ~AERIEJ~ 234
END

IF ~~ THEN BEGIN 325 // from:
  SAY #86527 /* ~Viconio! Prosz�, my�l�, �e powinni�my oszcz�dzi� Aerie naszych nieczystych my�li o... zaj�ciach grupowych.~ */
  IF ~~ THEN EXTERN ~JAHEIRAJ~ 537
END

IF ~~ THEN BEGIN 326 // from:
  SAY #86530 /* ~Aerie, zostajesz z ty�u. Chod� ju�, moja droga.~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 540
END

IF ~~ THEN BEGIN 327 // from:
  SAY #87063 /* ~Nie bardzo obchodz� mnie okre�lenia, jakimi obdarzasz biedak�w, Chloe. Pomimo tego, daj� im tylko nadmiar naszych pieni�dze. To nie jest tak, �e sami prawie nic nie mamy.~ */
  IF ~~ THEN DO ~SetGlobal("NaliaBanter1CR","GLOBAL",2)
~ EXTERN ~CHLOEJ~ 805
END

IF ~~ THEN BEGIN 328 // from:
  SAY #87065 /* ~Och, nie musisz przedstawia� wszystkiego tak dramatycznie, Chloe. Moneta tu i tam nie op�ni naszej wyprawy na pomoc Imoen. Ale dla �ebraka bez grosza przy duszy znaczy bardzo wiele.~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 806
END

IF ~~ THEN BEGIN 329 // from:
  SAY #87067 /* ~Potrafi� si� kontrolowa�, Chloe. A ty uwa�aj na swoje s�owa, kiedy m�wisz na te tematy.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 330 // from:
  SAY #87069 /* ~Dzi�kuj�, Chloe. Ty r�wnie� jeste� niczego sobie.~ */
  IF ~~ THEN DO ~SetGlobal("NaliaBanter2CR","GLOBAL",2)
~ EXTERN ~CHLOEJ~ 808
END

IF ~~ THEN BEGIN 331 // from:
  SAY #87071 /* ~O...? W jaki spos�b?~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 809
END

IF ~~ THEN BEGIN 332 // from:
  SAY #87073 /* ~Znam troch� D'Martine'�w, gdy� ojciec prowadzi� z nimi r�ne interesy. Chyba nawet j� kiedy� spotka�am. Theresa, czy� nie?~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 810
END

IF ~~ THEN BEGIN 333 // from:
  SAY #87075 /* ~Interesuj�ce. Wiesz co si� z ni� sta�o?~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 811
END

IF ~~ THEN BEGIN 334 // from:
  SAY #87077 /* ~To chyba zar�wno szcz�liwe jak i smutne wie�ci, jak s�dz�.~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 812
END

IF ~~ THEN BEGIN 335 // from:
  SAY #87079 /* ~Chyba tak. Sprawki wysoko urodzonych cz�sto zostawiaj� w mych ustach gorzki posmak. Ale i tak do tego przywyk�am. Planowa�am wyj�cie za szlachcica, kt�ry mia�by te same pogl�dy co ja odno�nie biednych. Albo przynajmniej m�odego, mi�ego m�czyzn�, kt�ry nie denerwowa�by nikogo w pobli�u.~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 813
END

IF ~~ THEN BEGIN 336 // from:
  SAY #87081 /* ~Tak, kilku. Jednym by� miejscowy ch�opak o imieniu Beran. Ca�kiem przystojny, ale potwornie nudny i jeszcze mniej rozgarni�ty. Ale by� s�odki. A potem Marietta, pokoj�wka. Moi rodzice nie byli zbyt zachwyceni kiedy si� o tym dowiedzieli. Wys�ali jej ca�� rodzin� na ziemie Roenall�w. Flirt ze s�u�b� jest dopuszczalny, o ile tylko nie zostaniesz przy�apana. Ci�gle czuj� si� nieco winna z tego powodu.~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 814
END

IF ~~ THEN BEGIN 337 // from:
  SAY #87083 /* ~Wszyscy mamy tak� nadziej�, Chloe. Do��czmy do reszty. Robi� si� nieco nerwowa, kiedy trac� ich z oczu.~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 815
END

IF ~~ THEN BEGIN 338 // from:
  SAY #68454 /* ~Hmm.~ */
  IF ~~ THEN EXIT
END

IF WEIGHT #0 ~Global("NaliaBanter3CR","GLOBAL",1)
~ THEN BEGIN 339 // from:
  SAY #87085 /* ~Co s�dzisz o wysoko urodzonych, Chloe?~ */
  IF ~~ THEN DO ~RealSetGlobalTimer("BanteringTimerCR","GLOBAL",EIGHT_HOURS)
~ EXTERN ~CHLOEJ~ 816
END

IF ~~ THEN BEGIN 340 // from:
  SAY #87087 /* ~Oczywi�cie. Ale w gruncie rzeczy zgadzam si� z tob�. Natura szlachty musi si� zmieni�. Zbyt wielkie s�r�nice dziel�ce bogatego szlachcica od ubogiego ch�opa. Jedynym sposobem na osi�gni�cie czego� jest dla nich zostanie �owcami przyg�d, a wtedy albo gin� gdzie� na szlaku trac�c wszystko albo udaje im si� i sami staj� si� szlachcicami, a cykl zaczyna si� od pocz�tku.~ */
  IF ~~ THEN DO ~SetGlobal("NoMoreNaliaBantersCR","GLOBAL",1)
~ EXTERN ~CHLOEJ~ 817
END

IF ~~ THEN BEGIN 341 // from:
  SAY #87089 /* ~Dok�adnie tak. Musi rozwin�� si� jaka� strefa po�rednia. Klasa �rednia, na kt�r� sk�ada� si� b�dzie kto� wi�cej ni� tylko zubo�ali szlachcica albo bogaci kupcy.~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 818
END

IF ~~ THEN BEGIN 342 // from:
  SAY #87091 /* ~C�... Mam na my�li wykorzystanie nieco nadmiaru z�ota nale��cego do bogaczy i rozdzielenia go po r�wno mi�dzy ubo�szych. Podnios�oby to ich stop� �yciow�, nie szkodz�c przy tym nadmiernie szlachcie.~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 819
END

IF ~~ THEN BEGIN 343 // from:
  SAY #87093 /* ~Hmm... Tego nie przemy�la�am.~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 820
END

IF ~~ THEN BEGIN 344 // from:
  SAY #87095 /* ~Chyba powinnam to troch� dog��bniej przemy�le�. Czasem wydaje mi si�, �e wszystko ju� przemy�la�am, a zaraz potem kto� pokazuje mi moje b��dy. Dzi�kuj� ci, Chloe.~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 821
END

IF ~~ THEN BEGIN 345 // from:
  SAY #87097 /* ~By� mo�e uda�oby si� wp�yn�� na rz�dz�cych w sprawie podatk�w i podzia�u d�br? Mo�e to porz�dnie rozwa�y�.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 346 // from:
  SAY #87466 /* ~Mog�aby�? Och... zapomnij, �e to powiedzia�am. Ha ha... jest aroganckim b�kartem, ale nawet on nie zas�uguje na �mier�.~ */
  IF ~~ THEN REPLY #1812 /* ~Czy on zawsze by� taki... napalony? Wygl�da na zdeterminowanego by wprowadzi� w �ycie wasze zar�czyny.~ */ DO ~SetGlobal("NaliaComplainsIsaea","LOCALS",1)~ GOTO 109
  IF ~~ THEN REPLY #1813 /* ~Powiedzia�, �e mo�e 'pom�c lub zaszkodzi�', i �e 'ju� to robi�'. Co to znaczy?~ */ DO ~SetGlobal("NaliaComplainsIsaea","LOCALS",1)~ GOTO 110
  IF ~~ THEN REPLY #1814 /* ~Po�lubienie go mog�oby by� ca�kiem op�acalne. My�la�a� o tym, prawda?~ */ DO ~SetGlobal("NaliaComplainsIsaea","LOCALS",1)~ GOTO 111
  IF ~~ THEN REPLY #1815 /* ~Nie chc� bra� udzia�u w tym zamieszaniu. Spotkamy si� znowu z tym wymuskanym prostakiem?~ */ DO ~SetGlobal("NaliaComplainsIsaea","LOCALS",1)~ GOTO 112
END
