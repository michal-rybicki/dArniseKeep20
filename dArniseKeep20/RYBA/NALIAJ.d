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
  SAY #24282 /* ~To tu... zaczekaj, jest tu palisada? Nasze stra¿e wycofa³y siê wtedy i... twierdza pad³a. Trudno j¹ bêdzie teraz uratowaæ. Palisada znajduje siê na zachód st¹d.~ */
  IF ~~ THEN REPLY #24290 /* ~Myœlê, ¿e powinnaœ mi w koñcu powiedzieæ, przeciwko komu stajemy.~ */ DO ~SetGlobal("EnteredAR1300","GLOBAL",1)
SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",ONE_DAY)
~ GOTO 149
  IF ~~ THEN REPLY #24291 /* ~A niech to! Dobra, muszê wiedzieæ, przeciwko komu stajemy, i to zaraz!~ */ DO ~SetGlobal("EnteredAR1300","GLOBAL",1)
SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",ONE_DAY)
~ GOTO 149
  IF ~~ THEN REPLY #24292 /* ~Nie pójdê ani kroku dalej, nie wiedz¹c, z kim mamy do czynienia. Nie wpl¹czê siê w to na oœlep.~ */ DO ~SetGlobal("EnteredAR1300","GLOBAL",1)
SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",ONE_DAY)
~ GOTO 149
  IF ~Global("NaliaCash","GLOBAL",1)~ THEN REPLY #49212 /* ~W takim razie cena w³aœnie wzros³a. Chcê dodatkowych 500 sztuk z³ota za moje us³ugi.~ */ DO ~SetGlobal("EnteredAR1300","GLOBAL",1)
SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",ONE_DAY)~ GOTO 248
END

IF ~~ THEN BEGIN 1 // from: 222.0
  SAY #24283 /* ~Mo¿e uciek³y tu przed elfami, albo zwabi³y je nowe osady na po³udnie od Tethyru. Nie... nie znam ich liczby, wiem tylko, ¿e musimy uratowaæ moj¹ rodzinê...~ */
  IF ~~ THEN REPLY #24293 /* ~Potrzebujemy wiêcej informacji. Frontalny atak skoñczy³by siê masakr¹.~ */ GOTO 4
  IF ~~ THEN REPLY #24294 /* ~Nie wiemy ilu ich jest, ani nawet czy jest jeszcze ktokolwiek do uratowania.~ */ GOTO 3
  IF ~~ THEN REPLY #24295 /* ~Nie wydaje mi siê, by stanowi³o to przedmiot naszej umowy. Bêdziesz musia³a znaleŸæ kogoœ innego do pomocy.~ */ GOTO 269
END

IF ~~ THEN BEGIN 2 // from: 270.0
  SAY #24284 /* ~Musisz siê zakraœæ i kogoœ uratowaæ, kogokolwiek. Byæ mo¿e... Dalesona! Stajenny Daleson móg³ prze¿yæ! Znajdziesz go?~ */
  IF ~~ THEN REPLY #24296 /* ~Dobrze, ale nie zamierzam nadstawiaæ karku. Potrzebne mi bezpieczne wejœcie.~ */ GOTO 4
  IF ~~ THEN REPLY #24297 /* ~Wolê bezpoœredni atak od skradania siê. Tylko tchórze unikaj¹ walki!~ */ GOTO 6
  IF ~~ THEN REPLY #24298 /* ~Nie, zmieniam zdanie. Nie wezmê udzia³u w twojej ma³ej wojnie.~ */ GOTO 5
END

IF ~~ THEN BEGIN 3 // from: 1.1
  SAY #24285 /* ~Wiem. Zaczekaj! Daleson nikomu nie zagra¿a. Prawdopodobnie pozostawili go przy ¿yciu by opiekowa³ siê zwierzêtami. Mo¿e znaæ ich liczebnoœæ i si³ê.~ */
  IF ~~ THEN REPLY #24299 /* ~Byæ mo¿e jest jakieœ bezpieczne wejœcie do œrodka? Nie chcê pukaæ do frontowych drzwi.~ */ GOTO 4
  IF ~~ THEN REPLY #24300 /* ~Wolê bezpoœredni atak od ca³ego tego lawirowania. Chowanie siê w cieniu zdaje siê byæ nieco tchórzliwe.~ */ GOTO 6
  IF ~~ THEN REPLY #24301 /* ~Brzmi rozs¹dnie. Poszukam go, gdy bêdê bada³ to miejsce.~ ~Brzmi rozs¹dnie. Poszukam go, gdy bêdê bada³a to miejsce.~ */ GOTO 7
END

IF ~~ THEN BEGIN 4 // from: 3.0 2.0 1.0
  SAY #24286 /* ~Na pó³noc od palisady, w œcianie twierdzy znajduj¹ siê sekretne drzwi, przejdŸ przez nie. U¿ywa³am ich by wymykaæ siê noc¹ na zewn¹trz. Ciotunia nigdy tego nie pochwala³a, ale ja o to nie dba³am.~ */
  IF ~~ THEN GOTO 8
END

IF ~~ THEN BEGIN 5 // from: 2.2
  SAY #24287 /* ~Ale... ale ty... Nie, nie bêdê siê bezowocnie spieraæ. Rozumujesz tak jak miejscowa arystokracja. Mia³am o tobie lepsze mniemanie. IdŸ sobie. Zrobiê to sama.~ */
  IF ~~ THEN DO ~LeaveParty()
SetGlobal("NaliaMove","GLOBAL",4)
SetGlobal("SPRITE_IS_DEADNalia","GLOBAL",1)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 6 // from: 3.1 2.1
  SAY #24288 /* ~Czy¿ tchórzostwem jest prze¿yæ dzieñ? Mo¿emy przypuœciæ szturm na frontowe wrota, ale co bêdzie jak trolle zdadz¹ sobie sprawê, ¿e tam jesteœmy?~ */
  IF ~~ THEN GOTO 295
END

IF ~~ THEN BEGIN 7 // from: 3.2
  SAY #24289 /* ~Najlepiej unikaæ frontowego ataku. Na pó³noc od palisady znajduj¹ siê sekretne drzwi. U¿ywam ich od czasu do czasu, gdy chcê pomóc wieœniakom.~ */
  IF ~~ THEN GOTO 8
END

IF ~~ THEN BEGIN 8 // from: 295.0 7.0 4.0
  SAY #24252 /* ~Powinniœmy wkrótce ruszaæ. Czekanie tylko pogarsza sprawê. Gdy dostaniemy siê do œrodka, postaram siê wskazywaæ drogê. Jak znajdziemy Dalesona, skoncentrujemy siê na trollach.~ */
  IF ~~ THEN UNSOLVED_JOURNAL #10074 /* ~Napaœæ na zamek d'Arnise.

Nalia powiedzia³a nam o napaœci na jej rodzinny zamek. Zajê³y go trolle wspierane przez jak¹œ "wê¿owat¹ kreaturê". Nieliczni ocaleni stra¿nicy schronili siê za palisad¹ ko³o zamku. Ale rodzina Nalii zosta³a w pu³apce. Daleson, s³uga z zamku mo¿e nam pomóc, o ile jeszcze ¿yje. Nalia poradzi³a, ¿ebyœmy po wejœciu do zamku najpierw go poszukali.
Lepiej nie wchodziæ przez g³ówn¹ bramê zamku, i tak jest zapewne zamkniêta. Na pó³noc od palisady, za krzakiem przy murach znajduje siê ukryte wejœcie do zamku.~ */ EXIT
END

IF WEIGHT #2 /* Triggers after states #: 339 even though they appear after this state */
~Global("EnteredAR1300","GLOBAL",0)
Global("Complain","LOCALS",1)
~ THEN BEGIN 9 // from:
  SAY #24376 /* ~Proszê, przecie¿ pamiêtam twoj¹ obietnicê. Musimy udaæ siê na ziemie mojej rodziny i stan¹æ w ich obronie. Jeœli chcesz zmieniæ zdanie, powiedz mi proszê.~ [NALIA69] */
  IF ~~ THEN REPLY #24377 /* ~Przykro mi za opóŸnienie. Pójdziemy tam teraz i zrobimy co w naszej mocy.~ */ DO ~IncrementGlobal("Complain","LOCALS",1)
SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",ONE_DAY)
~ GOTO 10
  IF ~~ THEN REPLY #24378 /* ~Taak, taak, ju¿ idê. Trzymaj szyjê z dala od stryczka.~ */ DO ~IncrementGlobal("Complain","LOCALS",1)
SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",ONE_DAY)
~ GOTO 10
  IF ~CheckStatGT(LastTalkedToBy,13,CHR)
~ THEN REPLY #24379 /* ~Obawiam siê, ¿e muszê najpierw za³atwiæ kilka spraw i mo¿e to spowodowaæ opóŸnienie. Wyruszê wkrótce.~ */ DO ~IncrementGlobal("Complain","LOCALS",1)
SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",ONE_DAY)
~ GOTO 11
  IF ~CheckStatLT(LastTalkedToBy,14,CHR)
~ THEN REPLY #24380 /* ~Zrobi³em co w mojej mocy. Wci¹¿ muszê jednak za³atwiæ kilka spraw i mo¿emy byæ opóŸnieni. Wyruszê wkrótce.~ ~Zrobi³am co w mojej mocy. Wci¹¿ muszê jednak za³atwiæ kilka spraw i mo¿emy byæ opóŸnieni. Wyruszê wkrótce.~ */ DO ~IncrementGlobal("Complain","LOCALS",1)
SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",ONE_DAY)
~ GOTO 12
  IF ~~ THEN REPLY #24381 /* ~W³aœciwie nie zamierzam ci pomóc. Staram siê tylko zabiæ czas.~ */ DO ~IncrementGlobal("Complain","LOCALS",1)
SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",ONE_DAY)
~ GOTO 13
  IF ~~ THEN REPLY #24382 /* ~Przykro mi, ale nie mogê ci pomóc. Muszê odmówiæ.~ */ DO ~IncrementGlobal("Complain","LOCALS",1)
SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",ONE_DAY)
~ GOTO 14
END

IF ~~ THEN BEGIN 10 // from: 9.1 9.0
  SAY #24383 /* ~Dziêkujê ci. Musimy siê jednak naprawdê pospieszyæ.~ */
  IF ~~ THEN DO ~SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",THREE_DAYS)
SetGlobal("Complain","LOCALS",2)
~ EXIT
END

IF ~~ THEN BEGIN 11 // from: 9.2
  SAY #24384 /* ~Zdajê sobie sprawê, ¿e musisz miêdzy innymi uzupe³niæ zapasy, ale jeœli wkrótce nie wyruszymy, nie bêdzie w ogóle po co iœæ. Proszê pospiesz siê.~ */
  IF ~~ THEN DO ~SetGlobalTimer("ArrivedNaliaKeep","GLOBAL",THREE_DAYS)
SetGlobal("Complain","LOCALS",2)
~ EXIT
END

IF ~~ THEN BEGIN 12 // from: 9.3
  SAY #24385 /* ~Przykro mi, ale nie mogê ju¿ d³u¿ej czekaæ. Pójdê tam i zaczekam na ciebie. Proszê, pospiesz siê, sama niewiele mogê zdzia³aæ.~ [NALIA70] */
  IF ~~ THEN DO ~SetGlobal("Complain","LOCALS",4)
LeaveParty()
SetDialog("Nalia")
ChangeAIScript("",DEFAULT)
SetGlobal("NaliaMove","GLOBAL",1)
EscapeAreaMove("AR1300",748,3227,14)
~ EXIT
END

IF ~~ THEN BEGIN 13 // from: 9.4
  SAY #24386 /* ~Sk¹d w tobie tyle okrucieñstwa?! Do widzenia, baba z wozu koniom l¿ej! Jeœli kiedykolwiek odwiedzisz moj¹ spalon¹ do cna twierdzê wspomnij na to, co siê tu dzisiaj przez ciebie wydarzy³o!~ */
  IF ~~ THEN DO ~SetGlobal("NaliaMove","GLOBAL",4)
SetGlobal("SPRITE_IS_DEADNalia","GLOBAL",1)
EscapeArea()
~ EXIT
END

IF ~~ THEN BEGIN 14 // from: 9.5
  SAY #24387 /* ~Nie mo¿na by³o wczeœniej powiedzieæ?! Muszê tam byæ! Oni mog¹ byæ ju¿... Do widzenia i dziêki za nic!~ */
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
  SAY #24388 /* ~Przykro mi, ale nie mogê ju¿ d³u¿ej czekaæ. Umówiliœmy siê, ¿e pomo¿esz ochroniæ ziemie mojej rodziny, ale zbyt d³ugo z tym zwlekamy. IdŸ za mn¹, jeœli chcesz, ale ja nie bêdê ju¿ d³u¿ej czekaæ.~ */
  IF ~~ THEN DO ~SetGlobal("Complain","LOCALS",4)
LeaveParty()
SetDialog("Nalia")
ChangeAIScript("",DEFAULT)
SetGlobal("NaliaMove","GLOBAL",1)
EscapeAreaMove("AR1300",748,3227,14)
~ UNSOLVED_JOURNAL #10073 /* ~Napaœæ na zamek d'Arnise.

Nalia odesz³a z dru¿yny i uda³a siê do rodzinnego zamku. Prosi³a, ¿ebyœmy te¿ siê tam udali, ale nie mog³a na nas czekaæ.~ */ EXIT
END

IF WEIGHT #4 /* Triggers after states #: 339 even though they appear after this state */
~Global("EnteredAR1300","GLOBAL",1)
Global("Complain","LOCALS",5)
!Dead("Torgal")
~ THEN BEGIN 16 // from:
  SAY #24389 /* ~Musimy szybko dotrzeæ do Dalesona. Jeœli go zabij¹, nigdy nie dowiemy siê z czym mamy do czynienia. Musi byæ wewn¹trz, w pobli¿u sekretnych drzwi.~ [NALIA71] */
  IF ~~ THEN DO ~SetGlobal("Complain","LOCALS",6)
~ EXIT
END

IF ~~ THEN BEGIN 17 // from:
  SAY #24596 /* ~Ciotuniu, proszê! Przybywamy by ciê uratowaæ!~ [NALIA92] */
  IF ~~ THEN EXTERN ~DELCIA~ 18
END

IF ~~ THEN BEGIN 18 // from:
  SAY #24600 /* ~Tak, tak, tak, sto albo i wiêcej razy ju¿ mi mówi³aœ o œmierci mojej matki. By³abym ci wdziêczna gdybyœ wiêcej tego nie robi³a.~ */
  IF ~~ THEN EXTERN ~DELCIA~ 19
END

IF ~~ THEN BEGIN 19 // from:
  SAY #24602 /* ~Ciotuniu! Traktuj ich z szacunkiem! Wola³abyœ raczej umrzeæ ni¿ przyj¹æ pomoc od prostaków? Mo¿emy siê od tych ludzi uczyæ wspó³czucia.~ */
  IF ~~ THEN EXTERN ~DELCIA~ 20
END

IF ~~ THEN BEGIN 20 // from:
  SAY #24608 /* ~Och, proszê, nie daj jej zacz¹æ...~ */
  IF ~~ THEN EXTERN ~DELCIA~ 44
END

IF ~~ THEN BEGIN 21 // from:
  SAY #24615 /* ~Och nie, proszê nie daj jej kontynuowaæ...~ */
  IF ~~ THEN EXTERN ~DELCIA~ 46
END

IF ~~ THEN BEGIN 22 // from:
  SAY #24620 /* ~Nie zrobisz tego! Nie bêdê tego tolerowaæ! Powiedz, ¿e to by³ ¿art, którego nie zrozumieliœmy. Powiedz...~ */
  IF ~~ THEN REPLY #24633 /* ~Przepraszam. Powinniœmy jednak ruszyæ dalej. Natychmiast. Zanim coœ... siê stanie.~ */ GOTO 24
  IF ~~ THEN REPLY #24635 /* ~Moim ¿yczeniem by³o jedynie pokazaæ jej, ¿e jej status jest nic niewarty w tej chwili. To wszystko.~ */ GOTO 26
  IF ~~ THEN REPLY #24636 /* ~Nie znoszê ³atwo zniewag. Powinna zgin¹æ wraz z ca³ym swoim zarozumialstwem!~ */ EXTERN ~DELCIA~ 25
END

IF ~~ THEN BEGIN 23 // from:
  SAY #24640 /* ~Ciotuniu!~ */
  IF ~~ THEN EXTERN ~DELCIA~ 23
END

IF ~~ THEN BEGIN 24 // from: 22.0
  SAY #24643 /* ~Hmm? Och! Tak, powinniœmy... rzeczywiœcie ruszyæ dalej. Wrócisz bezpiecznie drog¹, któr¹ przybyliœmy, Ciotuniu, ale nie mogê jeszcze pójœæ z tob¹.~ */
  IF ~~ THEN EXTERN ~DELCIA~ 24
END

IF ~~ THEN BEGIN 25 // from:
  SAY #24646 /* ~Oni nie s¹ tacy! Wielu jest zas³u¿onych, i... uwa¿a³am ich za godnych, ale... S¹ tak nietolerancyjni jak... my sami. Myœlê... myœlê, ¿e wola³abym raczej zostawiæ to wszystko...~ */
  IF ~~ THEN DO ~SetGlobal("NaliaMove","GLOBAL",4)
SetGlobal("SPRITE_IS_DEADNalia","GLOBAL",1)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 26 // from: 22.1
  SAY #24647 /* ~Zrozumia³e, ale i tak doœæ trudno przekonaæ j¹ o wartoœci innych tak, aby jej nie zagra¿ali. Nie to ¿eby nie powinna byæ przyzwyczajona do tego...~ */
  IF ~~ THEN EXTERN ~DELCIA~ 26
END

IF WEIGHT #5 /* Triggers after states #: 339 even though they appear after this state */
~Global("DelciaLeave","GLOBAL",1)
~ THEN BEGIN 27 // from:
  SAY #24648 /* ~Zupe³nie niezwyk³y przyk³ad opanowania z twojej strony. Doceniam to. Ciotunia jest poczciwa, ale bardzo nieustêpliwa i trudna w obejœciu. ChodŸ, musimy uratowaæ mojego ojca.~ [NALIA72] */
  IF ~~ THEN DO ~SetGlobal("DelciaLeave","GLOBAL",2)
~ EXIT
END

IF WEIGHT #6 /* Triggers after states #: 339 even though they appear after this state */
~!Dead("Torgal")
Global("TalkedToDaleson","GLOBAL",1)~ THEN BEGIN 28 // from:
  SAY #186 /* ~Jeœli tego w³aœnie chcesz. Bêdê czeka³a na zewn¹trz, przy palisadzie. Tam bêdzie bezpieczniej ni¿ tutaj.~ [NALIA95] */
  IF ~~ THEN DO ~LeaveParty()
ChangeAIScript("",DEFAULT)
SetDialog("Nalia")
EscapeAreaMove("AR1300",748,3227,14)
~ EXIT
END

IF ~~ THEN BEGIN 29 // from:
  SAY #187 /* ~Dziêkujê ci, Dalesonie, ale teraz nie czas na tajemnice. Ci ludzie nie s¹ moj¹ rodzin¹; to moi najemnicy. Nie musisz tu niczego skrywaæ.~ */
  IF ~~ THEN EXTERN ~DALESON~ 18
END

IF ~~ THEN BEGIN 30 // from:
  SAY #188 /* ~Proszê, nie musisz okazywaæ wobec mnie a¿ takiego szacunku. Moja Ciotunia byæ mo¿e woli by jej s³udzy p³aszczyli siê przed ni¹, ale ja nie.~ */
  IF ~~ THEN REPLY #571 /* ~Dlaczego ten cz³owiek k³amie dla ciebie? Co masz do ukrycia?~ */ GOTO 31
  IF ~~ THEN REPLY #572 /* ~Zadajesz siê z... ch³opcem stajennym? Co on mo¿e zaoferowaæ kobiecie o twojej pozycji?~ */ GOTO 32
  IF ~~ THEN REPLY #573 /* ~Czêsto chodzisz do stajni, prawda? Jak mniemam wolisz towarzystwo... prostych ludzi?~ */ EXTERN ~DALESON~ 19
  IF ~~ THEN REPLY #621 /* ~Nie mam w ogóle s³u¿by. Lepiej jest, gdy ludzie mog¹ pracowaæ dla samych siebie.~ */ GOTO 43
END

IF ~~ THEN BEGIN 31 // from: 30.0
  SAY #583 /* ~Dobre pytanie. U¿ywam tych drzwi by niepostrze¿enie wychodziæ. Ciotunia woli bym nie zadawa³a siê z ludŸmi, którzy nam s³u¿¹, ale brak dobrego pochodzenia nie mo¿e byæ przyczyn¹ z³ego traktowania.~ */
  IF ~~ THEN GOTO 36
END

IF ~~ THEN BEGIN 32 // from: 30.1
  SAY #584 /* ~Nie chodzi o to, co on mo¿e zaoferowaæ, ale o to, co ja powinnam zaoferowaæ jemu podobnym. U¿ywam tych drzwi by niepostrze¿enie wychodziæ, by sprawowaæ mi³osierne uczynki bez wiedzy Ciotuni.~ */
  IF ~~ THEN GOTO 150
END

IF ~~ THEN BEGIN 33 // from:
  SAY #591 /* ~W porz¹dku, Dalesonie. To dla mnie nic nowego, s³ysza³am ju¿ to wszystko od Ciotuni.~ */
  IF ~~ THEN EXTERN ~DALESON~ 20
END

IF ~~ THEN BEGIN 34 // from:
  SAY #611 /* ~Doœæ tego, Dalesonie! Nie bêdziesz o niej mówi³ w ten sposób!~ */
  IF ~~ THEN EXTERN ~DALESON~ 21
END

IF ~~ THEN BEGIN 35 // from:
  SAY #615 /* ~Jestem tego pewna. Bez wzglêdu na swoje nastawienie, jest ona wci¹¿ wielk¹ pani¹ tego domu. Musimy zatem przyst¹piæ do odzyskania tego miejsca.~ */
  IF ~~ THEN EXTERN ~DALESON~ 22
END

IF ~~ THEN BEGIN 36 // from: 297.0 150.0 31.0
  SAY #626 /* ~Przekona³am siê, ¿e Ciotunia nie jest podatna na te pomys³y. Pochodzi ze starej szko³y i uwa¿a, ¿e najlepiej nieustannie przypominaæ ni¿szym stanom o nale¿nym im miejscu.~ */
  IF ~~ THEN EXTERN ~DALESON~ 20
END

IF ~~ THEN BEGIN 37 // from:
  SAY #628 /* ~Piwnic! To s¹ 'piwnice'. Nie bêd¹ inaczej nazywane, pomimo ich historii. Zgodnie z rozkazem mego ojca.~ */
  IF ~~ THEN EXTERN ~DALESON~ 23
END

IF ~~ THEN BEGIN 38 // from:
  SAY #630 /* ~Tak. Jesteœ dobrym cz³owiekiem, Dalesonie.~ */
  IF ~~ THEN REPLY #631 /* ~Doœæ gadania! Musimy ruszaæ zanim odkryj¹ nasz¹ obecnoœæ.~ */ UNSOLVED_JOURNAL #16336 /* ~Napaœæ na zamek d'Arnise.

Spotkaliœmy w zamku Dalesona. Powiedzia³ nam, ¿e ojciec Nalii jeszcze ¿yje... ale zosta³ pojmany i zamkniêty w "piwnicach", czyli starych lochach tego zamku. Chyba próbowa³ zebraæ g³owice cepa bojowego, które trzymano oddzielnie z nieznanych Nalii powodów... ale poradzi³a, ¿e dobrze by³oby znaleŸæ te czêœci, jeœli jej ojciec nie zd¹¿y³ tego zrobiæ.~ */ GOTO 39
  IF ~~ THEN REPLY #632 /* ~Musimy ruszaæ. Skoro ju¿ tutaj jesteœmy powinniœmy siê dostaæ do tych piwnic.~ */ UNSOLVED_JOURNAL #16336 /* ~Napaœæ na zamek d'Arnise.

Spotkaliœmy w zamku Dalesona. Powiedzia³ nam, ¿e ojciec Nalii jeszcze ¿yje... ale zosta³ pojmany i zamkniêty w "piwnicach", czyli starych lochach tego zamku. Chyba próbowa³ zebraæ g³owice cepa bojowego, które trzymano oddzielnie z nieznanych Nalii powodów... ale poradzi³a, ¿e dobrze by³oby znaleŸæ te czêœci, jeœli jej ojciec nie zd¹¿y³ tego zrobiæ.~ */ GOTO 39
  IF ~~ THEN REPLY #633 /* ~A zatem mamy odnaleŸæ twojego ojca? Muszê wiedzieæ z jak licznym przeciwnikiem bêdziemy mieæ do czynienia.~ */ UNSOLVED_JOURNAL #16336 /* ~Napaœæ na zamek d'Arnise.

Spotkaliœmy w zamku Dalesona. Powiedzia³ nam, ¿e ojciec Nalii jeszcze ¿yje... ale zosta³ pojmany i zamkniêty w "piwnicach", czyli starych lochach tego zamku. Chyba próbowa³ zebraæ g³owice cepa bojowego, które trzymano oddzielnie z nieznanych Nalii powodów... ale poradzi³a, ¿e dobrze by³oby znaleŸæ te czêœci, jeœli jej ojciec nie zd¹¿y³ tego zrobiæ.~ */ EXTERN ~DALESON~ 24
  IF ~~ THEN REPLY #634 /* ~Kolejni g³upcy do uratowania? Cudownie. Mo¿esz powiedzieæ cokolwiek, co mog³oby nam w czymœ pomóc?~ */ UNSOLVED_JOURNAL #16336 /* ~Napaœæ na zamek d'Arnise.

Spotkaliœmy w zamku Dalesona. Powiedzia³ nam, ¿e ojciec Nalii jeszcze ¿yje... ale zosta³ pojmany i zamkniêty w "piwnicach", czyli starych lochach tego zamku. Chyba próbowa³ zebraæ g³owice cepa bojowego, które trzymano oddzielnie z nieznanych Nalii powodów... ale poradzi³a, ¿e dobrze by³oby znaleŸæ te czêœci, jeœli jej ojciec nie zd¹¿y³ tego zrobiæ.~ */ EXTERN ~DALESON~ 24
END

IF ~~ THEN BEGIN 39 // from: 38.1 38.0
  SAY #636 /* ~Jak sobie ¿yczysz. Zgadzam siê, ¿e musimy jak najszybciej uratowaæ mojego ojca. Ciotunia równie¿ mo¿e byæ przy ¿yciu i by³oby najlepiej gdybyœmy dostali siê równie¿ do niej. ChodŸmy wiêc.~ */
  IF ~~ THEN GOTO 296
END

IF ~~ THEN BEGIN 40 // from:
  SAY #655 /* ~Doœæ, Dalesonie! Ja... ja powiem. Piwnica jest reliktem, pozosta³oœci¹ po czasach, gdy nasza rodzina... nie by³a tak ¿yczliwa jak byæ mog³a.~ */
  IF ~~ THEN EXTERN ~DALESON~ 25
END

IF ~~ THEN BEGIN 41 // from:
  SAY #657 /* ~Jak œmiesz! Zrobi³am tak wiele, aby poprawiæ co siê da... nie, nie, masz racjê. Ta 'piwnica' jest... lochem. Mój ojciec zamurowa³ j¹, ale by³a w u¿yciu przez d³ugi czas...~ */
  IF ~~ THEN GOTO 151
END

IF ~~ THEN BEGIN 42 // from:
  SAY #659 /* ~Zgoda, wierzê ci, ale sk¹d oni wiedzieli? Ojciec by nie powiedzia³. ChodŸ, musimy iœæ. Dalesonie, przygotuj tych, którzy mog¹ powróciæ do s³u¿by.~ */
  IF ~~ THEN EXTERN ~DALESON~ 27
END

IF ~~ THEN BEGIN 43 // from: 30.3
  SAY #635 /* ~Osobliwy zamiar, i to taki, który bym popar³a. Myœlê jednak, ¿e trudno by³oby przekonaæ kogoœ ze starej szko³y o zaletach takiej zmiany.~ */
  IF ~~ THEN GOTO 297
END

IF WEIGHT #7 /* Triggers after states #: 339 even though they appear after this state */
~Global("NaliaInLibrary","GLOBAL",1)
!Dead("kpglai01")
~ THEN BEGIN 44 // from:
  SAY #716 /* ~Nie rozumiem. Poza paroma s³u¿¹cymi, widzieliœmy bardzo niewielu martwych. Gdzie s¹ stra¿e? Stra¿nicy walczyliby do ostatniej kropli krwi. Osobisty ochroniarz mojego ojca, Glaicus, powinien byæ tutaj w sypialni, a mimo to nie widzê ¿adnego cia³a.~ [NALIA73] */
  IF ~~ THEN REPLY #717 /* ~Ci tchórze prawdopodobnie uciekli. Za³o¿ê siê, ¿e zepsu³ ich do cna bogaty styl ¿ycia.~ */ DO ~SetGlobal("NaliaInLibrary","GLOBAL",2)
~ GOTO 49
  IF ~~ THEN REPLY #718 /* ~Mogli pos³u¿yæ za po¿ywienie. Byæ mo¿e cia³a sk³adowane s¹ gdzieœ indziej?~ */ DO ~SetGlobal("NaliaInLibrary","GLOBAL",2)
~ GOTO 50
  IF ~~ THEN REPLY #719 /* ~Jak bardzo byli oddani? Byæ mo¿e doszli po prostu do wniosku, ¿e nie warto walczyæ.~ */ DO ~SetGlobal("NaliaInLibrary","GLOBAL",2)
~ GOTO 51
  IF ~~ THEN REPLY #720 /* ~Byæ mo¿e nie byli tak skuteczni jak s¹dzi³aœ.~ */ DO ~SetGlobal("NaliaInLibrary","GLOBAL",2)
~ GOTO 52
END

IF ~~ THEN BEGIN 45 // from:
  SAY #722 /* ~Przybywamy by wygnaæ ciê z mojego domu, potworze! Opuœcisz to miejsce, albo zginiesz tutaj!~ [NALIA86] */
  IF ~~ THEN EXTERN ~TORGAL~ 16
END

IF ~~ THEN BEGIN 46 // from:
  SAY #724 /* ~Jestem tutaj, poniewa¿ jest to mój dom! Zap³acisz za zniewa¿enie tego miejsca!~ [NALIA87] */
  IF ~~ THEN EXTERN ~TORGAL~ 17
END

IF ~~ THEN BEGIN 47 // from:
  SAY #726 /* ~Co?! Jaka umowa?! Ktoœ ciê tu nas³a³? Kto to by³? Mój ojciec ich poæwiartuje!~ [NALIA88] */
  IF ~~ THEN EXTERN ~TORGAL~ 18
END

IF ~~ THEN BEGIN 48 // from:
  SAY #728 /* ~Nie! Powiedz, kto to zrobi³? Skoro jesteœcie tylko wynajêtymi ³otrami, ktoœ musi za tym staæ! Do stu piorunów, ty mi powiesz! Zmuœ go do mówienia, <CHARNAME>!~ [NALIA89] */
  IF ~~ THEN EXTERN ~TORGAL~ 19
END

IF ~~ THEN BEGIN 49 // from: 44.0
  SAY #730 /* ~Zapewniam ciê, ¿e s³u¿ba nie by³a zepsuta. Ciotunia nie tolerowa³aby tego. Mogê rêczyæ za oddanie s³u¿by. Stra¿e jednak, to co innego.~ */
  IF ~~ THEN UNSOLVED_JOURNAL #23491 /* ~Twierdza d'Arnise zosta³a zaatakowana.

Nalia ze zdziwieniem zauwa¿y³a, ¿e w twierdzy nie mo¿na znaleŸæ ¿adnych zw³ok. By³o tu wielu stra¿ników, a tak¿e Glaicus, wierny ochroniarz jej ojca, jednak wszyscy zniknêli.~ */ GOTO 298
END

IF ~~ THEN BEGIN 50 // from: 44.1
  SAY #731 /* ~Nie chcia³abym tak myœleæ. Niektórzy ze s³u¿by byli dobrymi znajomymi. Doceniali moje mi³osierdzie, tak s¹dzê.~ */
  IF ~~ THEN UNSOLVED_JOURNAL #23491 /* ~Twierdza d'Arnise zosta³a zaatakowana.

Nalia ze zdziwieniem zauwa¿y³a, ¿e w twierdzy nie mo¿na znaleŸæ ¿adnych zw³ok. By³o tu wielu stra¿ników, a tak¿e Glaicus, wierny ochroniarz jej ojca, jednak wszyscy zniknêli.~ */ GOTO 299
END

IF ~~ THEN BEGIN 51 // from: 44.2
  SAY #732 /* ~Nie s¹dzê by tak siê sta³o. Stra¿nicy byli dobrze op³acani. Bardziej prawdopodobne jest, ¿e nie ¿yj¹. Glaicus odda³by ¿ycie za mojego ojca.~ */
  IF ~~ THEN UNSOLVED_JOURNAL #23491 /* ~Twierdza d'Arnise zosta³a zaatakowana.

Nalia ze zdziwieniem zauwa¿y³a, ¿e w twierdzy nie mo¿na znaleŸæ ¿adnych zw³ok. By³o tu wielu stra¿ników, a tak¿e Glaicus, wierny ochroniarz jej ojca, jednak wszyscy zniknêli.~ */ EXIT
END

IF ~~ THEN BEGIN 52 // from: 44.3
  SAY #733 /* ~Zapewniam ciê, ¿e nie brakowa³o im zdolnoœci. Ojciec jest czu³y na takie sprawy, a poza tym pochodzili z pewnego Ÿród³a. Nie, oni byli bardzo kompetentni.~ */
  IF ~~ THEN UNSOLVED_JOURNAL #23491 /* ~Twierdza d'Arnise zosta³a zaatakowana.

Nalia ze zdziwieniem zauwa¿y³a, ¿e w twierdzy nie mo¿na znaleŸæ ¿adnych zw³ok. By³o tu wielu stra¿ników, a tak¿e Glaicus, wierny ochroniarz jej ojca, jednak wszyscy zniknêli.~ */ GOTO 300
END

IF WEIGHT #8 /* Triggers after states #: 339 even though they appear after this state */
~Dead("Torgal")
Global("NaliaKeepPlot","GLOBAL",0)
AreaCheck("AR1300")
Global("NaliaRaised","GLOBAL",0)
Global("PlayerHasStronghold","GLOBAL",0)
~ THEN BEGIN 53 // from: 191.1 191.0
  SAY #734 /* ~Mój... mój dom. Mój ojciec... i co pozosta³o? Ktoœ to zrobi³... ale kto...~ [NALIA74] */
  IF ~~ THEN REPLY #735 /* ~Jak mniemam moje zadanie tutaj jest zakoñczone. Mogê ju¿ iœæ?~ */ DO ~EraseJournalEntry(5083)
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
~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta³ odbity.

Po ciê¿kiej walce zamek d'Arnise zosta³ oczyszczony z trolli. Niestety, nie uda³o nam siê uratowaæ Lorda i zabi³ go TorGal, przywódca trolli. Ale Nalia ¿yje... tyle ¿e przysz³oœæ jej i zamku jest niepewna.~ */ GOTO 54
  IF ~~ THEN REPLY #736 /* ~Nie mogê z³agodziæ twojego bólu. Zrobi³em wszystko, co w mojej mocy, ale niewiele wiêcej mogê tutaj zdzia³aæ.~ ~Nie mogê z³agodziæ twojego bólu. Zrobi³am wszystko, co w mojej mocy, ale niewiele wiêcej mogê tutaj zdzia³aæ.~ */ DO ~EraseJournalEntry(5083)
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
~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta³ odbity.

Po ciê¿kiej walce zamek d'Arnise zosta³ oczyszczony z trolli. Niestety, nie uda³o nam siê uratowaæ Lorda i zabi³ go TorGal, przywódca trolli. Ale Nalia ¿yje... tyle ¿e przysz³oœæ jej i zamku jest niepewna.~ */ GOTO 54
  IF ~~ THEN REPLY #737 /* ~Czujê, ¿e moje zadanie nie zosta³o wype³nione. Nie uda³o mi siê uratowaæ twojego ojca i przykro mi z tego powodu.~ */ DO ~EraseJournalEntry(5083)
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
~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta³ odbity.

Po ciê¿kiej walce zamek d'Arnise zosta³ oczyszczony z trolli. Niestety, nie uda³o nam siê uratowaæ Lorda i zabi³ go TorGal, przywódca trolli. Ale Nalia ¿yje... tyle ¿e przysz³oœæ jej i zamku jest niepewna.~ */ GOTO 55
  IF ~~ THEN REPLY #738 /* ~Przykro mi, ¿e nie mogê zostaæ d³u¿ej by to wyjaœniæ. Wspomina³aœ coœ o nagrodzie?~ */ DO ~EraseJournalEntry(5083)
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
~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta³ odbity.

Po ciê¿kiej walce zamek d'Arnise zosta³ oczyszczony z trolli. Niestety, nie uda³o nam siê uratowaæ Lorda i zabi³ go TorGal, przywódca trolli. Ale Nalia ¿yje... tyle ¿e przysz³oœæ jej i zamku jest niepewna.~ */ GOTO 56
  IF ~~ THEN REPLY #739 /* ~Zrobi³em, co w mojej mocy. Mogê oczekiwaæ jakiejœ nagrody? Nie chcê by to zabrzmia³o nietaktownie.~ ~Zrobi³am, co w mojej mocy. Mogê oczekiwaæ jakiejœ nagrody? Nie chcê by to zabrzmia³o nietaktownie.~ */ DO ~EraseJournalEntry(5083)
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
~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta³ odbity.

Po ciê¿kiej walce zamek d'Arnise zosta³ oczyszczony z trolli. Niestety, nie uda³o nam siê uratowaæ Lorda i zabi³ go TorGal, przywódca trolli. Ale Nalia ¿yje... tyle ¿e przysz³oœæ jej i zamku jest niepewna.~ */ GOTO 56
END

IF ~~ THEN BEGIN 54 // from: 53.1 53.0
  SAY #740 /* ~Mo¿esz iœæ, jeœli chcesz. Ja zostajê... och nie. Zaczekaj! Hm, mo¿esz zostaæ d³u¿ej? Muszê... och niewa¿ne. Niech to wszystko szlag, jak nie jedna sprawa, to inna!~ */
  IF ~~ THEN REPLY #741 /* ~¯egnaj wiêc. Uwa¿aj na siebie.~ */ GOTO 57
  IF ~~ THEN REPLY #742 /* ~O co chodzi tym razem? No mów¿e, nie bêdê tu sterczeæ przez ca³y dzieñ!~ */ DO ~GiveGoldForce(10650)~ GOTO 58
  IF ~~ THEN REPLY #743 /* ~O co chodzi? Mogê ci jeszcze w czymœ pomóc?~ */ DO ~GiveGoldForce(10650)~ GOTO 58
END

IF ~~ THEN BEGIN 55 // from: 53.2
  SAY #744 /* ~Jestem wdziêczna i nagrodzê ciê w miarê moich mo¿liwoœci. Teraz, gdy nie ma ju¿ ojca muszê... och nie. Och, mogê ciê w jakiœ sposób przekonaæ do... och... nie. Nie, niewa¿ne.~ */
  IF ~~ THEN REPLY #745 /* ~Dziêkujê ci. Wezmê tylko moj¹ nagrodê i ju¿ mnie nie ma. ¯egnaj i powodzenia.~ */ GOTO 57
  IF ~~ THEN REPLY #746 /* ~O co chodzi tym razem? No mów¿e, nie mam zamiaru siedzieæ ca³¹ noc i zastanawiaæ siê, co chcia³aœ powiedzieæ.~ */ DO ~GiveGoldForce(10650)~ GOTO 58
  IF ~~ THEN REPLY #747 /* ~Mogê jeszcze coœ dla ciebie zrobiæ? Chêtnie pos³ucham.~ */ DO ~GiveGoldForce(10650)~ GOTO 58
END

IF ~~ THEN BEGIN 56 // from: 53.4 53.3
  SAY #748 /* ~Zobaczê, co siê da zrobiæ. Teraz skoro ojca ju¿ nie ma muszê... och nie. Och, zaczekaj! Mo¿esz... nie. Zapomnij, ¿e cokolwiek mówi³am. Lepiej ju¿ idŸ.~ */
  IF ~~ THEN REPLY #749 /* ~Dziêkujê ci. ¯yczê ci powodzenia.~ */ GOTO 57
  IF ~~ THEN REPLY #750 /* ~Dokoñcz to, co zaczê³aœ, Nalio. Nie mam zamiaru siedzieæ ca³¹ noc i zastanawiaæ siê, co chcia³aœ powiedzieæ.~ */ DO ~GiveGoldForce(10650)~ GOTO 58
  IF ~~ THEN REPLY #751 /* ~Mogê jeszcze coœ dla ciebie zrobiæ? Mów œmia³o.~ */ DO ~GiveGoldForce(10650)~ GOTO 58
END

IF ~~ THEN BEGIN 57 // from: 66.4 66.3 56.0 55.0 54.0
  SAY #752 /* ~Oto nagroda, weŸ z³oto z mojej d³oni. Nie dbam o nie. W tej chwili siê nie liczy. Do widzenia. ¯yczê ci powodzenia.~ */
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
  SAY #753 /* ~To... to zale¿y od tego, co siê teraz stanie. Jestem zarêczona z cz³owiekiem, którego nie chcê poœlubiæ. Ojciec powiedzia³, ¿e nie dopuœci³by do tego, dopóki taka by³aby moja wola, ale teraz go nie ma.~ */
  IF ~Gender(Player1,MALE)
~ THEN REPLY #754 /* ~Rozumiem. Pragniesz ma³¿eñstwa z rozs¹dku by zapobiec zalotom twojego narzeczonego.~ */ GOTO 59
  IF ~Gender(Player1,FEMALE)
~ THEN REPLY #755 /* ~Chcesz ma³¿eñstwa z rozs¹dku? Ciekawe, ale w¹tpiê by twój narzeczony da³ siê w ten sposób oszukaæ.~ */ GOTO 60
  IF ~~ THEN REPLY #756 /* ~Mogê zabiæ tego cz³owieka. Rozwi¹za³oby to twój problem.~ */ GOTO 61
  IF ~~ THEN REPLY #757 /* ~Mów dalej. Co proponujesz by unikn¹æ tych oœwiadczyn? Znikniêcie?~ */ GOTO 62
END

IF ~~ THEN BEGIN 59 // from: 58.0
  SAY #758 /* ~Z tob¹? Nic tak przykrego. By³by to ¿aden postêp; nikt by nie uwierzy³, ¿e znalaz³am upodobanie w kimœ takim jak ty. Eee, bez urazy. Naprawdê.~ */
  IF ~~ THEN GOTO 63
END

IF ~~ THEN BEGIN 60 // from: 58.1
  SAY #759 /* ~WyobraŸ sobie ten skandal. Kto by uwierzy³, ¿e ³¹cz¹ mnie z tob¹ jakieœ zwi¹zki, nawet gdybyœ by³a odpowiedniej p³ci? Znaczy siê, jestem dobroczynna, ale doprawdy... eee, bez urazy.~ */
  IF ~~ THEN GOTO 63
END

IF ~~ THEN BEGIN 61 // from: 58.2
  SAY #760 /* ~To rozwi¹zanie jest nie do przyjêcia! Nie wezmê w tym udzia³u! Chocia¿ gdyby to mia³o wygl¹daæ jak wypadek... NIE! Nie, nie s¹dzê, ¿eby to by³o konieczne.~ */
  IF ~~ THEN GOTO 63
END

IF ~~ THEN BEGIN 62 // from: 58.3
  SAY #761 /* ~Nie, to by nic nie da³o. Kiedyœ i tak do tego dojdzie, a unikanie tradycyjnych obowi¹zków Ÿle by o mnie œwiadczy³o.~ */
  IF ~~ THEN GOTO 63
END

IF ~~ THEN BEGIN 63 // from: 62.0 61.0 60.0 59.0
  SAY #763 /* ~Nie, mam inn¹ propozycjê. Nie s¹dzê by wielu ludzi da³o siê na to nabraæ, ale mog³oby to uratowaæ mój dom od z³ego gospodarza, jaki z pewnoœci¹ tu nadejdzie.~ */
  IF ~~ THEN GOTO 158
END

IF ~~ THEN BEGIN 64 // from: 158.0
  SAY #764 /* ~S¹ perfekcyjnym przyk³adem tego, czego nienawidzê u arystokracji. Ka¿dy jest dla nich ni¿ej sytuowany, i jeœli chcesz by ciê szanowano, musisz byæ jednym z nich.~ */
  IF ~~ THEN GOTO 159
END

IF ~~ THEN BEGIN 65 // from: 159.0
  SAY #765 /* ~Mój ojciec odziedziczy³ przy urodzeniu tytu³, ale wymaga³ by ludzie wyró¿niali siê dziêki swoim czynom. Przestrzega³ etykiety, ale nie kry³ swojej niechêci do niej.~ */
  IF ~~ THEN GOTO 160
END

IF ~~ THEN BEGIN 66 // from: 160.0
  SAY #770 /* ~Przyrzeczono moj¹ rêkê okropnemu cz³owiekowi o imieniu Isaea Roenall. Teraz bêdzie on z pewnoœci¹ d¹¿y³ do jak najszybszych zaœlubin, a ja zostanê zmuszona na prowadzenie ¿ycia spokojnej arystokratki.~ */
  IF ~~ THEN REPLY #771 /* ~Có¿, to z pewnoœci¹ brzmi okropnie. Ca³y ten przepych. Wybacz, ¿e nie wylejê dla ciebie potoku ³ez.~ */ GOTO 67
  IF ~~ THEN REPLY #772 /* ~W ten sposób staniesz siê czêœci¹ systemu, którego tak nienawidzisz. Jakie masz wyjœcie?~ */ GOTO 161
  IF ~~ THEN REPLY #773 /* ~D³uga i mêcz¹ca opowieœæ, Nalio. PrzejdŸ, jeœli ³aska do sedna sprawy.~ */ GOTO 68
  IF ~~ THEN REPLY #774 /* ~Naprawdê chcia³bym ci pomóc, zaklinam siê. Jeœli ju¿ skoñczy³aœ wezmê moj¹ nagrodê i pójdê.~ ~Naprawdê chcia³abym ci pomóc, zaklinam siê. Jeœli ju¿ skoñczy³aœ wezmê moj¹ nagrodê i pójdê.~ */ GOTO 57
  IF ~~ THEN REPLY #775 /* ~Przykro mi z powodu twoich k³opotów, ale naprawdê muszê ju¿ iœæ. Powodzenia, Nalio.~ */ GOTO 57
END

IF ~~ THEN BEGIN 67 // from: 66.0
  SAY #766 /* ~Z pewnoœci¹ dla ciebie nie wygl¹da to na kryzys, ale ja spêdzi³am ca³e ¿ycie próbuj¹c poprawiæ z³o, które wyrz¹dzono tym o ni¿szym pochodzeniu.~ */
  IF ~~ THEN GOTO 301
END

IF ~~ THEN BEGIN 68 // from: 66.2
  SAY #767 /* ~Zapewniam ciê, ¿e nie musisz siê o nic martwiæ zawczasu. Mo¿esz tylko na tym zyskaæ, praktycznie nic przy tym nie robi¹c.~ */
  IF ~~ THEN GOTO 161
END

IF ~~ THEN BEGIN 69 // from: 161.0
  SAY #768 /* ~Jako dziedziczka mam prawo wybraæ g³owê tego miejsca. Nie mog³abym skutecznie przeciwstawiæ siê Roenallom. Ty, ze swoimi... talentami, mo¿esz siê okazaæ postaci¹ budz¹c¹ postrach.~ */
  IF ~~ THEN REPLY #776 /* ~Roenallowie zgodziliby siê na to? Trudno mi w to uwierzyæ.~ */ GOTO 162
  IF ~~ THEN REPLY #777 /* ~Co muszê zrobiæ, aby wzi¹æ na siebie tê rolê? Czego by ode mnie wymagano?~ */ GOTO 163
  IF ~
~ THEN REPLY #778 /* ~Podoba mi siê ten pomys³.~ */ GOTO 73
  IF ~~ THEN REPLY #780 /* ~Po prostu próbujesz obarczyæ mnie swoimi problemami!~ */ GOTO 164
END

IF ~~ THEN BEGIN 70 // from: 162.0
  SAY #781 /* ~Proszê, to zapewni, ¿e Roenallowie nie przejm¹ w³adzy. S¹ ciemiêzcami i nie zajm¹ siê tym miejscem w sposób oddaj¹cy czeœæ memu ojcu.~ */
  IF ~~ THEN REPLY #785 /* ~Opiekowanie siê tym miejscem w tak niespokojnych czasach bêdzie zaszczytem. Do³o¿ê starañ by to miejsce rozkwit³o.~ */ GOTO 74
  IF ~~ THEN REPLY #786 /* ~Przyjmê twoj¹ ofertê i biada tym, którzy wejd¹ nam w drogê. Dopilnujê by to miejsce funkcjonowa³o jak nale¿y.~ */ GOTO 74
  IF ~~ THEN REPLY #787 /* ~Nie mogê siê na to zgodziæ. Z pewnoœci¹ s¹ inni, którzy lepiej nadaj¹ siê na moje miejsce. Przykro mi.~ */ GOTO 75
  IF ~~ THEN REPLY #792 /* ~Nie chcê mieæ z tym nic wspólnego. ZnajdŸ sobie innego frajera.~ */ GOTO 75
END

IF ~~ THEN BEGIN 71 // from: 163.0
  SAY #782 /* ~Zajmiesz siê ceremonia³ami, ale niczym zbyt stresuj¹cym. Proszê, Roenallowie nie zajêliby siê tym miejscem w sposób oddaj¹cy czeœæ memu ojcu.~ */
  IF ~~ THEN REPLY #788 /* ~Zgadzam siê. Opiekowanie siê tym miejscem w tak niespokojnych czasach bêdzie zaszczytem.~ */ GOTO 74
  IF ~~ THEN REPLY #789 /* ~Przyjmê twoj¹ ofertê i biada tym, którzy wejd¹ nam w drogê. Dopilnujê by to miejsce funkcjonowa³o jak nale¿y.~ */ GOTO 74
  IF ~~ THEN REPLY #790 /* ~Nie mogê siê na to zgodziæ. Z pewnoœci¹ s¹ inni, którzy lepiej nadaj¹ siê na moje miejsce. Przykro mi.~ */ GOTO 75
  IF ~~ THEN REPLY #791 /* ~Nie chcê mieæ z tym nic wspólnego. ZnajdŸ sobie innego frajera.~ */ GOTO 75
END

IF ~~ THEN BEGIN 72 // from: 164.0
  SAY #783 /* ~Oka¿esz siê postaci¹ budz¹c¹ postrach, a moi s³udzy i ja bêdziemy chronieni przed Roenallami. Proszê, nawet Ciotunia bêdzie nalegaæ na ich przybycie, jeœli nie bêdê szybko dzia³aæ.~ */
  IF ~~ THEN REPLY #793 /* ~Zgadzam siê. Opiekowanie siê tym miejscem w tak niespokojnych czasach bêdzie zaszczytem.~ */ GOTO 74
  IF ~~ THEN REPLY #794 /* ~Przyjmê twoj¹ ofertê i biada tym, którzy wejd¹ nam w drogê. Dopilnujê by to miejsce funkcjonowa³o jak nale¿y.~ */ GOTO 74
  IF ~~ THEN REPLY #795 /* ~Nie mogê siê na to zgodziæ. Z pewnoœci¹ s¹ inni, którzy lepiej nadaj¹ siê na moje miejsce. Przykro mi.~ */ GOTO 75
  IF ~~ THEN REPLY #796 /* ~Nie chcê mieæ z tym nic wspólnego. ZnajdŸ sobie innego frajera.~ */ GOTO 75
END

IF ~~ THEN BEGIN 73 // from: 69.2
  SAY #784 /* ~Nie jest rzecz¹ niezwyk³¹, kiedy wojownik przejmuje w³asnoœæ pana dworu, gdy ten jest... martwy. Jeœli bêdziesz przewodziæ temu miejscu, przyniesie to czeœæ memu ojcu.~ */
  IF ~~ THEN REPLY #797 /* ~Zgadzam siê. Opiekowanie siê tym miejscem w tak niespokojnych czasach bêdzie zaszczytem.~ */ GOTO 74
  IF ~~ THEN REPLY #798 /* ~Przyjmê twoj¹ ofertê i biada tym, którzy wejd¹ nam w drogê. Dopilnujê by to miejsce funkcjonowa³o jak nale¿y.~ */ GOTO 74
  IF ~~ THEN REPLY #799 /* ~Nie mogê siê na to zgodziæ. Z pewnoœci¹ s¹ inni, którzy lepiej nadaj¹ siê na moje miejsce. Przykro mi.~ */ GOTO 75
  IF ~~ THEN REPLY #800 /* ~Nie chcê mieæ z tym nic wspólnego. ZnajdŸ sobie innego frajera.~ */ GOTO 75
END

IF ~~ THEN BEGIN 74 // from: 73.1 73.0 72.1 72.0 71.1 71.0 70.1 70.0
  SAY #801 /* ~Cudownie! Nie mog¹ mnie teraz zmusiæ do opuszczenia tego miejsca, zaœ Isaea mo¿e zapomnieæ o tych przeklêtych zarêczynach. Przewodzisz tu teraz, oczywiœcie w granicach rozs¹dku. Ja zachowujê dziedzictwo krwi i mogê je odebraæ.~ */
  IF ~~ THEN GOTO 165
END

IF ~~ THEN BEGIN 75 // from: 73.3 73.2 72.3 72.2 71.3 71.2 70.3 70.2
  SAY #802 /* ~Ale... dobrze. Pozostanê tutaj, aby zrobiæ to, co musi byæ zrobione. Jeœli zmienisz zdanie jest jeszcze czas zanim Roenallowie bêd¹ w stanie przej¹æ w³adzê. Pomyœl o tym.~ */
  IF ~~ THEN DO ~SetGlobal("NaliaAtKeep","GLOBAL",1)
LeaveParty()
ChangeAIScript("",DEFAULT)
SetDialog("Nalia")
EscapeAreaMove("AR1300",3234,2477,14)
~ EXIT
END

IF ~~ THEN BEGIN 76 // from:
  SAY #803 /* ~Tak? Tak mam na imiê, co mogê zrobiæ dla ciebie, synu?~ */
  IF ~~ THEN EXTERN ~NALIAMES~ 1
END

IF ~~ THEN BEGIN 77 // from:
  SAY #1701 /* ~Oczywiœcie. Dobrze siê spisa³eœ.~ */
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
  SAY #1705 /* ~Muszê siê natychmiast udaæ do Dzielnicy Cmentarnej w Athkatli. Wszystkie inne sprawy musz¹ zaczekaæ. Przykro mi, ale nie mogê zmieniæ zdania.~ */
  IF ~~ THEN REPLY #1706 /* ~Co siê sta³o? Musi to byæ coœ wa¿nego, skoro tak ciê zasmuci³o.~ */ GOTO 81
  IF ~~ THEN REPLY #1707 /* ~Nie mogê odejœæ, nie znaj¹c wczeœniej powodów.~ */ GOTO 82
  IF ~~ THEN REPLY #1708 /* ~Jestem pewien, ¿e w koñcu zawrócimy t¹ drog¹. Cierpliwoœci, mamy du¿o do zrobienia.~ ~Jestem pewna, ¿e w koñcu zawrócimy t¹ drog¹. Cierpliwoœci, mamy du¿o do zrobienia.~ */ GOTO 83
  IF ~~ THEN REPLY #1709 /* ~Bez w¹tpienia kolejna z twoich spraw, która rozroœnie siê w zbrojny konflikt. O co chodzi tym razem?~ */ GOTO 84
END

IF ~~ THEN BEGIN 81 // from: 80.0
  SAY #1710 /* ~Masz wiêcej racji ni¿ mog³oby ci siê zdawaæ, ale wybaczam ci ignorancjê. Wiadomoœæ ta dotyczy pogrzebu mego ojca. Muszê siê udaæ do Dzielnicy Cmentarnej.~ */
  IF ~~ THEN REPLY #1714 /* ~W takim razie powinniœmy wyruszyæ najszybciej jak to mo¿liwe. Nie mam najmniejszego zamiaru pozwoliæ ci na spóŸnienie siê na pogrzeb.~ */ GOTO 85
  IF ~~ THEN REPLY #1715 /* ~Dobrze, udam siê w tym kierunku przy najbli¿szej nadarzaj¹cej siê okazji.~ */ GOTO 86
  IF ~~ THEN REPLY #1716 /* ~Wspó³czujê, ale to nie mog³o siê zdarzyæ w gorszym momencie. Trzeba za³atwiæ inne sprawy.~ */ GOTO 87
  IF ~~ THEN REPLY #1726 /* ~To po prostu nie wchodzi w rachubê. Nie mam ani czasu, ani ochoty.~ */ GOTO 87
END

IF ~~ THEN BEGIN 82 // from: 80.1
  SAY #1711 /* ~List ten powiadamia³ o pogrzebie mojego ojca, którego nie mam zamiaru opuœciæ. Muszê ruszyæ w drogê jak najszybciej.~ */
  IF ~~ THEN REPLY #1717 /* ~W takim razie ruszajmy. Nie pozwolê byœ siê spóŸni³a na pogrzeb z mojego powodu.~ */ GOTO 85
  IF ~~ THEN REPLY #1718 /* ~Zaniecham moich planów. Przypuszczam, ¿e zajmie nam to sporo czasu, gdy ju¿ bêdziemy tam na miejscu?~ */ GOTO 86
  IF ~~ THEN REPLY #1719 /* ~Wspó³czujê ci, ale, z drugiej strony, nie mogê teraz iœæ.~ */ GOTO 87
  IF ~~ THEN REPLY #1727 /* ~To nie jest ¿adne rozwi¹zanie w tej chwili. Mamy na g³owie sprawy, które nie mog¹ czekaæ.~ */ GOTO 87
END

IF ~~ THEN BEGIN 83 // from: 80.2
  SAY #1712 /* ~W normalnych warunkach byæ mo¿e, ale to nie s¹ zwyk³e czasy. List ten powiadamia o pogrzebie mojego ojca. Muszê jak najszybciej dostaæ siê do Athkatli.~ */
  IF ~~ THEN REPLY #1720 /* ~W takim razie powinniœmy wyruszyæ najszybciej jak to mo¿liwe. Nie mam najmniejszego zamiaru pozwoliæ ci na spóŸnienie siê na pogrzeb.~ */ GOTO 85
  IF ~~ THEN REPLY #1721 /* ~Dobrze, udam siê w tym kierunku przy najbli¿szej nadarzaj¹cej siê okazji.~ */ GOTO 86
  IF ~~ THEN REPLY #1722 /* ~Wspó³czujê, ale to nie mog³o siê zdarzyæ w gorszym momencie. Trzeba za³atwiæ inne sprawy.~ */ GOTO 87
  IF ~~ THEN REPLY #1728 /* ~To po prostu nie wchodzi w rachubê. Sama sk³adaj honory, ja nie mam na to czasu.~ */ GOTO 88
END

IF ~~ THEN BEGIN 84 // from: 80.3
  SAY #1713 /* ~Przykro mi, ¿e wa¿ne dla mnie sprawy s¹ ci tak nie na rêkê. List ten powiadamia o pogrzebie mojego ojca. Muszê jak najszybciej dostaæ siê do Athkatli.~ */
  IF ~~ THEN REPLY #1723 /* ~W takim razie ruszajmy. Nie pozwolê byœ siê spóŸni³a na pogrzeb z mojego powodu.~ */ GOTO 85
  IF ~~ THEN REPLY #1724 /* ~W porz¹dku, porzucê wszelkie moje zajêcia i wyruszymy najszybciej jak to mo¿liwe. Przypuszczam, ¿e zajmie nam to sporo czasu, gdy ju¿ bêdziemy tam na miejscu?~ */ GOTO 86
  IF ~~ THEN REPLY #1725 /* ~Wspó³czujê ci, ale, z drugiej strony, nie mogê teraz iœæ.~ */ GOTO 87
  IF ~~ THEN REPLY #1729 /* ~To nie jest ¿adne rozwi¹zanie w tej chwili. Mamy na g³owie du¿o wa¿niejsze sprawy, których nie mo¿na od³o¿yæ na póŸniej.~ */ GOTO 87
END

IF ~~ THEN BEGIN 85 // from: 87.2 84.0 83.0 82.0 81.0
  SAY #1730 /* ~Dziêkujê ci, doceniam to. Wygl¹da na to, ¿e mój d³ug wdziêcznoœci wobec ciebie powiêkszy³ siê.~ */
  IF ~~ THEN UNSOLVED_JOURNAL #7036 /* ~Pogrzeb ojca Nalii

Przyby³ pos³aniec, który powiedzia³, ¿e Nalia musi siê udaæ jak najszybciej do Dzielnicy Grobowej w Athkatli na pogrzeb ojca. Postanowiliœmy jej towarzyszyæ.~ */ EXIT
END

IF ~~ THEN BEGIN 86 // from: 88.0 87.1 84.1 83.1 82.1 81.1
  SAY #1731 /* ~Wiem, ¿e nie jest ci to na rêkê, ale nie martw siê. Zajmie nam to tylko chwilkê. Dziêkujê ci za zrozumienie, nawet jeœli nie przysz³o ³atwo.~ */
  IF ~~ THEN UNSOLVED_JOURNAL #7036 /* ~Pogrzeb ojca Nalii

Przyby³ pos³aniec, który powiedzia³, ¿e Nalia musi siê udaæ jak najszybciej do Dzielnicy Grobowej w Athkatli na pogrzeb ojca. Postanowiliœmy jej towarzyszyæ.~ */ EXIT
END

IF ~~ THEN BEGIN 87 // from: 84.3 84.2 83.2 82.3 82.2 81.3 81.2
  SAY #1732 /* ~To s¹ szczególne okolicznoœci. Nie proszê o wiele... có¿, poza uratowaniem mojego domu i rozgromieniem legionu trolli. Proszê, mo¿emy przynajmniej wkrótce wyruszyæ?~ */
  IF ~~ THEN REPLY #1733 /* ~Nie, przykro mi, ale nie zmieniê swojej decyzji. Nie mamy czasu na wycieczki na pogrzeby.~ */ GOTO 88
  IF ~~ THEN REPLY #1734 /* ~To jest do przyjêcia. Wyruszymy przy najbli¿szej sposobnoœci.~ */ GOTO 86
  IF ~~ THEN REPLY #1735 /* ~Skoro tak ci na tym zale¿y, powinniœmy ruszaæ od razu.~ */ GOTO 85
END

IF ~~ THEN BEGIN 88 // from: 87.0 83.3
  SAY #1736 /* ~Nie pozostawiasz mi wielkiego wyboru. Dobrze wiêc... Oto wiêkszoœæ twoich rzeczy. Jeœli zapragniesz mnie odszukaæ, powinnam byæ Pod Miedzianym Diademem w dzieñ po pogrzebie.~ */
  IF ~~ THEN REPLY #1737 /* ~Co? Zaczekaj! W porz¹dku, pojedziemy, ale nie w tej chwili. Choæ wkrótce.~ */ GOTO 86
  IF ~~ THEN REPLY #1738 /* ~Byæ mo¿e tak bêdzie najlepiej. Tam siê spotkamy.~ */ GOTO 89
  IF ~~ THEN REPLY #1739 /* ~IdŸ wiêc! Muszê oczekiwaæ lojalnoœci, a to po prostu nie wystarczy!~ */ GOTO 90
END

IF ~~ THEN BEGIN 89 // from: 88.1
  SAY #1740 /* ~Dobrze. Mam nadziejê, ¿e do mnie do³¹czysz. Rozumiesz chyba, dlaczego muszê iœæ, prawda? Mam tak¹ nadziejê. Do zobaczenia?~ */
  IF ~~ THEN DO ~GivePartyAllEquipment()
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
SetGlobal("NaliaWentToFuneral","GLOBAL",1)
SetGlobalTimer("NaliaReturnsFromFuneral","GLOBAL",ONE_DAY)
LeaveParty()
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 90 // from: 88.2
  SAY #1741 /* ~Pod¹¿am z t¹ grup¹ ze wzglêdu na pomoc, jakiej udzielamy. Nie jestem ¿o³nierzem, ani ty genera³em. Zostañ, jeœli chcesz, ale ja muszê iœæ.~ */
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
  SAY #1742 /* ~Muszê nalegaæ, abyœmy natychmiast udali siê do Athkatli. Przykro mi, ale tak siê umawialiœmy. Pójdê sama, jeœli bêdê musia³a.~ [NALIA75] */
  IF ~~ THEN REPLY #1743 /* ~Przepraszam za tak d³ug¹ zw³okê. Wyruszamy natychmiast.~ */ DO ~SetGlobalTimer("NaliaGraveyardTimer","GLOBAL",THREE_DAYS)
SetGlobal("NaliaGraveComplain","GLOBAL",1)~ GOTO 92
  IF ~~ THEN REPLY #1744 /* ~Jeszcze tylko chwilê, Nalio. Nie martw siê, zaprowadzê ciê tam.~ */ DO ~SetGlobalTimer("NaliaGraveyardTimer","GLOBAL",THREE_DAYS)
SetGlobal("NaliaGraveComplain","GLOBAL",1)~ GOTO 93
  IF ~~ THEN REPLY #1745 /* ~Naprawdê nie uwa¿am byœmy mieli na to czas. Rzeczywiœcie musisz tam byæ?~ */ DO ~SetGlobalTimer("NaliaGraveyardTimer","GLOBAL",THREE_DAYS)
SetGlobal("NaliaGraveComplain","GLOBAL",1)~ GOTO 94
END

IF ~~ THEN BEGIN 92 // from: 91.0
  SAY #1746 /* ~Jest to dla mnie bardzo wa¿ne. Dziêkujê ci za pomoc.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 93 // from: 91.1
  SAY #1747 /* ~Nie martwiê siê poniewa¿ odchodzê. Przykro mi, ale jest to dla mnie bardzo wa¿ne i nie mogê tego przegapiæ. Powinnam byæ w 'Pod Miedzianym Diademem' w dzieñ po pogrzebie.~ */
  IF ~~ THEN DO ~GivePartyAllEquipment()
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
SetGlobal("NaliaWentToFuneral","GLOBAL",1)
SetGlobalTimer("NaliaReturnsFromFuneral","GLOBAL",ONE_DAY)
LeaveParty()
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 94 // from: 91.2
  SAY #1748 /* ~Na pogrzebie mojego ojca? No, myœlê, ¿e tak! Nie mogê siê d³u¿ej godziæ na te opóŸnienia. Bêdê w 'Pod Miedzianym Diademem' w dzieñ po pogrzebie, jeœli chcesz mnie jeszcze zobaczyæ.~ */
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
  SAY #1749 /* ~Nie mogê ju¿ d³u¿ej czekaæ. Muszê wyruszyæ w tej chwili, niezale¿nie od tego czy to komuœ odpowiada, czy nie! Bêdê w gospodzie Pod Miedzianym Diademem w dzieñ po pogrzebie, jeœli chcesz mnie jeszcze zobaczyæ.~ [NALIA76] */
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
  SAY #1769 /* ~Och nie! To Isaea! Wynoœmy siê st¹d.~ [NALIA90] */
  IF ~~ THEN EXTERN ~ISAEA~ 1
END

IF ~~ THEN BEGIN 97 // from:
  SAY #1771 /* ~Przestañ, Isaea. Ja siê nie 'tu³am' jak wystrojeni g³upcy szukaj¹cy wra¿eñ. Ja pomagam ludziom.~ */
  IF ~~ THEN EXTERN ~ISAEA~ 2
END

IF ~~ THEN BEGIN 98 // from:
  SAY #1773 /* ~Na czele mojego domu stoi ktoœ, kto nie jest ci winny pos³uszeñstwa. Czy takie umowy utrzymuj¹ wa¿noœæ po œmierci ich twórców? Nie, wojownik mo¿e obj¹æ tytu³ do...~ */
  IF ~~ THEN EXTERN ~ISAEA~ 4
END

IF ~~ THEN BEGIN 99 // from:
  SAY #1775 /* ~Mojego domu? Jakiego domu? Twoja rodzina rozporz¹dza posiad³oœci¹ mojego ojca jak swoj¹. To oznacza, ¿e moje imiê straci³o... straci³o wszelk¹ szlachetnoœæ jak¹ mia³o.~ */
  IF ~~ THEN GOTO 166
END

IF ~~ THEN BEGIN 100 // from:
  SAY #1778 /* ~Tak w³aœnie s¹dzi³am. Nie, nie s¹dzê bym ciê mia³a poœlubiæ, Isaea. Nie muszê, ani nie potrzebujê, a poza tym, i co najwa¿niejsze, nie czujê siê dobrze w twoim towarzystwie.~ */
  IF ~~ THEN EXTERN ~ISAEA~ 5
END

IF ~~ THEN BEGIN 101 // from:
  SAY #1780 /* ~Nie ma nic bardziej absurdalnego ni¿ ty, forsuj¹cy pomys³ tych 'zarêczyn'. Nie, Isaea, nie wyjdê za ciebie. Przede wszystkim nie czujê siê dobrze w twoim towarzystwie.~ */
  IF ~~ THEN EXTERN ~ISAEA~ 5
END

IF ~~ THEN BEGIN 102 // from:
  SAY #1787 /* ~Dziêkujê ci, Lordzie Roenall. By³by zadowolony s³ysz¹c tak¹ pochwa³ê.~ */
  IF ~~ THEN EXTERN ~FARTHIN~ 1
END

IF ~~ THEN BEGIN 103 // from:
  SAY #1789 /* ~Lordzie Roenall, jesteœ skoñczonym ³ajdakiem!~ */
  IF ~Global("PCKeepOwner","GLOBAL",1)~ THEN EXTERN ~FARTHIN~ 2
  IF ~Global("PCKeepOwner","GLOBAL",0)~ THEN EXTERN ~FARTHIN~ 3
END

IF ~~ THEN BEGIN 104 // from:
  SAY #1793 /* ~CO powiedzia³ Isaea?! Opuœci³am?! Wyrwano mi go! Co...~ */
  IF ~~ THEN EXTERN ~ISAEA~ 8
END

IF ~~ THEN BEGIN 105 // from:
  SAY #1794 /* ~Obawiam siê, ¿e jesteœ Ÿle poinformowany, panie. Nie, po œmierci mojego ojca najlepiej by³o oddaæ siê pod opiekê wojownika, który uratowa³ tê twierdzê. Znasz stare zwyczaje, nieprawda¿?~ */
  IF ~~ THEN EXTERN ~FARTHIN~ 4
END

IF ~~ THEN BEGIN 106 // from:
  SAY #1799 /* ~Co mu powiedzia³eœ, Isaea? ¯e mnie przegoniono i ba³am siê wróciæ? Czy to w ten sposób zamierzasz zaw³adn¹æ mym domem, moim ¿yciem? Nie pozwolê na to!~ */
  IF ~~ THEN EXTERN ~ISAEA~ 9
END

IF ~~ THEN BEGIN 107 // from:
  SAY #1801 /* ~Mówiê... mówiê byœ wzi¹³ swoje imiê i siê nim ud³awi³! Nie bêdê twoj¹ maskotk¹!~ */
  IF ~~ THEN EXTERN ~ISAEA~ 10
END

IF WEIGHT #11 /* Triggers after states #: 339 even though they appear after this state */
~Global("IsaeaNalia","GLOBAL",1)
Global("NaliaComplainsIsaea","LOCALS",0)
GlobalTimerExpired("FuneralLeaveTimer","GLOBAL")
CombatCounter(0)
~ THEN BEGIN 108 // from:
  SAY #1811 /* ~Przepraszam za tê przyd³ug¹ wymianê zdañ, ale on jest takim ³obuzem, takim... takim manipuluj¹cym... takim... och, do diab³a z manierami, on jest skoñczonym draniem, a nazwanie go w ten sposób obra¿a wszystkich innych drani!~ [NALIA77] */
  IF ~~ THEN REPLY #1812 /* ~Czy on zawsze by³ taki... napalony? Wygl¹da na zdeterminowanego by wprowadziæ w ¿ycie wasze zarêczyny.~ */ DO ~SetGlobal("NaliaComplainsIsaea","LOCALS",1)~ GOTO 109
  IF ~~ THEN REPLY #1813 /* ~Powiedzia³, ¿e mo¿e 'pomóc lub zaszkodziæ', i ¿e 'ju¿ to robi³'. Co to znaczy?~ */ DO ~SetGlobal("NaliaComplainsIsaea","LOCALS",1)~ GOTO 110
  IF ~~ THEN REPLY #1814 /* ~Poœlubienie go mog³oby byæ ca³kiem op³acalne. Myœla³aœ o tym, prawda?~ */ DO ~SetGlobal("NaliaComplainsIsaea","LOCALS",1)~ GOTO 111
  IF ~~ THEN REPLY #1815 /* ~Nie chcê braæ udzia³u w tym zamieszaniu. Spotkamy siê znowu z tym wymuskanym prostakiem?~ */ DO ~SetGlobal("NaliaComplainsIsaea","LOCALS",1)~ GOTO 112
  IF ~Global("azucarCR38","GLOBAL",0)
See("Chloe")
!Dead("Chloe")
InParty("Chloe")
~ THEN DO ~SetGlobal("azucarCR38","GLOBAL",1)~ EXTERN ~CHLOEJ~ 1004
END

IF ~~ THEN BEGIN 109 // from: 346.0 108.0
  SAY #1816 /* ~Nie rozumiem go. Gdyby nie by³ synem Lorda Roenalla pomyœla³abym, ¿e jest zdolny do wszystkiego. Wszystkiego co najgorsze, ma siê rozumieæ.~ */
  IF ~~ THEN GOTO 204
END

IF ~~ THEN BEGIN 110 // from: 346.1 108.1
  SAY #1817 /* ~Co to znaczy? To, ¿e jest ³ajdakiem, i ¿e gdyby nie by³ synem Lorda Roenalla pomyœla³abym, ¿e jest zdolny do wszystkiego co najgorsze.~ */
  IF ~~ THEN GOTO 204
END

IF ~~ THEN BEGIN 111 // from: 346.2 108.2
  SAY #1818 /* ~Przypominam sobie o tym ka¿dego dnia, gdy siê budzê i zdajê sobie sprawê z tego, co siê zmieni³o. Ojciec trzyma³ wszystko w równowadze i porz¹dku. Teraz wszystko jest do góry nogami.~ */
  IF ~~ THEN GOTO 204
END

IF ~~ THEN BEGIN 112 // from: 346.3 108.3
  SAY #1819 /* ~Mam nadziejê, ¿e da mi teraz swobodê. W³aœciwie by³ to pierwszy raz, gdy otwarcie powiedziano "nie". Ojciec zawsze dawa³ sobie z tym radê. Za³o¿ê siê, ¿e doprowadza³ Isaeê do sza³u tak jak i ja.~ */
  IF ~~ THEN GOTO 204
END

IF ~~ THEN BEGIN 113 // from:
  SAY #14316 /* ~Biedne dziecko. Da³abym ci wszystko, co mog³a, gdybym mia³a wiele na zbyciu. Nie mogê siê pogodziæ z tym, ¿e tak wielu cierpi tak¹ biedê.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 114 // from:
  SAY #14482 /* ~To jest sposób na rozwi¹zanie tego problemu, nieprawda¿? Iœæ i zabiæ wszystkich biedaków, poniewa¿ ONI za tym stoj¹, hm?~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 115 // from:
  SAY #14490 /* ~Nie, myœlê, ¿e nie. Jesteœmy œmiertelni jak wszyscy inni. Lekcja, jakiej powinny nauczyæ siê inne Rodziny, choæ nie ¿yczy³abym tego mojemu najgorszemu wrogowi.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 116 // from:
  SAY #15021 /* ~S¹ moimi przyjació³mi. Zaœ ich uczynki sprawiaj¹, ¿e s¹ o wiele godniejsi od czegokolwiek, co jest zwi¹zane ze szlacheckim urodzeniem.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 117 // from:
  SAY #22385 /* ~Ty biedaku! Jakby nie by³o doœæ bogaczy w Athkatli, którym mo¿na by kraœæ. Hm.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 118 // from:
  SAY #14724 /* ~Sp³ywaj, Salvanas. Wiesz, ¿e stale tu przychodzê.~ */
  IF ~~ THEN EXTERN ~SALVANAS~ 4
END

IF ~~ THEN BEGIN 119 // from:
  SAY #19747 /* ~£adne, ale to samo powiedzia³eœ Priss w zesz³ym tygodniu.~ */
  IF ~~ THEN EXTERN ~SALVANAS~ 5
END

IF ~~ THEN BEGIN 120 // from:
  SAY #19750 /* ~Trzymaj tak dalej, a zrani ciê coœ wiêcej ni¿ moje s³owa, g³upcze.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 121 // from:
  SAY #25408 /* ~Dlaczego to mówisz, starcze?~ */
  IF ~~ THEN EXTERN ~YARIN~ 11
END

IF ~~ THEN BEGIN 122 // from:
  SAY #25410 /* ~Mo¿e nie by³eœ w tym wystarczaj¹co dobry.~ */
  IF ~~ THEN EXTERN ~YARIN~ 12
END

IF ~~ THEN BEGIN 123 // from:
  SAY #25413 /* ~Có¿, zamierzam wykorzystaæ moje umiejêtnoœci w jakimœ dobrym celu. Jest wielu biedaków, którym mogê pomóc... <CHARNAME> te¿ mo¿e otrzymaæ ode mnie wsparcie.~ */
  IF ~~ THEN EXTERN ~YARIN~ 14
END

IF ~~ THEN BEGIN 124 // from:
  SAY #25688 /* ~A ja mog³abym ci ogoliæ stopy moim sztyletem szybciej ni¿byœ zdo³a³ bekn¹æ, ma³y nizio³ku. Ale nie mam z³ych zamiarów... wiêc siê wyluzuj.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 125 // from:
  SAY #25702 /* ~IdŸ i zanurz na trochê d³u¿ej ³eb w morskiej wodzie, marynarzyku.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 126 // from:
  SAY #25721 /* ~Nie... nie o to mi chodzi³o. Zastanawia³am siê tylko, czy rzeczywiœcie zamierzasz uczyniæ rybie flaki czêœci¹ swojego stroju.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 127 // from:
  SAY #25823 /* ~Er... myœlê, ¿e ktoœ powinien usi¹œæ i uci¹æ sobie d³ug¹ pogawêdkê z twoj¹ matk¹...~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 128 // from:
  SAY #27643 /* ~Jeœli masz na tyle w sakiewce by wydawaæ na towary zamiast na dodatkow¹ ochronê, z pewnoœci¹ zas³ugujesz na to by ciê oskubano przynajmniej z czêœci piórek, w jakie obros³eœ, kupcze.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 129 // from:
  SAY #28452 /* ~Hm. To pewnie dlatego z³odziejstwo nigdy nie by³o zbyt ryzykownym zajêciem w Athkatli.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 130 // from:
  SAY #29536 /* ~A dlaczego nie jesteœ jeszcze porz¹dnie martwy?~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 131 // from:
  SAY #29610 /* ~Chodzi tylko o to, ¿e nie mogê siê oprzeæ wra¿eniu, panie, ¿e na swój sposób tkwimy w tym samym interesie.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 132 // from:
  SAY #29691 /* ~(westchnienie) Nie przejmuj siê. Naprawdê.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 133 // from:
  SAY #30076 /* ~Spójrz na to z tej strony: byæ mo¿e jest to po prostu sposób, w jaki bogowie chc¹ ci powiedzieæ, ¿e jest wiele wiêcej biednych, którzy o wiele bardziej potrzebuj¹ tych pieniêdzy od ciebie, co?~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 134 // from:
  SAY #30094 /* ~Wiem jak siê czujesz, ch³opcze. Jestem pewna, ¿e znajdziesz podobny do mojego sposób by to wyraziæ.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 135 // from:
  SAY #38736 /* ~Có¿, nie zamierzam ci odmówiæ jednej czy dwóch sztuk z³ota, biedna duszo. Mamy ich pod dostatkiem, jak s¹dzê... a te kilka sztuk z³ota znaczy dla nich wiele wiêcej ni¿ dla ciebie, <CHARNAME>!~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 136 // from:
  SAY #38740 /* ~Mi³e to by³o z twojej strony, <CHARNAME>! Chocia¿ jestem pewna, ¿e mo¿na im by³o ofiarowaæ o wiele wiêcej... na co zbierasz? Na z³oty miecz?~ */
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
  SAY #38870 /* ~Jestem pewna, ¿e to nie jest tak... tak straszne... jak to opisujesz.~ */
  IF ~~ THEN EXTERN ~WCUST03~ 3
END

IF ~~ THEN BEGIN 138 // from:
  SAY #38914 /* ~Nie mogê uwierzyæ w panuj¹ce tutaj warunki. Mo¿ni godz¹ siê by biedota tak mieszka³a, gdy tylko strac¹ j¹ z oczu... to... to doprowadza mnie do sza³u!~ */
  IF ~!IsValidForPartyDialog("Anomen")~ THEN EXIT
  IF ~IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ 157
END

IF ~~ THEN BEGIN 139 // from:
  SAY #38917 /* ~Nie mogê uwierzyæ, ¿e jesteœ tak wyprany z uczuæ, Anomenie!~ */
  IF ~~ THEN EXTERN ~ANOMENJ~ 158
END

IF ~~ THEN BEGIN 140 // from:
  SAY #38929 /* ~Có¿, to nie jest do koñca prawd¹, nieprawda¿ <CHARNAME>? Zapomnijmy, ¿e nasze kieszenie wypchane s¹ z³otem, tu w domu Boga Mi³osierdzia. Hm.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 141 // from:
  SAY #38956 /* ~£adna...? Chyba nie mówisz do mnie, co?~ */
  IF ~~ THEN EXTERN ~WAYLANE~ 24
END

IF ~~ THEN BEGIN 142 // from:
  SAY #38959 /* ~Powiedzia³abym, ¿e jesteœ ¿a³osnym cz³owiekiem, który powinien dla odmiany poszukaæ jakiegoœ uczciwego zajêcia. Szczerze mówi¹c... kto wed³ug ciebie da siê na to nabraæ?~ */
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
  SAY #39175 /* ~On jest tylko ch³opcem, <CHARNAME>, który nie mo¿e ci zrobiæ ¿adnej krzywdy. Nie ma powodu by go traktowaæ tak ostro, nieprawda¿? On tylko szuka pomocy.~ */
  IF ~!IsValidForPartyDialog("Korgan")~ THEN EXIT
  IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ 42
END

IF ~~ THEN BEGIN 145 // from:
  SAY #39279 /* ~Czy¿ nie masz serca, rycerzu? Ci ludzie nic nie maj¹! A my jesteœmy w stanie im pomóc!~ */
  IF ~~ THEN EXTERN ~ANOMENJ~ 163
END

IF ~~ THEN BEGIN 146 // from:
  SAY #39354 /* ~S³ysza³am ju¿ wczeœniej... pog³oski na temat w³aœciciela tego miejsca, ale nigdy bym nie s¹dzi³a, ¿e jest w nich tyle prawdy. To miejsce... jest odra¿aj¹ce. Musimy coœ zrobiæ!~ */
  IF ~~ THEN EXTERN ~HENDAK~ 6
END

IF ~~ THEN BEGIN 147 // from:
  SAY #39417 /* ~Ciê¿ko mi zadaæ to pytanie... co jest w³aœciwie z³ego w k¹pielach w mleku?~ */
  IF ~~ THEN EXTERN ~JANJ~ 88
END

IF WEIGHT #12 /* Triggers after states #: 339 even though they appear after this state */
~Dead("Torgal")
Global("NaliaKeepPlot","GLOBAL",0)
AreaCheck("AR1300")
Global("NaliaRaised","GLOBAL",0)
~ THEN BEGIN 148 // from: 191.3 191.2
  SAY #39770 /* ~Ju¿ po wszystkim... zgadza siê? Ale co zosta³o dla... Mój ojciec, nie ¿yje. Mój dom, w gruzach. Ktoœ namówi³ do tego te stwory... ale... ale kto...~ [NALIA78] */
  IF ~~ THEN REPLY #39929 /* ~Jak mniemam moje zadanie tutaj jest zakoñczone. Mogê ju¿ iœæ?~ */ DO ~EraseJournalEntry(5083)
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
~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta³ odbity.

Po ciê¿kiej walce zamek d'Arnise zosta³ oczyszczony z trolli. Niestety, nie uda³o nam siê uratowaæ Lorda i zabi³ go TorGal, przywódca trolli. Ale Nalia ¿yje... tyle ¿e przysz³oœæ jej i zamku jest niepewna.~ */ GOTO 167
  IF ~~ THEN REPLY #39930 /* ~Nie mogê z³agodziæ twojego bólu. Zrobi³em wszystko, co w mojej mocy, ale niewiele wiêcej mogê tutaj zdzia³aæ.~ */ DO ~EraseJournalEntry(5083)
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
~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta³ odbity.

Po ciê¿kiej walce zamek d'Arnise zosta³ oczyszczony z trolli. Niestety, nie uda³o nam siê uratowaæ Lorda i zabi³ go TorGal, przywódca trolli. Ale Nalia ¿yje... tyle ¿e przysz³oœæ jej i zamku jest niepewna.~ */ GOTO 167
  IF ~~ THEN REPLY #39931 /* ~Czujê, ¿e moje zadanie nie zosta³o wype³nione. Nie uda³o mi siê uratowaæ twojego ojca i przykro mi z tego powodu.~ */ DO ~EraseJournalEntry(5083)
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
~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta³ odbity.

Po ciê¿kiej walce zamek d'Arnise zosta³ oczyszczony z trolli. Niestety, nie uda³o nam siê uratowaæ Lorda i zabi³ go TorGal, przywódca trolli. Ale Nalia ¿yje... tyle ¿e przysz³oœæ jej i zamku jest niepewna.~ */ GOTO 167
  IF ~~ THEN REPLY #39932 /* ~Przykro mi, ¿e nie mogê zostaæ d³u¿ej by to wyjaœniæ. Wspomina³aœ coœ o nagrodzie?~ */ DO ~EraseJournalEntry(5083)
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
~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta³ odbity.

Po ciê¿kiej walce zamek d'Arnise zosta³ oczyszczony z trolli. Niestety, nie uda³o nam siê uratowaæ Lorda i zabi³ go TorGal, przywódca trolli. Ale Nalia ¿yje... tyle ¿e przysz³oœæ jej i zamku jest niepewna.~ */ GOTO 167
  IF ~~ THEN REPLY #39933 /* ~Zrobi³em, co w mojej mocy. Mogê oczekiwaæ jakiejœ nagrody? Nie chcê by to zabrzmia³o nietaktownie.~ ~Zrobi³am, co w mojej mocy. Mogê oczekiwaæ jakiejœ nagrody? Nie chcê by to zabrzmia³o nietaktownie.~ */ DO ~EraseJournalEntry(5083)
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
~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta³ odbity.

Po ciê¿kiej walce zamek d'Arnise zosta³ oczyszczony z trolli. Niestety, nie uda³o nam siê uratowaæ Lorda i zabi³ go TorGal, przywódca trolli. Ale Nalia ¿yje... tyle ¿e przysz³oœæ jej i zamku jest niepewna.~ */ GOTO 167
END

IF ~~ THEN BEGIN 149 // from: 248.0 0.2 0.1 0.0
  SAY #39792 /* ~Powinnam by³a ci powiedzieæ wczeœniej, ale inni opuœcili mnie, gdy siê dowiedzieli. Jesteœmy otoczeni przez trolle. G³ówny atak zacz¹³ siê zaledwie kilka nocy temu.~ */
  IF ~~ THEN GOTO 318
END

IF ~~ THEN BEGIN 150 // from: 32.0
  SAY #39820 /* ~Niedobrze siê dzieje, ¿e mamy tak wiele tylko ze wzglêdu na urodzenie. Wieœniacy zas³uguj¹ na tê odrobinê, któr¹ mogê im ofiarowaæ. S³u¿¹ dobrze i zas³uguj¹ na sw¹ godnoœæ.~ */
  IF ~~ THEN GOTO 36
END

IF ~~ THEN BEGIN 151 // from: 41.0
  SAY #39830 /* ~Nie pozwolê by j¹ znów wykorzystywano do tych celów. Nie ma ¿adnej wymówki. Jak oni... Dalesonie, powiedzia³eœ tym bestiom o piwnicy?~ */
  IF ~~ THEN EXTERN ~DALESON~ 26
END

IF ~~ THEN BEGIN 152 // from:
  SAY #39852 /* ~I ja mam tak¹ nadziejê. Moi nowi przyjaciele i ja zamierzamy siê dowiedzieæ, i upewniæ siê, ¿e nic podejrzanego nie ma w moim domu. Nie martw siê, Kapitanie Aracie, wrócisz na swoje stanowisko ani siê obejrzysz.~ */
  IF ~~ THEN EXTERN ~KPCAPT01~ 32
END

IF ~~ THEN BEGIN 153 // from:
  SAY #39903 /* ~Hendronie? ¯yjesz! Co tu robisz?~ */
  IF ~~ THEN EXTERN ~KPSOLD01~ 9
END

IF ~~ THEN BEGIN 154 // from:
  SAY #39904 /* ~Jesteœmy tutaj by siê rozprawiæ z najeŸdŸcami, Hendronie, i ocaliæ tych, którzy jeszcze ¿yj¹. Cieszê siê... ¿e Ciotunia jest wci¹¿ bezpieczna. Udasz siê z ni¹ pod palisadê, Hendronie?~ */
  IF ~~ THEN EXTERN ~KPSOLD01~ 10
END

IF ~~ THEN BEGIN 155 // from:
  SAY #39905 /* ~Ciotunia daje siê prawdziwie we znaki, co?~ */
  IF ~~ THEN EXTERN ~KPSOLD01~ 11
END

IF ~~ THEN BEGIN 156 // from:
  SAY #39906 /* ~Nie martw siê. Porozmawiam z ni¹.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 157 // from:
  SAY #39908 /* ~G-glaicusie? Czy to ty? Och, nie, <CHARNAME>... on musia³ zostaæ zauroczony! Jest jednym z najlojalniejszych stra¿ników mojego ojca, inaczej nigdy by tego nie zrobi³!!~ */
  IF ~~ THEN UNSOLVED_JOURNAL #7079 /* ~Napaœæ na zamek d'Arnise.

ZnaleŸliœmy Glaicusa, wiernego stra¿nika Lorda d'Arnise. Nalia jest przekonana, ¿e musia³ zostaæ zauroczony lub poddany dzia³aniu jakiejœ innej magii.~ */ EXIT
END

IF ~~ THEN BEGIN 158 // from: 63.0
  SAY #39910 /* ~Tutaj tkwi problem, wed³ug mnie. Mój ojciec... utrzymywa³ regularn¹ wspó³pracê z Roenallami, chocia¿ jestem pewna, ¿e czasami czu³ do nich niesmak równy mojemu.~ */
  IF ~~ THEN GOTO 64
END

IF ~~ THEN BEGIN 159 // from: 64.0
  SAY #39911 /* ~Wszyscy inni s¹ traktowani jak œmiecie. Mój ojciec wspó³pracowa³ z nimi, ale nie by³ taki jak oni. Tolerowali go ze wzglêdu na jego maj¹tek i sk³onnoœæ do ugody.~ */
  IF ~~ THEN GOTO 65
END

IF ~~ THEN BEGIN 160 // from: 65.0
  SAY #39916 /* ~Mój ojciec ciê¿ko pracowa³ na siebie, podczas gdy inni trwonili maj¹tki. Roenallowie chcieli zacieœniæ z nim wiêzy przez ma³¿eñstwo. S¹ potê¿ni, przyzna³ z niechêci¹.~ */
  IF ~~ THEN GOTO 66
END

IF ~~ THEN BEGIN 161 // from: 301.0 68.0 66.1
  SAY #39920 /* ~Proponujê uk³ad, w tajemnicy rzecz jasna, na mocy, którego ty obejmiesz prawo do tego miejsca. Staniesz siê nominalnym przywódc¹ tej twierdzy, a ja bêdê swego rodzaju wychowankiem.~ */
  IF ~~ THEN GOTO 69
END

IF ~~ THEN BEGIN 162 // from: 69.0
  SAY #39923 /* ~Czy zgodziliby siê? Nie, ale niewiele mogliby zrobiæ. Nie jest rzecz¹ niezwyk³¹, kiedy wojownik przejmuje w³asnoœæ pana dworu, gdy ten jest... martwy.~ */
  IF ~~ THEN GOTO 70
END

IF ~~ THEN BEGIN 163 // from: 69.1
  SAY #39925 /* ~Niczego oprócz si³y... charakteru. Nie jest rzecz¹ niezwyk³¹ przej¹æ w³adzê nad twierdz¹, gdy jej pan jest... martwy. Spadkobiercy musz¹ jedynie publicznie to og³osiæ.~ */
  IF ~~ THEN GOTO 71
END

IF ~~ THEN BEGIN 164 // from: 69.3
  SAY #39926 /* ~To bêdzie z po¿ytkiem dla nas wszystkich! Ty otrzymasz pozycjê spo³eczn¹, zaœ ja zachowam mój dom, zgodnie z ¿yczeniem mojego ojca. Nie jest rzecz¹ niezwyk³¹ przej¹æ w³adzê nad twierdz¹, gdy jej pan jest... martwy.~ */
  IF ~~ THEN GOTO 72
END

IF ~~ THEN BEGIN 165 // from: 74.0
  SAY #39927 /* ~ChodŸmy ju¿, chocia¿ mo¿esz siê tu rozejrzeæ. S³u¿ba przywróci to miejsce do porz¹dku. Dziêkujê ci raz jeszcze.~ */
  IF ~~ THEN DO ~SetGlobal("PCKeepOwner","GLOBAL",1)
SetGlobal("PlayerHasStronghold","GLOBAL",1)
RevealAreaOnMap("AR1304")
HideAreaOnMap("AR1300")
StartCutSceneMode()
StartCutScene("Cut32a")
~ EXIT
END

IF ~~ THEN BEGIN 166 // from: 99.0
  SAY #39928 /* ~Skoro moje prawa do kontrolowania uk³adów mojego ojca wygas³y, dlaczego utrzymywane s¹ w mocy warunki, na których powsta³y te uk³ady? Zamierzasz oddaæ mi kontrolê nad twierdz¹?~ */
  IF ~~ THEN EXTERN ~ISAEA~ 3
END

IF ~~ THEN BEGIN 167 // from: 148.4 148.3 148.2 148.1 148.0
  SAY #39934 /* ~Och, oczywiœcie. Zadanie uda³o ci siê wype³niæ zgodnie z proœb¹. ¯yczê ci powodzenia. Dopilnujê twojej zap³aty, a potem... potem... och nie. Mogê ciê prosiæ o...~ */
  IF ~~ THEN GOTO 168
END

IF ~~ THEN BEGIN 168 // from: 167.0
  SAY #39935 /* ~Nie, g³upstwem jest tak myœleæ. Zap³acê ci i wrócê do ¿ycia, które muszê prowadziæ.~ */
  IF ~~ THEN REPLY #39936 /* ~Mów, Nalio. Nie mam zamiaru siedzieæ ca³¹ noc i siê zastanawiaæ, co chcia³aœ powiedzieæ.~ */ DO ~GiveGoldForce(10650)~ GOTO 169
  IF ~~ THEN REPLY #39937 /* ~O co chodzi? Nic nie szkodzi zapytaæ.~ */ DO ~GiveGoldForce(10650)~ GOTO 169
END

IF ~~ THEN BEGIN 169 // from: 168.1 168.0
  SAY #39938 /* ~To zale¿y od tego, co siê ma ze mn¹ staæ. Mój... mój ojciec, Lord w tym domu, nie ¿yje. W arystokratycznych krêgach tytu³ przechodzi na mêskiego spadkobiercê.~ */
  IF ~Gender(Player1,MALE)
~ THEN REPLY #39939 /* ~A zatem bez w¹tpienia chcesz bym wcieli³ siê w tê rolê. Coœ w rodzaju ma³¿eñstwa z rozs¹dku?~ */ GOTO 170
  IF ~Gender(Player1,FEMALE)
~ THEN REPLY #39940 /* ~Przyjê³abym tê rolê, gdybym mog³a, ale oczywiœcie nie mogê ci pomóc w tej sprawie.~ */ GOTO 170
  IF ~~ THEN REPLY #39941 /* ~Czego chcesz ode mnie?~ */ GOTO 171
  IF ~~ THEN REPLY #39942 /* ~Niewiele wiem o tych rzeczach. Mów, co masz na myœli i wyra¿aj siê jasno.~ */ GOTO 171
END

IF ~~ THEN BEGIN 170 // from: 169.1 169.0
  SAY #39943 /* ~Co? Och, nie, nie, nie, nic podobnego. Wielkie nieba, nie. Porzuæ tê myœl. Naprawdê. To by spowodowa³o nie koñcz¹cy siê skandal.~ */
  IF ~~ THEN GOTO 171
END

IF ~~ THEN BEGIN 171 // from: 170.0 169.3 169.2
  SAY #39944 /* ~Zamierzam st¹d odejœæ. Nic wiêcej mnie tu nie czeka. Jestem... zarêczona z ³ajdakiem, który z pewnoœci¹ bêdzie próbowa³ odebraæ mi kontrolê nad tym miejscem.~ */
  IF ~~ THEN GOTO 172
END

IF ~~ THEN BEGIN 172 // from: 171.0
  SAY #39945 /* ~Byæ mo¿e najlepszym rozwi¹zaniem bêdzie odejœcie. Mój ojciec zawsze mawia³, ¿e cz³owieka mo¿na poznaæ po czynach, a nie po majêtnoœci. Osobliwe, ale pomo¿e mi to dzisiaj zasn¹æ.~ */
  IF ~~ THEN REPLY #39946 /* ~Nie chcesz walczyæ o swój dom? Nie mogê nic dla ciebie zrobiæ?~ */ GOTO 173
  IF ~~ THEN REPLY #39947 /* ~Twoje towarzystwo bêdzie mile widziane, jeœli zechcesz do mnie do³¹czyæ. Oni nie bêd¹ ciê niepokoiæ w drodze.~ */ GOTO 175
  IF ~~ THEN REPLY #39948 /* ~Nie potrzebujê ciê ju¿. Musisz zrobiæ, co w twojej mocy tutaj, na miejscu.~ */ GOTO 176
END

IF ~~ THEN BEGIN 173 // from: 172.0
  SAY #39949 /* ~Oni nie s¹ przestêpcami, s¹ jedynie odpychaj¹cy. Gdybyœ by³<PRO_HESHE> wojownikiem, mo¿naby ci by³o przyznaæ stanowisko dowódcze.~ */
  IF ~~ THEN GOTO 174
END

IF ~~ THEN BEGIN 174 // from: 173.0
  SAY #39950 /* ~Nie, powinnam st¹d odejœæ. Czy mogê siê schroniæ przy tobie? Pragnê wyjœæ do potrzebuj¹cych i pomagaæ im. ¯ycie tutaj by³o takie spokojne.~ */
  IF ~~ THEN REPLY #39951 /* ~Znajdziesz przy mnie schronienie, jeœli tego chcesz. ¯ycie w ci¹g³ej drodze jest jednak ciê¿kie.~ */ GOTO 175
  IF ~~ THEN REPLY #39952 /* ~By³aœ mi potrzebna w grupie tylko do czasu, gdy twoja twierdza zostanie odbita. Teraz powinnaœ pójœæ sobie.~ */ GOTO 202
END

IF ~~ THEN BEGIN 175 // from: 174.0 172.1
  SAY #39953 /* ~Dobrze wiêc. Pójdê z tob¹. Smutno patrzeæ jak to miejsce dostaje siê w z³e rêce, ale nie mam wyboru. Nie bêdê pomagaæ Roenallom w wype³nianiu ich snobistycznych planów.~ */
  IF ~~ THEN DO ~SetGlobal("RoenalControl","GLOBAL",1)
CreateCreature("QUINT",[3306.2412],14)
~ EXIT
END

IF ~~ THEN BEGIN 176 // from: 202.0 172.2
  SAY #39954 /* ~Moja przysz³oœæ jest zagro¿ona. Bêdê rozpieszczana, a¿ stanê siê tym, czego nienawidzê. IdŸ wiêc i prowadŸ ¿ycie podró¿nika. Ja zmarniejê tutaj.~ */
  IF ~~ THEN DO ~SetGlobal("NaliaAtKeep","GLOBAL",1)
LeaveParty()
ChangeAIScript("",DEFAULT)
SetDialog("Nalia")
~ EXIT
END

IF ~~ THEN BEGIN 177 // from:
  SAY #39962 /* ~To wspania³y pomys³! Dziêkujê ci, Kapitanie Aracie, dobrze siê przys³u¿y³eœ mojemu ojcu. <CHARNAME>, zaraz po wejœciu powinniœmy szybko opuœciæ most.~ */
  IF ~~ THEN EXTERN ~KPCAPT01~ 11
END

IF ~~ THEN BEGIN 178 // from:
  SAY #39980 /* ~Mogê za niego rêczyæ, <CHARNAME>. Od dawna s³u¿y mojej rodzinie, a poza tym... i tak nie ma tu w okolicy nikogo innego, kto móg³by podj¹æ siê tego zadania.~ */
  IF ~~ THEN EXTERN ~KPDOMO01~ 2
END

IF ~~ THEN BEGIN 179 // from:
  SAY #40001 /* ~Ludzie nie wytrzymaj¹ teraz d³ugo z nowymi podatkami, <CHARNAME>... nie zapominaj, ¿e dopiero co odparliœmy inwazjê trolli.~ */
  IF ~~ THEN EXTERN ~KPDOMO01~ 12
END

IF ~~ THEN BEGIN 180 // from:
  SAY #40037 /* ~Ciotuniu! Nasza twierdza zosta³a uchroniona przed trollami tylko dziêki j<PRO_HISHER> pomocy! Na dodatek <CHARNAME> chroni dom przed wpadniêciem w rêce Roenallów!~ */
  IF ~~ THEN EXTERN ~DELCIA~ 28
END

IF ~~ THEN BEGIN 181 // from:
  SAY #40044 /* ~Przykro mi, <CHARNAME>... moim... moim prawem jest zrobiæ z ziemi¹ co zechcê, i wierzê ci. Ona jakoœ to przeboleje.~ */
  IF ~~ THEN EXTERN ~KPDOMO01~ 20
END

IF ~~ THEN BEGIN 182 // from:
  SAY #40111 /* ~Nie wydaje mi siê by by³ to wielki problem, <CHARNAME>... po prostu nie rób tego zbyt czêsto, taka jest moja rada.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 183 // from:
  SAY #40112 /* ~Ludzie ju¿ zaczynaj¹ byæ niezadowoleni z ciebie, <CHARNAME>. Musisz uwa¿aæ z tymi podatkami!~ */
  IF ~~ THEN EXTERN ~KPDOMO01~ 29
END

IF ~~ THEN BEGIN 184 // from:
  SAY #40113 /* ~S³ysza³am, ¿e ludzie siê burz¹. Nie nak³ada³abym ju¿ nowych podatków, <CHARNAME>... chyba nie chcesz by wybuch³a rewolta? Ojciec zawsze dobrze ich traktowa³.~ */
  IF ~~ THEN EXTERN ~KPDOMO01~ 29
END

IF ~~ THEN BEGIN 185 // from:
  SAY #40114 /* ~Nie mo¿esz nak³adaæ na nich kolejnych podatków! Ludzie s¹ bliscy powstania i wcale siê im nie dziwiê, zwa¿ywszy na to, co z nimi wyprawiasz!~ */
  IF ~~ THEN EXTERN ~KPDOMO01~ 29
END

IF WEIGHT #13 /* Triggers after states #: 339 even though they appear after this state */
~!Dead("Torgal")
Global("NaliaRaised","GLOBAL",2)
~ THEN BEGIN 186 // from:
  SAY #40116 /* ~Co... co siê sta³o... pamiêtam, ¿e poczu³am ból i... i wtedy przewróci³am siê... gdzie...~ */
  IF ~~ THEN GOTO 188
END

IF WEIGHT #14 /* Triggers after states #: 339 even though they appear after this state */
~Dead("Torgal")
Global("TalkedDaleson","GLOBAL",1)
Global("NaliaRaised","GLOBAL",2)
~ THEN BEGIN 187 // from:
  SAY #40117 /* ~*KASZEL* Co... co siê sta³o... pamiêtam, ¿e poczu³am ból i... i wtedy przewróci³am siê... gdzie...~ */
  IF ~~ THEN GOTO 190
END

IF ~~ THEN BEGIN 188 // from: 186.0
  SAY #40118 /* ~Ja... ja by³am martwa... czy¿ nie? To z pewnoœci¹ nie by³o przyjemne doœwiadczenie. D³ugo by³am nieprzytomna?~ */
  IF ~~ THEN REPLY #40119 /* ~Odzyska³aœ przytomnoœæ i tylko to siê liczy.~ */ GOTO 189
  IF ~~ THEN REPLY #40120 /* ~Tak, tak, to na pewno by³o bolesne. Mo¿emy ju¿ ruszaæ?~ */ GOTO 189
END

IF ~~ THEN BEGIN 189 // from: 188.1 188.0
  SAY #40121 /* ~Co... co z moim domem? Czy ci najeŸdŸcy opuœcili ju¿ moj¹ rodzinn¹ twierdzê? Proszê, jeœli wci¹¿ istnieje jakieœ zagro¿enie musimy siê tam jak najprêdzej udaæ.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 190 // from: 187.0
  SAY #40122 /* ~Ja... ja by³am martwa... czy¿ nie? To z pewnoœci¹ nie by³o przyjemne doœwiadczenie. D³ugo by³am nieprzytomna?~ */
  IF ~~ THEN REPLY #40123 /* ~Odzyska³aœ przytomnoœæ i tylko to siê liczy.~ */ GOTO 191
  IF ~~ THEN REPLY #40124 /* ~Tak, tak, to na pewno by³o bolesne. Mo¿emy ju¿ ruszaæ?~ */ GOTO 191
END

IF ~~ THEN BEGIN 191 // from: 190.1 190.0
  SAY #40125 /* ~Co... co z moim rodzinnym domem... moje wspomnienia s¹ zamazane, co siê sta³o? Czy najeŸdŸcy zostali rozgromieni?~ */
  IF ~OR(7)
Class(Player1,FIGHTER)
Class(Player1,FIGHTER_MAGE)
Class(Player1,FIGHTER_CLERIC)
Class(Player1,FIGHTER_THIEF)
Class(Player1,FIGHTER_MAGE_THIEF)
Class(Player1,FIGHTER_DRUID)
Class(Player1,FIGHTER_MAGE_CLERIC)
~ THEN REPLY #40126 /* ~Wszystkim siê zajêto. Twój dom zosta³ uratowany. Jednak twój ojciec... nie ¿yje.~ */ DO ~EraseJournalEntry(5083)
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
EraseJournalEntry(42371)~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta³ odbity.

Po ciê¿kiej walce zamek d'Arnise zosta³ oczyszczony z trolli. Niestety, nie uda³o nam siê uratowaæ Lorda i zabi³ go TorGal, przywódca trolli. Ale Nalia ¿yje... tyle ¿e przysz³oœæ jej i zamku jest niepewna.~ */ GOTO 53
  IF ~OR(7)
Class(Player1,FIGHTER)
Class(Player1,FIGHTER_MAGE)
Class(Player1,FIGHTER_CLERIC)
Class(Player1,FIGHTER_THIEF)
Class(Player1,FIGHTER_MAGE_THIEF)
Class(Player1,FIGHTER_DRUID)
Class(Player1,FIGHTER_MAGE_CLERIC)
~ THEN REPLY #40127 /* ~Stare wieœci. Twój dom zosta³ uratowany, ale twój ojciec nie ¿yje.~ */ DO ~EraseJournalEntry(5083)
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
EraseJournalEntry(42371)~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta³ odbity.

Po ciê¿kiej walce zamek d'Arnise zosta³ oczyszczony z trolli. Niestety, nie uda³o nam siê uratowaæ Lorda i zabi³ go TorGal, przywódca trolli. Ale Nalia ¿yje... tyle ¿e przysz³oœæ jej i zamku jest niepewna.~ */ GOTO 53
  IF ~!Class(Player1,FIGHTER)
!Class(Player1,FIGHTER_MAGE)
!Class(Player1,FIGHTER_CLERIC)
!Class(Player1,FIGHTER_THIEF)
!Class(Player1,FIGHTER_MAGE_THIEF)
!Class(Player1,FIGHTER_DRUID)
!Class(Player1,FIGHTER_MAGE_CLERIC)
~ THEN REPLY #40133 /* ~Wszystkim siê zajêto. Twój dom zosta³ uratowany. Jednak twój ojciec... nie ¿yje.~ */ DO ~EraseJournalEntry(5083)
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
EraseJournalEntry(42371)~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta³ odbity.

Po ciê¿kiej walce zamek d'Arnise zosta³ oczyszczony z trolli. Niestety, nie uda³o nam siê uratowaæ Lorda i zabi³ go TorGal, przywódca trolli. Ale Nalia ¿yje... tyle ¿e przysz³oœæ jej i zamku jest niepewna.~ */ GOTO 148
  IF ~!Class(Player1,FIGHTER)
!Class(Player1,FIGHTER_MAGE)
!Class(Player1,FIGHTER_CLERIC)
!Class(Player1,FIGHTER_THIEF)
!Class(Player1,FIGHTER_MAGE_THIEF)
!Class(Player1,FIGHTER_DRUID)
!Class(Player1,FIGHTER_MAGE_CLERIC)
~ THEN REPLY #40134 /* ~Stare wieœci. Twój dom zosta³ uratowany, ale twój ojciec nie ¿yje.~ */ DO ~EraseJournalEntry(5083)
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
EraseJournalEntry(42371)~ SOLVED_JOURNAL #10101 /* ~Zamek d'Arnise zosta³ odbity.

Po ciê¿kiej walce zamek d'Arnise zosta³ oczyszczony z trolli. Niestety, nie uda³o nam siê uratowaæ Lorda i zabi³ go TorGal, przywódca trolli. Ale Nalia ¿yje... tyle ¿e przysz³oœæ jej i zamku jest niepewna.~ */ GOTO 148
END

IF WEIGHT #15 /* Triggers after states #: 339 even though they appear after this state */
~GlobalGT("KPRevolt","GLOBAL",9)
~ THEN BEGIN 192 // from:
  SAY #40187 /* ~Ja... ja nie zgadzam siê! Chyba wolê, ¿eby Roenallowie przejêli nasze posiad³oœci! Nie pozwolê ci na przejêcie moich rodzinnych ziem i zamienienie ich w ruinê!~ [NALIA79] */
  IF ~~ THEN DO ~ChangeAIScript("",DEFAULT)
LeaveParty()
EscapeArea()~ EXIT
END

IF WEIGHT #16 /* Triggers after states #: 339 even though they appear after this state */
~Global("KilledKeepServants","GLOBAL",1)
~ THEN BEGIN 193 // from:
  SAY #40188 /* ~Nie mo¿esz... nie mo¿esz tak po prostu kogoœ zabiæ! Myœlisz, ¿e masz do tego prawo, poniewa¿ zarz¹dzasz twierdz¹?! Có¿ z ciebie za POTWÓR?! Ja... ja na to nie pójdê!~ [NALIA80] */
  IF ~~ THEN DO ~SetGlobal("KilledKeepServants","GLOBAL",2)
LeaveParty()
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 194 // from:
  SAY #40201 /* ~Dziêkujê ci, Dalesonie. A teraz idŸ ju¿. Nie chcê, ¿eby ci siê coœ sta³o.~ */
  IF ~~ THEN EXTERN ~DALESON~ 42
END

IF ~~ THEN BEGIN 195 // from:
  SAY #40210 /* ~Nigdy nie widzia³am go w u¿yciu. Nigdy nie powiedzia³, dlaczego nie dzier¿y³ go czêœciej. Powinniœmy go odnaleŸæ skoro nie mia³ go przy sobie. Wiêc zabrano go do 'piwnic', tak?~ */
  IF ~~ THEN EXTERN ~DALESON~ 44
END

IF ~~ THEN BEGIN 196 // from:
  SAY #40447 /* ~Nie! <CHARNAME>, nie mo¿esz mu na to pozwoliæ! Nie mo¿esz mu po prostu oddaæ twierdzy mojego ojca! Proszê!~ */
  IF ~~ THEN REPLY #40448 /* ~Nie zamierzam wdawaæ siê z tego powodu w wojnê, Nalio. Zapomnij o tym.~ */ GOTO 197
  IF ~~ THEN REPLY #40449 /* ~Myœlê, ¿e masz racjê... Przypuszczam, ¿e odpowiedŸ musi brzmieæ nie, Lordzie Roenall. Twoja strata.~ */ EXTERN ~KPROEN01~ 3
END

IF ~~ THEN BEGIN 197 // from: 196.0
  SAY #40451 /* ~S¹dzê, ¿e... ¿e moja wiara w ciebie by³a wtedy przesadna. Có¿... nie zamierzam staæ i siê temu przygl¹daæ! Dziêkujê za nic, <CHARNAME>!~ */
  IF ~~ THEN DO ~LeaveParty()
EscapeArea()~ EXTERN ~KPROEN01~ 4
END

IF ~~ THEN BEGIN 198 // from:
  SAY #40651 /* ~Ten... ten bêkart! Nie uda³o mu siê nas oszukaæ podstêpem, wiêc chce to zrobiæ si³¹?! A rada nie zrobi nic, jeœli ju¿ j¹ zawojowa³!~ */
  IF ~~ THEN EXTERN ~KPDOMO01~ 116
END

IF ~~ THEN BEGIN 199 // from:
  SAY #40682 /* ~Tego w³aœnie chcê i wszystkim to powiedzia³am, <CHARNAME>. Gdyby nie ty, nie mia³abym w ogóle tego zamku. To jest mój dom... ale ty masz prawo tu rz¹dziæ.~ */
  IF ~~ THEN EXTERN ~KPDOMO01~ 119
END

IF WEIGHT #17 /* Triggers after states #: 339 even though they appear after this state */
~Global("NaliaAR1302","LOCALS",0)
Global("TalkedDaleson","GLOBAL",0)
AreaCheck("AR1302")
~ THEN BEGIN 200 // from:
  SAY #40851 /* ~Jesteœmy w œrodku. Najpierw powinniœmy znaleŸæ Dalesona, jeœli wci¹¿ ¿yje, a potem dostaæ siê na dziedziniec i opuœciæ zwodzony most.~ [NALIA81] */
  IF ~~ THEN DO ~SetGlobal("NaliaAR1302","LOCALS",1)~ EXIT
END

IF WEIGHT #18 /* Triggers after states #: 339 even though they appear after this state */
~Global("NaliaAR1303","LOCALS",0)
AreaCheck("AR1303")
~ THEN BEGIN 201 // from:
  SAY #40853 /* ~Jeœli chcemy dostaæ siê do piwnic i znaleŸæ TorGala, musimy najpierw znaleŸæ sypialniê mojej ciotki. Jest tam sekretne przejœcie, które prowadzi do piwnic.~ [NALIA82] */
  IF ~~ THEN DO ~SetGlobal("NaliaAR1303","LOCALS",1)~ UNSOLVED_JOURNAL #5083 /* ~Napaœæ na zamek d'Arnise.

Nalia powiedzia³a mi, ¿e do lochów zamku prowadzi ukryte przejœcie z sypialni jej ciotki, na pierwszym piêtrze.~ */ EXIT
END

IF ~~ THEN BEGIN 202 // from: 174.1
  SAY #42680 /* ~Roenallowie czekaj¹ jak sêpy na padlinê. Nie zdziwi³abym siê gdyby mieli za³adowane wozy i byli gotowi do wprowadzenia siê tu.~ */
  IF ~~ THEN GOTO 176
END

IF ~~ THEN BEGIN 203 // from:
  SAY #44112 /* ~Wygl¹da... dziwnie. Tak jakby coœ kierowa³o jego wol¹. Uwa¿aj na siebie, nie wydaje mi siê by on myœla³ za siebie.~ */
  IF ~~ THEN EXTERN ~PPCOWLED~ 2
END

IF ~~ THEN BEGIN 204 // from: 112.0 111.0 110.0 109.0
  SAY #46102 /* ~Tego wszystkiego nie da siê poj¹æ. Wynoœmy siê daleko od tego miejsca i od niego. ProwadŸ.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 205 // from:
  SAY #46161 /* ~I on dobrze siê o tobie wypowiada³, Lordzie Farthington.~ */
  IF ~~ THEN EXTERN ~FARTHIN~ 9
END

IF ~~ THEN BEGIN 206 // from:
  SAY #46171 /* ~Mam nadziejê. Jestem pewna, ¿e niejeden z jego partnerów od interesów wola³by mnie nie widzieæ.~ */
  IF ~~ THEN EXTERN ~FUMIN~ 1
END

IF ~~ THEN BEGIN 207 // from:
  SAY #46173 /* ~Spróbujê, Pastorze Adelain.~ */
  IF ~~ THEN EXTERN ~FUMIN~ 2
END

IF ~~ THEN BEGIN 208 // from:
  SAY #46181 /* ~Panno Tandolan? Nie jestem pewna, czy rozumiem, co masz na myœli.~ */
  IF ~~ THEN EXTERN ~FULADY~ 2
END

IF ~~ THEN BEGIN 209 // from:
  SAY #46182 /* ~Rzeczywiœcie? On gada za du¿o jak na mój gust, Panno Tandolan. Mo¿esz mi teraz wybaczyæ?~ */
  IF ~~ THEN EXTERN ~FULADY~ 3
END

IF ~~ THEN BEGIN 210 // from:
  SAY #46186 /* ~Mam wra¿enie, ¿e mogli poœwiêciæ nieco czasu.~ */
  IF ~~ THEN EXTERN ~FULORD~ 1
END

IF ~~ THEN BEGIN 211 // from:
  SAY #46188 /* ~Dziêkujê ci za to, Lordzie Donderbeg.~ */
  IF ~~ THEN EXTERN ~FULORD~ 2
END

IF ~~ THEN BEGIN 212 // from:
  SAY #46190 /* ~Zawsze by³eœ jednym z rozs¹dniejszych przyjació³ ojca.~ */
  IF ~~ THEN EXTERN ~FULORD~ 3
END

IF ~~ THEN BEGIN 213 // from:
  SAY #46195 /* ~Bonchy? Czy to ty?~ */
  IF ~~ THEN EXTERN ~FUAGNON~ 1
END

IF ~~ THEN BEGIN 214 // from:
  SAY #46197 /* ~Nie przepraszaj. Ojciec ucieszy³by siê z twojego przybycia. Arystokraci czuj¹ przed tob¹ respekt.~ */
  IF ~~ THEN EXTERN ~FUAGNON~ 2
END

IF ~~ THEN BEGIN 215 // from:
  SAY #46199 /* ~Bonchy!~ */
  IF ~~ THEN EXTERN ~FUAGNON~ 3
END

IF ~~ THEN BEGIN 216 // from:
  SAY #46201 /* ~Dziêki, Bonchy. Sprawiasz mi radoœæ.~ */
  IF ~~ THEN EXTERN ~FUAGNON~ 4
END

IF ~~ THEN BEGIN 217 // from:
  SAY #46203 /* ~Skoro musisz, Bonchy. Szczêœliwej podró¿y.~ */
  IF ~~ THEN EXTERN ~FUAGNON~ 5
END

IF ~~ THEN BEGIN 218 // from:
  SAY #46236 /* ~Wyrobi³am ju¿ sobie opiniê na twój temat, Isaea. Nie zmieniê teraz zdania.~ [NALIA91] */
  IF ~~ THEN EXTERN ~ISAEA~ 22
END

IF ~~ THEN BEGIN 219 // from:
  SAY #46238 /* ~Co!!~ */
  IF ~~ THEN EXTERN ~ISAEA~ 23
END

IF ~~ THEN BEGIN 220 // from:
  SAY #46240 /* ~Kim jesteœ by o tym decydowaæ! Jakim prawem!~ */
  IF ~~ THEN EXTERN ~ISAEA~ 24
END

IF ~~ THEN BEGIN 221 // from:
  SAY #46243 /* ~To szaleñstwo! <CHARNAME> ciê powstrzyma!~ */
  IF ~~ THEN EXTERN ~ISAEA~ 26
END

IF ~~ THEN BEGIN 222 // from: 318.0
  SAY #47200 /* ~Ju¿ same trolle s¹ wystarczaj¹co niebezpieczne... s³ysza³am, ¿e mo¿na je zg³adziæ tylko za pomoc¹ ognia lub kwasu. O pozosta³ych stworach nie wiem nic.~ */
  IF ~~ THEN GOTO 1
END

IF WEIGHT #19 /* Triggers after states #: 339 even though they appear after this state */
~Dead("Torgal")
Global("TorgalDies","LOCALS",0)
~ THEN BEGIN 223 // from:
  SAY #47533 /* ~Œmieræ! Giñ bestio! Usunê z tego miejsca wszelki œlad, jaki po sobie pozostawi³aœ! Zrobiê to... zrobiê...~ [NALIA83] */
  IF ~~ THEN DO ~SetGlobal("TorgalDies","LOCALS",1)
~ GOTO 224
END

IF ~~ THEN BEGIN 224 // from: 223.0
  SAY #47534 /* ~Wynoœmy siê st¹d. Nie chcê ogl¹daæ mojego domu w takim stanie. Zrobiliœmy, co w naszej mocy...~ */
  IF ~~ THEN GOTO 225
END

IF ~~ THEN BEGIN 225 // from: 224.0
  SAY #47535 /* ~Niech pomyœlê... powiem coœ wiêcej, gdy opuœcimy to miejsce...~ */
  IF ~~ THEN UNSOLVED_JOURNAL #7025 /* ~Napaœæ na zamek d'Arnise.

TorGal nie ¿yje i wszystkie pozbawione przywódcy pozosta³e trolle i yuan-ti wkrótce uciekn¹. Czas odejœæ i pozwoliæ, ¿eby wszystko by³o tak jak dawniej.~ */ EXIT
END

IF ~~ THEN BEGIN 226 // from:
  SAY #48461 /* ~Uda³o ci siê dokonaæ wspania³ej rzeczy, <CHARNAME>. Cz³owiek mniejszego serca pozwoli³by tym dzieciom tu³aæ siê po ulicach, w g³odzie i bez grosza w kieszeni.~ */
  IF ~!IsValidForPartyDialog("Yoshimo")
!IsValidForPartyDialog("Korgan")~ THEN EXIT
  IF ~IsValidForPartyDialog("Yoshimo")~ THEN EXTERN ~YOSHJ~ 38
  IF ~!IsValidForPartyDialog("Yoshimo")
IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ 57
END

IF ~~ THEN BEGIN 227 // from:
  SAY #48467 /* ~To straszne s³owa! Jestem pewna, ¿e mamy doœæ z³ota, aby siê nim trochê podzieliæ... dla nich jest to du¿a ró¿nica, zaœ ty nawet nie odczujesz straty swojej dzia³ki!~ */
  IF ~~ THEN EXTERN ~KORGANJ~ 58
END

IF ~~ THEN BEGIN 228 // from:
  SAY #48468 /* ~Jesteœ ohydn¹ besti¹, Korganie!~ */
  IF ~~ THEN EXTERN ~KORGANJ~ 59
END

IF ~~ THEN BEGIN 229 // from:
  SAY #48502 /* ~Hm. £atwo ci mówiæ, <CHARNAME>. On siê nie gapi przez ca³y dzieñ na twoje siedzenie.~ */
  IF ~~ THEN EXTERN ~KORGANJ~ 65
END

IF ~~ THEN BEGIN 230 // from:
  SAY #48514 /* ~Có¿... teraz jest wolny, w koñcu. Zastanawiam siê jak d³ugo przebywa³ tu na dole... w œciekach. Co za okropna rzecz ci siê przytrafi³a!~ */
  IF ~~ THEN DO ~ActionOverride("quallo",EscapeArea())~ EXIT
END

IF ~~ THEN BEGIN 231 // from:
  SAY #48533 /* ~Ja... ja nie wiem, Jaheiro, s³ysza³am o tym Lordzie Jierdanie. To brutal; opieka nad swoimi ludŸmi nie jest w jego stylu. Nie podoba mi siê to.~ */
  IF ~!IsValidForPartyDialog("Korgan")
!IsValidForPartyDialog("Anomen")~ THEN EXIT
  IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ 70
  IF ~!IsValidForPartyDialog("Korgan")
IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ 182
END

IF ~~ THEN BEGIN 232 // from:
  SAY #48581 /* ~Teraz sobie przypominam, dlaczego o nim s³ysza³am! Wzbogaci³ siê i zdoby³ w³adzê zbyt szybko by mog³o to byæ legalne. Zastanawiam siê, dlaczego siê nami zainteresowa³?~ */
  IF ~~ THEN EXTERN ~GARREN~ 19
END

IF ~~ THEN BEGIN 233 // from:
  SAY #48604 /* ~Czujê siê brudna, <CHARNAME>. Nie zdawa³am sobie sprawy, ¿e podró¿uj¹c z tob¹ wdam siê w tak ponure sprawki. Spróbujmy... spróbujmy unikaæ tego rodzaju rzeczy w przysz³oœci, dobrze?~ */
  IF ~!IsValidForPartyDialog("Jan")~ THEN EXIT
  IF ~IsValidForPartyDialog("Jan")~ THEN EXTERN ~JANJ~ 99
END

IF ~~ THEN BEGIN 234 // from:
  SAY #48612 /* ~Oni... oni chc¹ ciê wykorzystaæ by siê dostaæ do sfery. Wiedzia³am, ¿e nie mo¿na ufaæ tym Zakapturzonym Czarodziejom! Ale... bêd¹ nas trzymaæ za s³owo, nieprawda¿?~ */
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
  SAY #48637 /* ~Nie rozumiem... dlaczego w³aœciwie mia³by nie chcieæ byœmy poszli i uzdrowili jego matkê? Wtedy nie musia³by tu wystawaæ i ¿ebraæ, zgadza siê?~ */
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
  SAY #48655 /* ~Widzieliœcie... widzieliœcie to?! Zabra³ nasze z³oto! Co za bezczelnoœæ!~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 237 // from:
  SAY #48659 /* ~Dachy! Mogê siê poruszaæ wzd³u¿ œcian, ale nigdy nie mia³am ochoty by pójœæ wy¿ej.~ */
  IF ~~ THEN EXTERN ~ARNMAN03~ 15
END

IF ~~ THEN BEGIN 238 // from:
  SAY #48661 /* ~Ee, nie, dziêkujê.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 239 // from:
  SAY #48677 /* ~Bez w¹tpienia s¹dzi³eœ, ¿e bêd¹ tañsi ni¿ zwyk³y lud. Budzisz we mnie odrazê. Prawie ¿a³ujê, ¿e ogry nie dokoñczy³y roboty.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 240 // from:
  SAY #48707 /* ~Hm. Dawniej lubi³am czytaæ w zamku; tak zrodzi³o siê moje zainteresowanie magi¹. Nie mogê sobie wyobraziæ zniszczenia wiedzy... to wydaje siê takie z³e!~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 241 // from:
  SAY #48818 /* ~Tak. Wci¹¿ jesteœ aroganckim, bezwartoœciowym, ma³ostkowym arystokrat¹, co? WsadŸ to sobie w ucho, mój 'panie'.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 242 // from:
  SAY #48829 /* ~Przypominam sobie jak Ciotunia wspomina³a, ¿e podczas waszego ostatniego spotkania specjalnie wyla³eœ jej na sukniê herbatê. Twoje zapytanie o ni¹ traktujê teraz jako obrazê. Przepraszam.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 243 // from:
  SAY #48885 /* ~Byæ mo¿e... powinniœmy po prostu spróbowaæ znaleŸæ ten gong, <CHARNAME>. Jak d³ugo mog³oby to zaj¹æ? Nie chcê by komuœ sta³a siê krzywda, jeœli mo¿emy coœ z tym zrobiæ.~ */
  IF ~~ THEN EXTERN ~LOUTCAPT~ 19
END

IF ~~ THEN BEGIN 244 // from:
  SAY #48950 /* ~Wygl¹da to na robotê bardzo sadystycznej osoby. Powinniœmy siê temu przyjrzeæ, <CHARNAME>... byæ mo¿e uda nam siê znaleŸæ wskazówki, które inni przeoczyli.~ */
  IF ~!IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~INSPECT~ 14
  IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ 375
END

IF ~~ THEN BEGIN 245 // from:
  SAY #48954 /* ~<CHARNAME>! Jak mo¿esz odwracaæ siê plecami do bardziej potrzebuj¹cych? Zas³uguj¹ na nasz¹ pomoc.~ */
  IF ~~ THEN EXIT
END

IF WEIGHT #20 /* Triggers after states #: 339 even though they appear after this state */
~AreaCheck("AR0502")
Global("EnteredTanner2","AR0502",0)~ THEN BEGIN 246 // from:
  SAY #48981 /* ~To miejsce jest... straszne! Jakiego rodzaju 'prac¹' zajmuje siê ten cz³owiek?! Czy... czy to s¹ cia³a?! Fu! Ten s-smród!!~ */
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
  SAY #48988 /* ~Jesteœmy... jesteœmy czêœciowo odpowiedzialni za to. Wys³aliœmy go tutaj, <CHARNAME>. Powinniœmy... przekazaæ go komuœ, mo¿e komuœ z Dzielnicy Rz¹dowej, sama nie wiem.~ */
  IF ~~ THEN DO ~SetGlobal("FoundAegis","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN 248 // from: 0.3
  SAY #49213 /* ~Proszê! Nie mam wiêcej z³ota! Wszystko co mam, znajduje siê w twierdzy. Jestem pewna, ¿e znajdziesz tam dosyæ, by siê tym zadowoliæ.~ */
  IF ~!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("Minsc")~ THEN REPLY #49214 /* ~Powiedz mi, zatem przeciwko czemu stajemy. Muszê wiedzieæ, z czym mam do czynienia.~ */ GOTO 149
  IF ~!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("Minsc")~ THEN REPLY #49215 /* ~To nie wystarczy. Bêdziesz musia³a znaleŸæ kogoœ innego do pomocy.~ */ GOTO 269
  IF ~IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ 184
  IF ~!IsValidForPartyDialog("Keldorn")
IsValidForPartyDialog("Aerie")~ THEN EXTERN ~AERIEJ~ 127
  IF ~!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Aerie")
IsValidForPartyDialog("Minsc")~ THEN EXTERN ~MINSCJ~ 150
END

IF ~~ THEN BEGIN 249 // from:
  SAY #49260 /* ~Myœlê, ¿e... ju¿ gdzieœ o nim s³ysza³am, <CHARNAME>. Przelotnie. Podobno ma wiele powi¹zañ... ale poza tym wiem niewiele wiêcej.~ */
  IF ~~ THEN EXTERN ~GAELAN~ 8
END

IF ~~ THEN BEGIN 250 // from:
  SAY #49381 /* ~Chce... chce byœmy okradli œwi¹tyniê? Nawet gdy chodzi o œwi¹tyniê Talosa, to mam gêsi¹ skórkê, gdy o tym pomyœlê. Jak... jak bardzo mamy siê jeszcze pogr¹¿yæ by uratowaæ twoj¹ przyjació³kê, <CHARNAME>?~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 251 // from:
  SAY #49509 /* ~Po tych wszystkich zadaniach... obracasz siê przeciwko swojemu panu? Nie to ¿ebym myœla³a, ¿e Mae'Var na to nie zas³uguje, czy coœ takiego, chodzi tylko o to... jesteœ bardzo z³ym cz³owiekiem.~ */
  IF ~~ THEN EXTERN ~EDWIN~ 27
END

IF ~~ THEN BEGIN 252 // from:
  SAY #49551 /* ~Zw³aszcza nie z t¹ wojn¹, o której s³yszeliœmy, zgadza siê? Za³o¿ê siê, ¿e nie udalibyœcie siê do obcych, gdyby inna gildia powa¿nie wam nie zagrozi³a.~ */
  IF ~~ THEN EXTERN ~RENAL~ 58
END

IF ~~ THEN BEGIN 253 // from:
  SAY #49588 /* ~Nie mo¿emy go tak po prostu zostawiæ. Powinniœmy przynajmniej dowiedzieæ siê, o kim mówi albo... albo sprowadziæ dla niego jak¹œ pomoc? Proszê, <CHARNAME>! Nie mo¿emy pozwoliæ by ktoœ po prostu umar³...~ */
  IF ~!IsValidForPartyDialog("Keldorn")~ THEN DO ~SetGlobalTimer("RenfeldDeath","LOCALS",TWO_DAYS)~ EXIT
  IF ~IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ 150
END

IF ~~ THEN BEGIN 254 // from:
  SAY #49815 /* ~Mog³o byæ o wiele gorzej. S¹dz¹c po tym, jak wszystkie w³osy stoj¹ mi dêba, oczekiwa³am, ¿e zostaniemy wys³ani do o wiele gorszej roboty. Spróbujmy... jakoœ siê z tym uporaæ.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 255 // from:
  SAY #49854 /* ~A wiêc do tego d¹¿yliœmy przez ca³y ten czas? Nies³ychane! Jak... jak mamy to zrobiæ? Mistrz Cienia ma na swoje skinienie ca³¹ hordê zabójców!~ */
  IF ~~ THEN EXTERN ~BODHI~ 73
END

IF ~~ THEN BEGIN 256 // from:
  SAY #49869 /* ~Zakopany ¿ywcem? Ja... ja po prostu nie wyobra¿am sobie niczego okropniejszego. I wszystko to za garœæ pieniêdzy. Fuj!~ */
  IF ~~ THEN EXTERN ~TIRDIR~ 3
END

IF ~~ THEN BEGIN 257 // from:
  SAY #50050 /* ~Chcesz byœmy zeszli do kana³ów... ku œwi¹tyni Talosa? Có¿... jestem gotowa pomóc, jeœli dziêki temu ludzie przestan¹ siê okaleczaæ.~ */
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
  SAY #50088 /* ~Uwa¿aj na siebie, <CHARNAME>. Jeœli obserwator potrzebuje pomocy, musi byæ jakiœ tego powód, niebezpieczny powód, i nie wydaje mi siê byœmy mogli zaufaæ temu kap³anowi.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 259 // from:
  SAY #50165 /* ~W takim razie dajcie spokój swoim g³upim petycjom. Zanim wy ludzie zebralibyœcie siê by coœ zdzia³aæ, moja twierdza rozsypa³aby siê ze staroœci.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 260 // from:
  SAY #50189 /* ~To odpowiada tym, którzy maja z³oto, ale co z biednymi? Cierpi¹, poniewa¿ nie mog¹ nape³niæ kieszeni kogoœ, kto i tak dostaje zap³atê za swoj¹ pracê? To jest niesprawiedliwe!~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 261 // from:
  SAY #50213 /* ~Nie! On jest tylko niewinnym, biednym cz³owiekiem, próbuj¹cym przetrwaæ!~ */
  IF ~Global("Gavegbegg","AR1000",0)~ THEN GOTO 262
  IF ~Global("Gavegbegg","AR1000",1)~ THEN EXTERN ~GGUARD01~ 4
END

IF ~~ THEN BEGIN 262 // from: 261.0
  SAY #50217 /* ~Widzisz to? Dajê mu te monety w darze, a nie dlatego, ¿e o nie ¿ebrze. Jestem pewna, ¿e masz do zrobienia wa¿niejsze rzeczy ni¿ zawracanie g³owy temu biedakowi!~ */
  IF ~~ THEN DO ~ActionOverride("Gbegg01",TakePartyGold(5))~ EXTERN ~GGUARD01~ 4
END

IF ~~ THEN BEGIN 263 // from:
  SAY #50353 /* ~Zobaczyæ znowu Filberta? (westchnienie) Jedliœmy raz lunch. Twoje próby z³¹czenia nas razem podoba³y mu siê nawet mniej ni¿ mnie. Poza tym nadepn¹³ mi na odcisk.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 264 // from:
  SAY #50452 /* ~Za nic mam twoje s³owa, Oriono. Mog³abym przez ca³y dzieñ tarzaæ siê w krowich odchodach, a i tak by³abym czystsza ni¿ ma³ostkowa dziwka z wy¿szych klas.~ */
  IF ~~ THEN EXTERN ~ORIONA~ 10
END

IF ~~ THEN BEGIN 265 // from:
  SAY #50536 /* ~S³ysza³am o... drowach, ale czy ona pope³ni³a jakieœ przestêpstwo? Chc¹ j¹ spaliæ tylko dlatego, ¿e jest drowem. <CHARNAME>, to nie jest w porz¹dku! Zrób coœ!~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 266 // from:
  SAY #52284 /* ~Tak w³aœnie... szkol¹ tutaj z³odziei? Cieszê siê, ¿e nigdy nie wybra³am tej drogi. Jakie to straszne, gdy twoi nauczyciele nie zwracaj¹ na ciebie w ogóle uwagi...~ */
  IF ~!IsValidForPartyDialog("Yoshimo")~ THEN EXIT
  IF ~IsValidForPartyDialog("Yoshimo")~ THEN EXTERN ~YOSHJ~ 88
END

IF ~~ THEN BEGIN 267 // from:
  SAY #55201 /* ~To jest nasze zwyciêstwo po tym wszystkim, co przeszliœmy? On jest martwy, i to wszystko? Ha... martwy. Tak jak ka¿dy inny. Wydaje siê to takie dziwne.~ */
  IF ~~ THEN EXTERN ~PLAYER1~ 17
END

IF ~~ THEN BEGIN 268 // from:
  SAY #55226 /* ~Ja... och, czujê siê tak dziwnie. Umarliœmy, nieprawda¿? By³ ten ból, a potem szarpniêcie, jak... Jak gdyby wci¹gn¹³ mnie wir wodny...~ [NALIA85] */
  IF ~!IsValidForPartyDialog("Edwin")~ THEN EXIT
  IF ~IsValidForPartyDialog("Edwin")~ THEN EXTERN ~EDWINJ~ 95
END

IF ~~ THEN BEGIN 269 // from: 248.1 1.2
  SAY #55234 /* ~Proszê! Nie ma nikogo innego! Pomyœl o mojej rodzinie! Pomyœl o s³ugach i ich rodzinach! S³udzy! Mo¿e trolle nie zabi³y ca³ej s³u¿by...~ */
  IF ~~ THEN GOTO 270
END

IF ~~ THEN BEGIN 270 // from: 269.0
  SAY #55235 /* ~Stra¿nicy pewnie nie ¿yj¹, ale s³u¿ba widzia³a pewnie ten atak i bêdzie wiedzieæ jak liczni s¹ najeŸdŸcy. Proszê, jeœli zostaniesz, mo¿emy mieæ szansê.~ */
  IF ~~ THEN GOTO 2
END

IF ~~ THEN BEGIN 271 // from:
  SAY #55302 /* ~Naprawdê? Przyjdzie ci pilnowaæ pustej skrzyni? Dlaczego? Jaki móg³by byæ tego cel? Nawet szalony drow musia³by *to* widzieæ.~ */
  IF ~~ THEN EXTERN ~SAHBEH01~ 39
END

IF ~~ THEN BEGIN 272 // from:
  SAY #55663 /* ~Wspaniale dotrzymali towarzystwa? Ten statek jest brudny, rozpada siê, zaœ twoja za³oga to banda gburów. Nigdy tak bardzo nie potrzebowa³am dobrej k¹pieli!~ */
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
  SAY #55708 /* ~Klara zas³uguje na lepsze ¿ycie, podobnie jak wszystkie kurtyzany Galveny, ale my wmieszaliœmy siê w to, by znaleŸæ drogê do przytu³ku... Sanik zosta³ zabity zanim móg³ cokolwiek powiedzieæ.~ */
  IF ~~ THEN EXTERN ~PIRMUR09~ 0
END

IF ~~ THEN BEGIN 274 // from:
  SAY #55713 /* ~Biedny cz³owiek. Ciê¿ko musi byæ, gdy koñczy siê jako szaleniec, po tym jak przez ca³e ¿ycie leczy³o siê szaleñców. Zak³adam, ¿e to miejsce mia³o s³u¿yæ leczeniu, a nie tylko odosabnianiu.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 275 // from:
  SAY #55721 /* ~Zostaw... zostaw go w spokoju. Szkoda mówiæ, przez co przeszed³ ten cz³owiek.~ */
  IF ~~ THEN EXTERN ~KORGANJ~ 124
END

IF ~~ THEN BEGIN 276 // from:
  SAY #55757 /* ~Twoje nawrócenie jest bardzo wygodne, piracie. Co wiesz o planach Irenicusa? Z tego, co widzê nie by³ zbyt rozmowny na te tematy.~ */
  IF ~~ THEN EXTERN ~PPSAEM2~ 22
END

IF ~~ THEN BEGIN 277 // from:
  SAY #55764 /* ~To za ma³o powiedziane. Dlaczego po prostu nie zaoferujemy mu ca³ego Faerunu i uznamy rachunki za wyrównane?~ */
  IF ~~ THEN EXTERN ~PPSAEM2~ 12
END

IF ~~ THEN BEGIN 278 // from:
  SAY #55827 /* ~Och. Nigdy do tej pory nie zwraca³am specjalnie uwagi na ryby, ale ten zapach... uch, jakby coœ umar³o...~ */
  IF ~~ THEN EXTERN ~SAHBAR03~ 0
END

IF ~~ THEN BEGIN 279 // from:
  SAY #55850 /* ~Nie wiem na ile powinniœmy zaufaæ temu stworowi, <CHARNAME>. Podejrzewam, ¿e z¿ar³by nas na przystawkê tylko dlatego, ¿e komponowalibyœmy siê dobrze z g³ównym daniem.~ */
  IF ~~ THEN EXTERN ~SAHKNG01~ 37
END

IF ~~ THEN BEGIN 280 // from:
  SAY #55912 /* ~C-co robisz, <CHARNAME>?! Sprowadzasz na nas... gniew smoka? I po co?! Nie... nie, nie bêdê siê temu przygl¹daæ, z pewnoœci¹!~ */
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
  SAY #55960 /* ~Nie cierpiê sposobu, w jaki arystokraci mówi¹ o biednych. Twoje stereotypy na temat magów to niemal identyczny przypadek.~ */
  IF ~~ THEN EXTERN ~VALYGARJ~ 88
END

IF ~~ THEN BEGIN 282 // from:
  SAY #56005 /* ~Zapewniam ciê, ¿e nie sprawimy ci k³opotu.~ */
  IF ~!IsValidForPartyDialogue("HAERDALIS")
!IsValidForPartyDialogue("CERND")~ THEN EXIT
  IF ~IsValidForPartyDialogue("HAERDALIS")~ THEN EXTERN ~HAERDAJ~ 117
  IF ~!IsValidForPartyDialogue("HAERDALIS")
IsValidForPartyDialogue("CERND")~ THEN EXTERN ~CERNDJ~ 113
END

IF ~~ THEN BEGIN 283 // from:
  SAY #56011 /* ~Spodziewam siê najlepszego, nawet jeœli to ma³o prawdopodobne.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 284 // from:
  SAY #56031 /* ~Mimo to zabra³eœ ca³e nasze z³oto i wynaj¹³eœ go... nie mówi¹c nam nawet, jaka z niego kanalia! Zmusi³eœ nas nawet byœmy dla ciebie zapracowali na ten przywilej!~ */
  IF ~~ THEN EXTERN ~ARAN~ 78
END

IF ~~ THEN BEGIN 285 // from:
  SAY #56075 /* ~Haer'dalisie! Co ci siê sta³o?~ */
  IF ~~ THEN EXTERN ~HAERDAJ~ 121
END

IF ~~ THEN BEGIN 286 // from:
  SAY #56096 /* ~Robi mi siê od tego niedobrze. Te drowy maj¹ nad wszystkimi tyle w³adzy.~ */
  IF ~~ THEN EXTERN ~EDWINJ~ 125
END

IF ~~ THEN BEGIN 287 // from:
  SAY #56100 /* ~Przybyliœmy, a¿ do Piek³a by ciê powstrzymaæ, Irenicusie, i zrobimy to! <CHARNAME> jest naszym przyjacielem i bêdzie ¿yæ!!~ [NALIA84] */
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
  SAY #56161 /* ~Nigdy... nie mia³am przed sob¹ podobnego stworzenia... twoje uroda jest zachwycaj¹ca.~ */
  IF ~~ THEN EXTERN ~UDSILVER~ 58
END

IF ~~ THEN BEGIN 289 // from:
  SAY #56408 /* ~To niemo¿liwe, prawda? Ca³e miasto, zw³aszcza tak staro¿ytne jak twoje, nie mo¿e po prostu znikn¹æ.~ */
  IF ~~ THEN EXTERN ~C6ELHAN2~ 29
END

IF ~~ THEN BEGIN 290 // from:
  SAY #56436 /* ~Dlaczego od razu ¿¹daæ pieniêdzy? Myœla³am, ¿e jesteœmy tutaj, by pomóc tym ludziom, a nie zastraszaæ ich jak bandyci. Jeœli takie s¹ twoje metody dzia³ania, nie interesuje mnie to.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 291 // from:
  SAY #56441 /* ~Nie wiem za wiele o Umar, ale to wszystko kojarzy mi siê z jak¹œ z³¹ magi¹. Byæ mo¿e ta ogr to jakiœ potê¿ny mag? Nie powinniœmy wykluczaæ takiej mo¿liwoœci.~ */
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
  SAY #56449 /* ~Ten... ten cz³owiek... zosta³ pozbawiony umys³u przez jakieœ zaklêcie. Nie mam pojêcia, czy... czy mo¿na by zdj¹æ ten urok. Nie zazdroszczê mu.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 293 // from:
  SAY #56494 /* ~Uff, czujê ulgê! Bêd¹c tam przez chwilê myœla³am, ¿e to jest normalne. Nie mamy u nas zbyt wielu teatrów i zaczyna³am rozumieæ dlaczego!~ */
  IF ~~ THEN EXTERN ~RAELIS~ 34
END

IF ~~ THEN BEGIN 294 // from:
  SAY #56503 /* ~S³ysza³am o... o Lady Jysstev. Nie mogê poj¹æ, w jaki sposób mog³aby byæ zamieszana... zawsze uwa¿a³am j¹ za przyzwoit¹ i zarozumia³¹. To mo¿e byæ ciekawe.~ */
  IF ~!IsValidForPartyDialog("Anomen")~ THEN EXIT
  IF ~IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ 286
END

IF ~~ THEN BEGIN 295 // from: 6.0
  SAY #56699 /* ~Byæ mo¿e lepsze by³oby jakieœ strategiczne przejœcie. Na pó³noc od palisady, znajduj¹ siê w murach zamkowych sekretne drzwi. Ja... czêsto ich u¿ywa³am by móc niepostrze¿enie pomagaæ innym.~ */
  IF ~~ THEN GOTO 8
END

IF ~~ THEN BEGIN 296 // from: 39.0
  SAY #56700 /* ~Udaj siê w bezpieczne miejsce, Dalesonie, i przygotuj tych, którzy pozostali, do powrotu do s³u¿by. To miejsce bêdzie wymaga³o sporo pracy, gdy bêdzie ju¿ po wszystkim.~ */
  IF ~~ THEN EXTERN ~DALESON~ 27
END

IF ~~ THEN BEGIN 297 // from: 43.0
  SAY #56701 /* ~Sama s³u¿ba te¿ mo¿e byæ zaniepokojona. Czy doceni ciê¿ar sprawowania w³adzy? Warto by spróbowaæ, ale nie bêdzie to tutaj popularne.~ */
  IF ~~ THEN GOTO 36
END

IF ~~ THEN BEGIN 298 // from: 49.0
  SAY #56702 /* ~Byli najemnikami, ale zostali poleceni z dobrego Ÿród³a. Trenowali w Amn. Glaicus jednak¿e by³ przyjacielem mojego ojca. Byæ mo¿e zosta³ zabity gdzieœ w zamku.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 299 // from: 50.0
  SAY #56703 /* ~Stra¿nicy zawsze zachowywali pewn¹ rezerwê. Byli nieco nieprzyjaŸni, za wyj¹tkiem Glaicusa, ale zostali poleceni z dobrego Ÿród³a. Trenowali w Amn.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 300 // from: 52.0
  SAY #56704 /* ~Skoro ich tu nie ma, walki musia³y byæ krwawe. Ale gdzie s¹ cia³a... spodziewa³abym siê, ¿e przynajmniej Glaicus walczy³, a¿ do œmierci...~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 301 // from: 67.0
  SAY #56705 /* ~Nie podoba mi siê myœl, ¿e znajdê siê pod wp³ywem Roenallów, po tym jak pracowa³am ciê¿ko by zdobyæ to, co mam. Wola³abym ¿eby nie po³o¿yli swoich ³ap na dobytku mojego ojca.~ */
  IF ~~ THEN GOTO 161
END

IF ~~ THEN BEGIN 302 // from:
  SAY #57156 /* ~Chwileczkê! Powiedzia³eœ, ¿e... ¿e dusze twoich ludzi zosta³y uwiêzione w tych klejnotach! Myœla³am, ¿e ich ratujemy!~ */
  IF ~~ THEN EXTERN ~JARLAXLE~ 25
END

IF ~~ THEN BEGIN 303 // from:
  SAY #57398 /* ~Ummm... przypuszczam, ¿e to jest lepsze od tego co mia³y im zrobiæ drowy. Nie o wiele jednak.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 304 // from:
  SAY #57661 /* ~Potrzebujesz chwili odpoczynku? Nie wahaj siê poprosiæ o ramiê, na którym mo¿esz spocz¹æ.~ */
  IF ~~ THEN REPLY #57662 /* ~Nic mi nie jest. Zachowaj si³y dla tych 'biednych ludzi', których tak lubisz rozpieszczaæ.~ */ GOTO 305
  IF ~~ THEN REPLY #57663 /* ~Twoja pomoc jest mile widziana, ale jakoœ sobie poradzê. To uczucie ju¿ przesz³o.~ */ GOTO 306
  IF ~~ THEN REPLY #57664 /* ~Nie wiem. To by³o bardzo dziwne. W ogóle nie czu³em siê sob¹.~ ~Nie wiem. To by³o bardzo dziwne. W ogóle nie czu³am siê sob¹.~ */ GOTO 307
END

IF ~~ THEN BEGIN 305 // from: 304.0
  SAY #57665 /* ~Mam za swoje. Moje zdolnoœci zarezerwujê dla tych, którzy zas³uguj¹ na moj¹ pomoc. Phi!~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 306 // from: 304.1
  SAY #57666 /* ~Daj mi znaæ, jeœli to siê powtórzy. Powinniœmy siê z tob¹ obchodziæ delikatnie, dopóki nie dowiemy siê dok³adnie, jaki wp³yw mia³ na ciebie ten rytua³.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 307 // from: 304.2
  SAY #57667 /* ~Bêdê mieæ na ciebie oko przez jakiœ czas. Kto wie jaki wp³yw mia³ na ciebie ten rytua³. Nigdy nie widzia³am czegoœ podobnego.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 308 // from:
  SAY #57724 /* ~<CHARNAME>, to nie mo¿e byæ nic dobrego. Nigdy nie widzia³am takiego...~ */
  IF ~~ THEN GOTO 309
END

IF ~~ THEN BEGIN 309 // from: 308.0
  SAY #57725 /* ~Ciotunia zwyk³a mi opowiadaæ historie o bogach, których siê nauczy³a, gdy by³a w szkole w Calimshanie. Opowiada³a o wielu przera¿aj¹cych rzeczach, ale nie by³o to nic podobnego do tego.~ */
  IF ~~ THEN GOTO 310
END

IF ~~ THEN BEGIN 310 // from: 309.0
  SAY #57726 /* ~<CHARNAME>, gdybym ciê nie zna³a, krzycza³abym ze strachu. Musimy odzyskaæ twoj¹ duszê zanim... zanim zupe³nie siê w tym zatracisz...~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 311 // from:
  SAY #58151 /* ~S¹dzê, ¿e nie mamy wielkiego wyboru, chocia¿ trudno mi uwierzyæ... tym ludziom. Wcale nie wygl¹daj¹ na zmuszonych do prowadzenia tego rodzaju ¿ycia.~ */
  IF ~!IsValidForPartyDialogue("EDWIN")
!IsValidForPartyDialogue("HAERDALIS")~ THEN EXIT
  IF ~IsValidForPartyDialogue("EDWIN")~ THEN EXTERN ~EDWINJ~ 156
  IF ~IsValidForPartyDialogue("HAERDALIS")
!IsValidForPartyDialogue("EDWIN")~ THEN EXTERN ~HAERDAJ~ 146
END

IF ~~ THEN BEGIN 312 // from:
  SAY #58152 /* ~Zamknij siê, Edwinie. Robi mi siê niedobrze od twojego pompatycznego tonu.~ */
  IF ~~ THEN EXTERN ~EDWINJ~ 157
END

IF ~~ THEN BEGIN 313 // from:
  SAY #58155 /* ~Ach! Nie mo¿na z tob¹ rozmawiaæ!~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 314 // from:
  SAY #58157 /* ~Ale jest tak wielu, którzy nie maj¹ ¿adnego wyboru.~ */
  IF ~~ THEN EXTERN ~HAERDAJ~ 147
END

IF ~~ THEN BEGIN 315 // from:
  SAY #58160 /* ~Przyby³am... tak daleko, zgadza siê? Nie zgadzam siê by ktoœ taki jak Irenicus robi³ co chcia³. Jeœli on zdobêdzie moc, której pragnie, cierpienie tylko siê powiêkszy. Nie, jestem gotowa do walki, <CHARNAME>.~ */
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
  SAY #58522 /* ~Nie wiem, <CHARNAME>... to nie wygl¹da w porz¹dku. Tolgerias z pewnoœci¹ nas ok³ama³ w sprawie Valygara. Nie pracujemy ju¿ dla niego, prawda?~ */
  IF ~!IsValidForPartyDialog("Korgan")~ THEN EXTERN ~TOLGER~ 82
  IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ 189
END

IF ~~ THEN BEGIN 317 // from:
  SAY #58740 /* ~Zachowujesz siê jak arystokraci, z którymi nie chcê mieæ nic wspólnego. Wyrzekaj¹ siê swych ojców, jeœli tego wymagaj¹ ich plany. Mia³am o tobie wy¿sze mniemanie, Yoshimo.~ */
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
  SAY #59894 /* ~Co gorsza, wygl¹da na to, ¿e maj¹ ze sob¹... coœ w rodzaju wê¿y. Nigdy nie widzia³am czegoœ podobnego, ale chyba w ogóle nie widzia³am wielu rzeczy.~ */
  IF ~~ THEN GOTO 222
END

IF ~~ THEN BEGIN 319 // from:
  SAY #85783 /* ~Tak jak wtedy, gdy okrutny szlachcic wywo³uje cierpienie i strach poddanych uprawiaj¹cych jego ziemiê, by pracowali wydajniej. To z pewnoœci¹ jest z³e.~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 183
END

IF ~~ THEN BEGIN 320 // from:
  SAY #85890 /* ~Ja zaczê³am uczyæ siê z ksi¹g. Kiedy podpali³am bibliotekê w Twierdzy, moi rodzice zdecydowali siê wynaj¹æ mi nauczyciela. (Chichocze)~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 237
END

IF ~~ THEN BEGIN 321 // from:
  SAY #86154 /* ~To mi przypomina jak w³aœnie zaczyna³am siê uczyæ i s¹dzi³am, ¿e rzucam zaklêcie niewidzialnoœci... w zamian przypadkowo sama siê oœlepi³am. W panice prawie wypad³am przez okno. (Chichocze)~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 375
END

IF ~~ THEN BEGIN 322 // from:
  SAY #86511 /* ~Mam takie dziwne wra¿enie, ¿e to podchwytliwe pytanie, Chloe.~ */
  IF ~~ THEN EXTERN ~AERIEJ~ 231
END

IF ~~ THEN BEGIN 323 // from:
  SAY #86517 /* ~Aerie... on myœli o ...~ */
  IF ~~ THEN EXTERN ~VICONIJ~ 197
END

IF ~~ THEN BEGIN 324 // from:
  SAY #86521 /* ~Z ca³¹ pewnoœci¹ w tej grupie jest za wiele napiêcia. Byc mo¿e *pomog³oby*, gdybyœmy wszystkie...~ */
  IF ~~ THEN EXTERN ~AERIEJ~ 234
END

IF ~~ THEN BEGIN 325 // from:
  SAY #86527 /* ~Viconio! Proszê, myœlê, ¿e powinniœmy oszczêdziæ Aerie naszych nieczystych myœli o... zajêciach grupowych.~ */
  IF ~~ THEN EXTERN ~JAHEIRAJ~ 537
END

IF ~~ THEN BEGIN 326 // from:
  SAY #86530 /* ~Aerie, zostajesz z ty³u. ChodŸ ju¿, moja droga.~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 540
END

IF ~~ THEN BEGIN 327 // from:
  SAY #87063 /* ~Nie bardzo obchodz¹ mnie okreœlenia, jakimi obdarzasz biedaków, Chloe. Pomimo tego, dajê im tylko nadmiar naszych pieniêdze. To nie jest tak, ¿e sami prawie nic nie mamy.~ */
  IF ~~ THEN DO ~SetGlobal("NaliaBanter1CR","GLOBAL",2)
~ EXTERN ~CHLOEJ~ 805
END

IF ~~ THEN BEGIN 328 // from:
  SAY #87065 /* ~Och, nie musisz przedstawiaæ wszystkiego tak dramatycznie, Chloe. Moneta tu i tam nie opóŸni naszej wyprawy na pomoc Imoen. Ale dla ¿ebraka bez grosza przy duszy znaczy bardzo wiele.~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 806
END

IF ~~ THEN BEGIN 329 // from:
  SAY #87067 /* ~Potrafiê siê kontrolowaæ, Chloe. A ty uwa¿aj na swoje s³owa, kiedy mówisz na te tematy.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 330 // from:
  SAY #87069 /* ~Dziêkujê, Chloe. Ty równie¿ jesteœ niczego sobie.~ */
  IF ~~ THEN DO ~SetGlobal("NaliaBanter2CR","GLOBAL",2)
~ EXTERN ~CHLOEJ~ 808
END

IF ~~ THEN BEGIN 331 // from:
  SAY #87071 /* ~O...? W jaki sposób?~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 809
END

IF ~~ THEN BEGIN 332 // from:
  SAY #87073 /* ~Znam trochê D'Martine'ów, gdy¿ ojciec prowadzi³ z nimi ró¿ne interesy. Chyba nawet j¹ kiedyœ spotka³am. Theresa, czy¿ nie?~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 810
END

IF ~~ THEN BEGIN 333 // from:
  SAY #87075 /* ~Interesuj¹ce. Wiesz co siê z ni¹ sta³o?~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 811
END

IF ~~ THEN BEGIN 334 // from:
  SAY #87077 /* ~To chyba zarówno szczêœliwe jak i smutne wieœci, jak s¹dzê.~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 812
END

IF ~~ THEN BEGIN 335 // from:
  SAY #87079 /* ~Chyba tak. Sprawki wysoko urodzonych czêsto zostawiaj¹ w mych ustach gorzki posmak. Ale i tak do tego przywyk³am. Planowa³am wyjœcie za szlachcica, który mia³by te same pogl¹dy co ja odnoœnie biednych. Albo przynajmniej m³odego, mi³ego mê¿czyznê, który nie denerwowa³by nikogo w pobli¿u.~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 813
END

IF ~~ THEN BEGIN 336 // from:
  SAY #87081 /* ~Tak, kilku. Jednym by³ miejscowy ch³opak o imieniu Beran. Ca³kiem przystojny, ale potwornie nudny i jeszcze mniej rozgarniêty. Ale by³ s³odki. A potem Marietta, pokojówka. Moi rodzice nie byli zbyt zachwyceni kiedy siê o tym dowiedzieli. Wys³ali jej ca³¹ rodzinê na ziemie Roenallów. Flirt ze s³u¿b¹ jest dopuszczalny, o ile tylko nie zostaniesz przy³apana. Ci¹gle czujê siê nieco winna z tego powodu.~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 814
END

IF ~~ THEN BEGIN 337 // from:
  SAY #87083 /* ~Wszyscy mamy tak¹ nadziejê, Chloe. Do³¹czmy do reszty. Robiê siê nieco nerwowa, kiedy tracê ich z oczu.~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 815
END

IF ~~ THEN BEGIN 338 // from:
  SAY #68454 /* ~Hmm.~ */
  IF ~~ THEN EXIT
END

IF WEIGHT #0 ~Global("NaliaBanter3CR","GLOBAL",1)
~ THEN BEGIN 339 // from:
  SAY #87085 /* ~Co s¹dzisz o wysoko urodzonych, Chloe?~ */
  IF ~~ THEN DO ~RealSetGlobalTimer("BanteringTimerCR","GLOBAL",EIGHT_HOURS)
~ EXTERN ~CHLOEJ~ 816
END

IF ~~ THEN BEGIN 340 // from:
  SAY #87087 /* ~Oczywiœcie. Ale w gruncie rzeczy zgadzam siê z tob¹. Natura szlachty musi siê zmieniæ. Zbyt wielkie s¹ró¿nice dziel¹ce bogatego szlachcica od ubogiego ch³opa. Jedynym sposobem na osi¹gniêcie czegoœ jest dla nich zostanie ³owcami przygód, a wtedy albo gin¹ gdzieœ na szlaku trac¹c wszystko albo udaje im siê i sami staj¹ siê szlachcicami, a cykl zaczyna siê od pocz¹tku.~ */
  IF ~~ THEN DO ~SetGlobal("NoMoreNaliaBantersCR","GLOBAL",1)
~ EXTERN ~CHLOEJ~ 817
END

IF ~~ THEN BEGIN 341 // from:
  SAY #87089 /* ~Dok³adnie tak. Musi rozwin¹æ siê jakaœ strefa poœrednia. Klasa œrednia, na któr¹ sk³adaæ siê bêdzie ktoœ wiêcej ni¿ tylko zubo¿ali szlachcica albo bogaci kupcy.~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 818
END

IF ~~ THEN BEGIN 342 // from:
  SAY #87091 /* ~Có¿... Mam na myœli wykorzystanie nieco nadmiaru z³ota nale¿¹cego do bogaczy i rozdzielenia go po równo miêdzy ubo¿szych. Podnios³oby to ich stopê ¿yciow¹, nie szkodz¹c przy tym nadmiernie szlachcie.~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 819
END

IF ~~ THEN BEGIN 343 // from:
  SAY #87093 /* ~Hmm... Tego nie przemyœla³am.~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 820
END

IF ~~ THEN BEGIN 344 // from:
  SAY #87095 /* ~Chyba powinnam to trochê dog³êbniej przemyœleæ. Czasem wydaje mi siê, ¿e wszystko ju¿ przemyœla³am, a zaraz potem ktoœ pokazuje mi moje b³êdy. Dziêkujê ci, Chloe.~ */
  IF ~~ THEN EXTERN ~CHLOEJ~ 821
END

IF ~~ THEN BEGIN 345 // from:
  SAY #87097 /* ~Byæ mo¿e uda³oby siê wp³yn¹æ na rz¹dz¹cych w sprawie podatków i podzia³u dóbr? Mo¿e to porz¹dnie rozwa¿yæ.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 346 // from:
  SAY #87466 /* ~Mog³abyœ? Och... zapomnij, ¿e to powiedzia³am. Ha ha... jest aroganckim bêkartem, ale nawet on nie zas³uguje na œmieræ.~ */
  IF ~~ THEN REPLY #1812 /* ~Czy on zawsze by³ taki... napalony? Wygl¹da na zdeterminowanego by wprowadziæ w ¿ycie wasze zarêczyny.~ */ DO ~SetGlobal("NaliaComplainsIsaea","LOCALS",1)~ GOTO 109
  IF ~~ THEN REPLY #1813 /* ~Powiedzia³, ¿e mo¿e 'pomóc lub zaszkodziæ', i ¿e 'ju¿ to robi³'. Co to znaczy?~ */ DO ~SetGlobal("NaliaComplainsIsaea","LOCALS",1)~ GOTO 110
  IF ~~ THEN REPLY #1814 /* ~Poœlubienie go mog³oby byæ ca³kiem op³acalne. Myœla³aœ o tym, prawda?~ */ DO ~SetGlobal("NaliaComplainsIsaea","LOCALS",1)~ GOTO 111
  IF ~~ THEN REPLY #1815 /* ~Nie chcê braæ udzia³u w tym zamieszaniu. Spotkamy siê znowu z tym wymuskanym prostakiem?~ */ DO ~SetGlobal("NaliaComplainsIsaea","LOCALS",1)~ GOTO 112
END
