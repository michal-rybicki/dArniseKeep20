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
  SAY #39977 /* ~Witam, wasza dostojnoœæ... Jak rzek³a mi Pani Nalia, to do ciebie nale¿y teraz zaszczyt w³adania t¹ warowni¹ i otaczaj¹cymi j¹ gruntami, tak?~ [KPDOMO02] */
  IF ~~ THEN REPLY #39978 /* ~Tak, to prawda.~ */ GOTO 1
END

IF ~~ THEN BEGIN 1 // from: 0.0
  SAY #39979 /* ~Dobrze. Ja jestem majordomusem tego zamku, lub przynajmniej by³em nim, kiedy s³u¿y³em pod Lordem d'Arnise. Pragnê s³u¿yæ ci tak samo wiernie.~ */
  IF ~IsValidForPartyDialog("Nalia")
~ THEN EXTERN ~NALIAJ~ 178
  IF ~!IsValidForPartyDialog("Nalia")
~ THEN EXTERN ~NALIA~ 69
END

IF ~~ THEN BEGIN 2 // from:
  SAY #39982 /* ~Zaszczytem jest dla mnie s³yszeæ takie s³owa, Lady. Zarz¹dzam codziennymi pracami w zamku, kierujê s³u¿b¹ i rozstrzygam pomniejsze problemy z twoimi wieœniakami lub inne sprawy, zwi¹zane z twoj¹ ziemi¹.~ */
  IF ~~ THEN GOTO 3
END

IF ~~ THEN BEGIN 3 // from: 2.0
  SAY #39983 /* ~Dbam te¿, aby zbierano podatki, które nastêpnie gromadzimy tu w skrzyniach. Jeœli pragniesz zmieniæ wysokoœæ podatku, rzeknij mi tylko s³owo. Na razie zbieram je tak, jak to czyni³em dla Lorda d'Arnise.~ */
  IF ~~ THEN GOTO 4
END

IF ~~ THEN BEGIN 4 // from: 3.0
  SAY #39984 /* ~Znaczna czêœæ zasobów pójdzie na odbudowê garnizonu zamkowego, który znacznie zmala³, oraz na utrzymanie zamku i s³u¿by.~ */
  IF ~~ THEN GOTO 5
END

IF ~~ THEN BEGIN 5 // from: 4.0
  SAY #39985 /* ~Ale jak mniemam, i tak zostanie oko³o piêciuset sztuk z³ota tygodniowo. Jeœli pragniesz skorzystaæ z tych pieniêdzy, starczy, ¿e zapytasz, a wska¿ê ci drogê.~ */
  IF ~~ THEN GOTO 6
END

IF ~~ THEN BEGIN 6 // from: 5.0
  SAY #39986 /* ~Co siê tyczy zasadniczych decyzji, có¿, sugerujê, aby twoja dru¿yna powraca³a tutaj przynajmniej co kilka tygodni. Jeœli wydarzy siê coœ krytycznego, wyœlê za tob¹ umyœlnego.~ */
  IF ~~ THEN GOTO 7
END

IF ~~ THEN BEGIN 7 // from: 6.0
  SAY #39987 /* ~Chwilowo nie ma ¿adnych spraw, które wymaga³by twojej decyzji. S³u¿ba posprz¹ta warowniê i jak mniemam, trzeba bêdzie poczyniæ ustalenia w sprawie pochówku Lorda d'Arnise.~ */
  IF ~~ THEN DO ~SetGlobalTimer("KPTaxTime","GLOBAL",SEVEN_DAYS)
SetGlobalTimer("KPPlotTime","GLOBAL",SEVEN_DAYS)
SetGlobal("KeepPlot","GLOBAL",1)
~ GOTO 8
END

IF ~~ THEN BEGIN 8 // from: 7.0
  SAY #39988 /* ~Czy masz wiêc jakieœ polecenia?~ */
  IF ~~ THEN REPLY #39989 /* ~W tej chwili w skarbcu nie ma pieniêdzy, tak?~ */ GOTO 9
  IF ~GlobalLT("KPRevolt","GLOBAL",10)
~ THEN REPLY #39990 /* ~Chcia³bym zebraæ dodatkowy podatek... potrzeba mi pieniêdzy.~ ~Chcia³abym zebraæ dodatkowy podatek... potrzeba mi pieniêdzy.~ */ GOTO 11
  IF ~~ THEN REPLY #39991 /* ~Wiêc... ca³a warownia jest moja?~ */ GOTO 14
  IF ~~ THEN REPLY #39992 /* ~Jak rozleg³e s¹ ziemie nale¿¹ce do zamku?~ */ GOTO 15
  IF ~areacheck("ar1306")~ THEN REPLY ~Natychmiat zoorganizuj naradê moich poruczników, towarzyszy i doradców.~ DO ~setglobal("NaradadArnise","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY #39993 /* ~Nie, nie mam ¿adnych pytañ.~ */ GOTO 17
END

IF ~~ THEN BEGIN 9 // from: 16.0 14.0 8.0
  SAY #39994 /* ~Hmm... z tego co wiem, trolle skrad³y z zamku mnóstwo bogactw. Nic tu nie znajdziesz, oprócz tego, co uda³o ci siê zdobyæ podczas, aach, odzyskiwania w³adzy nad zamkiem.~ */
  IF ~~ THEN GOTO 10
END

IF ~~ THEN BEGIN 10 // from: 9.0
  SAY #39995 /* ~Ale jeœli zaczekasz tydzieñ lub wiêcej, uprawy zbó¿ z gruntów dooko³a zamku przynios¹ ci profit. Tak jak rzek³em, Lord d'Arnise zbiera³ przeciêtnie 500 sztuk z³ota.~ */
  IF ~GlobalLT("KPRevolt","GLOBAL",10)
~ THEN REPLY #39996 /* ~Chcia³bym zebraæ dodatkowy podatek... potrzeba mi pieniêdzy.~ ~Chcia³abym zebraæ dodatkowy podatek... potrzeba mi pieniêdzy.~ */ GOTO 11
  IF ~~ THEN REPLY #39997 /* ~Wiêc... ca³a warownia jest moja?~ */ GOTO 14
  IF ~~ THEN REPLY #39998 /* ~Jak rozleg³e s¹ ziemie nale¿¹ce do zamku?~ */ GOTO 15
  IF ~areacheck("ar1306")~ THEN REPLY ~Natychmiat zoorganizuj naradê moich poruczników, towarzyszy i doradców.~ DO ~setglobal("NaradadArnise","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY #39999 /* ~Udam siê w swoj¹ stronê.~ */ GOTO 17
END

IF ~~ THEN BEGIN 11 // from: 16.1 14.1 10.0 8.1
  SAY #40000 /* ~Jeœli... jeœli tak jest twoja wola, mogê zorganizowaæ dodatkowy pobór. Moi ludzie w okamgnieniu zgromadz¹ pieni¹dze i dostarcz¹ je tutaj, jeno... ach...~ */
  IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ 179
  IF ~!IsValidForPartyDialog("Nalia")~ THEN GOTO 13
END

IF ~~ THEN BEGIN 12 // from:
  SAY #40002 /* ~Ee, tak... to znaczy. Ludzie... uczyni¹ jak im rozka¿esz, <PRO_LADYLORD>, ale nie maj¹ oni zbyt wiele w swoich trzosach. Czy... na pewno chcesz przeprowadziæ dodatkowy pobór?~ */
  IF ~~ THEN REPLY #40004 /* ~Tak, oczywiœcie.~ */ GOTO 30
  IF ~~ THEN REPLY #40005 /* ~Nie, chyba nie.~ */ GOTO 31
END

IF ~~ THEN BEGIN 13 // from: 11.1
  SAY #40003 /* ~...ludzie dopiero podnosz¹ siê po najeŸdzie. Uczyni¹ jak im rozka¿esz, <PRO_LADYLORD>, ale nie maj¹ zbyt wiele w swych trzosach. Czy... na pewno tego chcesz?~ */
  IF ~~ THEN REPLY #40006 /* ~Tak, oczywiœcie.~ */ GOTO 30
  IF ~~ THEN REPLY #40007 /* ~Nie, chyba nie.~ */ GOTO 31
END

IF ~~ THEN BEGIN 14 // from: 16.2 10.1 8.2
  SAY #40008 /* ~Tak, <PRO_LADYLORD>, wszystko twoje, jak rzek³a Pani Nalia. Pozosta³o kilku dawnych s³u¿¹cych, najêliœmy te¿ kilku nowych. Jeœli pragniesz, mo¿esz zwiedzaæ wszystkie zak¹tki zamku.~ */
  IF ~~ THEN REPLY #40009 /* ~W tym momencie w skarbcu nie ma ¿adnych pieniêdzy, tak?~ */ GOTO 9
  IF ~GlobalLT("KPRevolt","GLOBAL",10)
~ THEN REPLY #40010 /* ~Chcia³bym zebraæ dodatkowy podatek... potrzeba mi pieniêdzy.~ ~Chcia³abym zebraæ dodatkowy podatek... potrzeba mi pieniêdzy.~ */ GOTO 11
  IF ~~ THEN REPLY #40011 /* ~Jak rozleg³e s¹ ziemie nale¿¹ce do zamku?~ */ GOTO 15
  IF ~areacheck("ar1306")~ THEN REPLY ~Natychmiat zoorganizuj naradê moich poruczników, towarzyszy i doradców.~ DO ~setglobal("NaradadArnise","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY #40012 /* ~Udam siê ju¿ w drogê.~ */ GOTO 17
END

IF ~~ THEN BEGIN 15 // from: 14.2 10.2 8.3
  SAY #40013 /* ~Mniemam, i¿ dane ci ju¿ by³o widzieæ nasz¹ warowniê. Bêdziesz tak¿e w³adaæ rozleg³ymi po³aciami ziemi, która przylega do zamku. Nie ma tam osiedli ludzkich, ale wszystko to ¿yzne grunty rolne.~ */
  IF ~~ THEN GOTO 16
END

IF ~~ THEN BEGIN 16 // from: 15.0
  SAY #40014 /* ~Lord d'Arnise zawsze dobrze ¿y³ ze swoimi ludŸmi, tak samo jak wszyscy jego przodkowie. Panuje tu spokój... zazwyczaj. Myœlê, i¿ nie bêdziesz mieæ wiêkszych k³opotów.~ */
  IF ~~ THEN REPLY #40015 /* ~W tym momencie w skarbcu nie ma ¿adnych pieniêdzy, tak?~ */ GOTO 9
  IF ~GlobalLT("KPRevolt","GLOBAL",10)
~ THEN REPLY #40016 /* ~Chcia³bym zebraæ dodatkowy podatek... potrzeba mi pieniêdzy.~ ~Chcia³abym zebraæ dodatkowy podatek... potrzeba mi pieniêdzy.~ */ GOTO 11
  IF ~~ THEN REPLY #40017 /* ~Wiêc... ca³a warownia jest moja?~ */ GOTO 14
  IF ~areacheck("ar1306")~ THEN REPLY ~Natychmiat zoorganizuj naradê moich poruczników, towarzyszy i doradców.~ DO ~setglobal("NaradadArnise","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY #40018 /* ~Udam siê ju¿ w drogê.~ */ GOTO 17
END

IF ~~ THEN BEGIN 17 // from: 16.3 14.3 10.3 8.4
  SAY #40019 /* ~<CHARNAME>, <PRO_LADYLORD>, jeœli tak sobie ¿yczysz. Mogê z ³atwoœci¹ oporz¹dziæ dla ciebie jedn¹ z sypialni, jeœli pragniesz pozostaæ tu na noc. Dla twoich towarzyszy tak¿e znajdziemy godne lokum.~ */
  IF ~OR(4)
InParty("Nalia")
Dead("Nalia")
StateCheck("Nalia",STATE_SLEEPING)
!See("Nalia")
!Dead("Delcia")
!StateCheck("Delcia",STATE_SLEEPING)
See("Delcia")
~ THEN UNSOLVED_JOURNAL #3030 /* ~Rz¹dzê twierdz¹ i ziemiami rodu d'Arnise

Nalia poprosi³a mnie o zaopiekowanie siê ziemiami jej rodziny, aby Roenallowie nie mieli okazji do zabrania ich bez jej zgody. Pomo¿e mi majordomus jej ojca. Zajmie siê codziennymi sprawami zamku i zbieraniem dla mnie podatków. Majordomus oszacowa³, ¿e po odjêciu kosztów utrzymania zamku i garnizonu dostanê jakieœ 500 sztuk z³ota co tydzieñ... i mogê je sobie odebraæ w ka¿dej chwili. Mogê te¿ podnieœæ podatki, ale muszê uwa¿aæ, ¿eby nie rozgniewaæ poddanych.
Muszê te¿ co jakiœ czas wracaæ do zamku ¿eby podj¹æ decyzje, których majordomus sam nie mo¿e podj¹æ. W sumie wygl¹da to naprawdê doœæ prosto.~ */ GOTO 19
  IF ~!Dead("Nalia")
!InParty("Nalia")
!StateCheck("Nalia",STATE_SLEEPING)
See("Nalia")
~ THEN UNSOLVED_JOURNAL #3030 /* ~Rz¹dzê twierdz¹ i ziemiami rodu d'Arnise

Nalia poprosi³a mnie o zaopiekowanie siê ziemiami jej rodziny, aby Roenallowie nie mieli okazji do zabrania ich bez jej zgody. Pomo¿e mi majordomus jej ojca. Zajmie siê codziennymi sprawami zamku i zbieraniem dla mnie podatków. Majordomus oszacowa³, ¿e po odjêciu kosztów utrzymania zamku i garnizonu dostanê jakieœ 500 sztuk z³ota co tydzieñ... i mogê je sobie odebraæ w ka¿dej chwili. Mogê te¿ podnieœæ podatki, ale muszê uwa¿aæ, ¿eby nie rozgniewaæ poddanych.
Muszê te¿ co jakiœ czas wracaæ do zamku ¿eby podj¹æ decyzje, których majordomus sam nie mo¿e podj¹æ. W sumie wygl¹da to naprawdê doœæ prosto.~ */ GOTO 18
  IF ~OR(4)
InParty("Nalia")
Dead("Nalia")
StateCheck("Nalia",STATE_SLEEPING)
!See("Nalia")
OR(3)
Dead("Delcia")
StateCheck("Delcia",STATE_SLEEPING)
!See("Delcia")
~ THEN UNSOLVED_JOURNAL #3030 /* ~Rz¹dzê twierdz¹ i ziemiami rodu d'Arnise

Nalia poprosi³a mnie o zaopiekowanie siê ziemiami jej rodziny, aby Roenallowie nie mieli okazji do zabrania ich bez jej zgody. Pomo¿e mi majordomus jej ojca. Zajmie siê codziennymi sprawami zamku i zbieraniem dla mnie podatków. Majordomus oszacowa³, ¿e po odjêciu kosztów utrzymania zamku i garnizonu dostanê jakieœ 500 sztuk z³ota co tydzieñ... i mogê je sobie odebraæ w ka¿dej chwili. Mogê te¿ podnieœæ podatki, ale muszê uwa¿aæ, ¿eby nie rozgniewaæ poddanych.
Muszê te¿ co jakiœ czas wracaæ do zamku ¿eby podj¹æ decyzje, których majordomus sam nie mo¿e podj¹æ. W sumie wygl¹da to naprawdê doœæ prosto.~ */ GOTO 20
END

IF ~~ THEN BEGIN 18 // from: 17.1
  SAY #40020 /* ~Lady Nalia oczywiœcie pozostanie tutaj, w swych dawnych pokojach. Jeœli pragniesz z ni¹ mówiæ, z pewnoœci¹ tam j¹ znajdziesz.~ */
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
  SAY #40021 /* ~A... zaœ Lady Delcia...ach...~ */
  IF ~~ THEN EXTERN ~DELCIA~ 27
END

IF ~~ THEN BEGIN 20 // from: 18.1 17.2
  SAY #40022 /* ~Jeœli masz kolejne ¿yczenia, <PRO_LADYLORD>, tedy bez wahania rzeknij mi o nich. Zazwyczaj przebywam w komnacie audiencyjnej.~ */
  IF ~~ THEN EXIT
END

IF WEIGHT #1 ~OR(2)
!InPartySlot(LastTalkedToBy,0)
Name("Nalia",LastTalkedToBy)
~ THEN BEGIN 21 // from:
  SAY #40091 /* ~Niestety, nie mam ci zbyt wiele do powiedzenia. Wierzê, i¿ przyjemnie p³ynie ci czas, tu, w twierdzy?~ [KPDOMO07] */
  IF ~~ THEN EXIT
END

IF WEIGHT #2 ~Name("Nalia",LastTalkedToBy)
~ THEN BEGIN 22 // from:
  SAY #40092 /* ~Dzieñ dobry, panno Nalio. Czy wszystko idzie dobrze na... ach... szlaku przygody? Muszê rzec, ¿e ostatnio bardzo przypomina mi pani ojca.~ [KPDOMO08] */
  IF ~~ THEN EXIT
END

IF WEIGHT #16 /* Triggers after states #: 43 55 61 68 73 77 78 85 89 98 103 113 117 even though they appear after this state */
~InPartySlot(LastTalkedToBy,0)
!Global("KeepPlot","GLOBAL",10)
!Global("KeepPlot","GLOBAL",15)
!Global("KeepPlot","GLOBAL",20)
~ THEN BEGIN 23 // from:
  SAY #40093 /* ~Witaj, wasza dostojnoœæ. Czy mogê byæ ci w czymœ pomocny?~ [KPDOMO09] */
  IF ~~ THEN REPLY #40094 /* ~Czy nikt nie chcia³ siê ze mn¹ zobaczyæ?~ */ GOTO 24
  IF ~~ THEN REPLY #40095 /* ~Chcia³bym skorzystaæ z pieniêdzy, które uda³o siê wam zebraæ z podatków.~ ~Chcia³abym skorzystaæ z pieniêdzy, które uda³o siê wam zebraæ z podatków.~ */ GOTO 26
  IF ~GlobalLT("KPRevolt","GLOBAL",10)
~ THEN REPLY #40097 /* ~Trzeba mi pieniêdzy i to szybko...Pragnê zebraæ nieco podatków.~ */ GOTO 28
  IF ~GlobalLT("KPRevolt","GLOBAL",10)~ THEN REPLY #40096 /* ~Jak siê sprawy maj¹ w okolicy?~ */ GOTO 33
  IF ~areacheck("ar1306")~ THEN REPLY ~Natychmiat zoorganizuj naradê moich poruczników, towarzyszy i doradców.~ DO ~setglobal("NaradadArnise","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY #40098 /* ~Nie, na razie niczego mi nie trzeba.~ */ GOTO 42
END

IF ~~ THEN BEGIN 24 // from: 25.0 23.0
  SAY #40100 /* ~Nie, <LADYLORD>. Rozstrzygn¹³em kilka sporów i k³ótni o ziemiê... ale to pomniejsze problemy, zaprawdê. Na razie nikt nie prosi³ o audiencjê u ciebie.~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 25 // from: 91.0 83.0 62.0 56.0 46.0 41.0 40.0 39.0 38.0 37.0 36.0 35.0 34.0 32.0 31.0 30.0 27.0 26.0 24.0
  SAY #40101 /* ~Czym jeszcze móg³bym ci s³u¿yæ?~ */
  IF ~~ THEN REPLY #40102 /* ~Chcia³bym upewniæ siê, czy nikt nie prosi³ o audiencjê.~ ~Chcia³abym upewniæ siê, czy nikt nie prosi³ o audiencjê.~ */ GOTO 24
  IF ~~ THEN REPLY #40103 /* ~Chcia³bym skorzystaæ z pieniêdzy, które uda³o siê wam zebraæ z podatków.~ ~Chcia³abym skorzystaæ z pieniêdzy, które uda³o siê wam zebraæ z podatków.~ */ GOTO 26
  IF ~GlobalLT("KPRevolt","GLOBAL",10)
~ THEN REPLY #40105 /* ~Trzeba mi pieniêdzy i to szybko... Musisz zebraæ nieco podatków.~ */ GOTO 28
  IF ~GlobalLT("KPRevolt","GLOBAL",10)~ THEN REPLY #40106 /* ~Powiedz mi, jak siê sprawy maj¹.~ */ GOTO 33
  IF ~areacheck("ar1306")~ THEN REPLY ~Natychmiat zoorganizuj naradê moich poruczników, towarzyszy i doradców.~ DO ~setglobal("NaradadArnise","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY #40107 /* ~Nie, chwilowo nie.~ */ GOTO 42
END

IF ~~ THEN BEGIN 26 // from: 25.1 23.1
  SAY #40108 /* ~Wedle ¿yczenia. Zgromadzi³em wszystkie zebrane pieni¹dze w szafce w bibliotece na drugim piêtrze, <LADYLORD>. Zazwyczaj tam w³aœnie przechowujê pieni¹dze.~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 27 // from:
  SAY #40109 /* ~Mm, obawiam siê, ¿e w tym momencie nic tam nie znajdziesz, <LADYLORD>. Trzeba zaczekaæ do koñca tygodnia, chyba, ¿e pragniesz zorganizowaæ nadzwyczajny pobór.~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 28 // from: 25.2 23.2
  SAY #40110 /* ~Ja... oczywiœcie zrobiê, co ka¿esz, <PRO_LADYLORD>. Jednak trzeba ci zachowaæ ostro¿noœæ. Twoi obywatele uczyni¹, jak im ka¿esz, ale niewiele ju¿ maj¹ w swych trzosach.~ */
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
  SAY #40115 /* ~Czy na pewno... chcesz, aby to uczyni³?~ */
  IF ~~ THEN REPLY #40128 /* ~Tak, oczywiœcie.~ */ GOTO 30
  IF ~~ THEN REPLY #40129 /* ~Nie, chyba nie.~ */ GOTO 31
END

IF ~~ THEN BEGIN 30 // from: 29.0 13.0 12.0
  SAY #40130 /* ~Jak sobie ¿yczysz. Rozka¿ê zbrojnym, aby zebrali dodatkowy podatek. Bez zw³oki wykonaj¹ to zadanie.~ */
  IF ~~ THEN DO ~GiveGoldForce(1000)
IncrementGlobal("KPRevolt","GLOBAL",1)
~ GOTO 25
END

IF ~~ THEN BEGIN 31 // from: 29.1 13.1 12.1
  SAY #40137 /* ~Ja... z ulg¹ s³yszê te s³owa, <PRO_LADYLORD>. Roenallowie z pewnoœci¹ zdarliby skórê z mieszkañców tej ziemi, i w³aœnie dlatego poddani tak siê ich lêkali.~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 32 // from:
  SAY #40138 /* ~Tak uczyniê, <PRO_LADYLORD>. Rozeœlê wieœci do twych zbrojnych, aby zaprzestali poboru.~ */
  IF ~~ THEN DO ~IncrementGlobal("KPRevolt","GLOBAL",-1)
~ GOTO 25
END

IF ~~ THEN BEGIN 33 // from: 25.3 23.3
  SAY #40139 /* ~Niewiele siê zmieni³o. Czyniê to samo, co czyni³em dla Lorda d'Arnise, rozstrzygam pomniejsze spory... lecz poza tym w zamku niewiele siê dzieje.~ */
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
  SAY #40140 /* ~Natomiast serca twoich ch³opów przepe³nia radoœæ. Twierdz¹, i¿ jesteœ osob¹ tak sprawiedliw¹ jak sam Lord d'Arnise, a mo¿e i nawet przewy¿szasz go swymi cnotami. Twoi poddani pozbierali ju¿ siê po najeŸdzie i z pogod¹ wyczekuj¹ twoich dalszych rz¹dów.~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 35 // from: 33.1
  SAY #40141 /* ~Natomiast jeœli chodzi o twoich ch³opów, to ciesz¹ siê z twego panowania. Nadal haruj¹, aby odbudowaæ swe gospodarstwa po zniszczeniach zadanych przez trolle... ale sprawy maj¹ siê doœæ dobrze.~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 36 // from: 33.2
  SAY #40142 /* ~Natomiast ch³opi z twoich ziem... maj¹ siê dobrze. Wiele jeszcze czeka ich pracy, zanim odbuduj¹ swe gospodarstwa po najeŸdzie trolli. Ale prêdzej czy póŸniej, doczekamy siê tego.~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 37 // from: 33.3
  SAY #40143 /* ~Jeno ch³opi s¹ trochê rozdra¿nieni przez twoje rozkazy. Lecz nic to, <PRO_LADYLORD>. Op³akuj¹ wci¹¿ Lorda d'Arnise, ale wkrótce zapomn¹ o swej wrogoœci.~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 38 // from: 33.4
  SAY #40144 /* ~Jednak ch³opi z twoich ziem s¹ niespokojni. Oczekiwali, <PRO_LADYLORD>, twych sprawiedliwych rz¹dów i twe rozkazy nie s¹ przyjmowane z radoœci¹. Ale... nie powinienem mówiæ takich rzeczy.~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 39 // from: 33.5
  SAY #40145 /* ~Natomiast s¹ k³opoty z ch³opami z twoich ziem. Wybucha³y liczne protesty przeciw podatkom i musia³em koiæ liczne niepokoje. Ale... to nic nader wa¿nego, <PRO_LADYLORD>.~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 40 // from: 33.6
  SAY #40146 /* ~Natomiast na naszych ziemiach ch³opi s¹ rozwœcieczeni. W zamku odkryto zabójcê, zaœ kilka kup rozochoconego plebsu trzeba by³o odpêdzaæ od bram. Musisz... zachowaæ najwy¿sz¹ ostro¿noœæ.~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 41 // from: 33.7
  SAY #40147 /* ~Natomiast ch³opi... bunt wisi w powietrzu. Ma³a iskra starczy, aby wybuchn¹³ wielki p³omieñ. Jeœli nic siê nie zmieni, ch³opi... zaatakuj¹ zamek, <PRO_LADYLORD>...~ */
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 42 // from: 25.4 23.4
  SAY #40148 /* ~Jeœli taka jest twoja wola, <PRO_LADYLORD>.~ */
  IF ~~ THEN EXIT
END

IF WEIGHT #3 ~GlobalTimerExpired("KPPlotTime","GLOBAL")
Global("KeepPlot","GLOBAL",1)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 43 // from:
  SAY #40191 /* ~Witaj, wasza dostojnoœæ. Przyj¹³em pewnego rozdra¿nionego kupca o imieniu Tolmas Bendelia, który domaga siê spotkania z tob¹.~ [KPDOMO09] */
  IF ~~ THEN GOTO 44
END

IF ~~ THEN BEGIN 44 // from: 43.0
  SAY #40192 /* ~Chodzi mu chyba o swoj¹ karawanê, podró¿uj¹c¹ przez ten region, która pad³a ofiar¹ zbójeckiej zasadzki. Nie zechcia³ mówiæ z nikim oprócz ciebie, <PRO_LADYLORD>.~ */
  IF ~~ THEN GOTO 45
END

IF ~~ THEN BEGIN 45 // from: 44.0
  SAY #40193 /* ~To wp³ywowa osoba w tych okolicach; mniemam, i¿ w swej gestii ma znacznie wiêcej ni¿ tylko jedno gospodarstwo w okolicy. Czy udzielisz mu audiencji, <PRO_LADYLORD>?~ */
  IF ~~ THEN REPLY #40195 /* ~Oczywiœcie. WprowadŸ go.~ */ GOTO 47
  IF ~~ THEN REPLY #40196 /* ~Nie, nie mam na to czasu... ka¿ mu przyjœæ kiedy indziej.~ */ GOTO 46
END

IF ~~ THEN BEGIN 46 // from: 45.1
  SAY #40197 /* ~Jak sobie ¿yczysz, <PRO_LADYLORD>... choæ bez w¹tpienia kupiec bêdzie bardzo niezadowolony. Ale je¿eli przy takiej decyzji obstajesz, ka¿ê mu odejœæ.~ */
  IF ~~ THEN DO ~IncrementGlobal("KPRevolt","GLOBAL",1)
SetGlobalTimer("KPPlotTime","GLOBAL",SEVEN_DAYS)
SetGlobal("KeepPlot","GLOBAL",2)
~ GOTO 25
END

IF ~~ THEN BEGIN 47 // from: 45.0
  SAY #40200 /* ~Doskonale, <PRO_LADYLORD>. Poœlê po niego natychmiast.~ */
  IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("Cut32b")
~ EXIT
END

IF ~~ THEN BEGIN 48 // from:
  SAY #40205 /* ~Radzi³bym opanowaæ swe nerwy, panie Bendelia... i raczy³by pan zacz¹æ wyjaœniaæ swój problem. <CHARNAME> czeka, a¿ us³yszy o co dok³adnie panu chodzi.~ */
  IF ~~ THEN EXTERN ~KPMERC01~ 1
END

IF ~~ THEN BEGIN 49 // from:
  SAY #40253 /* ~Hmm... jak ju¿ rzek³em, nie mo¿na go ca³kiem zignorowaæ. Wielu ludzi przyjdzie z pretensjami, jeœli coœ stanie siê z ich gospodarstwem. Prêdzej czy póŸniej nale¿y zaj¹æ siê tymi bandytami.~ */
  IF ~~ THEN GOTO 50
END

IF ~~ THEN BEGIN 50 // from: 49.0
  SAY #40254 /* ~Jednak nie mamy wystarczaj¹cych si³, aby mierzyæ siê z nimi; nasze patrole nie s¹ zbyt silne liczebnie. Z pewnoœci¹ zbóje ju¿ to dostrzegli. Potrzeba nam najemnych ¿o³nierzy, <PRO_LADYLORD>.~ */
  IF ~~ THEN GOTO 51
END

IF ~~ THEN BEGIN 51 // from: 50.0
  SAY #40255 /* ~Znam kilka solidnych kompanii najemników, które mo¿na by zatrudniæ za piêæ setek w z³ocie. To rozwi¹za³oby problem. Mm... mniemam, i¿ moglibyœmy nawet zap³aciæ tylko 250, ale wtedy zajê³oby to wiêcej czasu.~ */
  IF ~~ THEN EXTERN ~KPMERC01~ 5
END

IF ~~ THEN BEGIN 52 // from:
  SAY #40310 /* ~Dobrze, <PRO_LADYLORD>. Uczynimy, jak nam przyka¿esz. Co mam zrobiæ w kwestii zbójców?~ */
  IF ~PartyGoldGT(499)
~ THEN REPLY #40311 /* ~WeŸ ze skarbca ca³e piêæset sztuk z³ota i sprowadŸ najemników. Niech siê szybko z nimi rozprawi¹.~ */ DO ~AddExperienceParty(15500)
ActionOverride("TOLMAS",TakePartyGold(500))
IncrementGlobal("KPRevolt","GLOBAL",-1)
~ GOTO 53
  IF ~PartyGoldGT(249)
~ THEN REPLY #40312 /* ~Mo¿esz wydaæ dwieœcie piêædziesi¹t sztuk z³ota. Niech to potrwa d³u¿ej, ale skutek bêdzie taki sam.~ */ DO ~AddExperienceParty(11500)
ActionOverride("TOLMAS",TakePartyGold(250))
~ GOTO 53
  IF ~~ THEN REPLY #40313 /* ~Na razie nic. Kiedy zbudujemy w³asne si³y, sami siê nimi zajmiemy.~ */ DO ~IncrementGlobal("KPRevolt","GLOBAL",1)
~ GOTO 53
END

IF ~~ THEN BEGIN 53 // from: 52.2 52.1 52.0
  SAY #40314 /* ~Jak rozka¿esz. Rozeœlê te¿ zaproszenia do gildii kupieckich z okolicy... mo¿e znajdziemy kogoœ innego, kto zachce sprzedawaæ dobra miejscowym.~ */
  IF ~~ THEN GOTO 54
END

IF ~~ THEN BEGIN 54 // from: 53.0
  SAY #40315 /* ~Stra¿e, zabraæ go, jak rozkazano.~ */
  IF ~~ THEN EXTERN ~KPMERC01~ 19
END

IF WEIGHT #4 ~GlobalTimerExpired("KPPlotTime","GLOBAL")
Global("KeepPlot","GLOBAL",2)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 55 // from:
  SAY #40317 /* ~Witaj, wasza dostojnoœæ. Jest pewna kwestia delikatnej natury, o której chce z tob¹ mówiæ kapitan Cernick. Czy zgodzisz siê go przyj¹æ?~ [KPDOMO09] */
  IF ~~ THEN REPLY #40318 /* ~Oczywiœcie, wprowadŸ go.~ */ GOTO 57
  IF ~~ THEN REPLY #40319 /* ~Nie, nie mam dla niego czasu.~ */ GOTO 56
END

IF ~~ THEN BEGIN 56 // from: 55.1
  SAY #40320 /* ~Jeœli tak ka¿esz, <PRO_LADYLORD>, tedy powiem kapitanowi Cernickowi, aby rozstrzygn¹³ sprawê wedle w³asnego rozs¹dku.~ */
  IF ~~ THEN DO ~IncrementGlobal("KPRevolt","GLOBAL",1)
SetGlobalTimer("KPPlotTime","GLOBAL",FOUR_DAYS)
SetGlobal("KeepPlot","GLOBAL",3)
~ GOTO 25
END

IF ~~ THEN BEGIN 57 // from: 55.0
  SAY #40321 /* ~Jak sobie ¿yczysz, <PRO_LADYLORD>. Poœlê po niego natychmiast.~ */
  IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("Cut32c")
~ EXIT
END

IF ~~ THEN BEGIN 58 // from:
  SAY #40326 /* ~Jest on twoim poddanym, <PRO_LADYLORD>, wiêc masz prawo zadecydowaæ o karze dla niego... pamiêtaj jednak, ¿e obserwuj¹ ciê oczy tych, którzy s¹ nieprzychylni twym rz¹dom.~ */
  IF ~~ THEN REPLY #40327 /* ~Myœlê, ¿e przewina jest oczywista. Nie mogê pozwoliæ, aby w mym zamku gnieŸdzili siê z³odzieje. Natychmiast wykonaæ egzekucjê.~ */ GOTO 59
  IF ~~ THEN REPLY #40328 /* ~Nie mogê dopuœciæ, aby s³u¿ba zamkowa krad³a. Wyrzuæcie go z zamku... niech wraca na swoje gospodarstwo.~ */ GOTO 60
  IF ~~ THEN REPLY #40330 /* ~Co o tym s¹dzisz, Cernick? Czy to ju¿ siê kiedyœ zdarza³o?~ */ EXTERN ~KPCAPT02~ 15
  IF ~~ THEN REPLY #40329 /* ~Najpierw chcia³bym wys³uchaæ, co sam Lastin ma do powiedzenia w tej sprawie.~ ~Najpierw chcia³abym wys³uchaæ, co sam Lastin ma do powiedzenia w tej sprawie~ */ EXTERN ~KPGRD01~ 2
END

IF ~~ THEN BEGIN 59 // from: 58.0
  SAY #40331 /* ~Jak sobie ¿yczysz, <PRO_LADYLORD>. Sprawiedliwoœci stanie siê zadoœæ. S³ysza³eœ <PRO_MALEFEMALE>, kapitanie?~ */
  IF ~~ THEN DO ~IncrementGlobal("KPRevolt","GLOBAL",1)
~ EXTERN ~KPCAPT02~ 11
END

IF ~~ THEN BEGIN 60 // from: 58.1
  SAY #40335 /* ~Jeœli tak jest twoja wola, <PRO_LADYLORD>. Natychmiast zostanie wydalony z szeregów stra¿y zamkowej. S³ysza³eœ, kapitanie?~ */
  IF ~~ THEN EXTERN ~KPCAPT02~ 13
END

IF WEIGHT #5 ~GlobalTimerExpired("KPPlotTime","GLOBAL")
Global("KeepPlot","GLOBAL",3)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 61 // from:
  SAY #40376 /* ~Witaj, wasza dostojnoœæ. Pewien cz³owiek... czeka od d³u¿szego czasu na audiencjê. Mam go wpuœciæ czy odes³aæ?~ [KPDOMO09] */
  IF ~~ THEN REPLY #40377 /* ~Przyjmê go.~ */ GOTO 64
  IF ~~ THEN REPLY #40378 /* ~Czego chce?~ */ GOTO 63
  IF ~~ THEN REPLY #40379 /* ~Odeœlij go, nie mam czasu na audiencje.~ */ GOTO 62
END

IF ~~ THEN BEGIN 62 // from: 63.1 61.2
  SAY #40380 /* ~Bezzw³ocznie tak uczyniê, <PRO_LADYLORD>. Proszê wybaczyæ, i¿ niepokoi³em.~ */
  IF ~~ THEN DO ~SetGlobalTimer("KPPlotTime","GLOBAL",SEVEN_DAYS)
SetGlobal("KeepPlot","GLOBAL",4)
~ GOTO 25
END

IF ~~ THEN BEGIN 63 // from: 61.1
  SAY #40381 /* ~Nie jestem pewien, <PRO_LADYLORD>. Twierdzi, ¿e jest kap³anem Tempusa, lecz jak na osobê oddan¹ sprawom ducha zdaje siê byæ raczej krzepki i surowy. Chce rozmawiaæ tylko z tob¹...~ */
  IF ~~ THEN REPLY #40382 /* ~Wiêc go wprowadŸ.~ */ GOTO 64
  IF ~~ THEN REPLY #40383 /* ~A wiêc odeœlij go.~ */ GOTO 62
END

IF ~~ THEN BEGIN 64 // from: 63.0 61.0
  SAY #40384 /* ~Jak sobie ¿yczysz, <PRO_LADYLORD>. Wprowadzê go przed twoje oblicze.~ */
  IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("Cut32d")
~ EXIT
END

IF ~~ THEN BEGIN 65 // from:
  SAY #40392 /* ~Ten ca³y... kap³an. Teraz, kiedy ju¿ znam jego imiê, przypomnia³o mi siê, i¿ dotar³y mnie o nim pewne s³uchy. Zdaje siê, ¿e wyrzucono go z jego ostatniej parafii w jakiejœ wiosce na po³udniu, gdzieœ w Tethyrze...~ */
  IF ~~ THEN EXTERN ~KPCHAP01~ 5
END

IF ~~ THEN BEGIN 66 // from:
  SAY #40395 /* ~Có¿... skoro nalegasz, aby go przyj¹æ... Nie radzi³bym wpuszczaæ go do kaplicy rodowej na ni¿szym poziomie, ale... ta ma³a kapliczka na tym piêtrze powinna mu wystarczyæ, jak mniemam. Zadecyduj.~ */
  IF ~~ THEN REPLY #40396 /* ~Dobrze. Umieœæ go w kaplicy i zobaczymy, co z tego bêdzie.~ */ DO ~AddExperienceParty(15500)
IncrementGlobal("KPRevolt","GLOBAL",-1)
~ EXTERN ~KPCHAP01~ 7
  IF ~~ THEN REPLY #40397 /* ~Nie przyjmê obcego w mury zamku... szczególnie cz³owieka o w¹tpliwej reputacji.~ */ DO ~AddExperienceParty(11500)~ EXTERN ~KPCHAP01~ 9
  IF ~~ THEN REPLY #40398 /* ~OdejdŸ, kap³anie. Chyba uwa¿asz mnie za osobê niespe³na rozumu, jeœli myœlisz, ¿e zaoferujê ci bezpieczne schronienie.~ */ EXTERN ~KPCHAP01~ 10
END

IF ~~ THEN BEGIN 67 // from:
  SAY #40400 /* ~Tak... a wiêc zaprowadzê ciê do...~ */
  IF ~~ THEN EXTERN ~KPCHAP01~ 8
END

IF WEIGHT #6 ~GlobalTimerExpired("KPPlotTime","GLOBAL")
Global("KeepPlot","GLOBAL",4)
InPartySlot(LastTalkedToBy,0)
GlobalTimerNotExpired("KeepImportant","GLOBAL")
~ THEN BEGIN 68 // from:
  SAY #40422 /* ~Dobrze, ¿e ciê spotykam, <PRO_LADYLORD>! Lord Farthington Roenall we w³asnej osobie przyby³ i pragnie siê z tob¹ rozmówiæ. Jest trochê... niespokojny..., gdy¿ musia³ ju¿ d³ugo czekaæ i nie wygl¹da na zadowolonego.~ */
  IF ~~ THEN GOTO 69
END

IF ~~ THEN BEGIN 69 // from: 68.0
  SAY #40423 /* ~Nie wiem czego chce... za¿¹da³ widzieæ siê tylko z tob¹ i z nikim innym. Ja... ja tylko wierzê, i¿ obejdzie siê bez rozlewu krwi! Czy mam... wprowadziæ go teraz, <PRO_LADYLORD>?~ */
  IF ~~ THEN REPLY #40424 /* ~Oczywiœcie, zobaczmy, co ma do powiedzenia.~ */ GOTO 71
  IF ~~ THEN REPLY #40425 /* ~Nie czujê potrzeby ogl¹dania jego pyska. Odeœlij go.~ */ GOTO 70
END

IF ~~ THEN BEGIN 70 // from: 69.1
  SAY #40426 /* ~C-co? Czy... czy mówisz serio, <PRO_LADYLORD>? Lord Roenall poczuje siê... bardzo ura¿ony!~ */
  IF ~~ THEN REPLY #40427 /* ~Auuu... có¿ za szkoda, prawda?~ */ GOTO 72
  IF ~~ THEN REPLY #40428 /* ~Nie obchodzi mnie to. Czyñ, co mówiê.~ */ GOTO 72
  IF ~~ THEN REPLY #40429 /* ~(wzdycha) Dobrze wiêc... wprowadŸ go.~ */ GOTO 71
END

IF ~~ THEN BEGIN 71 // from: 70.2 69.0
  SAY #40430 /* ~Przybêdzie tu za chwilê, wraz z ca³¹ swoj¹ œwit¹.~ */
  IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("Cut32e")
~ EXIT
END

IF ~~ THEN BEGIN 72 // from: 70.1 70.0
  SAY #40431 /* ~Tak... rozumiem. Powiadomiê go wiêc, ¿e nie zostanie przyjêty.~ */
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
  SAY #40432 /* ~Wasza dostojnoœæ! Powracasz! Przykro mi, ale przybywasz zbyt póŸno, aby spotkaæ siê z Lordem Roenallem. By³ wœciek³y, ¿e musia³ na ciebie czekaæ i odjecha³ st¹d w wielkim gniewie.~ [KPDOMO10] */
  IF ~~ THEN GOTO 74
END

IF ~~ THEN BEGIN 74 // from: 73.0
  SAY #40433 /* ~Ale zostawi³ mi... przes³anie dla ciebie. Rzek³, i¿ nie uznaje twoich praw do warowni... ani prawa Pani Nalii do dysponowania losami tej ziemi. Rzek³, i¿ powróci... z wojskiem.~ */
  IF ~~ THEN GOTO 75
END

IF ~~ THEN BEGIN 75 // from: 77.0 74.0
  SAY #40434 /* ~Kapitan Cernick obieca³, i¿ zrobi co w jego mocy, aby przygotowaæ nasze si³y, lecz chyba niewiele mo¿e uczyniæ. Byæ mo¿e Lord Roenall chcia³ nas tylko nastraszyæ, ale... nie mam pewnoœci.~ */
  IF ~~ THEN GOTO 76
END

IF ~~ THEN BEGIN 76 // from: 75.0
  SAY #40435 /* ~Tak czy inaczej, kapitan Cernick rozes³a³ zwiadowców na granice naszych ziem. Jeœli wojska Lorda Roenalla rusz¹, bezzw³ocznie siê o tym dowiemy. Powiadomiê ciê, jeœli tak siê stanie.~ */
  IF ~~ THEN EXIT
END

IF WEIGHT #8 ~Global("KeepPlot","GLOBAL",16)
~ THEN BEGIN 77 // from:
  SAY #40439 /* ~Wasza dostojnoœæ! Powracasz! Ja.. spodziewa³em siê, ¿e do tego dojdzie. Pozwoli³em sobie pomówiæ z kapitanem Cernickiem, <PRO_LADYLORD>...~ [KPDOMO10] */
  IF ~~ THEN DO ~SetGlobal("KeepPlot","GLOBAL",5)
~ GOTO 75
END

IF WEIGHT #9 ~GlobalTimerExpired("KPPlotTime","GLOBAL")
Global("KeepPlot","GLOBAL",5)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 78 // from:
  SAY #40455 /* ~Witaj, wasza dostojnoœæ. Mamy tu ma³y k³opot, o którym zapewne nic ci nie wiadomo.~ [KPDOMO09] */
  IF ~~ THEN GOTO 79
END

IF ~~ THEN BEGIN 79 // from: 78.0
  SAY #40456 /* ~Nie wiem, czy znasz Chanelle... dziewczyna jest s³u¿k¹ w zamku przez ca³e swoje ¿ycie. By³a sierot¹ i ród d'Arnise przyj¹³ j¹ w sw¹ s³u¿bê, kiedy by³a jeszcze dzieckiem.~ */
  IF ~~ THEN GOTO 80
END

IF ~~ THEN BEGIN 80 // from: 79.0
  SAY #40457 /* ~<PRO_LADYLORD>, jako ¿e ty w³adasz zamkiem, jesteœ teraz jej prawnym opiekunem. Na co dzieñ nie musisz nawet o tym pamiêtaæ, lecz teraz pojawi³o siê dwóch mê¿czyzn, którzy pragn¹ posi¹œæ jej rêkê.~ */
  IF ~~ THEN GOTO 81
END

IF ~~ THEN BEGIN 81 // from: 80.0
  SAY #40459 /* ~Decyzja, komu j¹ oddaæ, nale¿y do ciebie, <PRO_LADYLORD>. Zadecyduj, który z nich otrzyma b³ogos³awieñstwo i zgodê na zaœlubienie Chanelle.~ */
  IF ~~ THEN GOTO 82
END

IF ~~ THEN BEGIN 82 // from: 81.0
  SAY #40461 /* ~Czy mam przywieœæ ich przed twe oblicze, <PRO_LADYLORD>? Je¿eli odmówisz... wtedy ¿aden z nich nie bêdzie móg³ poœlubiæ Chanelle. Pewien jestem, ¿e dziewczyna nie chcia³aby tego.~ */
  IF ~~ THEN REPLY #40462 /* ~Oczywiœcie. PrzyprowadŸ wszystkich.~ */ GOTO 84
  IF ~~ THEN REPLY #40463 /* ~No to szkoda, bo nie mam teraz dla nich czasu.~ */ GOTO 83
END

IF ~~ THEN BEGIN 83 // from: 82.1
  SAY #40464 /* ~Jak... jak sobie ¿yczysz, <PRO_LADYLORD>. Przeka¿ê Chanelle nieszczêsn¹ wieœæ.~ */
  IF ~~ THEN DO ~IncrementGlobal("KPRevolt","GLOBAL",1)
SetGlobalTimer("KPPlotTime","GLOBAL",FOUR_DAYS)
SetGlobal("KeepPlot","GLOBAL",6)
~ GOTO 25
END

IF ~~ THEN BEGIN 84 // from: 82.0
  SAY #40465 /* ~Poœlê po nich natychmiast, <PRO_LADYLORD>. To zajmie tylko chwilkê.~ */
  IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("Cut32g")
~ EXIT
END

IF WEIGHT #10 ~Global("KeepPlot","GLOBAL",20)
~ THEN BEGIN 85 // from:
  SAY #40466 /* ~(wzdycha) Oto, rzecz jasna, Chanell... jedna ze s³u¿ek zamkowych, wasza dostojnoœæ.~ */
  IF ~~ THEN DO ~SetGlobal("KeepPlot","GLOBAL",6)
~ EXTERN ~KPMAID01~ 6
END

IF ~~ THEN BEGIN 86 // from:
  SAY #40468 /* ~Wy³uszcz w³asnymi s³owami gdzie dok³adnie tkwi problem.~ */
  IF ~~ THEN EXTERN ~KPMAID01~ 7
END

IF ~~ THEN BEGIN 87 // from:
  SAY #40477 /* ~Hmm. Z tego, co pamiêtam, taka obietnica faktycznie pad³a... i tradycja j¹ potwierdza. Ale to od ciebie, <PRO_LADYLORD>, zale¿y, jaki posag przygotujesz dla dziewczyny.~ */
  IF ~~ THEN EXTERN ~KPRANG02~ 3
END

IF ~~ THEN BEGIN 88 // from:
  SAY #40483 /* ~Doœæ! <CHARNAME> podejmie decyzjê w tej sprawie.~ */
  IF ~~ THEN REPLY #40484 /* ~Malvolio zapewni jej lepsz¹ przysz³oœæ... lepsz¹ ni¿ to, co czeka j¹ tutaj. To najlepszy wybór.~ */ DO ~IncrementGlobal("KPRevolt","GLOBAL",1)
~ EXTERN ~KPRANG02~ 4
  IF ~~ THEN REPLY #40485 /* ~Wyboru dokona³o serce Chanelle, a ja nie bêdê mu stawaæ na drodze. Niechaj zostanie poœlubiona Jessupowi, jeœli tego pragnie.~ */ DO ~AddExperienceParty(15500)~ EXTERN ~KPMAID01~ 13
  IF ~~ THEN REPLY #40486 /* ~Myœlê, ¿e obydwaj zupe³nie siê nie nadaj¹. Chanelle, nie poœlubisz ¿adnego z nich.~ */ DO ~IncrementGlobal("KPRevolt","GLOBAL",1)
~ EXTERN ~KPMAID01~ 17
END

IF WEIGHT #11 ~GlobalTimerExpired("KPPlotTime","GLOBAL")
Global("KeepPlot","GLOBAL",6)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 89 // from:
  SAY #40514 /* ~Witaj, wasza dostojnoœæ. Czeka na ciebie... jakaœ para, która niedawno przyby³a i prosi o audiencjê. Mê¿czyzna i kobieta, schludnie przyodziani.~ [KPDOMO09] */
  IF ~~ THEN GOTO 90
END

IF ~~ THEN BEGIN 90 // from: 89.0
  SAY #40515 /* ~Nie chcieli rzec, co ich sprowadza, twierdz¹, ¿e bêd¹ mówiæ tylko z tob¹. Czy... udzielisz im audiencji, <PRO_LADYLORD>? Czy mam ich po prostu odes³aæ?~ */
  IF ~~ THEN REPLY #40516 /* ~WprowadŸ ich. Przynajmniej wys³ucham czego chc¹.~ */ GOTO 92
  IF ~~ THEN REPLY #40517 /* ~Odeœlij ich. Nie bêdê trwoni³ czasu na pogawêdki z nieznajomymi.~ */ DO ~IncrementGlobal("KPRevolt","GLOBAL",1)
~ GOTO 91
END

IF ~~ THEN BEGIN 91 // from: 90.1
  SAY #40521 /* ~Doskonale, <PRO_LADYLORD>. Uczyniê to niezw³ocznie.~ */
  IF ~~ THEN DO ~SetGlobalTimer("KPPlotTime","GLOBAL",FOUR_DAYS)
SetGlobal("KeepPlot","GLOBAL",7)
~ GOTO 25
END

IF ~~ THEN BEGIN 92 // from: 90.0
  SAY #40523 /* ~Hmm. Dobrze, <PRO_LADYLORD>. Ka¿ê ich wprowadziæ.~ */
  IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("Cut32h")
~ EXIT
END

IF ~~ THEN BEGIN 93 // from:
  SAY #40531 /* ~Niedorzecznoœæ! Nie ma takiego d³ugu! Wiedzia³bym o tym!~ */
  IF ~~ THEN EXTERN ~KPLEND01~ 3
END

IF ~~ THEN BEGIN 94 // from:
  SAY #40534 /* ~Co? Niech ja na to spojrzê!~ */
  IF ~~ THEN GOTO 95
END

IF ~~ THEN BEGIN 95 // from: 94.0
  SAY #40535 /* ~...hmmm...~ */
  IF ~~ THEN GOTO 97
END

IF ~~ THEN BEGIN 96 // from: 97.0
  SAY #40536 /* ~W czasie najazdu trolli zaginê³o wiele rzeczy, w tym tak¿e pieczêæ Lorda d'Arnise. Ci ludzie mogli j¹ gdzieœ zdobyæ i wykorzystaæ do fa³szowania dokumentów...~ */
  IF ~~ THEN EXTERN ~KPLEND02~ 3
END

IF ~~ THEN BEGIN 97 // from: 95.0
  SAY #40537 /* ~Podpis Lorda d'Arnise wygl¹da na oryginalny, <PRO_LADYLORD>. Na laku wyciœniêto jego pieczêæ. Ale nie mo¿na stwierdziæ, kiedy to siê sta³o.~ */
  IF ~~ THEN GOTO 96
END

IF WEIGHT #12 ~Global("KeepPlot","GLOBAL",10)
~ THEN BEGIN 98 // from:
  SAY #40565 /* ~Dobrze... teraz wiêc, kiedy ju¿ za³atwiliœmy siê z t¹ dwójk¹, trzeba nam jeszcze zaj¹æ siê ich groŸb¹. Jeœli miejscowi s¹ im winni pieni¹dze i bêd¹ musieli natychmiast sp³aciæ d³ug, z pewnoœci¹ zrodz¹ siê niepokoje!~ */
  IF ~~ THEN DO ~SetGlobal("KeepPlot","GLOBAL",7)
~ GOTO 99
END

IF ~~ THEN BEGIN 99 // from: 98.0
  SAY #40566 /* ~Czy uczynimy coœ w tej materii, <PRO_LADYLORD>?~ */
  IF ~~ THEN REPLY #40567 /* ~Jeœli ludzie po¿yczali od tych szalbierzy, to sami s¹ sobie winni! Niech sami radz¹ sobie z problemem.~ */ DO ~IncrementGlobal("KPRevolt","GLOBAL",1)
~ GOTO 100
  IF ~PartyGoldGT(499)
~ THEN REPLY #40568 /* ~Rozdaj im 500 sztuk z³ota. Z chêci¹ pomogê i op³acê po³owê, ale resztê bêd¹ musieli zdobyæ sami.~ */ DO ~AddExperienceParty(11500)
TakePartyGold(500)
~ GOTO 101
  IF ~PartyGoldGT(999)
~ THEN REPLY #40569 /* ~Wy³o¿ê ca³y tysi¹c. Nie pozwolê, aby ludzie cierpieli tylko dlatego, ¿e jacyœ oszuœci usi³owali zagraæ mi na nosie.~ */ DO ~AddExperienceParty(15500)
TakePartyGold(1000)
IncrementGlobal("KPRevolt","GLOBAL",-1)
~ GOTO 102
END

IF ~~ THEN BEGIN 100 // from: 99.0
  SAY #40570 /* ~Tak. Chyba masz racjê, <PRO_LADYLORD>. Przynajmniej ta para nieuczciwców nie skorzysta na swoich haniebnych czynach.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 101 // from: 99.1
  SAY #40571 /* ~Nie wiem czy uda im siê zebraæ 500 w z³ocie, ale z pewnoœci¹ czynisz sprawiedliwie. Natychmiast rozdam pieni¹dze, <PRO_LADYLORD>.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 102 // from: 99.2
  SAY #40572 /* ~Twoja hojnoœæ nie zna granic. To bardzo rozs¹dne, <PRO_LADYLORD>. W ten sposób zamykasz drogê do nastêpnych szanta¿ów. Natychmiast wydam odpowiednie rozkazy.~ */
  IF ~~ THEN EXIT
END

IF WEIGHT #13 ~GlobalTimerExpired("KPPlotTime","GLOBAL")
Global("KeepPlot","GLOBAL",7)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 103 // from:
  SAY #40578 /* ~Wasza dostojnoœæ! Przybywasz! To straszliwe, nieprawda¿? Czy¿ twe oczy widzia³y ju¿ zniszczenia, jakie wywo³a³a powódŸ? Woda wygna³a wielu z ich gospodarstw...~ */
  IF ~~ THEN GOTO 104
END

IF ~~ THEN BEGIN 104 // from: 103.0
  SAY #40579 /* ~To sprawka tych starych grobli, <PRO_LADYLORD>. Lord d'Arnise ju¿ dawno zamierza³ zast¹piæ je nowymi, ale zawsze odk³ada³ tê sprawê na przysz³y rok.~ */
  IF ~~ THEN GOTO 105
END

IF ~~ THEN BEGIN 105 // from: 104.0
  SAY #40580 /* ~A teraz to siê zemœci³o. Wielu miejscowych prosi o rozmowê z tob¹... wielu jest rozdra¿nionych! Wybra³em spoœród nich ma³¹ delegacjê...~ */
  IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("Cut32j")
~ EXIT
END

IF ~~ THEN BEGIN 106 // from:
  SAY #40588 /* ~Uspokójcie siê wszyscy! <CHARNAME> i tak uczyni, jak uzna za stosowne, i nic tego nie zmieni! Proszê... opanujcie swe nerwy...~ */
  IF ~~ THEN GOTO 107
END

IF ~~ THEN BEGIN 107 // from: 106.0
  SAY #40589 /* ~<PRO_LADYLORD>, obrachowa³em koszty naprawy zniszczeñ i odbudowy grobli. Do ciebie nale¿y wybór, co uczynimy pierwej.~ */
  IF ~~ THEN GOTO 108
END

IF ~~ THEN BEGIN 108 // from: 107.0
  SAY #40590 /* ~Zniszczenia, jakie woda wyrz¹dzi³a na groblach s¹ znaczne. Szkoda, ¿e nie mamy dostêpu do skarbca Lorda d'Arnise, bo koszt odbudowy to... ee... ponad 5000 sztuk z³ota.~ */
  IF ~PartyGoldGT(4999)
~ THEN REPLY #40591 /* ~Jeœli tyle trzeba do odbudowy, wy³o¿ê tak¹ sumê. Niechaj bêdzie 5000 sztuk z³ota.~ */ DO ~AddExperienceParty(15500)
ActionOverride("kpfarm01",TakePartyGold(5000))
~ EXTERN ~KPFARM01~ 2
  IF ~PartyGoldGT(999)
~ THEN REPLY #40592 /* ~Mogê zap³aciæ jeno za czêœæ odbudowy, nie pokryjê pe³nej sumy.~ */ DO ~AddExperienceParty(4500)~ GOTO 112
  IF ~~ THEN REPLY #40593 /* ~Ludzie bêd¹ musieli sami zadbaæ o odbudowê w³asnych gospodarstw. Wspó³czujê im, lecz nic nie mogê uczyniæ.~ */ DO ~IncrementGlobal("KPRevolt","GLOBAL",5)
~ EXTERN ~KPFARM01~ 6
END

IF ~~ THEN BEGIN 109 // from:
  SAY #40597 /* ~Groble s¹... prawie równie drogie, dlatego w³aœnie Lord d'Arnise tak odk³ada³ budowê. 2000 sztuk z³ota trzeba na ich odbudowê, <PRO_LADYLORD>... to powa¿ny wydatek, zdaje sobie sprawê...~ */
  IF ~PartyGoldGT(1999)
~ THEN REPLY #40598 /* ~Jeœli dziêki temu unikniemy dalszych problemów, trzeba to niezw³ocznie uczyniæ. Wydaj te dwa tysi¹ce w z³ocie i napraw groble.~ */ DO ~ActionOverride("kpfarm01",TakePartyGold(2000))
IncrementGlobal("KPRevolt","GLOBAL",-1)
~ GOTO 110
  IF ~~ THEN REPLY #40599 /* ~W tej chwili nie mo¿emy tego siê podj¹æ, ale stanie siê to wkrótce. Na razie skupimy siê na odbudowie gospodarstw.~ */ GOTO 111
END

IF ~~ THEN BEGIN 110 // from: 109.0
  SAY #40601 /* ~Dobrze, <PRO_LADYLORD>... zarz¹dzê, aby natychmiast zacz¹æ odbudowê grobli.~ */
  IF ~GlobalLT("KPRevolt","GLOBAL",0)~ THEN EXTERN ~KPFARM02~ 3
  IF ~GlobalGT("KPRevolt","GLOBAL",0)
GlobalLT("KPRevolt","GLOBAL",5)~ THEN EXTERN ~KPFARM03~ 2
  IF ~GlobalGT("KPRevolt","GLOBAL",4)
GlobalLT("KPRevolt","GLOBAL",10)~ THEN EXTERN ~KPFARM01~ 4
  IF ~GlobalGT("KPRevolt","GLOBAL",9)~ THEN EXTERN ~KPFARM01~ 5
END

IF ~~ THEN BEGIN 111 // from: 109.1
  SAY #40602 /* ~Jak... sobie ¿yczysz, <PRO_LADYLORD>. Mo¿na z tym zaczekaæ do przysz³ego roku, lecz lepiej nie odk³adaæ tego jeszcze d³u¿ej. Lord d'Arnise i tak zwleka³ z tym wiele czasu.~ */
  IF ~GlobalLT("KPRevolt","GLOBAL",0)~ THEN EXTERN ~KPFARM02~ 3
  IF ~GlobalGT("KPRevolt","GLOBAL",0)
GlobalLT("KPRevolt","GLOBAL",5)~ THEN EXTERN ~KPFARM03~ 2
  IF ~GlobalGT("KPRevolt","GLOBAL",4)
GlobalLT("KPRevolt","GLOBAL",10)~ THEN EXTERN ~KPFARM01~ 4
  IF ~GlobalGT("KPRevolt","GLOBAL",9)~ THEN EXTERN ~KPFARM01~ 5
END

IF ~~ THEN BEGIN 112 // from: 108.1
  SAY #40618 /* ~Ile z tych piêciu tysiêcy chcia³byœ im u¿yczyæ, <PRO_LADYLORD>?~ */
  IF ~PartyGoldGT(4999)~ THEN REPLY #40619 /* ~W zasadzie daj im ca³e piêæ tysiêcy w z³ocie. Zmieni³em zdanie.~ ~W zasadzie daj im ca³e piêæ tysiêcy w z³ocie. Zmieni³am zdanie.~ */ DO ~AddExperienceParty(8500)
ActionOverride("kpfarm01",TakePartyGold(5000))~ EXTERN ~KPFARM01~ 2
  IF ~PartyGoldGT(3999)~ THEN REPLY #40620 /* ~Daj im 4000 sztuk z³ota. To wszystko na co mnie staæ.~ */ DO ~AddExperienceParty(6500)
ActionOverride("kpfarm01",TakePartyGold(4000))
IncrementGlobal("KPRevolt","GLOBAL",1)~ EXTERN ~KPFARM03~ 6
  IF ~PartyGoldGT(2999)~ THEN REPLY #40621 /* ~Daj im 3000 sztuk z³ota. To wszystko na co mnie staæ.~ */ DO ~AddExperienceParty(4500)
ActionOverride("kpfarm01",TakePartyGold(3000))
IncrementGlobal("KPRevolt","GLOBAL",2)~ EXTERN ~KPFARM03~ 6
  IF ~PartyGoldGT(1999)~ THEN REPLY #40622 /* ~Daj im 2000 sztuk z³ota. Resztê bêd¹ musieli sami zgromadziæ.~ */ DO ~AddExperienceParty(2500)
ActionOverride("kpfarm01",TakePartyGold(2000))
IncrementGlobal("KPRevolt","GLOBAL",3)~ EXTERN ~KPFARM01~ 8
  IF ~PartyGoldGT(999)~ THEN REPLY #40623 /* ~Daj im 1000 sztuk z³ota. Resztê bêd¹ musieli sami zgromadziæ.~ */ DO ~ActionOverride("kpfarm01",TakePartyGold(1000))
IncrementGlobal("KPRevolt","GLOBAL",4)~ EXTERN ~KPFARM01~ 8
  IF ~~ THEN REPLY #40625 /* ~W zasadzie myœlê, ¿e nie mogê ich na razie wspomóc. Bêd¹ musieli poradziæ sobie sami.~ */ DO ~IncrementGlobal("KPRevolt","GLOBAL",5)~ EXTERN ~KPFARM01~ 6
END

IF WEIGHT #14 ~GlobalTimerExpired("KPPlotTime","GLOBAL")
Global("KeepPlot","GLOBAL",8)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 113 // from:
  SAY #40646 /* ~Wasza dostojnoœæ! Powracasz! Dziêki bogom, ¿e pojawiasz siê w³aœnie teraz! Wojska Lorda Roenalla nam zagra¿aj¹!~ [KPDOMO10] */
  IF ~~ THEN GOTO 114
END

IF ~~ THEN BEGIN 114 // from: 113.0
  SAY #40647 /* ~Ja... nie wierzy³em, ¿e Lord Roenall zaatakuje. Kapitan Cernick dostrzeg³ ich wojska i wyruszy³ im na spotkanie... planuje przynajmniej spowolniæ ich pochód...~ */
  IF ~~ THEN GOTO 115
END

IF ~~ THEN BEGIN 115 // from: 114.0
  SAY #40648 /* ~Nasze si³y s¹ mniej liczne i sk³adaj¹ siê ze œwie¿ych rekrutów... nie ma nadziei, ¿e zwyciê¿ymy! Och, oni tu przybêd¹ lada chwila... Lord Roenall przemoc¹ opanuje zamek!~ */
  IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ 198
  IF ~!IsValidForPartyDialog("Nalia")~ THEN GOTO 116
END

IF ~~ THEN BEGIN 116 // from: 115.1
  SAY #40652 /* ~Dwie godziny temu dotar³y mnie wieœci z pola boju... Kapitan Cernick rzecze, i¿ bitwa...~ */
  IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("Cut32k")
~ EXIT
END

IF WEIGHT #15 ~Global("KeepPlot","GLOBAL",13)
Dead("kproen01")
~ THEN BEGIN 117 // from:
  SAY #40678 /* ~Oddzia³y Lorda Roenalla zosta³y rozbite dziêki twoim wysi³kom, wasza dostojnoœæ. Po raz wtóry uda³o ci siê ochroniæ zamek i nasze ziemie przez najazdem.~ [KPDOMO11] */
  IF ~~ THEN GOTO 118
END

IF ~~ THEN BEGIN 118 // from: 117.0
  SAY #40679 /* ~Wszyscy jesteœmy ci dozgonnie wdziêczni... i wiedz, ¿e z radoœci¹ witamy twoje przywództwo, jak tylko d³ugo bêdziesz ³askaw je roztaczaæ nad nami.~ */
  IF ~!Dead("Nalia")
!InParty("Nalia")~ THEN GOTO 120
  IF ~!Dead("Nalia")
InParty("Nalia")~ THEN EXTERN ~NALIAJ~ 199
  IF ~Dead("Nalia")~ THEN GOTO 119
END

IF ~~ THEN BEGIN 119 // from: 120.0 118.2
  SAY #40680 /* ~<CHARNAME>, <PRO_LADYLORD>, pozdrawiamy ciê... pozdrawiamy ciê i bijemy przed tob¹ uk³ony. Przyjmujemy ciê jako naszego suwerena, teraz i na zawsze...~ */
  IF ~~ THEN DO ~EraseJournalEntry(3030)
EraseJournalEntry(3031)
EraseJournalEntry(3032)
EraseJournalEntry(3033)
AddExperienceParty(50000)
SetGlobal("KeepPlot","GLOBAL",14)
~ SOLVED_JOURNAL #3036 /* ~Rz¹dzê twierdz¹ i ziemiami rodu d'Arnise

W koñcu Roenallowie zostali pokonani. W¹tpiê czy szybko powróc¹ skoro Lord Farthington nie ¿yje. Moja pozycja w³adcy zamku zosta³a wzmocniona... przy odrobinie szczêœcia od tej pory w zamku d'Arnisów bêdzie spokojnie.~ */ EXIT
END

IF ~~ THEN BEGIN 120 // from: 118.0
  SAY #40681 /* ~Pani Nalia rzek³a nam, i¿ pragnie tylko pozostaæ w warowni... lecz bez twej pomocy, nie mia³aby ju¿ czym w³adaæ.~ */
  IF ~~ THEN GOTO 119
END

IF ~~ THEN BEGIN zgoda
SAY ~Natychmiast.~
IF ~~ THEN EXIT
END
