BEGIN ~KPCAPT02~

IF ~global("CernikPozwolenie","GLOBAL",0) !InPartySlot(LastTalkedToBy,0)~ THEN BEGIN Nic
SAY ~Przykro mi, ale mog� przyjmowa� rozkazy tylko od naszego przyw�dcy.~
IF ~~ THEN EXIT
END

IF ~OR(2) AreaCheck("Ar1304") GlobalGT("KeepPlot","GLOBAL",14)~ THEN BEGIN Witanie
SAY ~W czym kapitan gwardii mo�e ci pom�c?~
IF ~~ THEN REPLY ~Opowiedz mi o sobie.~ GOTO Przedstawienie
IF ~global("CernikWiad","GLOBAL",0)~ THEN REPLY ~Czy podczas mojej nieobecno�ci zdarzy�o si� co� wa�nego o czym jeszcze nie wiem?~ GOTO Nie
IF ~global("CernikWiad","GLOBAL",1) global("GoblinBunkry","GLOBAL",0)~ THEN REPLY ~Czy podczas mojej nieobecno�ci zdarzy�o si� co� wa�nego o czym jeszcze nie wiem?~ GOTO Gobliny1
IF ~global("CernikWiad","GLOBAL",1) global("GoblinBunkry","GLOBAL",1)~ THEN REPLY ~Czy podczas mojej nieobecno�ci zdarzy�o si� co� wa�nego o czym jeszcze nie wiem?~ GOTO Gobliny2
IF ~global("CernikWiad","GLOBAL",2)~ THEN REPLY ~Czy podczas mojej nieobecno�ci zdarzy�o si� co� wa�nego o czym jeszcze nie wiem?~ GOTO Karawana
IF ~global("CernikWiad","GLOBAL",3)~ THEN REPLY ~Czy podczas mojej nieobecno�ci zdarzy�o si� co� wa�nego o czym jeszcze nie wiem?~ GOTO Plus
IF ~global("CernikPozwolenie","GLOBAL",0) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chc�, aby moi kompani mogli wydawa� rozkazy mojej armii.~ DO ~setglobal("CernikPozwolenie","GLOBAL",1)~ GOTO Zgoda
IF ~global("CernikPozwolenie","GLOBAL",1) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Odwo�aj uprawnienia moich kompan�w do wydawania rozkaz�w mojej armii.~ DO ~setglobal("CernikPozwolenie","GLOBAL",0)~ GOTO Zgoda
IF ~~ THEN REPLY ~Porozmawiajmy o naszej armii.~ GOTO Armia
//IF ~global("RoenallInwazja","GLOBAL",0) globalLT("DarniseRezerwy","GLOBAL",4)~ THEN REPLY ~Porozmawiajmy o ataku na zamek Roenall�w.~ GOTO Odmowa
//IF ~global("RoenallInwazja","GLOBAL",0) globalGT("DarniseRezerwy","GLOBAL",3)~ THEN REPLY ~Porozmawiajmy o ataku na zamek Roenall�w.~ GOTO Inwazja
//IF ~global("RoenallInwazja","GLOBAL",1)~ THEN REPLY ~Porozmawiajmy o ataku na zamek Roenall�w.~ GOTO Inwazja1
//IF ~global("RoenallInwazja","GLOBAL",2)~ THEN REPLY ~Porozmawiajmy o ataku na zamek Roenall�w.~ GOTO Inwazja2
//IF ~global("RoenallInwazja","GLOBAL",3)~ THEN REPLY ~Porozmawiajmy o ataku na zamek Roenall�w.~ GOTO Inwazja3
IF ~~ THEN REPLY ~Obecnie niczego nie potrzebuje.~ EXIT
END

IF ~~ THEN BEGIN Zgoda
SAY ~Oczywi�cie. Zaraz wydam odpowiednie rozkazy.~
IF ~~ THEN REPLY ~Chc� prosi� o co� innego.~ GOTO Witanie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Nie
SAY ~Nic o czym warto informowa�.~
IF ~~ THEN REPLY ~Chc� zapyta� o co� innego.~ GOTO Witanie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Przedstawienie
SAY ~Wychowa�em si� w na farmie niedaleko. Potem wst�pi�em do gwardii. D�ugo s�u�y�em z poprzednim dow�dc�. Szkoda, �e kapitan Arat odszed�, <PRO_LADYLORD>. Uzna�, �e jako� zawi�d� Lorda d'Arnise...~
IF ~~ THEN REPLY ~Chc� prosi� o co� innego.~ GOTO Witanie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Nowy1
SAY ~To doskona�y pomys�. Ludzie z rado�ci� przy��czaj� si� do gwardii, wi�c b�d� potrzebowa� tylko 6000 sztuk z�ota na wyposa�enie i przygotowanie miejsca w koszarach. Oddzia� bedzie dostepny praktycznie od razu, ale p�ki nie zako�czy szkolenia, bede trzyma� go przy mniej istotnych zadaniach.~
IF ~PartyGoldGT(5999)~ THEN REPLY ~Prosz�, oto pieniadze.~ DO ~TakePartyGold(6000) DestroyGold(6000) incrementglobal("DarniseRezerwy","GLOBAL",1) incrementglobal("DarniseTotal","GLOBAL",1)~ GOTO Tworzenie
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Pom�wmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Na razie zrezygnuj�. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Tworzenie
SAY ~Rozka�� Arkandowi, �eby rozpocz�� trening, udam sie do ku�ni po wyposa�enie i powiem majordomusowi �eby przygotowa� miejsce w koszarach.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Pom�wmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~ EXIT
END

IF WEIGHT #0 ~Global("KPCapt02Steal","GLOBAL",1)~ THEN BEGIN 7
SAY ~Witam, <PRO_LADYLORD>. Nie jestem pewny czy wiesz, ale od kilku tygodni w twierdzy dochodzi do kradzie�y.~
    IF ~~ THEN DO ~SetGlobal("KPCapt02Steal","GLOBAL",2)~ GOTO 8
END

IF ~~ THEN BEGIN 8
  SAY ~Gin� drobiazgi. Tu puchar, tam srebrna zastawa, albo par� z�otych monet nale��cych do s�u��cych. Wszystkie przedmioty maj� pewn� warto��, ale niezbyt wielk�.~
  IF ~~ THEN GOTO 9
END

IF ~~ THEN BEGIN 9
  SAY ~Mimo wszystko, przeprowadzi�em �ledztwo. Winowajc� okaza� si� Lastin - jeden z nowych stra�nik�w. Z�apa�em go na gor�cym uczynku, gdy pr�bowa� zwin�� naszyjnik Lady d'Arnise.~
  IF ~~ THEN GOTO 10
END

IF ~~ THEN BEGIN 10
  SAY ~Lastin przyzna� si� do winy. Nie wiem, jak� kar� nale�y mu wymierzy�, wi�c przedstawiam t� spraw� tobie, <PRO_LADYLORD>.~
  IF ~~ THEN EXTERN ~KPDOMO01~ 58
END

IF ~~ THEN BEGIN 11 // from:
  SAY #40332 //* ~Owszem. Natychmiast ka�� to zrobi�... B�dzie to dobrym ostrze�eniem dla wszystkich, kt�rzy mog� mie� podobne pomys�y.~ */
  IF ~~ THEN EXTERN ~KPGRD01~ 0
END

IF ~~ THEN BEGIN 12 // from:
  SAY #40334 //* ~Cisza! <PRO_LADYLORD> wydaje tu rozkazy! Chod� ze mn� i spr�buj zachowa� resztki godno�ci, Lastin.~ */
  IF ~~ THEN DO ~ActionOverride("kpgrd01",MoveToPoint([1549.1192]))
ActionOverride("kpgrd01",EscapeArea())
MoveToPoint([1499.1196])
EscapeArea()
~ EXIT
END

IF ~~ THEN BEGIN 13 // from:
  SAY #40336 //* ~Owszem. Nie podoba mi si�, �e ujdzie mu to na sucho, ale skoro<PRO_LADYLORD> <CHARNAME> okazuje lito��, to niech tak b�dzie.~ */
  IF ~~ THEN EXTERN ~KPGRD01~ 1
END

IF ~~ THEN BEGIN 14 // from:
  SAY #40338 //* ~Do��. Chod� ze mn�, Lastin. P�jdziemy do koszar i zabierzemy twoje rzeczy... A potem stra� odprowadzi ci� do bram.~ */
  IF ~~ THEN DO ~AddExperienceParty(11500)
ActionOverride("kpgrd01",MoveToPoint([1549.1192]))
ActionOverride("kpgrd01",EscapeArea())
MoveToPoint([1499.1196])
EscapeArea()
~ EXIT
END

IF ~~ THEN BEGIN 15 // from:
  SAY #40339 //* ~Nie by�o mnie wtedy w twierdzy, ale Arat wspomina� o s�u��cym, kt�ry podbiera� pieni�dze. Oczywi�cie zosta� stracony.~ */
  IF ~~ THEN REPLY #40340 /* ~Skoro wi�c taka kara jest w�a�ciwa, sprawa jest jasna. Natychmiast straci� tego cz�owieka.~ */ EXTERN ~KPDOMO01~ 59
  IF ~~ THEN REPLY #40341 /* ~Nie chc� jego �mierci. To drobne przest�pstwo. Zamiast tego wydalimy go ze stra�y i z twierdzy.~ */ EXTERN ~KPDOMO01~ 60
  IF ~~ THEN REPLY #40342 /* ~Rozumiem. Chc� us�ysze�, co Lastin ma do powiedzenia na swoj� obron�.~ */ EXTERN ~KPGRD01~ 2
END

IF ~~ THEN BEGIN 16 // from:
  SAY #40344 //* ~Je�li masz jakie� wyt�umaczenie, Lastin, to lepiej m�w szybko, nim <PRO_LADYLORD> straci cierpliwo��.~ */
  IF ~~ THEN EXTERN ~KPGRD01~ 3
END

IF ~~ THEN BEGIN 17 // from:
  SAY #40352 //* ~Chcesz... zupe�nie mu wybaczy�, <PRO_LADYLORD>?~ */
  IF ~~ THEN EXTERN ~KPGRD01~ 6
END

IF ~~ THEN BEGIN 18 // from:
  SAY #40354 //* ~(wzdycha) No dobrze. Masz szcz�cie, �e <PRO_LADYLORD> wykazuje tak� uprzejmo��, Lastin. Chod� ze mn� do koszar.~ */
  IF ~~ THEN DO ~AddexperienceParty(15500)
ActionOverride("kpgrd01",MoveToPoint([1549.1192]))
ActionOverride("kpgrd01",EscapeArea())
MoveToPoint([1499.1196])
EscapeArea()
~ EXIT
END

IF ~~ THEN BEGIN 19 // from:
  SAY #40372 //* ~Chod� ze mn�, Lastin. Sprawiedliwo�ci stanie si� zado��, a wszyscy, kt�rzy chcieliby p�j�� w twoje �lady, powa�nie si� nad tym zastanowi�.~ */
  IF ~~ THEN DO ~ActionOverride("kpgrd01",MoveToPoint([1549.1192]))
ActionOverride("kpgrd01",EscapeArea())
MoveToPoint([1499.1196])
EscapeArea()
~ EXIT
END

IF ~~ THEN BEGIN 20 // from:
  SAY #40375 //* ~(wzdycha) Nie powiem, �ebym si� z tym zgadza�, ale... Chyba uczyni�bym tak samo. Mam nadziej�, �e z �on� jako� si� u�o�y. Chod� ze mn� do koszar.~ */
  IF ~~ THEN DO ~AddexperienceParty(15500)
ActionOverride("kpgrd01",MoveToPoint([1549.1192]))
ActionOverride("kpgrd01",EscapeArea())
MoveToPoint([1499.1196])
EscapeArea()
~ EXIT
END

IF WEIGHT #1 ~Global("KeepPlot","GLOBAL",9)~ THEN BEGIN 21 // from:
  SAY #40654 //* ~<PRO_LADYLORD> <CHARNAME>! Lord Roenall i jego wojsko przebili si� przez nasze linie! Atakuj� wrota!~ */
  IF ~~ THEN GOTO 22
END

IF ~~ THEN BEGIN 22 // from: 21.0
  SAY #40655 //* ~Musisz i�� tam pr�dko! Je�li ich nie powstrzymamy, pokonaj� mury i przegramy!~ */
  IF ~~ THEN GOTO 23
END

IF ~~ THEN BEGIN 23 // from: 22.0
  SAY #40656 //* ~Musisz walczy� z Lordem Roenallem! Je�li zginie, jego armia rozproszy si�! Ale musisz to zrobi�, nim zdob�d� mury! Szybko, <PRO_LADYLORD>! Do wr�t!~ */
  IF ~~ THEN DO ~SetGlobal("KeepPlot","GLOBAL",11)
ActionOverride("kpsold03",MoveToPoint([1549.1192])
ActionOverride("kpsold04",MoveToPoint([1480.1235])
ActionOverride("kpsold03",EscapeArea())
ActionOverride("kpsold04",EscapeArea())
MoveToPoint([1499.1196])
EscapeArea()
~ EXIT
END

IF WEIGHT #2 ~Global("KeepPlot","GLOBAL",11)
!Dead("kproen01")
~ THEN BEGIN 24 // from:
  SAY #40660 //* ~Musisz zabi� Roenalla, <PRO_LADYLORD>! Szybko!~ */
  IF ~~ THEN EXIT
END

IF WEIGHT #3 ~Global("KeepPlot","GLOBAL",13)
Dead("kproen01")
~ THEN BEGIN 25 // from:
  SAY #40683 //* ~Ciesz� si�, �e zostajesz w twierdzy... I �e �yjesz. Lord Roenall zas�u�y� na sw�j los. Cieszymy si�, �e nie musimy s�u�y� pod takim �ajdakiem.~ */
  IF ~~ THEN DO ~SetGlobal("KeepPlot","GLOBAL",15)
~ EXIT
END

IF ~~ THEN BEGIN Nowy2
SAY ~To doskona�y pomys�, ale ludzi b�dzie trzeba przekona� �eby do��czyli do gwardii, wi�c b�d� potrzebowa� 9000 sztuk z�ota na wyposa�enie, przygotowanie miejsca w koszarach i przekonanie ludzi. Oddzia� bedzie dostepny praktycznie od razu, ale p�ki nie zako�czy szkolenia, bede trzyma� go przy mniej istotnych zadaniach.~
IF ~PartyGoldGT(8999)~THEN REPLY ~Prosz�, oto pieniadze.~ DO ~TakePartyGold(9000) DestroyGold(9000) incrementglobal("DarniseRezerwy","GLOBAL",1) incrementglobal("DarniseTotal","GLOBAL",1)~ GOTO Tworzenie
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Pom�wmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Na razie zrezygnuj�. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Nowy3
SAY ~To doskona�y pomys�, ale nikt w miejscowych nie przy��czy sie do gwardii, wi�c b�d� potrzebowa� 15000 sztuk z�ota na wyposa�enie, przygotowanie miejsca w koszarach i wynaj�cie cudzoziemskich najemnik�w. Oddzia� bedzie dostepny praktycznie od razu, ale p�ki nie zako�czy szkolenia, bede trzyma� go przy mniej istotnych zadaniach.~
IF ~PartyGoldGT(14999)~THEN REPLY ~Prosz�, oto pieniadze.~ DO ~TakePartyGold(15000) DestroyGold(15000) incrementglobal("DarniseRezerwy","GLOBAL",1) incrementglobal("DarniseTotal","GLOBAL",1)~ GOTO Tworzenie
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Pom�wmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Na razie zrezygnuj�. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Nowy0
SAY ~To doskona�y pomys�, ale nasza ku�nia nie dzia�a, wi�c b�d� potrzebowa� 20000 sztuk z�ota na wyposa�enie i przygotowanie miejsca w koszarach niezale�nie od tego sk�d wezm� ludzi. Oddzia� bedzie dostepny praktycznie od razu, ale p�ki nie zako�czy szkolenia, bede trzyma� go przy mniej istotnych zadaniach.~
IF ~PartyGoldGT(19999)~THEN REPLY ~Prosz�, oto pieniadze.~ DO ~TakePartyGold(20000) DestroyGold(20000) incrementglobal("DarniseRezerwy","GLOBAL",1) incrementglobal("DarniseTotal","GLOBAL",1)~ GOTO Tworzenie
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Pom�wmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Na razie zrezygnuj�. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Odmowa
SAY ~Mam za ma�o dost�pnych oddzia��w zeby przeprowadzi� atak. Potrzebuj� przynajmniej cztery. Musimy zwolni� oddzia�y z innych zada� lub wyszkoli� dodatkowe.~
IF ~Global("RoenallWynik","GLOBAL",1)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak1
IF ~Global("RoenallWynik","GLOBAL",2)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak2
IF ~Global("RoenallWynik","GLOBAL",3)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ DO ~setglobal("JeniecWiem","GLOBAL",0)~ GOTO Atak3
IF ~Global("RoenallWynik","GLOBAL",4)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak4
IF ~Global("RoenallWynik","GLOBAL",31)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak31
IF ~Global("RoenallWynik","GLOBAL",32)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak32
IF ~Global("RoenallWynik","GLOBAL",33)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak33
IF ~~ THEN REPLY ~Rozumiem. Chc� prosi� o co� jeszcze.~ GOTO Witanie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Inwazja
SAY ~Mog� to zrobi�. Potrzebuj� cztery oddzia�y i trzy tygodnie czasu.~
IF ~~ THEN REPLY ~Zgoda. Zabierajcie si� do pracy.~ DO ~setglobaltimer("ArkandInwazja","GLOBAL",SEVEN_DAYS) incrementglobal("DarniseRezerwy","GLOBAL",-4) setglobal("RoenallInwazja","GLOBAL",1)~ GOTO Zgoda
IF ~Global("RoenallWynik","GLOBAL",1)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak1
IF ~Global("RoenallWynik","GLOBAL",2)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak2
IF ~Global("RoenallWynik","GLOBAL",3)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak3
IF ~Global("RoenallWynik","GLOBAL",4)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak4
IF ~Global("RoenallWynik","GLOBAL",31)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak31
IF ~Global("RoenallWynik","GLOBAL",32)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak32
IF ~Global("RoenallWynik","GLOBAL",33)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak33
IF ~~ THEN REPLY ~Chc� prosi� o co� innego.~ GOTO Witanie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Inwazja1
SAY ~Zbieramy obecnie informacje potrzebne do zaplanowania najazdu.~
IF ~!global("RoenallInwazja","GLOBAL",0)~ THEN REPLY ~Odwo�aj inwazj� na ziemie Roenall�w. Potrzebuj� oddzia�y gdzie indziej.~ GOTO Rezygnacja
IF ~Global("RoenallWynik","GLOBAL",1)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak1
IF ~Global("RoenallWynik","GLOBAL",2)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak2
IF ~Global("RoenallWynik","GLOBAL",3)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak3
IF ~Global("RoenallWynik","GLOBAL",4)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak4
IF ~Global("RoenallWynik","GLOBAL",31)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak31
IF ~Global("RoenallWynik","GLOBAL",32)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak32
IF ~Global("RoenallWynik","GLOBAL",33)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak33
IF ~~ THEN REPLY ~Chc� prosi� o co� innego.~ GOTO Witanie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Inwazja2
SAY ~Na podstawie zdobytych informacji wywiadowczych szkolimy nasze oddzia�y, aby by�y jak najlepiej przygotowane do ataku.~
IF ~!global("RoenallInwazja","GLOBAL",0)~ THEN REPLY ~Odwo�aj inwazj� na ziemie Roenall�w. Potrzebuj� oddzia�y gdzie indziej.~ GOTO Rezygnacja
IF ~Global("RoenallWynik","GLOBAL",1)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak1
IF ~Global("RoenallWynik","GLOBAL",2)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak2
IF ~Global("RoenallWynik","GLOBAL",3)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak3
IF ~Global("RoenallWynik","GLOBAL",4)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak4
IF ~Global("RoenallWynik","GLOBAL",31)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak31
IF ~Global("RoenallWynik","GLOBAL",32)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak32
IF ~Global("RoenallWynik","GLOBAL",33)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak33
IF ~~ THEN REPLY ~Chc� prosi� o co� innego.~ GOTO Witanie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Inwazja3
SAY ~Obecnie ustawiamy nasze oddzia�y na pozycjach do ataku. Rozmieszczamy je dyskretnie jak najbli�ej zamku Roenall�w.~
IF ~!global("RoenallInwazja","GLOBAL",0)~ THEN REPLY ~Odwo�aj inwazj� na ziemie Roenall�w. Potrzebuj� oddzia�y gdzie indziej.~ GOTO Rezygnacja
IF ~Global("RoenallWynik","GLOBAL",1)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak1
IF ~Global("RoenallWynik","GLOBAL",2)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak2
IF ~Global("RoenallWynik","GLOBAL",3)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak3
IF ~Global("RoenallWynik","GLOBAL",4)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak4
IF ~Global("RoenallWynik","GLOBAL",31)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak31
IF ~Global("RoenallWynik","GLOBAL",32)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak32
IF ~Global("RoenallWynik","GLOBAL",33)~ THEN REPLY ~Opowiadaj jak uda�a si� ostatnia inwazja na ziemie Roenall�w!~ GOTO Atak33
IF ~~ THEN REPLY ~Na razie z tym poczekajmy. Chc� prosi� o co� innego.~ GOTO Witanie
IF ~~ THEN REPLY ~Jeszcze nie teraz. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Rezygnacja
SAY ~Jak ka�esz. Mog� odda� je do innych zada� ju� teraz.~
IF ~~ THEN REPLY ~Zr�b to.~ DO ~incrementglobal("DarniseRezerwy","GLOBAL",4) setglobal("RoenallInwazja","GLOBAL",0)~ GOTO Zgoda
IF ~~ THEN REPLY ~Na razie z tym poczekajmy. Chc� prosi� o co� innego.~ GOTO Witanie
IF ~~ THEN REPLY ~Jeszcze nie teraz. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Atak1
SAY ~Skorzystali�my ze starego tunelu ewakuacyjnego zeby dostac sie do ich zamku! Tak! Do samego zamku! Pewno nawet Roenallowie nie wiedzieli o tym tunelu. Niestety zostali�my spostrze�eni. Walczylismy dzielnie, ale wycofywali�my si�. Musieli�my! W ko�cu wyparli nas z zamku i wyda�em rozkaz odwrotu, ale ostatnim pomieszczeniem jakie mijali�my by� skarbiec. Przynie�li�my 25000 sztuk z�ota i wszyscy prze�yli!~
IF ~~ THEN REPLY ~Nale�y wam sie pochwa�a. Chc� prosi� o co� jeszcze.~ GOTO Witanie
IF ~~ THEN REPLY ~To dobre wie�ci. �egnaj.~ EXIT
IF ~~ THEN REPLY ~Mimo wszystko, nast�pnym razem postarajcie si� lepiej. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Atak2
SAY ~Udawali�my karawan� kupieck�. Arkand oferuj�cy warzywa! To dopiero co�! W ten spos�b dostali�my si� na dziedziniec ich zamku. Dla odwr�cenia uwagi Arkand wypu�ci� wi�ni�w z cel Roenall�w. Walka by�a zaci�ta! Roenallowie potracili g�owy! Czasami dos�ownie! Niestety, jeden z uwolnionych przez nas wi�ni�w by� magiem. Poza cel� jego moc nie by�a uwi�zana. Atakowa� wszystkich, nas te�. Musieli�my sie wycofa�, zanim osi�gn�li�my zaplanowany cel, ale cz�� z uwolnionych przez nas wi�ni�w te� uciek�a. To porz�dni ludzie. Pozwoli�em sobie w��czy� ich do gwardii. Zyskali�my dwa nowe oddzia�y.~
IF ~~ THEN REPLY ~Dodatkowi ludzie zawsze s� mile widziani w gwardii. Chc� prosi� o co� jeszcze.~ GOTO Witanie
IF ~~ THEN REPLY ~My�l�, �e mo�na to uzna� za sukces! �egnaj.~ EXIT
IF ~~ THEN REPLY ~Mimo wszystko, nast�pnym razem postarajcie si� lepiej. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Atak3
SAY ~To by�o co�! Przebrali�my cz�c gwardzistek za... hm... tancerki... egzotyczne. Tym razem zabrali�my ze sob� Dinar�, wola�em �eby jeden z porucznik�w by� z gwardzistkami, a Arkand si� nie nadawa�. Gwardzistki wesz�y do zamku i u�pi�y czujno�� wielu �o�nierzy i szlachcic�w. Niestety by�y tam te� roenallskie kobiety, narobi�y ha�asu. Zaatakowali�my z Arkandem, kiedy zacz�a si� wrzawa. Bitwa trwa�a d�ugo, ale oddzia�ow Roenall�w by�o coraz wi�cej i musieli�my sie wycofa�, ale postanowi�em, �e nie odejdziemy z pustymi r�kami. Kaza�em pojma� bogato odzianego szlachcica. Zamkn�li�my go w celi.~
IF ~~ THEN REPLY ~To bardzo ciekawa historia. Chc� prosi� o co� jeszcze.~ GOTO Witanie
IF ~~ THEN REPLY ~Jeniec? A to ci dopiero trofeum! �egnaj.~ EXIT
IF ~~ THEN REPLY ~Mimo wszystko, nast�pnym razem postarajcie si� lepiej. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Atak4
SAY ~Nie jestem pewnien co zrobili�my �le, ale zorientowali si� i musieli�my si� wycofa� zanim rozpocz�li�my szturm. Dobrze, �e w por� zauwa�ylismy zbli�aj�ce sie oddzia�y. Przewy�sza�y nas liczebnie!~
IF ~~ THEN REPLY ~C�, zdarza si�. Chc� prosi� o co� jeszcze.~ GOTO Witanie
IF ~~ THEN REPLY ~Dobrze, ze przynajmniej nikt nie zgin��. Trzymaj si� kapitanie!~ EXIT
IF ~~ THEN REPLY ~Mimo wszystko, nast�pnym razem postarajcie si� lepiej. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Atak31
SAY ~Rozpoznali�my kiedy znaczna cz�� �o�nierzy Roenall�w wyjedzie eskortowa� reprezentanta Zakapturzonych Czarodziei do Atkathli. Wtedy zaatakowali�my. Si�y by�y wyr�wnane. My nie mogli�my wej�� do ich zamku, a oni wyj��. Kiedy us�yszeli�my, �e oddzia�y z Atkathli wracaj�, wyda�em rozkaz odwrotu. Troch� za p�no. Wymkn�li�my si�, ale jeden oddzia� poleg�. Obawiam si�, �e twoja reputacja te� troch� podupad�a.~
IF ~~ THEN REPLY ~C�, zdarza si�. Chc� prosi� o co� jeszcze.~ GOTO Witanie
IF ~~ THEN REPLY ~Nie lubi� traci� ludzi, ale nic lepszego zrobi� nie mog�e�. Trzymaj si� kapitanie!~ EXIT
IF ~~ THEN REPLY ~Obejdziemy si� bez tego jednego oddzia�u, ma�a strata. �egnaj.~ DO ~IncrementGlobal("KPRevolt","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Atak32
SAY ~Wszystko by�o zaplanowane. Szli�my boczn� drog� na ich zamek. Niestety oni wybrali t� sam� drog�, Arkand uwa�a, ze szli na nasz� warowni�. Si�y by�y wyr�wnane. Straci�em po�ow� oddzia��w, oni te�. Obie strony wr�ci�y sk�d przysz�y. Obwiam sie, ze wie�ci o tym niepowodzeniu dodtar�y do naszych ludzi i nie zosta�y dobrze przyj�te.~
IF ~~ THEN REPLY ~C�, to do�� nieszcz�liwy przypadek. Chc� prosi� o co� jeszcze.~ GOTO Witanie
IF ~~ THEN REPLY ~Nie lubi� traci� ludzi, ale nic lepszego zrobi� nie mog�e�. Trzymaj si� kapitanie!~ EXIT
IF ~~ THEN REPLY ~Wida� ci co zgin�li byli s�abi, albo marnie wyszkoleni. Zostali ci silniejsi, to dobrze. �egnaj.~ DO ~IncrementGlobal("KPRevolt","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Atak33
SAY ~Ci�ko mi o tym m�wi�. Kto� nas zdradzi�. Mo�liwe, �e roenallscy wie�niacy, kt�rzy obiecywali pomoc... Mo�e jeden z naszych juz teraz martwych ludzi... Nie wiem. Wpadlismy w pu�apk�. Prze�yli�my tylko ja, Arkand i jeden oddzia�.~
IF ~~ THEN REPLY ~To smutne, ale musimy sobie z tym poradzi�. Chc� prosi� o co� jeszcze.~ GOTO Witanie
IF ~~ THEN REPLY ~Nie lubi� traci� ludzi, ale nic lepszego zrobi� nie mog�e�. Trzymaj si� kapitanie!~ EXIT
IF ~~ THEN REPLY ~Szkoda, �e nie przynie�li�cie z�ota. Za co� musz� teraz naj�� nowych gwardzist�w! �egnaj.~ DO ~IncrementGlobal("KPRevolt","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Gobliny1
SAY ~Zwiadowcy zauwa�yli hord� Goblin�w zmierzaj�cych na zamek. Zaraz b�d� pod murami! Musimy zadba� by most by� podniesiony, a katapulty gotowe do strza�u! Wyszli tak nagle z lasu, �e nie zd��yli�my ostrzec mieszka�c�w! Nie b�d� zadowoleni.~
IF ~~ THEN DO ~setglobal("GoblinNajazd","GLOBAL",50) setglobaltimer("CernikInwazja","GLOBAL",FIVE_DAYS) SetGlobal("GWARD01Ogrod","GLOBAL",2) setglobaltimer("CernikTimer","GLOBAL",SEVEN_DAYS) SetGlobal("CernikLicznik","GLOBAL",0) SetGlobal("CernikWiad","GLOBAL",0) IncrementGlobal("KPRevolt","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Gobliny2
SAY ~Zwiadowcy zauwa�yli hord� Goblin�w zmierzaj�cych na zamek. Zaraz b�d� pod murami! Musimy zadba� by most by� podniesiony, a katapulty gotowe do strza�u! Wyszli z lasu tak nagle, ale dzi�ki schronom w gospodarstwach ludzie powinni si� schowa� na czas. Nie b�d� mie� do ciebie �alu.~
IF ~~ THEN DO ~setglobal("GoblinNajazd","GLOBAL",50) setglobaltimer("CernikInwazja","GLOBAL",FIVE_DAYS) SetGlobal("GWARD01Ogrod","GLOBAL",2) setglobaltimer("CernikTimer","GLOBAL",SEVEN_DAYS) SetGlobal("CernikLicznik","GLOBAL",0) SetGlobal("CernikWiad","GLOBAL",0)~ EXIT
END

IF ~~ THEN BEGIN Karawana
SAY ~Nasi zwiadowcy donie�li, �e po naszych drogach podr�uje karawana kupiecka. Je�li chcesz zwiadowcy mog� przekona� kupc�w aby nad�o�yli drogi i zatrzymali si� na dzie�, u nas na dziedzi�cu.~
IF ~~ THEN REPLY ~Oczywi�cie. Niech si� u nas zatrzymaj�. Ch�tnie z nimi pohandluj�.~ DO ~setglobal("KupcyNajazd","GLOBAL",1) SetGlobalTimer("KupcyStart","GLOBAL",ONE_DAY) SetGlobalTimer("KupcyStop","GLOBAL",TWO_DAYS) setglobaltimer("CernikTimer","GLOBAL",SEVEN_DAYS) SetGlobal("CernikLicznik","GLOBAL",0) SetGlobal("CernikWiad","GLOBAL",0)~ GOTO Kupcy
IF ~~ THEN REPLY ~Nie. Nie zatrzymuj ich.~ DO ~setglobaltimer("CernikTimer","GLOBAL",SEVEN_DAYS) SetGlobal("CernikLicznik","GLOBAL",0) SetGlobal("CernikWiad","GLOBAL",0)~ EXIT
END

IF ~~ THEN BEGIN Kupcy
SAY ~Doskonale. Kupcy b�d� potrzebowali dzie� �eby tu dotrze� i pozostan� tu przez ca�y nast�pny dzie�.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Plus
SAY ~U jednego z naszych rolnik�w zatrzyma�o si� paru najemnik�w. Dinara troch� pow�szy�a i twierdzi, �e mo�na im ufa�. Chc� wst�pi� do naszej gwardii. Maj� ju� sw�j sprz�t, wi�c koszt naboru wyni�s�by jedynie 2500 sztuk z�ota. Czy zgadzasz si� na to?~
IF ~PartyGoldGT(2499)~ THEN REPLY ~Przyda si� dodatkowy oddzia�. Oto pieniadze.~ DO ~TakePartyGold(2500) DestroyGold(2500) incrementglobal("DarniseRezerwy","GLOBAL",1) incrementglobal("DarniseTotal","GLOBAL",1) setglobaltimer("CernikTimer","GLOBAL",SEVEN_DAYS) SetGlobal("CernikLicznik","GLOBAL",0) SetGlobal("CernikWiad","GLOBAL",0)~ GOTO Najemnik
IF ~~ THEN REPLY ~Nie sta� nas teraz na taki wydatek.~ DO ~setglobaltimer("CernikTimer","GLOBAL",SEVEN_DAYS) SetGlobal("CernikLicznik","GLOBAL",0) SetGlobal("CernikWiad","GLOBAL",0)~ EXIT
END

IF ~~ THEN BEGIN Najemnik
SAY ~Bardzo si� ciesz�. Zaraz po nich po�l�!~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Nowy4
SAY ~Niestety koszary nie pomieszcz� wi�cej oddzia��w. Mo�emy teraz przyjmowa� nowe odddzia�y tylko w specjalnych okoliczno�ciach.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia
SAY ~Oczywi�cie, <PRO_LADYLORD>. Co chcesz wiedzie�?~
IF ~global("DarniseTotal","GLOBAL",0)~    THEN REPLY ~Jak liczna jest nasza armia?~ GOTO Armia0
IF ~global("DarniseTotal","GLOBAL",1)~    THEN REPLY ~Jak liczna jest nasza armia?~ GOTO Armia1
IF ~global("DarniseTotal","GLOBAL",2)~    THEN REPLY ~Jak liczna jest nasza armia?~ GOTO Armia2
IF ~global("DarniseTotal","GLOBAL",3)~    THEN REPLY ~Jak liczna jest nasza armia?~ GOTO Armia3
IF ~global("DarniseTotal","GLOBAL",4)~    THEN REPLY ~Jak liczna jest nasza armia?~ GOTO Armia4
IF ~global("DarniseTotal","GLOBAL",5)~    THEN REPLY ~Jak liczna jest nasza armia?~ GOTO Armia5
IF ~global("DarniseTotal","GLOBAL",6)~    THEN REPLY ~Jak liczna jest nasza armia?~ GOTO Armia6
IF ~global("DarniseTotal","GLOBAL",7)~    THEN REPLY ~Jak liczna jest nasza armia?~ GOTO Armia7
IF ~global("DarniseTotal","GLOBAL",8)~    THEN REPLY ~Jak liczna jest nasza armia?~ GOTO Armia8
IF ~global("DarniseTotal","GLOBAL",9)~    THEN REPLY ~Jak liczna jest nasza armia?~ GOTO Armia9
IF ~global("DarniseTotal","GLOBAL",10)~   THEN REPLY ~Jak liczna jest nasza armia?~ GOTO Armia10
IF ~global("DarniseTotal","GLOBAL",11)~   THEN REPLY ~Jak liczna jest nasza armia?~ GOTO Armia11
IF ~global("DarniseTotal","GLOBAL",12)~   THEN REPLY ~Jak liczna jest nasza armia?~ GOTO Armia12
IF ~global("DarniseTotal","GLOBAL",13)~   THEN REPLY ~Jak liczna jest nasza armia?~ GOTO Armia13
IF ~global("DarniseTotal","GLOBAL",14)~   THEN REPLY ~Jak liczna jest nasza armia?~ GOTO Armia14
IF ~global("DarniseTotal","GLOBAL",15)~   THEN REPLY ~Jak liczna jest nasza armia?~ GOTO Armia15
IF ~global("DarniseTotal","GLOBAL",16)~   THEN REPLY ~Jak liczna jest nasza armia?~ GOTO Armia16
IF ~global("DarniseTotal","GLOBAL",17)~   THEN REPLY ~Jak liczna jest nasza armia?~ GOTO Armia17
IF ~global("DarniseTotal","GLOBAL",18)~   THEN REPLY ~Jak liczna jest nasza armia?~ GOTO Armia18
IF ~global("DarniseTotal","GLOBAL",19)~   THEN REPLY ~Jak liczna jest nasza armia?~ GOTO Armia19
IF ~global("DarniseTotal","GLOBAL",20)~   THEN REPLY ~Jak liczna jest nasza armia?~ GOTO Armia20
IF ~globalGT("DarniseTotal","GLOBAL",20)~ THEN REPLY ~Jak liczna jest nasza armia?~ GOTO Armia21
IF ~global("GoblinKoszary","GLOBAL",0)~ THEN REPLY ~Ile oddzia��w pomieszcz� nasze koszary?~ GOTO Koszary0
IF ~global("GoblinKoszary","GLOBAL",1)~ THEN REPLY ~Ile oddzia��w pomieszcz� nasze koszary?~ GOTO Koszary1
IF ~globalLT("DarniseTotal","GLOBAL",10) global("GoblinKoszary","GLOBAL",0) global("RatavaPosi","GLOBAL",3)~ THEN REPLY ~Potrzebujemy dodatkowy oddzia� gwardii.~ GOTO Nowy0
IF ~globalLT("DarniseTotal","GLOBAL",10) global("GoblinKoszary","GLOBAL",0) !global("RatavaPosi","GLOBAL",3) GlobalLT("kprevolt","GLOBAL",0)~ THEN REPLY ~Potrzebujemy dodatkowy oddzia� gwardii.~ GOTO Nowy1
IF ~globalLT("DarniseTotal","GLOBAL",10) global("GoblinKoszary","GLOBAL",0) !global("RatavaPosi","GLOBAL",3) GlobalGT("kprevolt","GLOBAL",-1) GlobalLT("kprevolt","GLOBAL",6)~ THEN REPLY ~Potrzebujemy dodatkowy oddzia� gwardii.~ GOTO Nowy2
IF ~globalLT("DarniseTotal","GLOBAL",10) global("GoblinKoszary","GLOBAL",0) !global("RatavaPosi","GLOBAL",3) GlobalGT("kprevolt","GLOBAL",5)~ THEN REPLY ~Potrzebujemy dodatkowy oddzia� gwardii.~ GOTO Nowy3
IF ~globalGT("DarniseTotal","GLOBAL",9)  global("GoblinKoszary","GLOBAL",0)~ THEN REPLY ~Potrzebujemy dodatkowy oddzia� gwardii.~ GOTO Nowy4
IF ~globalLT("DarniseTotal","GLOBAL",15) global("GoblinKoszary","GLOBAL",1) global("RatavaPosi","GLOBAL",3)~ THEN REPLY ~Potrzebujemy dodatkowy oddzia� gwardii.~ GOTO Nowy0
IF ~globalLT("DarniseTotal","GLOBAL",15) global("GoblinKoszary","GLOBAL",1) !global("RatavaPosi","GLOBAL",3) GlobalLT("kprevolt","GLOBAL",0)~ THEN REPLY ~Potrzebujemy dodatkowy oddzia� gwardii.~ GOTO Nowy1
IF ~globalLT("DarniseTotal","GLOBAL",15) global("GoblinKoszary","GLOBAL",1) !global("RatavaPosi","GLOBAL",3) GlobalGT("kprevolt","GLOBAL",-1) GlobalLT("kprevolt","GLOBAL",6)~ THEN REPLY ~Potrzebujemy dodatkowy oddzia� gwardii.~ GOTO Nowy2
IF ~globalLT("DarniseTotal","GLOBAL",15) global("GoblinKoszary","GLOBAL",1) !global("RatavaPosi","GLOBAL",3) GlobalGT("kprevolt","GLOBAL",5)~ THEN REPLY ~Potrzebujemy dodatkowy oddzia� gwardii.~ GOTO Nowy3
IF ~globalGT("DarniseTotal","GLOBAL",14) global("GoblinKoszary","GLOBAL",1)~ THEN REPLY ~Potrzebujemy dodatkowy oddzia� gwardii.~ GOTO Nowy4
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~To ju� wszystko. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Koszary0
SAY ~Koszary mieszcz� 10 oddzia��w.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Koszary1
SAY ~Koszary mieszcz� 15 oddzia��w.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia0
SAY ~Dysponujemy tylko szkieletow� za�og� warownii.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia1
SAY ~Dysponujemy szkieletow� za�og� warownii i jednym oddzia�em.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia2
SAY ~Dysponujemy szkieletow� za�og� warownii i dwoma oddzia�ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia3
SAY ~Dysponujemy szkieletow� za�og� warownii i trzema oddzia�ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia4
SAY ~Dysponujemy szkieletow� za�og� warownii i czterema oddzia�ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia5
SAY ~Dysponujemy szkieletow� za�og� warownii i pi�cioma oddzia�ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia6
SAY ~Dysponujemy szkieletow� za�og� warownii i sze�cioma oddzia�ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia7
SAY ~Dysponujemy szkieletow� za�og� warownii i siedmioma oddzia�ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia8
SAY ~Dysponujemy szkieletow� za�og� warownii i o�mioma oddzia�ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia9
SAY ~Dysponujemy szkieletow� za�og� warownii i dziewi�cioma oddzia�ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia10
SAY ~Dysponujemy szkieletow� za�og� warownii i dziesi�cioma oddzia�ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia11
SAY ~Dysponujemy szkieletow� za�og� warownii i jedenastoma oddzia�ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia12
SAY ~Dysponujemy szkieletow� za�og� warownii i dwunastoma oddzia�ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia13
SAY ~Dysponujemy szkieletow� za�og� warownii i trzynastoma oddzia�ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia14
SAY ~Dysponujemy szkieletow� za�og� warownii i czternastoma oddzia�ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia15
SAY ~Dysponujemy szkieletow� za�og� warownii i pi�tnastoma oddzia�ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia16
SAY ~Dysponujemy szkieletow� za�og� warownii i szesnastoma oddzia�ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia17
SAY ~Dysponujemy szkieletow� za�og� warownii i siedemnastoma oddzia�ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia18
SAY ~Dysponujemy szkieletow� za�og� warownii i osiemnastoma oddzia�ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END


IF ~~ THEN BEGIN Armia19
SAY ~Dysponujemy szkieletow� za�og� warownii i dziewi�tnastoma oddzia�ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia20
SAY ~Dysponujemy szkieletow� za�og� warownii i dwudziestoma oddzia�ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia21
SAY ~Dysponujemy szkieletow� za�og� warownii i ponad dwudziestoma oddzia�ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END