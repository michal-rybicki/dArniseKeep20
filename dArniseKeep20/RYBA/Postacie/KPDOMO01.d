// creator  : weidu (version 199)
// argument : KPDOMO01.DLG
// game     : .
// source   : ./DATA/DIALOG.BIF
// dialog   : ./Dialog.tlk
// dialogF  : ./DialogF.tlk

BEGIN ~KPDOMO01~
//////////////////////////////////////////////////
// WARNING: this file contains non-trivial WEIGHTs
//////////////////////////////////////////////////

IF WEIGHT #0 ~NumTimesTalkedTo(0)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 0 // from:
  SAY #39977 /* ~Witam, wasza dostojno��... Jak rzek�a mi Pani Nalia, to do ciebie nale�y teraz zaszczyt w�adania t� warowni� i otaczaj�cymi j� gruntami, tak?~ [KPDOMO02] */
  IF ~~ THEN REPLY #39978 /* ~Tak, to prawda.~ */ GOTO 1
END

IF ~~ THEN BEGIN 1 // from: 0.0
  SAY #39979 /* ~Dobrze. Ja jestem majordomusem tego zamku, lub przynajmniej by�em nim, kiedy s�u�y�em pod Lordem d'Arnise. Pragn� s�u�y� ci tak samo wiernie.~ */
  IF ~IsValidForPartyDialog("Nalia")
~ THEN EXTERN ~NALIAJ~ 178
  IF ~!IsValidForPartyDialog("Nalia")
~ THEN EXTERN ~NALIA~ 69
END

IF ~~ THEN BEGIN 2 // from:
  SAY #39982 /* ~Zaszczytem jest dla mnie s�ysze� takie s�owa, Lady. Zarz�dzam codziennymi pracami w zamku, kieruj� s�u�b� i rozstrzygam pomniejsze problemy z twoimi wie�niakami lub inne sprawy, zwi�zane z twoj� ziemi�.~ */
  IF ~~ THEN GOTO 3
END

IF ~~ THEN BEGIN 3 // from: 2.0
  SAY #39983 /* ~Dbam te�, aby zbierano podatki, kt�re nast�pnie gromadzimy tu w skrzyniach. Je�li pragniesz zmieni� wysoko�� podatku, rzeknij mi tylko s�owo. Na razie zbieram je tak, jak to czyni�em dla Lorda d'Arnise.~ */
  IF ~~ THEN GOTO 4
END

IF ~~ THEN BEGIN 4 // from: 3.0
  SAY #39984 /* ~Znaczna cz�� zasob�w p�jdzie na odbudow� garnizonu zamkowego, kt�ry znacznie zmala�, oraz na utrzymanie zamku i s�u�by.~ */
  IF ~~ THEN GOTO 5
END

IF ~~ THEN BEGIN 5 // from: 4.0
  SAY #39985 /* ~Ale jak mniemam, i tak zostanie oko�o pi�ciuset sztuk z�ota tygodniowo. Je�li pragniesz skorzysta� z tych pieni�dzy, starczy, �e zapytasz, a wska�� ci drog�.~ */
  IF ~~ THEN GOTO 6
END

IF ~~ THEN BEGIN 6 // from: 5.0
  SAY #39986 /* ~Co si� tyczy zasadniczych decyzji, c�, sugeruj�, aby twoja dru�yna powraca�a tutaj przynajmniej co kilka tygodni. Je�li wydarzy si� co� krytycznego, wy�l� za tob� umy�lnego.~ */
  IF ~~ THEN GOTO 7
END

IF ~~ THEN BEGIN 7 // from: 6.0
  SAY #39987 /* ~Chwilowo nie ma �adnych spraw, kt�re wymaga�by twojej decyzji. S�u�ba posprz�ta warowni� i jak mniemam, trzeba b�dzie poczyni� ustalenia w sprawie poch�wku Lorda d'Arnise.~ */
  IF ~~ THEN DO ~SetGlobalTimer("KPTaxTime","GLOBAL",SEVEN_DAYS)
SetGlobalTimer("KPPlotTime","GLOBAL",SEVEN_DAYS)
SetGlobal("KeepPlot","GLOBAL",1)
~ GOTO 8
END

IF ~~ THEN BEGIN 8 // from: 7.0
  SAY #39988 /* ~Czy masz wi�c jakie� polecenia?~ */
  IF ~~ THEN REPLY #39989 /* ~W tej chwili w skarbcu nie ma pieni�dzy, tak?~ */ GOTO 9
  IF ~GlobalLT("KPRevolt","GLOBAL",10)
~ THEN REPLY #39990 /* ~Chcia�bym zebra� dodatkowy podatek... potrzeba mi pieni�dzy.~ ~Chcia�abym zebra� dodatkowy podatek... potrzeba mi pieni�dzy.~ */ GOTO 11
  IF ~~ THEN REPLY #39991 /* ~Wi�c... ca�a warownia jest moja?~ */ GOTO 14
  IF ~~ THEN REPLY #39992 /* ~Jak rozleg�e s� ziemie nale��ce do zamku?~ */ GOTO 15
  IF ~areacheck("ar1306")~ THEN REPLY ~Natychmiat zoorganizuj narad� moich porucznik�w, towarzyszy i doradc�w.~ DO ~setglobal("NaradadArnise","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY #39993 /* ~Nie, nie mam �adnych pyta�.~ */ GOTO 17
END

IF ~~ THEN BEGIN 9 // from: 16.0 14.0 8.0
  SAY #39994 /* ~Hmm... z tego co wiem, trolle skrad�y z zamku mn�stwo bogactw. Nic tu nie znajdziesz, opr�cz tego, co uda�o ci si� zdoby� podczas, aach, odzyskiwania w�adzy nad zamkiem.~ */
  IF ~~ THEN GOTO 10
END

IF ~~ THEN BEGIN 10 // from: 9.0
  SAY #39995 /* ~Ale je�li zaczekasz tydzie� lub wi�cej, uprawy zb� z grunt�w dooko�a zamku przynios� ci profit. Tak jak rzek�em, Lord d'Arnise zbiera� przeci�tnie 500 sztuk z�ota.~ */
  IF ~GlobalLT("KPRevolt","GLOBAL",10)
~ THEN REPLY #39996 /* ~Chcia�bym zebra� dodatkowy podatek... potrzeba mi pieni�dzy.~ ~Chcia�abym zebra� dodatkowy podatek... potrzeba mi pieni�dzy.~ */ GOTO 11
  IF ~~ THEN REPLY #39997 /* ~Wi�c... ca�a warownia jest moja?~ */ GOTO 14
  IF ~~ THEN REPLY #39998 /* ~Jak rozleg�e s� ziemie nale��ce do zamku?~ */ GOTO 15
  IF ~areacheck("ar1306")~ THEN REPLY ~Natychmiat zoorganizuj narad� moich porucznik�w, towarzyszy i doradc�w.~ DO ~setglobal("NaradadArnise","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY #39999 /* ~Udam si� w swoj� stron�.~ */ GOTO 17
END

IF ~~ THEN BEGIN 11 // from: 16.1 14.1 10.0 8.1
  SAY #40000 /* ~Je�li... je�li tak jest twoja wola, mog� zorganizowa� dodatkowy pob�r. Moi ludzie w okamgnieniu zgromadz� pieni�dze i dostarcz� je tutaj, jeno... ach...~ */
  IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ 179
  IF ~!IsValidForPartyDialog("Nalia")~ THEN GOTO 13
END

IF ~~ THEN BEGIN 12 // from:
  SAY #40002 /* ~Ee, tak... to znaczy. Ludzie... uczyni� jak im rozka�esz, <PRO_LADYLORD>, ale nie maj� oni zbyt wiele w swoich trzosach. Czy... na pewno chcesz przeprowadzi� dodatkowy pob�r?~ */
  IF ~~ THEN REPLY #40004 /* ~Tak, oczywi�cie.~ */ GOTO 30
  IF ~~ THEN REPLY #40005 /* ~Nie, chyba nie.~ */ GOTO 31
END

IF ~~ THEN BEGIN 13 // from: 11.1
  SAY #40003 /* ~...ludzie dopiero podnosz� si� po naje�dzie. Uczyni� jak im rozka�esz, <PRO_LADYLORD>, ale nie maj� zbyt wiele w swych trzosach. Czy... na pewno tego chcesz?~ */
  IF ~~ THEN REPLY #40006 /* ~Tak, oczywi�cie.~ */ GOTO 30
  IF ~~ THEN REPLY #40007 /* ~Nie, chyba nie.~ */ GOTO 31
END

IF ~~ THEN BEGIN 14 // from: 16.2 10.1 8.2
  SAY #40008 /* ~Tak, <PRO_LADYLORD>, wszystko twoje, jak rzek�a Pani Nalia. Pozosta�o kilku dawnych s�u��cych, naj�li�my te� kilku nowych. Je�li pragniesz, mo�esz zwiedza� wszystkie zak�tki zamku.~ */
  IF ~~ THEN REPLY #40009 /* ~W tym momencie w skarbcu nie ma �adnych pieni�dzy, tak?~ */ GOTO 9
  IF ~GlobalLT("KPRevolt","GLOBAL",10)
~ THEN REPLY #40010 /* ~Chcia�bym zebra� dodatkowy podatek... potrzeba mi pieni�dzy.~ ~Chcia�abym zebra� dodatkowy podatek... potrzeba mi pieni�dzy.~ */ GOTO 11
  IF ~~ THEN REPLY #40011 /* ~Jak rozleg�e s� ziemie nale��ce do zamku?~ */ GOTO 15
  IF ~areacheck("ar1306")~ THEN REPLY ~Natychmiat zoorganizuj narad� moich porucznik�w, towarzyszy i doradc�w.~ DO ~setglobal("NaradadArnise","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY #40012 /* ~Udam si� ju� w drog�.~ */ GOTO 17
END

IF ~~ THEN BEGIN 15 // from: 14.2 10.2 8.3
  SAY #40013 /* ~Mniemam, i� dane ci ju� by�o widzie� nasz� warowni�. B�dziesz tak�e w�ada� rozleg�ymi po�aciami ziemi, kt�ra przylega do zamku. Nie ma tam osiedli ludzkich, ale wszystko to �yzne grunty rolne.~ */
  IF ~~ THEN GOTO 16
END

IF ~~ THEN BEGIN 16 // from: 15.0
  SAY #40014 /* ~Lord d'Arnise zawsze dobrze �y� ze swoimi lud�mi, tak samo jak wszyscy jego przodkowie. Panuje tu spok�j... zazwyczaj. My�l�, i� nie b�dziesz mie� wi�kszych k�opot�w.~ */
  IF ~~ THEN REPLY #40015 /* ~W tym momencie w skarbcu nie ma �adnych pieni�dzy, tak?~ */ GOTO 9
  IF ~GlobalLT("KPRevolt","GLOBAL",10)
~ THEN REPLY #40016 /* ~Chcia�bym zebra� dodatkowy podatek... potrzeba mi pieni�dzy.~ ~Chcia�abym zebra� dodatkowy podatek... potrzeba mi pieni�dzy.~ */ GOTO 11
  IF ~~ THEN REPLY #40017 /* ~Wi�c... ca�a warownia jest moja?~ */ GOTO 14
  IF ~areacheck("ar1306")~ THEN REPLY ~Natychmiat zoorganizuj narad� moich porucznik�w, towarzyszy i doradc�w.~ DO ~setglobal("NaradadArnise","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY #40018 /* ~Udam si� ju� w drog�.~ */ GOTO 17
END

IF ~~ THEN BEGIN 17 // from: 16.3 14.3 10.3 8.4
  SAY #40019 /* ~<CHARNAME>, <PRO_LADYLORD>, je�li tak sobie �yczysz. Mog� z �atwo�ci� oporz�dzi� dla ciebie jedn� z sypialni, je�li pragniesz pozosta� tu na noc. Dla twoich towarzyszy tak�e znajdziemy godne lokum.~ */
  IF ~OR(4)
InParty("Nalia")
Dead("Nalia")
StateCheck("Nalia",STATE_SLEEPING)
!See("Nalia")
!Dead("Delcia")
!StateCheck("Delcia",STATE_SLEEPING)
See("Delcia")
~ THEN UNSOLVED_JOURNAL #3030 /* ~Rz�dz� twierdz� i ziemiami rodu d'Arnise

Nalia poprosi�a mnie o zaopiekowanie si� ziemiami jej rodziny, aby Roenallowie nie mieli okazji do zabrania ich bez jej zgody. Pomo�e mi majordomus jej ojca. Zajmie si� codziennymi sprawami zamku i zbieraniem dla mnie podatk�w. Majordomus oszacowa�, �e po odj�ciu koszt�w utrzymania zamku i garnizonu dostan� jakie� 500 sztuk z�ota co tydzie�... i mog� je sobie odebra� w ka�dej chwili. Mog� te� podnie�� podatki, ale musz� uwa�a�, �eby nie rozgniewa� poddanych.
Musz� te� co jaki� czas wraca� do zamku �eby podj�� decyzje, kt�rych majordomus sam nie mo�e podj��. W sumie wygl�da to naprawd� do�� prosto.~ */ GOTO 19
  IF ~!Dead("Nalia")
!InParty("Nalia")
!StateCheck("Nalia",STATE_SLEEPING)
See("Nalia")
~ THEN UNSOLVED_JOURNAL #3030 /* ~Rz�dz� twierdz� i ziemiami rodu d'Arnise

Nalia poprosi�a mnie o zaopiekowanie si� ziemiami jej rodziny, aby Roenallowie nie mieli okazji do zabrania ich bez jej zgody. Pomo�e mi majordomus jej ojca. Zajmie si� codziennymi sprawami zamku i zbieraniem dla mnie podatk�w. Majordomus oszacowa�, �e po odj�ciu koszt�w utrzymania zamku i garnizonu dostan� jakie� 500 sztuk z�ota co tydzie�... i mog� je sobie odebra� w ka�dej chwili. Mog� te� podnie�� podatki, ale musz� uwa�a�, �eby nie rozgniewa� poddanych.
Musz� te� co jaki� czas wraca� do zamku �eby podj�� decyzje, kt�rych majordomus sam nie mo�e podj��. W sumie wygl�da to naprawd� do�� prosto.~ */ GOTO 18
  IF ~OR(4)
InParty("Nalia")
Dead("Nalia")
StateCheck("Nalia",STATE_SLEEPING)
!See("Nalia")
OR(3)
Dead("Delcia")
StateCheck("Delcia",STATE_SLEEPING)
!See("Delcia")
~ THEN UNSOLVED_JOURNAL #3030 /* ~Rz�dz� twierdz� i ziemiami rodu d'Arnise

Nalia poprosi�a mnie o zaopiekowanie si� ziemiami jej rodziny, aby Roenallowie nie mieli okazji do zabrania ich bez jej zgody. Pomo�e mi majordomus jej ojca. Zajmie si� codziennymi sprawami zamku i zbieraniem dla mnie podatk�w. Majordomus oszacowa�, �e po odj�ciu koszt�w utrzymania zamku i garnizonu dostan� jakie� 500 sztuk z�ota co tydzie�... i mog� je sobie odebra� w ka�dej chwili. Mog� te� podnie�� podatki, ale musz� uwa�a�, �eby nie rozgniewa� poddanych.
Musz� te� co jaki� czas wraca� do zamku �eby podj�� decyzje, kt�rych majordomus sam nie mo�e podj��. W sumie wygl�da to naprawd� do�� prosto.~ */ GOTO 20
END

IF ~~ THEN BEGIN 18 // from: 17.1
  SAY #40020 /* ~Lady Nalia oczywi�cie pozostanie tutaj, w swych dawnych pokojach. Je�li pragniesz z ni� m�wi�, z pewno�ci� tam j� znajdziesz.~ */
  IF ~!Dead("Delcia")
!StateCheck("Delcia",STATE_SLEEPING)
See("Delcia")
~ THEN GOTO 19
  IF ~OR(3)
Dead("Delcia")
StateCheck("Delcia",STATE_SLEEPING)
!See("Delcia")
~ THEN GOTO 20
END

IF ~~ THEN BEGIN 19 // from: 18.0 17.0
  SAY #40021 /* ~A... za� Lady Delcia...ach...~ */
  IF ~~ THEN EXTERN ~DELCIA~ 27
END

IF ~~ THEN BEGIN 20 // from: 18.1 17.2
  SAY #40022 /* ~Je�li masz kolejne �yczenia, <PRO_LADYLORD>, tedy bez wahania rzeknij mi o nich. Zazwyczaj przebywam w komnacie audiencyjnej.~ */
  IF ~~ THEN EXIT
END

IF WEIGHT #1 ~OR(2)
!InPartySlot(LastTalkedToBy,0)
Name("Nalia",LastTalkedToBy)
~ THEN BEGIN 21 // from:
  SAY #40091 /* ~Niestety, nie mam ci zbyt wiele do powiedzenia. Wierz�, i� przyjemnie p�ynie ci czas, tu, w twierdzy?~ [KPDOMO07] */
  IF ~~ THEN EXIT
END

IF WEIGHT #2 ~Name("Nalia",LastTalkedToBy)
~ THEN BEGIN 22 // from:
  SAY #40092 /* ~Dzie� dobry, panno Nalio. Czy wszystko idzie dobrze na... ach... szlaku przygody? Musz� rzec, �e ostatnio bardzo przypomina mi pani ojca.~ [KPDOMO08] */
  IF ~~ THEN EXIT
END

IF WEIGHT #16 /* Triggers after states #: 43 55 61 68 73 77 78 85 89 98 103 113 117 even though they appear after this state */
~InPartySlot(LastTalkedToBy,0)
!Global("KeepPlot","GLOBAL",10)
!Global("KeepPlot","GLOBAL",15)
!Global("KeepPlot","GLOBAL",20)
~ THEN BEGIN 23 // from:
  SAY #40093 /* ~Witaj, wasza dostojno��. Czy mog� by� ci w czym� pomocny?~ [KPDOMO09] */
  IF ~~ THEN REPLY #40094 /* ~Czy nikt nie chcia� si� ze mn� zobaczy�?~ */ GOTO 24
  IF ~~ THEN REPLY #40095 /* ~Chcia�bym skorzysta� z pieni�dzy, kt�re uda�o si� wam zebra� z podatk�w.~ ~Chcia�abym skorzysta� z pieni�dzy, kt�re uda�o si� wam zebra� z podatk�w.~ */ GOTO 26
  IF ~GlobalLT("KPRevolt","GLOBAL",10)
~ THEN REPLY #40097 /* ~Trzeba mi pieni�dzy i to szybko...Pragn� zebra� nieco podatk�w.~ */ GOTO 28
  IF ~GlobalLT("KPRevolt","GLOBAL",10)~ THEN REPLY #40096 /* ~Jak si� sprawy maj� w okolicy?~ */ GOTO 33
  IF ~areacheck("ar1306")~ THEN REPLY ~Natychmiat zoorganizuj narad� moich porucznik�w, towarzyszy i doradc�w.~ DO ~setglobal("NaradadArnise","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY #40098 /* ~Nie, na razie niczego mi nie trzeba.~ */ GOTO 42
END

IF ~~ THEN BEGIN 24 // from: 25.0 23.0
  SAY #40100 /* ~Nie, <LADYLORD>. Rozstrzygn��em kilka spor�w i k��tni o ziemi�... ale to pomniejsze problemy, zaprawd�. Na razie nikt nie prosi� o audiencj� u ciebie.~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 25 // from: 91.0 83.0 62.0 56.0 46.0 41.0 40.0 39.0 38.0 37.0 36.0 35.0 34.0 32.0 31.0 30.0 27.0 26.0 24.0
  SAY #40101 /* ~Czym jeszcze m�g�bym ci s�u�y�?~ */
  IF ~~ THEN REPLY #40102 /* ~Chcia�bym upewni� si�, czy nikt nie prosi� o audiencj�.~ ~Chcia�abym upewni� si�, czy nikt nie prosi� o audiencj�.~ */ GOTO 24
  IF ~~ THEN REPLY #40103 /* ~Chcia�bym skorzysta� z pieni�dzy, kt�re uda�o si� wam zebra� z podatk�w.~ ~Chcia�abym skorzysta� z pieni�dzy, kt�re uda�o si� wam zebra� z podatk�w.~ */ GOTO 26
  IF ~GlobalLT("KPRevolt","GLOBAL",10)
~ THEN REPLY #40105 /* ~Trzeba mi pieni�dzy i to szybko... Musisz zebra� nieco podatk�w.~ */ GOTO 28
  IF ~GlobalLT("KPRevolt","GLOBAL",10)~ THEN REPLY #40106 /* ~Powiedz mi, jak si� sprawy maj�.~ */ GOTO 33
  IF ~areacheck("ar1306")~ THEN REPLY ~Natychmiat zoorganizuj narad� moich porucznik�w, towarzyszy i doradc�w.~ DO ~setglobal("NaradadArnise","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY #40107 /* ~Nie, chwilowo nie.~ */ GOTO 42
END

IF ~~ THEN BEGIN 26 // from: 25.1 23.1
  SAY #40108 /* ~Wedle �yczenia. Zgromadzi�em wszystkie zebrane pieni�dze w szafce w bibliotece na drugim pi�trze, <LADYLORD>. Zazwyczaj tam w�a�nie przechowuj� pieni�dze.~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 27 // from:
  SAY #40109 /* ~Mm, obawiam si�, �e w tym momencie nic tam nie znajdziesz, <LADYLORD>. Trzeba zaczeka� do ko�ca tygodnia, chyba, �e pragniesz zorganizowa� nadzwyczajny pob�r.~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 28 // from: 25.2 23.2
  SAY #40110 /* ~Ja... oczywi�cie zrobi�, co ka�esz, <PRO_LADYLORD>. Jednak trzeba ci zachowa� ostro�no��. Twoi obywatele uczyni�, jak im ka�esz, ale niewiele ju� maj� w swych trzosach.~ */
  IF ~IsValidForPartyDialog("Nalia")
GlobalGT("KPRevolt","GLOBAL",2)
GlobalLT("KPRevolt","GLOBAL",5)
~ THEN EXTERN ~NALIAJ~ 183
  IF ~IsValidForPartyDialog("Nalia")
GlobalGT("KPRevolt","GLOBAL",4)
GlobalLT("KPRevolt","GLOBAL",7)~ THEN EXTERN ~NALIAJ~ 184
  IF ~IsValidForPartyDialog("Nalia")
GlobalGT("KPRevolt","GLOBAL",6)~ THEN EXTERN ~NALIAJ~ 185
  IF ~OR(2)
!IsValidForPartyDialog("Nalia")
GlobalLT("KPRevolt","GLOBAL",3)
~ THEN GOTO 29
END

IF ~~ THEN BEGIN 29 // from: 28.3
  SAY #40115 /* ~Czy na pewno... chcesz, aby to uczyni�?~ */
  IF ~~ THEN REPLY #40128 /* ~Tak, oczywi�cie.~ */ GOTO 30
  IF ~~ THEN REPLY #40129 /* ~Nie, chyba nie.~ */ GOTO 31
END

IF ~~ THEN BEGIN 30 // from: 29.0 13.0 12.0
  SAY #40130 /* ~Jak sobie �yczysz. Rozka�� zbrojnym, aby zebrali dodatkowy podatek. Bez zw�oki wykonaj� to zadanie.~ */
  IF ~~ THEN DO ~GiveGoldForce(1000)
IncrementGlobal("KPRevolt","GLOBAL",1)
~ GOTO 25
END

IF ~~ THEN BEGIN 31 // from: 29.1 13.1 12.1
  SAY #40137 /* ~Ja... z ulg� s�ysz� te s�owa, <PRO_LADYLORD>. Roenallowie z pewno�ci� zdarliby sk�r� z mieszka�c�w tej ziemi, i w�a�nie dlatego poddani tak si� ich l�kali.~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 32 // from:
  SAY #40138 /* ~Tak uczyni�, <PRO_LADYLORD>. Roze�l� wie�ci do twych zbrojnych, aby zaprzestali poboru.~ */
  IF ~~ THEN DO ~IncrementGlobal("KPRevolt","GLOBAL",-1)
~ GOTO 25
END

IF ~~ THEN BEGIN 33 // from: 25.3 23.3
  SAY #40139 /* ~Niewiele si� zmieni�o. Czyni� to samo, co czyni�em dla Lorda d'Arnise, rozstrzygam pomniejsze spory... lecz poza tym w zamku niewiele si� dzieje.~ */
  IF ~GlobalLT("KPRevolt","GLOBAL",-2)
~ THEN GOTO 34
  IF ~GlobalLT("KPRevolt","GLOBAL",0)
GlobalGT("KPRevolt","GLOBAL",-3)
~ THEN GOTO 35
  IF ~Global("KPRevolt","GLOBAL",0)
~ THEN GOTO 36
  IF ~GlobalLT("KPRevolt","GLOBAL",3)
GlobalGT("KPRevolt","GLOBAL",0)
~ THEN GOTO 37
  IF ~GlobalLT("KPRevolt","GLOBAL",5)
GlobalGT("KPRevolt","GLOBAL",2)
~ THEN GOTO 38
  IF ~GlobalLT("KPRevolt","GLOBAL",7)
GlobalGT("KPRevolt","GLOBAL",4)
~ THEN GOTO 39
  IF ~GlobalLT("KPRevolt","GLOBAL",9)
GlobalGT("KPRevolt","GLOBAL",6)
~ THEN GOTO 40
  IF ~GlobalGT("KPRevolt","GLOBAL",8)
~ THEN GOTO 41
END

IF ~~ THEN BEGIN 34 // from: 33.0
  SAY #40140 /* ~Natomiast serca twoich ch�op�w przepe�nia rado��. Twierdz�, i� jeste� osob� tak sprawiedliw� jak sam Lord d'Arnise, a mo�e i nawet przewy�szasz go swymi cnotami. Twoi poddani pozbierali ju� si� po naje�dzie i z pogod� wyczekuj� twoich dalszych rz�d�w.~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 35 // from: 33.1
  SAY #40141 /* ~Natomiast je�li chodzi o twoich ch�op�w, to ciesz� si� z twego panowania. Nadal haruj�, aby odbudowa� swe gospodarstwa po zniszczeniach zadanych przez trolle... ale sprawy maj� si� do�� dobrze.~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 36 // from: 33.2
  SAY #40142 /* ~Natomiast ch�opi z twoich ziem... maj� si� dobrze. Wiele jeszcze czeka ich pracy, zanim odbuduj� swe gospodarstwa po naje�dzie trolli. Ale pr�dzej czy p�niej, doczekamy si� tego.~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 37 // from: 33.3
  SAY #40143 /* ~Jeno ch�opi s� troch� rozdra�nieni przez twoje rozkazy. Lecz nic to, <PRO_LADYLORD>. Op�akuj� wci�� Lorda d'Arnise, ale wkr�tce zapomn� o swej wrogo�ci.~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 38 // from: 33.4
  SAY #40144 /* ~Jednak ch�opi z twoich ziem s� niespokojni. Oczekiwali, <PRO_LADYLORD>, twych sprawiedliwych rz�d�w i twe rozkazy nie s� przyjmowane z rado�ci�. Ale... nie powinienem m�wi� takich rzeczy.~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 39 // from: 33.5
  SAY #40145 /* ~Natomiast s� k�opoty z ch�opami z twoich ziem. Wybucha�y liczne protesty przeciw podatkom i musia�em koi� liczne niepokoje. Ale... to nic nader wa�nego, <PRO_LADYLORD>.~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 40 // from: 33.6
  SAY #40146 /* ~Natomiast na naszych ziemiach ch�opi s� rozw�cieczeni. W zamku odkryto zab�jc�, za� kilka kup rozochoconego plebsu trzeba by�o odp�dza� od bram. Musisz... zachowa� najwy�sz� ostro�no��.~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 41 // from: 33.7
  SAY #40147 /* ~Natomiast ch�opi... bunt wisi w powietrzu. Ma�a iskra starczy, aby wybuchn�� wielki p�omie�. Je�li nic si� nie zmieni, ch�opi... zaatakuj� zamek, <PRO_LADYLORD>...~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 42 // from: 25.4 23.4
  SAY #40148 /* ~Je�li taka jest twoja wola, <PRO_LADYLORD>.~ */
  IF ~~ THEN EXIT
END

IF WEIGHT #3 ~GlobalTimerExpired("KPPlotTime","GLOBAL")
Global("KeepPlot","GLOBAL",1)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 43 // from:
  SAY #40191 /* ~Witaj, wasza dostojno��. Przyj��em pewnego rozdra�nionego kupca o imieniu Tolmas Bendelia, kt�ry domaga si� spotkania z tob�.~ [KPDOMO09] */
  IF ~~ THEN GOTO 44
END

IF ~~ THEN BEGIN 44 // from: 43.0
  SAY #40192 /* ~Chodzi mu chyba o swoj� karawan�, podr�uj�c� przez ten region, kt�ra pad�a ofiar� zb�jeckiej zasadzki. Nie zechcia� m�wi� z nikim opr�cz ciebie, <PRO_LADYLORD>.~ */
  IF ~~ THEN GOTO 45
END

IF ~~ THEN BEGIN 45 // from: 44.0
  SAY #40193 /* ~To wp�ywowa osoba w tych okolicach; mniemam, i� w swej gestii ma znacznie wi�cej ni� tylko jedno gospodarstwo w okolicy. Czy udzielisz mu audiencji, <PRO_LADYLORD>?~ */
  IF ~~ THEN REPLY #40195 /* ~Oczywi�cie. Wprowad� go.~ */ GOTO 47
  IF ~~ THEN REPLY #40196 /* ~Nie, nie mam na to czasu... ka� mu przyj�� kiedy indziej.~ */ GOTO 46
END

IF ~~ THEN BEGIN 46 // from: 45.1
  SAY #40197 /* ~Jak sobie �yczysz, <PRO_LADYLORD>... cho� bez w�tpienia kupiec b�dzie bardzo niezadowolony. Ale je�eli przy takiej decyzji obstajesz, ka�� mu odej��.~ */
  IF ~~ THEN DO ~IncrementGlobal("KPRevolt","GLOBAL",1)
SetGlobalTimer("KPPlotTime","GLOBAL",SEVEN_DAYS)
SetGlobal("KeepPlot","GLOBAL",2)
~ GOTO 25
END

IF ~~ THEN BEGIN 47 // from: 45.0
  SAY #40200 /* ~Doskonale, <PRO_LADYLORD>. Po�l� po niego natychmiast.~ */
  IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("Cut32b")
~ EXIT
END

IF ~~ THEN BEGIN 48 // from:
  SAY #40205 /* ~Radzi�bym opanowa� swe nerwy, panie Bendelia... i raczy�by pan zacz�� wyja�nia� sw�j problem. <CHARNAME> czeka, a� us�yszy o co dok�adnie panu chodzi.~ */
  IF ~~ THEN EXTERN ~KPMERC01~ 1
END

IF ~~ THEN BEGIN 49 // from:
  SAY #40253 /* ~Hmm... jak ju� rzek�em, nie mo�na go ca�kiem zignorowa�. Wielu ludzi przyjdzie z pretensjami, je�li co� stanie si� z ich gospodarstwem. Pr�dzej czy p�niej nale�y zaj�� si� tymi bandytami.~ */
  IF ~~ THEN GOTO 50
END

IF ~~ THEN BEGIN 50 // from: 49.0
  SAY #40254 /* ~Jednak nie mamy wystarczaj�cych si�, aby mierzy� si� z nimi; nasze patrole nie s� zbyt silne liczebnie. Z pewno�ci� zb�je ju� to dostrzegli. Potrzeba nam najemnych �o�nierzy, <PRO_LADYLORD>.~ */
  IF ~~ THEN GOTO 51
END

IF ~~ THEN BEGIN 51 // from: 50.0
  SAY #40255 /* ~Znam kilka solidnych kompanii najemnik�w, kt�re mo�na by zatrudni� za pi�� setek w z�ocie. To rozwi�za�oby problem. Mm... mniemam, i� mogliby�my nawet zap�aci� tylko 250, ale wtedy zaj�oby to wi�cej czasu.~ */
  IF ~~ THEN EXTERN ~KPMERC01~ 5
END

IF ~~ THEN BEGIN 52 // from:
  SAY #40310 /* ~Dobrze, <PRO_LADYLORD>. Uczynimy, jak nam przyka�esz. Co mam zrobi� w kwestii zb�jc�w?~ */
  IF ~PartyGoldGT(499)
~ THEN REPLY #40311 /* ~We� ze skarbca ca�e pi��set sztuk z�ota i sprowad� najemnik�w. Niech si� szybko z nimi rozprawi�.~ */ DO ~AddExperienceParty(15500)
ActionOverride("TOLMAS",TakePartyGold(500))
IncrementGlobal("KPRevolt","GLOBAL",-1)
~ GOTO 53
  IF ~PartyGoldGT(249)
~ THEN REPLY #40312 /* ~Mo�esz wyda� dwie�cie pi��dziesi�t sztuk z�ota. Niech to potrwa d�u�ej, ale skutek b�dzie taki sam.~ */ DO ~AddExperienceParty(11500)
ActionOverride("TOLMAS",TakePartyGold(250))
~ GOTO 53
  IF ~~ THEN REPLY #40313 /* ~Na razie nic. Kiedy zbudujemy w�asne si�y, sami si� nimi zajmiemy.~ */ DO ~IncrementGlobal("KPRevolt","GLOBAL",1)
~ GOTO 53
END

IF ~~ THEN BEGIN 53 // from: 52.2 52.1 52.0
  SAY #40314 /* ~Jak rozka�esz. Roze�l� te� zaproszenia do gildii kupieckich z okolicy... mo�e znajdziemy kogo� innego, kto zachce sprzedawa� dobra miejscowym.~ */
  IF ~~ THEN GOTO 54
END

IF ~~ THEN BEGIN 54 // from: 53.0
  SAY #40315 /* ~Stra�e, zabra� go, jak rozkazano.~ */
  IF ~~ THEN EXTERN ~KPMERC01~ 19
END

IF WEIGHT #4 ~GlobalTimerExpired("KPPlotTime","GLOBAL")
Global("KeepPlot","GLOBAL",2)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 55 // from:
  SAY #40317 /* ~Witaj, wasza dostojno��. Jest pewna kwestia delikatnej natury, o kt�rej chce z tob� m�wi� kapitan Cernick. Czy zgodzisz si� go przyj��?~ [KPDOMO09] */
  IF ~~ THEN REPLY #40318 /* ~Oczywi�cie, wprowad� go.~ */ GOTO 57
  IF ~~ THEN REPLY #40319 /* ~Nie, nie mam dla niego czasu.~ */ GOTO 56
END

IF ~~ THEN BEGIN 56 // from: 55.1
  SAY #40320 /* ~Je�li tak ka�esz, <PRO_LADYLORD>, tedy powiem kapitanowi Cernickowi, aby rozstrzygn�� spraw� wedle w�asnego rozs�dku.~ */
  IF ~~ THEN DO ~IncrementGlobal("KPRevolt","GLOBAL",1)
SetGlobalTimer("KPPlotTime","GLOBAL",FOUR_DAYS)
SetGlobal("KeepPlot","GLOBAL",3)
~ GOTO 25
END

IF ~~ THEN BEGIN 57 // from: 55.0
  SAY #40321 /* ~Jak sobie �yczysz, <PRO_LADYLORD>. Po�l� po niego natychmiast.~ */
  IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("Cut32c")
~ EXIT
END

IF ~~ THEN BEGIN 58 // from:
  SAY #40326 /* ~Jest on twoim poddanym, <PRO_LADYLORD>, wi�c masz prawo zadecydowa� o karze dla niego... pami�taj jednak, �e obserwuj� ci� oczy tych, kt�rzy s� nieprzychylni twym rz�dom.~ */
  IF ~~ THEN REPLY #40327 /* ~My�l�, �e przewina jest oczywista. Nie mog� pozwoli�, aby w mym zamku gnie�dzili si� z�odzieje. Natychmiast wykona� egzekucj�.~ */ GOTO 59
  IF ~~ THEN REPLY #40328 /* ~Nie mog� dopu�ci�, aby s�u�ba zamkowa krad�a. Wyrzu�cie go z zamku... niech wraca na swoje gospodarstwo.~ */ GOTO 60
  IF ~~ THEN REPLY #40330 /* ~Co o tym s�dzisz, Cernick? Czy to ju� si� kiedy� zdarza�o?~ */ EXTERN ~KPCAPT02~ 15
  IF ~~ THEN REPLY #40329 /* ~Najpierw chcia�bym wys�ucha�, co sam Lastin ma do powiedzenia w tej sprawie.~ ~Najpierw chcia�abym wys�ucha�, co sam Lastin ma do powiedzenia w tej sprawie~ */ EXTERN ~KPGRD01~ 2
END

IF ~~ THEN BEGIN 59 // from: 58.0
  SAY #40331 /* ~Jak sobie �yczysz, <PRO_LADYLORD>. Sprawiedliwo�ci stanie si� zado��. S�ysza�e� <PRO_MALEFEMALE>, kapitanie?~ */
  IF ~~ THEN DO ~IncrementGlobal("KPRevolt","GLOBAL",1)
~ EXTERN ~KPCAPT02~ 11
END

IF ~~ THEN BEGIN 60 // from: 58.1
  SAY #40335 /* ~Je�li tak jest twoja wola, <PRO_LADYLORD>. Natychmiast zostanie wydalony z szereg�w stra�y zamkowej. S�ysza�e�, kapitanie?~ */
  IF ~~ THEN EXTERN ~KPCAPT02~ 13
END

IF WEIGHT #5 ~GlobalTimerExpired("KPPlotTime","GLOBAL")
Global("KeepPlot","GLOBAL",3)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 61 // from:
  SAY #40376 /* ~Witaj, wasza dostojno��. Pewien cz�owiek... czeka od d�u�szego czasu na audiencj�. Mam go wpu�ci� czy odes�a�?~ [KPDOMO09] */
  IF ~~ THEN REPLY #40377 /* ~Przyjm� go.~ */ GOTO 64
  IF ~~ THEN REPLY #40378 /* ~Czego chce?~ */ GOTO 63
  IF ~~ THEN REPLY #40379 /* ~Ode�lij go, nie mam czasu na audiencje.~ */ GOTO 62
END

IF ~~ THEN BEGIN 62 // from: 63.1 61.2
  SAY #40380 /* ~Bezzw�ocznie tak uczyni�, <PRO_LADYLORD>. Prosz� wybaczy�, i� niepokoi�em.~ */
  IF ~~ THEN DO ~SetGlobalTimer("KPPlotTime","GLOBAL",SEVEN_DAYS)
SetGlobal("KeepPlot","GLOBAL",4)
~ GOTO 25
END

IF ~~ THEN BEGIN 63 // from: 61.1
  SAY #40381 /* ~Nie jestem pewien, <PRO_LADYLORD>. Twierdzi, �e jest kap�anem Tempusa, lecz jak na osob� oddan� sprawom ducha zdaje si� by� raczej krzepki i surowy. Chce rozmawia� tylko z tob�...~ */
  IF ~~ THEN REPLY #40382 /* ~Wi�c go wprowad�.~ */ GOTO 64
  IF ~~ THEN REPLY #40383 /* ~A wi�c ode�lij go.~ */ GOTO 62
END

IF ~~ THEN BEGIN 64 // from: 63.0 61.0
  SAY #40384 /* ~Jak sobie �yczysz, <PRO_LADYLORD>. Wprowadz� go przed twoje oblicze.~ */
  IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("Cut32d")
~ EXIT
END

IF ~~ THEN BEGIN 65 // from:
  SAY #40392 /* ~Ten ca�y... kap�an. Teraz, kiedy ju� znam jego imi�, przypomnia�o mi si�, i� dotar�y mnie o nim pewne s�uchy. Zdaje si�, �e wyrzucono go z jego ostatniej parafii w jakiej� wiosce na po�udniu, gdzie� w Tethyrze...~ */
  IF ~~ THEN EXTERN ~KPCHAP01~ 5
END

IF ~~ THEN BEGIN 66 // from:
  SAY #40395 /* ~C�... skoro nalegasz, aby go przyj��... Nie radzi�bym wpuszcza� go do kaplicy rodowej na ni�szym poziomie, ale... ta ma�a kapliczka na tym pi�trze powinna mu wystarczy�, jak mniemam. Zadecyduj.~ */
  IF ~~ THEN REPLY #40396 /* ~Dobrze. Umie�� go w kaplicy i zobaczymy, co z tego b�dzie.~ */ DO ~AddExperienceParty(15500)
IncrementGlobal("KPRevolt","GLOBAL",-1)
~ EXTERN ~KPCHAP01~ 7
  IF ~~ THEN REPLY #40397 /* ~Nie przyjm� obcego w mury zamku... szczeg�lnie cz�owieka o w�tpliwej reputacji.~ */ DO ~AddExperienceParty(11500)~ EXTERN ~KPCHAP01~ 9
  IF ~~ THEN REPLY #40398 /* ~Odejd�, kap�anie. Chyba uwa�asz mnie za osob� niespe�na rozumu, je�li my�lisz, �e zaoferuj� ci bezpieczne schronienie.~ */ EXTERN ~KPCHAP01~ 10
END

IF ~~ THEN BEGIN 67 // from:
  SAY #40400 /* ~Tak... a wi�c zaprowadz� ci� do...~ */
  IF ~~ THEN EXTERN ~KPCHAP01~ 8
END

IF WEIGHT #6 ~GlobalTimerExpired("KPPlotTime","GLOBAL")
Global("KeepPlot","GLOBAL",4)
InPartySlot(LastTalkedToBy,0)
GlobalTimerNotExpired("KeepImportant","GLOBAL")
~ THEN BEGIN 68 // from:
  SAY #40422 /* ~Dobrze, �e ci� spotykam, <PRO_LADYLORD>! Lord Farthington Roenall we w�asnej osobie przyby� i pragnie si� z tob� rozm�wi�. Jest troch�... niespokojny..., gdy� musia� ju� d�ugo czeka� i nie wygl�da na zadowolonego.~ */
  IF ~~ THEN GOTO 69
END

IF ~~ THEN BEGIN 69 // from: 68.0
  SAY #40423 /* ~Nie wiem czego chce... za��da� widzie� si� tylko z tob� i z nikim innym. Ja... ja tylko wierz�, i� obejdzie si� bez rozlewu krwi! Czy mam... wprowadzi� go teraz, <PRO_LADYLORD>?~ */
  IF ~~ THEN REPLY #40424 /* ~Oczywi�cie, zobaczmy, co ma do powiedzenia.~ */ GOTO 71
  IF ~~ THEN REPLY #40425 /* ~Nie czuj� potrzeby ogl�dania jego pyska. Ode�lij go.~ */ GOTO 70
END

IF ~~ THEN BEGIN 70 // from: 69.1
  SAY #40426 /* ~C-co? Czy... czy m�wisz serio, <PRO_LADYLORD>? Lord Roenall poczuje si�... bardzo ura�ony!~ */
  IF ~~ THEN REPLY #40427 /* ~Auuu... c� za szkoda, prawda?~ */ GOTO 72
  IF ~~ THEN REPLY #40428 /* ~Nie obchodzi mnie to. Czy�, co m�wi�.~ */ GOTO 72
  IF ~~ THEN REPLY #40429 /* ~(wzdycha) Dobrze wi�c... wprowad� go.~ */ GOTO 71
END

IF ~~ THEN BEGIN 71 // from: 70.2 69.0
  SAY #40430 /* ~Przyb�dzie tu za chwil�, wraz z ca�� swoj� �wit�.~ */
  IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("Cut32e")
~ EXIT
END

IF ~~ THEN BEGIN 72 // from: 70.1 70.0
  SAY #40431 /* ~Tak... rozumiem. Powiadomi� go wi�c, �e nie zostanie przyj�ty.~ */
  IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("Cut32e2")
~ EXIT
END

IF WEIGHT #7 ~GlobalTimerExpired("KPPlotTime","GLOBAL")
Global("KeepPlot","GLOBAL",4)
InPartySlot(LastTalkedToBy,0)
GlobalTimerExpired("KeepImportant","GLOBAL")
~ THEN BEGIN 73 // from:
  SAY #40432 /* ~Wasza dostojno��! Powracasz! Przykro mi, ale przybywasz zbyt p�no, aby spotka� si� z Lordem Roenallem. By� w�ciek�y, �e musia� na ciebie czeka� i odjecha� st�d w wielkim gniewie.~ [KPDOMO10] */
  IF ~~ THEN GOTO 74
END

IF ~~ THEN BEGIN 74 // from: 73.0
  SAY #40433 /* ~Ale zostawi� mi... przes�anie dla ciebie. Rzek�, i� nie uznaje twoich praw do warowni... ani prawa Pani Nalii do dysponowania losami tej ziemi. Rzek�, i� powr�ci... z wojskiem.~ */
  IF ~~ THEN GOTO 75
END

IF ~~ THEN BEGIN 75 // from: 77.0 74.0
  SAY #40434 /* ~Kapitan Cernick obieca�, i� zrobi co w jego mocy, aby przygotowa� nasze si�y, lecz chyba niewiele mo�e uczyni�. By� mo�e Lord Roenall chcia� nas tylko nastraszy�, ale... nie mam pewno�ci.~ */
  IF ~~ THEN GOTO 76
END

IF ~~ THEN BEGIN 76 // from: 75.0
  SAY #40435 /* ~Tak czy inaczej, kapitan Cernick rozes�a� zwiadowc�w na granice naszych ziem. Je�li wojska Lorda Roenalla rusz�, bezzw�ocznie si� o tym dowiemy. Powiadomi� ci�, je�li tak si� stanie.~ */
  IF ~~ THEN EXIT
END

IF WEIGHT #8 ~Global("KeepPlot","GLOBAL",16)
~ THEN BEGIN 77 // from:
  SAY #40439 /* ~Wasza dostojno��! Powracasz! Ja.. spodziewa�em si�, �e do tego dojdzie. Pozwoli�em sobie pom�wi� z kapitanem Cernickiem, <PRO_LADYLORD>...~ [KPDOMO10] */
  IF ~~ THEN DO ~SetGlobal("KeepPlot","GLOBAL",5)
~ GOTO 75
END

IF WEIGHT #9 ~GlobalTimerExpired("KPPlotTime","GLOBAL")
Global("KeepPlot","GLOBAL",5)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 78 // from:
  SAY #40455 /* ~Witaj, wasza dostojno��. Mamy tu ma�y k�opot, o kt�rym zapewne nic ci nie wiadomo.~ [KPDOMO09] */
  IF ~~ THEN GOTO 79
END

IF ~~ THEN BEGIN 79 // from: 78.0
  SAY #40456 /* ~Nie wiem, czy znasz Chanelle... dziewczyna jest s�u�k� w zamku przez ca�e swoje �ycie. By�a sierot� i r�d d'Arnise przyj�� j� w sw� s�u�b�, kiedy by�a jeszcze dzieckiem.~ */
  IF ~~ THEN GOTO 80
END

IF ~~ THEN BEGIN 80 // from: 79.0
  SAY #40457 /* ~<PRO_LADYLORD>, jako �e ty w�adasz zamkiem, jeste� teraz jej prawnym opiekunem. Na co dzie� nie musisz nawet o tym pami�ta�, lecz teraz pojawi�o si� dw�ch m�czyzn, kt�rzy pragn� posi��� jej r�k�.~ */
  IF ~~ THEN GOTO 81
END

IF ~~ THEN BEGIN 81 // from: 80.0
  SAY #40459 /* ~Decyzja, komu j� odda�, nale�y do ciebie, <PRO_LADYLORD>. Zadecyduj, kt�ry z nich otrzyma b�ogos�awie�stwo i zgod� na za�lubienie Chanelle.~ */
  IF ~~ THEN GOTO 82
END

IF ~~ THEN BEGIN 82 // from: 81.0
  SAY #40461 /* ~Czy mam przywie�� ich przed twe oblicze, <PRO_LADYLORD>? Je�eli odm�wisz... wtedy �aden z nich nie b�dzie m�g� po�lubi� Chanelle. Pewien jestem, �e dziewczyna nie chcia�aby tego.~ */
  IF ~~ THEN REPLY #40462 /* ~Oczywi�cie. Przyprowad� wszystkich.~ */ GOTO 84
  IF ~~ THEN REPLY #40463 /* ~No to szkoda, bo nie mam teraz dla nich czasu.~ */ GOTO 83
END

IF ~~ THEN BEGIN 83 // from: 82.1
  SAY #40464 /* ~Jak... jak sobie �yczysz, <PRO_LADYLORD>. Przeka�� Chanelle nieszcz�sn� wie��.~ */
  IF ~~ THEN DO ~IncrementGlobal("KPRevolt","GLOBAL",1)
SetGlobalTimer("KPPlotTime","GLOBAL",FOUR_DAYS)
SetGlobal("KeepPlot","GLOBAL",6)
~ GOTO 25
END

IF ~~ THEN BEGIN 84 // from: 82.0
  SAY #40465 /* ~Po�l� po nich natychmiast, <PRO_LADYLORD>. To zajmie tylko chwilk�.~ */
  IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("Cut32g")
~ EXIT
END

IF WEIGHT #10 ~Global("KeepPlot","GLOBAL",20)
~ THEN BEGIN 85 // from:
  SAY #40466 /* ~(wzdycha) Oto, rzecz jasna, Chanell... jedna ze s�u�ek zamkowych, wasza dostojno��.~ */
  IF ~~ THEN DO ~SetGlobal("KeepPlot","GLOBAL",6)
~ EXTERN ~KPMAID01~ 6
END

IF ~~ THEN BEGIN 86 // from:
  SAY #40468 /* ~Wy�uszcz w�asnymi s�owami gdzie dok�adnie tkwi problem.~ */
  IF ~~ THEN EXTERN ~KPMAID01~ 7
END

IF ~~ THEN BEGIN 87 // from:
  SAY #40477 /* ~Hmm. Z tego, co pami�tam, taka obietnica faktycznie pad�a... i tradycja j� potwierdza. Ale to od ciebie, <PRO_LADYLORD>, zale�y, jaki posag przygotujesz dla dziewczyny.~ */
  IF ~~ THEN EXTERN ~KPRANG02~ 3
END

IF ~~ THEN BEGIN 88 // from:
  SAY #40483 /* ~Do��! <CHARNAME> podejmie decyzj� w tej sprawie.~ */
  IF ~~ THEN REPLY #40484 /* ~Malvolio zapewni jej lepsz� przysz�o��... lepsz� ni� to, co czeka j� tutaj. To najlepszy wyb�r.~ */ DO ~IncrementGlobal("KPRevolt","GLOBAL",1)
~ EXTERN ~KPRANG02~ 4
  IF ~~ THEN REPLY #40485 /* ~Wyboru dokona�o serce Chanelle, a ja nie b�d� mu stawa� na drodze. Niechaj zostanie po�lubiona Jessupowi, je�li tego pragnie.~ */ DO ~AddExperienceParty(15500)~ EXTERN ~KPMAID01~ 13
  IF ~~ THEN REPLY #40486 /* ~My�l�, �e obydwaj zupe�nie si� nie nadaj�. Chanelle, nie po�lubisz �adnego z nich.~ */ DO ~IncrementGlobal("KPRevolt","GLOBAL",1)
~ EXTERN ~KPMAID01~ 17
END

IF WEIGHT #11 ~GlobalTimerExpired("KPPlotTime","GLOBAL")
Global("KeepPlot","GLOBAL",6)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 89 // from:
  SAY #40514 /* ~Witaj, wasza dostojno��. Czeka na ciebie... jaka� para, kt�ra niedawno przyby�a i prosi o audiencj�. M�czyzna i kobieta, schludnie przyodziani.~ [KPDOMO09] */
  IF ~~ THEN GOTO 90
END

IF ~~ THEN BEGIN 90 // from: 89.0
  SAY #40515 /* ~Nie chcieli rzec, co ich sprowadza, twierdz�, �e b�d� m�wi� tylko z tob�. Czy... udzielisz im audiencji, <PRO_LADYLORD>? Czy mam ich po prostu odes�a�?~ */
  IF ~~ THEN REPLY #40516 /* ~Wprowad� ich. Przynajmniej wys�ucham czego chc�.~ */ GOTO 92
  IF ~~ THEN REPLY #40517 /* ~Ode�lij ich. Nie b�d� trwoni� czasu na pogaw�dki z nieznajomymi.~ */ DO ~IncrementGlobal("KPRevolt","GLOBAL",1)
~ GOTO 91
END

IF ~~ THEN BEGIN 91 // from: 90.1
  SAY #40521 /* ~Doskonale, <PRO_LADYLORD>. Uczyni� to niezw�ocznie.~ */
  IF ~~ THEN DO ~SetGlobalTimer("KPPlotTime","GLOBAL",FOUR_DAYS)
SetGlobal("KeepPlot","GLOBAL",7)
~ GOTO 25
END

IF ~~ THEN BEGIN 92 // from: 90.0
  SAY #40523 /* ~Hmm. Dobrze, <PRO_LADYLORD>. Ka�� ich wprowadzi�.~ */
  IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("Cut32h")
~ EXIT
END

IF ~~ THEN BEGIN 93 // from:
  SAY #40531 /* ~Niedorzeczno��! Nie ma takiego d�ugu! Wiedzia�bym o tym!~ */
  IF ~~ THEN EXTERN ~KPLEND01~ 3
END

IF ~~ THEN BEGIN 94 // from:
  SAY #40534 /* ~Co? Niech ja na to spojrz�!~ */
  IF ~~ THEN GOTO 95
END

IF ~~ THEN BEGIN 95 // from: 94.0
  SAY #40535 /* ~...hmmm...~ */
  IF ~~ THEN GOTO 97
END

IF ~~ THEN BEGIN 96 // from: 97.0
  SAY #40536 /* ~W czasie najazdu trolli zagin�o wiele rzeczy, w tym tak�e piecz�� Lorda d'Arnise. Ci ludzie mogli j� gdzie� zdoby� i wykorzysta� do fa�szowania dokument�w...~ */
  IF ~~ THEN EXTERN ~KPLEND02~ 3
END

IF ~~ THEN BEGIN 97 // from: 95.0
  SAY #40537 /* ~Podpis Lorda d'Arnise wygl�da na oryginalny, <PRO_LADYLORD>. Na laku wyci�ni�to jego piecz��. Ale nie mo�na stwierdzi�, kiedy to si� sta�o.~ */
  IF ~~ THEN GOTO 96
END

IF WEIGHT #12 ~Global("KeepPlot","GLOBAL",10)
~ THEN BEGIN 98 // from:
  SAY #40565 /* ~Dobrze... teraz wi�c, kiedy ju� za�atwili�my si� z t� dw�jk�, trzeba nam jeszcze zaj�� si� ich gro�b�. Je�li miejscowi s� im winni pieni�dze i b�d� musieli natychmiast sp�aci� d�ug, z pewno�ci� zrodz� si� niepokoje!~ */
  IF ~~ THEN DO ~SetGlobal("KeepPlot","GLOBAL",7)
~ GOTO 99
END

IF ~~ THEN BEGIN 99 // from: 98.0
  SAY #40566 /* ~Czy uczynimy co� w tej materii, <PRO_LADYLORD>?~ */
  IF ~~ THEN REPLY #40567 /* ~Je�li ludzie po�yczali od tych szalbierzy, to sami s� sobie winni! Niech sami radz� sobie z problemem.~ */ DO ~IncrementGlobal("KPRevolt","GLOBAL",1)
~ GOTO 100
  IF ~PartyGoldGT(499)
~ THEN REPLY #40568 /* ~Rozdaj im 500 sztuk z�ota. Z ch�ci� pomog� i op�ac� po�ow�, ale reszt� b�d� musieli zdoby� sami.~ */ DO ~AddExperienceParty(11500)
TakePartyGold(500)
~ GOTO 101
  IF ~PartyGoldGT(999)
~ THEN REPLY #40569 /* ~Wy�o�� ca�y tysi�c. Nie pozwol�, aby ludzie cierpieli tylko dlatego, �e jacy� oszu�ci usi�owali zagra� mi na nosie.~ */ DO ~AddExperienceParty(15500)
TakePartyGold(1000)
IncrementGlobal("KPRevolt","GLOBAL",-1)
~ GOTO 102
END

IF ~~ THEN BEGIN 100 // from: 99.0
  SAY #40570 /* ~Tak. Chyba masz racj�, <PRO_LADYLORD>. Przynajmniej ta para nieuczciwc�w nie skorzysta na swoich haniebnych czynach.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 101 // from: 99.1
  SAY #40571 /* ~Nie wiem czy uda im si� zebra� 500 w z�ocie, ale z pewno�ci� czynisz sprawiedliwie. Natychmiast rozdam pieni�dze, <PRO_LADYLORD>.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 102 // from: 99.2
  SAY #40572 /* ~Twoja hojno�� nie zna granic. To bardzo rozs�dne, <PRO_LADYLORD>. W ten spos�b zamykasz drog� do nast�pnych szanta��w. Natychmiast wydam odpowiednie rozkazy.~ */
  IF ~~ THEN EXIT
END

IF WEIGHT #13 ~GlobalTimerExpired("KPPlotTime","GLOBAL")
Global("KeepPlot","GLOBAL",7)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 103 // from:
  SAY #40578 /* ~Wasza dostojno��! Przybywasz! To straszliwe, nieprawda�? Czy� twe oczy widzia�y ju� zniszczenia, jakie wywo�a�a pow�d�? Woda wygna�a wielu z ich gospodarstw...~ */
  IF ~~ THEN GOTO 104
END

IF ~~ THEN BEGIN 104 // from: 103.0
  SAY #40579 /* ~To sprawka tych starych grobli, <PRO_LADYLORD>. Lord d'Arnise ju� dawno zamierza� zast�pi� je nowymi, ale zawsze odk�ada� t� spraw� na przysz�y rok.~ */
  IF ~~ THEN GOTO 105
END

IF ~~ THEN BEGIN 105 // from: 104.0
  SAY #40580 /* ~A teraz to si� zem�ci�o. Wielu miejscowych prosi o rozmow� z tob�... wielu jest rozdra�nionych! Wybra�em spo�r�d nich ma�� delegacj�...~ */
  IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("Cut32j")
~ EXIT
END

IF ~~ THEN BEGIN 106 // from:
  SAY #40588 /* ~Uspok�jcie si� wszyscy! <CHARNAME> i tak uczyni, jak uzna za stosowne, i nic tego nie zmieni! Prosz�... opanujcie swe nerwy...~ */
  IF ~~ THEN GOTO 107
END

IF ~~ THEN BEGIN 107 // from: 106.0
  SAY #40589 /* ~<PRO_LADYLORD>, obrachowa�em koszty naprawy zniszcze� i odbudowy grobli. Do ciebie nale�y wyb�r, co uczynimy pierwej.~ */
  IF ~~ THEN GOTO 108
END

IF ~~ THEN BEGIN 108 // from: 107.0
  SAY #40590 /* ~Zniszczenia, jakie woda wyrz�dzi�a na groblach s� znaczne. Szkoda, �e nie mamy dost�pu do skarbca Lorda d'Arnise, bo koszt odbudowy to... ee... ponad 5000 sztuk z�ota.~ */
  IF ~PartyGoldGT(4999)
~ THEN REPLY #40591 /* ~Je�li tyle trzeba do odbudowy, wy�o�� tak� sum�. Niechaj b�dzie 5000 sztuk z�ota.~ */ DO ~AddExperienceParty(15500)
ActionOverride("kpfarm01",TakePartyGold(5000))
~ EXTERN ~KPFARM01~ 2
  IF ~PartyGoldGT(999)
~ THEN REPLY #40592 /* ~Mog� zap�aci� jeno za cz�� odbudowy, nie pokryj� pe�nej sumy.~ */ DO ~AddExperienceParty(4500)~ GOTO 112
  IF ~~ THEN REPLY #40593 /* ~Ludzie b�d� musieli sami zadba� o odbudow� w�asnych gospodarstw. Wsp�czuj� im, lecz nic nie mog� uczyni�.~ */ DO ~IncrementGlobal("KPRevolt","GLOBAL",5)
~ EXTERN ~KPFARM01~ 6
END

IF ~~ THEN BEGIN 109 // from:
  SAY #40597 /* ~Groble s�... prawie r�wnie drogie, dlatego w�a�nie Lord d'Arnise tak odk�ada� budow�. 2000 sztuk z�ota trzeba na ich odbudow�, <PRO_LADYLORD>... to powa�ny wydatek, zdaje sobie spraw�...~ */
  IF ~PartyGoldGT(1999)
~ THEN REPLY #40598 /* ~Je�li dzi�ki temu unikniemy dalszych problem�w, trzeba to niezw�ocznie uczyni�. Wydaj te dwa tysi�ce w z�ocie i napraw groble.~ */ DO ~ActionOverride("kpfarm01",TakePartyGold(2000))
IncrementGlobal("KPRevolt","GLOBAL",-1)
~ GOTO 110
  IF ~~ THEN REPLY #40599 /* ~W tej chwili nie mo�emy tego si� podj��, ale stanie si� to wkr�tce. Na razie skupimy si� na odbudowie gospodarstw.~ */ GOTO 111
END

IF ~~ THEN BEGIN 110 // from: 109.0
  SAY #40601 /* ~Dobrze, <PRO_LADYLORD>... zarz�dz�, aby natychmiast zacz�� odbudow� grobli.~ */
  IF ~GlobalLT("KPRevolt","GLOBAL",0)~ THEN EXTERN ~KPFARM02~ 3
  IF ~GlobalGT("KPRevolt","GLOBAL",0)
GlobalLT("KPRevolt","GLOBAL",5)~ THEN EXTERN ~KPFARM03~ 2
  IF ~GlobalGT("KPRevolt","GLOBAL",4)
GlobalLT("KPRevolt","GLOBAL",10)~ THEN EXTERN ~KPFARM01~ 4
  IF ~GlobalGT("KPRevolt","GLOBAL",9)~ THEN EXTERN ~KPFARM01~ 5
END

IF ~~ THEN BEGIN 111 // from: 109.1
  SAY #40602 /* ~Jak... sobie �yczysz, <PRO_LADYLORD>. Mo�na z tym zaczeka� do przysz�ego roku, lecz lepiej nie odk�ada� tego jeszcze d�u�ej. Lord d'Arnise i tak zwleka� z tym wiele czasu.~ */
  IF ~GlobalLT("KPRevolt","GLOBAL",0)~ THEN EXTERN ~KPFARM02~ 3
  IF ~GlobalGT("KPRevolt","GLOBAL",0)
GlobalLT("KPRevolt","GLOBAL",5)~ THEN EXTERN ~KPFARM03~ 2
  IF ~GlobalGT("KPRevolt","GLOBAL",4)
GlobalLT("KPRevolt","GLOBAL",10)~ THEN EXTERN ~KPFARM01~ 4
  IF ~GlobalGT("KPRevolt","GLOBAL",9)~ THEN EXTERN ~KPFARM01~ 5
END

IF ~~ THEN BEGIN 112 // from: 108.1
  SAY #40618 /* ~Ile z tych pi�ciu tysi�cy chcia�by� im u�yczy�, <PRO_LADYLORD>?~ */
  IF ~PartyGoldGT(4999)~ THEN REPLY #40619 /* ~W zasadzie daj im ca�e pi�� tysi�cy w z�ocie. Zmieni�em zdanie.~ ~W zasadzie daj im ca�e pi�� tysi�cy w z�ocie. Zmieni�am zdanie.~ */ DO ~AddExperienceParty(8500)
ActionOverride("kpfarm01",TakePartyGold(5000))~ EXTERN ~KPFARM01~ 2
  IF ~PartyGoldGT(3999)~ THEN REPLY #40620 /* ~Daj im 4000 sztuk z�ota. To wszystko na co mnie sta�.~ */ DO ~AddExperienceParty(6500)
ActionOverride("kpfarm01",TakePartyGold(4000))
IncrementGlobal("KPRevolt","GLOBAL",1)~ EXTERN ~KPFARM03~ 6
  IF ~PartyGoldGT(2999)~ THEN REPLY #40621 /* ~Daj im 3000 sztuk z�ota. To wszystko na co mnie sta�.~ */ DO ~AddExperienceParty(4500)
ActionOverride("kpfarm01",TakePartyGold(3000))
IncrementGlobal("KPRevolt","GLOBAL",2)~ EXTERN ~KPFARM03~ 6
  IF ~PartyGoldGT(1999)~ THEN REPLY #40622 /* ~Daj im 2000 sztuk z�ota. Reszt� b�d� musieli sami zgromadzi�.~ */ DO ~AddExperienceParty(2500)
ActionOverride("kpfarm01",TakePartyGold(2000))
IncrementGlobal("KPRevolt","GLOBAL",3)~ EXTERN ~KPFARM01~ 8
  IF ~PartyGoldGT(999)~ THEN REPLY #40623 /* ~Daj im 1000 sztuk z�ota. Reszt� b�d� musieli sami zgromadzi�.~ */ DO ~ActionOverride("kpfarm01",TakePartyGold(1000))
IncrementGlobal("KPRevolt","GLOBAL",4)~ EXTERN ~KPFARM01~ 8
  IF ~~ THEN REPLY #40625 /* ~W zasadzie my�l�, �e nie mog� ich na razie wspom�c. B�d� musieli poradzi� sobie sami.~ */ DO ~IncrementGlobal("KPRevolt","GLOBAL",5)~ EXTERN ~KPFARM01~ 6
END

IF WEIGHT #14 ~GlobalTimerExpired("KPPlotTime","GLOBAL")
Global("KeepPlot","GLOBAL",8)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 113 // from:
  SAY #40646 /* ~Wasza dostojno��! Powracasz! Dzi�ki bogom, �e pojawiasz si� w�a�nie teraz! Wojska Lorda Roenalla nam zagra�aj�!~ [KPDOMO10] */
  IF ~~ THEN GOTO 114
END

IF ~~ THEN BEGIN 114 // from: 113.0
  SAY #40647 /* ~Ja... nie wierzy�em, �e Lord Roenall zaatakuje. Kapitan Cernick dostrzeg� ich wojska i wyruszy� im na spotkanie... planuje przynajmniej spowolni� ich poch�d...~ */
  IF ~~ THEN GOTO 115
END

IF ~~ THEN BEGIN 115 // from: 114.0
  SAY #40648 /* ~Nasze si�y s� mniej liczne i sk�adaj� si� ze �wie�ych rekrut�w... nie ma nadziei, �e zwyci�ymy! Och, oni tu przyb�d� lada chwila... Lord Roenall przemoc� opanuje zamek!~ */
  IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ 198
  IF ~!IsValidForPartyDialog("Nalia")~ THEN GOTO 116
END

IF ~~ THEN BEGIN 116 // from: 115.1
  SAY #40652 /* ~Dwie godziny temu dotar�y mnie wie�ci z pola boju... Kapitan Cernick rzecze, i� bitwa...~ */
  IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("Cut32k")
~ EXIT
END

IF WEIGHT #15 ~Global("KeepPlot","GLOBAL",13)
Dead("kproen01")
~ THEN BEGIN 117 // from:
  SAY #40678 /* ~Oddzia�y Lorda Roenalla zosta�y rozbite dzi�ki twoim wysi�kom, wasza dostojno��. Po raz wt�ry uda�o ci si� ochroni� zamek i nasze ziemie przez najazdem.~ [KPDOMO11] */
  IF ~~ THEN GOTO 118
END

IF ~~ THEN BEGIN 118 // from: 117.0
  SAY #40679 /* ~Wszyscy jeste�my ci dozgonnie wdzi�czni... i wiedz, �e z rado�ci� witamy twoje przyw�dztwo, jak tylko d�ugo b�dziesz �askaw je roztacza� nad nami.~ */
  IF ~!Dead("Nalia")
!InParty("Nalia")~ THEN GOTO 120
  IF ~!Dead("Nalia")
InParty("Nalia")~ THEN EXTERN ~NALIAJ~ 199
  IF ~Dead("Nalia")~ THEN GOTO 119
END

IF ~~ THEN BEGIN 119 // from: 120.0 118.2
  SAY #40680 /* ~<CHARNAME>, <PRO_LADYLORD>, pozdrawiamy ci�... pozdrawiamy ci� i bijemy przed tob� uk�ony. Przyjmujemy ci� jako naszego suwerena, teraz i na zawsze...~ */
  IF ~~ THEN DO ~EraseJournalEntry(3030)
EraseJournalEntry(3031)
EraseJournalEntry(3032)
EraseJournalEntry(3033)
AddExperienceParty(50000)
SetGlobal("KeepPlot","GLOBAL",14)
~ SOLVED_JOURNAL #3036 /* ~Rz�dz� twierdz� i ziemiami rodu d'Arnise

W ko�cu Roenallowie zostali pokonani. W�tpi� czy szybko powr�c� skoro Lord Farthington nie �yje. Moja pozycja w�adcy zamku zosta�a wzmocniona... przy odrobinie szcz�cia od tej pory w zamku d'Arnis�w b�dzie spokojnie.~ */ EXIT
END

IF ~~ THEN BEGIN 120 // from: 118.0
  SAY #40681 /* ~Pani Nalia rzek�a nam, i� pragnie tylko pozosta� w warowni... lecz bez twej pomocy, nie mia�aby ju� czym w�ada�.~ */
  IF ~~ THEN GOTO 119
END

IF ~~ THEN BEGIN zgoda
SAY ~Natychmiast.~
IF ~~ THEN EXIT
END
