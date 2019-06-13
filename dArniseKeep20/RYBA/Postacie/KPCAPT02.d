BEGIN ~KPCAPT02~

IF ~global("CernikPozwolenie","GLOBAL",0) !InPartySlot(LastTalkedToBy,0)~ THEN BEGIN Nic
SAY ~Przykro mi, ale mogê przyjmowaæ rozkazy tylko od naszego przywódcy.~
IF ~~ THEN EXIT
END

IF ~OR(2) AreaCheck("Ar1304") GlobalGT("KeepPlot","GLOBAL",14)~ THEN BEGIN Witanie
SAY ~W czym kapitan gwardii mo¿e ci pomóc?~
IF ~~ THEN REPLY ~Opowiedz mi o sobie.~ GOTO Przedstawienie
IF ~global("CernikWiad","GLOBAL",0)~ THEN REPLY ~Czy podczas mojej nieobecnoœci zdarzy³o siê coœ wa¿nego o czym jeszcze nie wiem?~ GOTO Nie
IF ~global("CernikWiad","GLOBAL",1) global("GoblinBunkry","GLOBAL",0)~ THEN REPLY ~Czy podczas mojej nieobecnoœci zdarzy³o siê coœ wa¿nego o czym jeszcze nie wiem?~ GOTO Gobliny1
IF ~global("CernikWiad","GLOBAL",1) global("GoblinBunkry","GLOBAL",1)~ THEN REPLY ~Czy podczas mojej nieobecnoœci zdarzy³o siê coœ wa¿nego o czym jeszcze nie wiem?~ GOTO Gobliny2
IF ~global("CernikWiad","GLOBAL",2)~ THEN REPLY ~Czy podczas mojej nieobecnoœci zdarzy³o siê coœ wa¿nego o czym jeszcze nie wiem?~ GOTO Karawana
IF ~global("CernikWiad","GLOBAL",3)~ THEN REPLY ~Czy podczas mojej nieobecnoœci zdarzy³o siê coœ wa¿nego o czym jeszcze nie wiem?~ GOTO Plus
IF ~global("CernikPozwolenie","GLOBAL",0) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chcê, aby moi kompani mogli wydawaæ rozkazy mojej armii.~ DO ~setglobal("CernikPozwolenie","GLOBAL",1)~ GOTO Zgoda
IF ~global("CernikPozwolenie","GLOBAL",1) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Odwo³aj uprawnienia moich kompanów do wydawania rozkazów mojej armii.~ DO ~setglobal("CernikPozwolenie","GLOBAL",0)~ GOTO Zgoda
IF ~~ THEN REPLY ~Porozmawiajmy o naszej armii.~ GOTO Armia
//IF ~global("RoenallInwazja","GLOBAL",0) globalLT("DarniseRezerwy","GLOBAL",4)~ THEN REPLY ~Porozmawiajmy o ataku na zamek Roenallów.~ GOTO Odmowa
//IF ~global("RoenallInwazja","GLOBAL",0) globalGT("DarniseRezerwy","GLOBAL",3)~ THEN REPLY ~Porozmawiajmy o ataku na zamek Roenallów.~ GOTO Inwazja
//IF ~global("RoenallInwazja","GLOBAL",1)~ THEN REPLY ~Porozmawiajmy o ataku na zamek Roenallów.~ GOTO Inwazja1
//IF ~global("RoenallInwazja","GLOBAL",2)~ THEN REPLY ~Porozmawiajmy o ataku na zamek Roenallów.~ GOTO Inwazja2
//IF ~global("RoenallInwazja","GLOBAL",3)~ THEN REPLY ~Porozmawiajmy o ataku na zamek Roenallów.~ GOTO Inwazja3
IF ~~ THEN REPLY ~Obecnie niczego nie potrzebuje.~ EXIT
END

IF ~~ THEN BEGIN Zgoda
SAY ~Oczywiœcie. Zaraz wydam odpowiednie rozkazy.~
IF ~~ THEN REPLY ~Chcê prosiæ o coœ innego.~ GOTO Witanie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Nie
SAY ~Nic o czym warto informowaæ.~
IF ~~ THEN REPLY ~Chcê zapytaæ o coœ innego.~ GOTO Witanie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Przedstawienie
SAY ~Wychowa³em siê w na farmie niedaleko. Potem wst¹pi³em do gwardii. D³ugo s³u¿y³em z poprzednim dowódc¹. Szkoda, ¿e kapitan Arat odszed³, <PRO_LADYLORD>. Uzna³, ¿e jakoœ zawiód³ Lorda d'Arnise...~
IF ~~ THEN REPLY ~Chcê prosiæ o coœ innego.~ GOTO Witanie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Nowy1
SAY ~To doskona³y pomys³. Ludzie z radoœci¹ przy³¹czaj¹ siê do gwardii, wiêc bêdê potrzebowa³ tylko 6000 sztuk z³ota na wyposa¿enie i przygotowanie miejsca w koszarach. Oddzia³ bedzie dostepny praktycznie od razu, ale póki nie zakoñczy szkolenia, bede trzyma³ go przy mniej istotnych zadaniach.~
IF ~PartyGoldGT(5999)~ THEN REPLY ~Proszê, oto pieniadze.~ DO ~TakePartyGold(6000) DestroyGold(6000) incrementglobal("DarniseRezerwy","GLOBAL",1) incrementglobal("DarniseTotal","GLOBAL",1)~ GOTO Tworzenie
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Pomówmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Na razie zrezygnujê. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Tworzenie
SAY ~Rozka¿ê Arkandowi, ¿eby rozpocz¹³ trening, udam sie do kuŸni po wyposa¿enie i powiem majordomusowi ¿eby przygotowa³ miejsce w koszarach.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Pomówmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END

IF WEIGHT #0 ~Global("KPCapt02Steal","GLOBAL",1)~ THEN BEGIN 7
SAY ~Witam, <PRO_LADYLORD>. Nie jestem pewny czy wiesz, ale od kilku tygodni w twierdzy dochodzi do kradzie¿y.~
    IF ~~ THEN DO ~SetGlobal("KPCapt02Steal","GLOBAL",2)~ GOTO 8
END

IF ~~ THEN BEGIN 8
  SAY ~Gin¹ drobiazgi. Tu puchar, tam srebrna zastawa, albo parê z³otych monet nale¿¹cych do s³u¿¹cych. Wszystkie przedmioty maj¹ pewn¹ wartoœæ, ale niezbyt wielk¹.~
  IF ~~ THEN GOTO 9
END

IF ~~ THEN BEGIN 9
  SAY ~Mimo wszystko, przeprowadzi³em œledztwo. Winowajc¹ okaza³ siê Lastin - jeden z nowych stra¿ników. Z³apa³em go na gor¹cym uczynku, gdy próbowa³ zwin¹æ naszyjnik Lady d'Arnise.~
  IF ~~ THEN GOTO 10
END

IF ~~ THEN BEGIN 10
  SAY ~Lastin przyzna³ siê do winy. Nie wiem, jak¹ karê nale¿y mu wymierzyæ, wiêc przedstawiam tê sprawê tobie, <PRO_LADYLORD>.~
  IF ~~ THEN EXTERN ~KPDOMO01~ 58
END

IF ~~ THEN BEGIN 11 // from:
  SAY #40332 //* ~Owszem. Natychmiast ka¿ê to zrobiæ... Bêdzie to dobrym ostrze¿eniem dla wszystkich, którzy mog¹ mieæ podobne pomys³y.~ */
  IF ~~ THEN EXTERN ~KPGRD01~ 0
END

IF ~~ THEN BEGIN 12 // from:
  SAY #40334 //* ~Cisza! <PRO_LADYLORD> wydaje tu rozkazy! ChodŸ ze mn¹ i spróbuj zachowaæ resztki godnoœci, Lastin.~ */
  IF ~~ THEN DO ~ActionOverride("kpgrd01",MoveToPoint([1549.1192]))
ActionOverride("kpgrd01",EscapeArea())
MoveToPoint([1499.1196])
EscapeArea()
~ EXIT
END

IF ~~ THEN BEGIN 13 // from:
  SAY #40336 //* ~Owszem. Nie podoba mi siê, ¿e ujdzie mu to na sucho, ale skoro<PRO_LADYLORD> <CHARNAME> okazuje litoœæ, to niech tak bêdzie.~ */
  IF ~~ THEN EXTERN ~KPGRD01~ 1
END

IF ~~ THEN BEGIN 14 // from:
  SAY #40338 //* ~Doœæ. ChodŸ ze mn¹, Lastin. Pójdziemy do koszar i zabierzemy twoje rzeczy... A potem stra¿ odprowadzi ciê do bram.~ */
  IF ~~ THEN DO ~AddExperienceParty(11500)
ActionOverride("kpgrd01",MoveToPoint([1549.1192]))
ActionOverride("kpgrd01",EscapeArea())
MoveToPoint([1499.1196])
EscapeArea()
~ EXIT
END

IF ~~ THEN BEGIN 15 // from:
  SAY #40339 //* ~Nie by³o mnie wtedy w twierdzy, ale Arat wspomina³ o s³u¿¹cym, który podbiera³ pieni¹dze. Oczywiœcie zosta³ stracony.~ */
  IF ~~ THEN REPLY #40340 /* ~Skoro wiêc taka kara jest w³aœciwa, sprawa jest jasna. Natychmiast straciæ tego cz³owieka.~ */ EXTERN ~KPDOMO01~ 59
  IF ~~ THEN REPLY #40341 /* ~Nie chcê jego œmierci. To drobne przestêpstwo. Zamiast tego wydalimy go ze stra¿y i z twierdzy.~ */ EXTERN ~KPDOMO01~ 60
  IF ~~ THEN REPLY #40342 /* ~Rozumiem. Chcê us³yszeæ, co Lastin ma do powiedzenia na swoj¹ obronê.~ */ EXTERN ~KPGRD01~ 2
END

IF ~~ THEN BEGIN 16 // from:
  SAY #40344 //* ~Jeœli masz jakieœ wyt³umaczenie, Lastin, to lepiej mów szybko, nim <PRO_LADYLORD> straci cierpliwoœæ.~ */
  IF ~~ THEN EXTERN ~KPGRD01~ 3
END

IF ~~ THEN BEGIN 17 // from:
  SAY #40352 //* ~Chcesz... zupe³nie mu wybaczyæ, <PRO_LADYLORD>?~ */
  IF ~~ THEN EXTERN ~KPGRD01~ 6
END

IF ~~ THEN BEGIN 18 // from:
  SAY #40354 //* ~(wzdycha) No dobrze. Masz szczêœcie, ¿e <PRO_LADYLORD> wykazuje tak¹ uprzejmoœæ, Lastin. ChodŸ ze mn¹ do koszar.~ */
  IF ~~ THEN DO ~AddexperienceParty(15500)
ActionOverride("kpgrd01",MoveToPoint([1549.1192]))
ActionOverride("kpgrd01",EscapeArea())
MoveToPoint([1499.1196])
EscapeArea()
~ EXIT
END

IF ~~ THEN BEGIN 19 // from:
  SAY #40372 //* ~ChodŸ ze mn¹, Lastin. Sprawiedliwoœci stanie siê zadoœæ, a wszyscy, którzy chcieliby pójœæ w twoje œlady, powa¿nie siê nad tym zastanowi¹.~ */
  IF ~~ THEN DO ~ActionOverride("kpgrd01",MoveToPoint([1549.1192]))
ActionOverride("kpgrd01",EscapeArea())
MoveToPoint([1499.1196])
EscapeArea()
~ EXIT
END

IF ~~ THEN BEGIN 20 // from:
  SAY #40375 //* ~(wzdycha) Nie powiem, ¿ebym siê z tym zgadza³, ale... Chyba uczyni³bym tak samo. Mam nadziejê, ¿e z ¿on¹ jakoœ siê u³o¿y. ChodŸ ze mn¹ do koszar.~ */
  IF ~~ THEN DO ~AddexperienceParty(15500)
ActionOverride("kpgrd01",MoveToPoint([1549.1192]))
ActionOverride("kpgrd01",EscapeArea())
MoveToPoint([1499.1196])
EscapeArea()
~ EXIT
END

IF WEIGHT #1 ~Global("KeepPlot","GLOBAL",9)~ THEN BEGIN 21 // from:
  SAY #40654 //* ~<PRO_LADYLORD> <CHARNAME>! Lord Roenall i jego wojsko przebili siê przez nasze linie! Atakuj¹ wrota!~ */
  IF ~~ THEN GOTO 22
END

IF ~~ THEN BEGIN 22 // from: 21.0
  SAY #40655 //* ~Musisz iœæ tam prêdko! Jeœli ich nie powstrzymamy, pokonaj¹ mury i przegramy!~ */
  IF ~~ THEN GOTO 23
END

IF ~~ THEN BEGIN 23 // from: 22.0
  SAY #40656 //* ~Musisz walczyæ z Lordem Roenallem! Jeœli zginie, jego armia rozproszy siê! Ale musisz to zrobiæ, nim zdobêd¹ mury! Szybko, <PRO_LADYLORD>! Do wrót!~ */
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
  SAY #40660 //* ~Musisz zabiæ Roenalla, <PRO_LADYLORD>! Szybko!~ */
  IF ~~ THEN EXIT
END

IF WEIGHT #3 ~Global("KeepPlot","GLOBAL",13)
Dead("kproen01")
~ THEN BEGIN 25 // from:
  SAY #40683 //* ~Cieszê siê, ¿e zostajesz w twierdzy... I ¿e ¿yjesz. Lord Roenall zas³u¿y³ na swój los. Cieszymy siê, ¿e nie musimy s³u¿yæ pod takim ³ajdakiem.~ */
  IF ~~ THEN DO ~SetGlobal("KeepPlot","GLOBAL",15)
~ EXIT
END

IF ~~ THEN BEGIN Nowy2
SAY ~To doskona³y pomys³, ale ludzi bêdzie trzeba przekonaæ ¿eby do³¹czyli do gwardii, wiêc bêdê potrzebowa³ 9000 sztuk z³ota na wyposa¿enie, przygotowanie miejsca w koszarach i przekonanie ludzi. Oddzia³ bedzie dostepny praktycznie od razu, ale póki nie zakoñczy szkolenia, bede trzyma³ go przy mniej istotnych zadaniach.~
IF ~PartyGoldGT(8999)~THEN REPLY ~Proszê, oto pieniadze.~ DO ~TakePartyGold(9000) DestroyGold(9000) incrementglobal("DarniseRezerwy","GLOBAL",1) incrementglobal("DarniseTotal","GLOBAL",1)~ GOTO Tworzenie
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Pomówmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Na razie zrezygnujê. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Nowy3
SAY ~To doskona³y pomys³, ale nikt w miejscowych nie przy³¹czy sie do gwardii, wiêc bêdê potrzebowa³ 15000 sztuk z³ota na wyposa¿enie, przygotowanie miejsca w koszarach i wynajêcie cudzoziemskich najemników. Oddzia³ bedzie dostepny praktycznie od razu, ale póki nie zakoñczy szkolenia, bede trzyma³ go przy mniej istotnych zadaniach.~
IF ~PartyGoldGT(14999)~THEN REPLY ~Proszê, oto pieniadze.~ DO ~TakePartyGold(15000) DestroyGold(15000) incrementglobal("DarniseRezerwy","GLOBAL",1) incrementglobal("DarniseTotal","GLOBAL",1)~ GOTO Tworzenie
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Pomówmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Na razie zrezygnujê. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Nowy0
SAY ~To doskona³y pomys³, ale nasza kuŸnia nie dzia³a, wiêc bêdê potrzebowa³ 20000 sztuk z³ota na wyposa¿enie i przygotowanie miejsca w koszarach niezale¿nie od tego sk¹d wezmê ludzi. Oddzia³ bedzie dostepny praktycznie od razu, ale póki nie zakoñczy szkolenia, bede trzyma³ go przy mniej istotnych zadaniach.~
IF ~PartyGoldGT(19999)~THEN REPLY ~Proszê, oto pieniadze.~ DO ~TakePartyGold(20000) DestroyGold(20000) incrementglobal("DarniseRezerwy","GLOBAL",1) incrementglobal("DarniseTotal","GLOBAL",1)~ GOTO Tworzenie
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Pomówmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Na razie zrezygnujê. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Odmowa
SAY ~Mam za ma³o dostêpnych oddzia³ów zeby przeprowadziæ atak. Potrzebujê przynajmniej cztery. Musimy zwolniæ oddzia³y z innych zadañ lub wyszkoliæ dodatkowe.~
IF ~Global("RoenallWynik","GLOBAL",1)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak1
IF ~Global("RoenallWynik","GLOBAL",2)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak2
IF ~Global("RoenallWynik","GLOBAL",3)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ DO ~setglobal("JeniecWiem","GLOBAL",0)~ GOTO Atak3
IF ~Global("RoenallWynik","GLOBAL",4)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak4
IF ~Global("RoenallWynik","GLOBAL",31)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak31
IF ~Global("RoenallWynik","GLOBAL",32)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak32
IF ~Global("RoenallWynik","GLOBAL",33)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak33
IF ~~ THEN REPLY ~Rozumiem. Chcê prosiæ o coœ jeszcze.~ GOTO Witanie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Inwazja
SAY ~Mogê to zrobiæ. Potrzebujê cztery oddzia³y i trzy tygodnie czasu.~
IF ~~ THEN REPLY ~Zgoda. Zabierajcie siê do pracy.~ DO ~setglobaltimer("ArkandInwazja","GLOBAL",SEVEN_DAYS) incrementglobal("DarniseRezerwy","GLOBAL",-4) setglobal("RoenallInwazja","GLOBAL",1)~ GOTO Zgoda
IF ~Global("RoenallWynik","GLOBAL",1)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak1
IF ~Global("RoenallWynik","GLOBAL",2)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak2
IF ~Global("RoenallWynik","GLOBAL",3)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak3
IF ~Global("RoenallWynik","GLOBAL",4)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak4
IF ~Global("RoenallWynik","GLOBAL",31)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak31
IF ~Global("RoenallWynik","GLOBAL",32)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak32
IF ~Global("RoenallWynik","GLOBAL",33)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak33
IF ~~ THEN REPLY ~Chcê prosiæ o coœ innego.~ GOTO Witanie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Inwazja1
SAY ~Zbieramy obecnie informacje potrzebne do zaplanowania najazdu.~
IF ~!global("RoenallInwazja","GLOBAL",0)~ THEN REPLY ~Odwo³aj inwazjê na ziemie Roenallów. Potrzebujê oddzia³y gdzie indziej.~ GOTO Rezygnacja
IF ~Global("RoenallWynik","GLOBAL",1)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak1
IF ~Global("RoenallWynik","GLOBAL",2)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak2
IF ~Global("RoenallWynik","GLOBAL",3)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak3
IF ~Global("RoenallWynik","GLOBAL",4)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak4
IF ~Global("RoenallWynik","GLOBAL",31)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak31
IF ~Global("RoenallWynik","GLOBAL",32)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak32
IF ~Global("RoenallWynik","GLOBAL",33)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak33
IF ~~ THEN REPLY ~Chcê prosiæ o coœ innego.~ GOTO Witanie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Inwazja2
SAY ~Na podstawie zdobytych informacji wywiadowczych szkolimy nasze oddzia³y, aby by³y jak najlepiej przygotowane do ataku.~
IF ~!global("RoenallInwazja","GLOBAL",0)~ THEN REPLY ~Odwo³aj inwazjê na ziemie Roenallów. Potrzebujê oddzia³y gdzie indziej.~ GOTO Rezygnacja
IF ~Global("RoenallWynik","GLOBAL",1)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak1
IF ~Global("RoenallWynik","GLOBAL",2)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak2
IF ~Global("RoenallWynik","GLOBAL",3)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak3
IF ~Global("RoenallWynik","GLOBAL",4)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak4
IF ~Global("RoenallWynik","GLOBAL",31)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak31
IF ~Global("RoenallWynik","GLOBAL",32)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak32
IF ~Global("RoenallWynik","GLOBAL",33)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak33
IF ~~ THEN REPLY ~Chcê prosiæ o coœ innego.~ GOTO Witanie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Inwazja3
SAY ~Obecnie ustawiamy nasze oddzia³y na pozycjach do ataku. Rozmieszczamy je dyskretnie jak najbli¿ej zamku Roenallów.~
IF ~!global("RoenallInwazja","GLOBAL",0)~ THEN REPLY ~Odwo³aj inwazjê na ziemie Roenallów. Potrzebujê oddzia³y gdzie indziej.~ GOTO Rezygnacja
IF ~Global("RoenallWynik","GLOBAL",1)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak1
IF ~Global("RoenallWynik","GLOBAL",2)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak2
IF ~Global("RoenallWynik","GLOBAL",3)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak3
IF ~Global("RoenallWynik","GLOBAL",4)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak4
IF ~Global("RoenallWynik","GLOBAL",31)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak31
IF ~Global("RoenallWynik","GLOBAL",32)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak32
IF ~Global("RoenallWynik","GLOBAL",33)~ THEN REPLY ~Opowiadaj jak uda³a siê ostatnia inwazja na ziemie Roenallów!~ GOTO Atak33
IF ~~ THEN REPLY ~Na razie z tym poczekajmy. Chcê prosiæ o coœ innego.~ GOTO Witanie
IF ~~ THEN REPLY ~Jeszcze nie teraz. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Rezygnacja
SAY ~Jak ka¿esz. Mogê oddaæ je do innych zadañ ju¿ teraz.~
IF ~~ THEN REPLY ~Zrób to.~ DO ~incrementglobal("DarniseRezerwy","GLOBAL",4) setglobal("RoenallInwazja","GLOBAL",0)~ GOTO Zgoda
IF ~~ THEN REPLY ~Na razie z tym poczekajmy. Chcê prosiæ o coœ innego.~ GOTO Witanie
IF ~~ THEN REPLY ~Jeszcze nie teraz. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Atak1
SAY ~Skorzystaliœmy ze starego tunelu ewakuacyjnego zeby dostac sie do ich zamku! Tak! Do samego zamku! Pewno nawet Roenallowie nie wiedzieli o tym tunelu. Niestety zostaliœmy spostrze¿eni. Walczylismy dzielnie, ale wycofywaliœmy siê. Musieliœmy! W koñcu wyparli nas z zamku i wyda³em rozkaz odwrotu, ale ostatnim pomieszczeniem jakie mijaliœmy by³ skarbiec. Przynieœliœmy 25000 sztuk z³ota i wszyscy prze¿yli!~
IF ~~ THEN REPLY ~Nale¿y wam sie pochwa³a. Chcê prosiæ o coœ jeszcze.~ GOTO Witanie
IF ~~ THEN REPLY ~To dobre wieœci. ¯egnaj.~ EXIT
IF ~~ THEN REPLY ~Mimo wszystko, nastêpnym razem postarajcie siê lepiej. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Atak2
SAY ~Udawaliœmy karawanê kupieck¹. Arkand oferuj¹cy warzywa! To dopiero coœ! W ten sposób dostaliœmy siê na dziedziniec ich zamku. Dla odwrócenia uwagi Arkand wypuœci³ wiêŸniów z cel Roenallów. Walka by³a zaciêta! Roenallowie potracili g³owy! Czasami dos³ownie! Niestety, jeden z uwolnionych przez nas wiêŸniów by³ magiem. Poza cel¹ jego moc nie by³a uwi¹zana. Atakowa³ wszystkich, nas te¿. Musieliœmy sie wycofaæ, zanim osi¹gnêliœmy zaplanowany cel, ale czêœæ z uwolnionych przez nas wiêŸniów te¿ uciek³a. To porz¹dni ludzie. Pozwoli³em sobie w³¹czyæ ich do gwardii. Zyskaliœmy dwa nowe oddzia³y.~
IF ~~ THEN REPLY ~Dodatkowi ludzie zawsze s¹ mile widziani w gwardii. Chcê prosiæ o coœ jeszcze.~ GOTO Witanie
IF ~~ THEN REPLY ~Myœlê, ¿e mo¿na to uznaæ za sukces! ¯egnaj.~ EXIT
IF ~~ THEN REPLY ~Mimo wszystko, nastêpnym razem postarajcie siê lepiej. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Atak3
SAY ~To by³o coœ! Przebraliœmy czêœc gwardzistek za... hm... tancerki... egzotyczne. Tym razem zabraliœmy ze sob¹ Dinarê, wola³em ¿eby jeden z poruczników by³ z gwardzistkami, a Arkand siê nie nadawa³. Gwardzistki wesz³y do zamku i uœpi³y czujnoœæ wielu ¿o³nierzy i szlachciców. Niestety by³y tam te¿ roenallskie kobiety, narobi³y ha³asu. Zaatakowaliœmy z Arkandem, kiedy zaczê³a siê wrzawa. Bitwa trwa³a d³ugo, ale oddzia³ow Roenallów by³o coraz wiêcej i musieliœmy sie wycofaæ, ale postanowi³em, ¿e nie odejdziemy z pustymi rêkami. Kaza³em pojmaæ bogato odzianego szlachcica. Zamknêliœmy go w celi.~
IF ~~ THEN REPLY ~To bardzo ciekawa historia. Chcê prosiæ o coœ jeszcze.~ GOTO Witanie
IF ~~ THEN REPLY ~Jeniec? A to ci dopiero trofeum! ¯egnaj.~ EXIT
IF ~~ THEN REPLY ~Mimo wszystko, nastêpnym razem postarajcie siê lepiej. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Atak4
SAY ~Nie jestem pewnien co zrobiliœmy Ÿle, ale zorientowali siê i musieliœmy siê wycofaæ zanim rozpoczêliœmy szturm. Dobrze, ¿e w porê zauwa¿ylismy zbli¿aj¹ce sie oddzia³y. Przewy¿sza³y nas liczebnie!~
IF ~~ THEN REPLY ~Có¿, zdarza siê. Chcê prosiæ o coœ jeszcze.~ GOTO Witanie
IF ~~ THEN REPLY ~Dobrze, ze przynajmniej nikt nie zgin¹³. Trzymaj siê kapitanie!~ EXIT
IF ~~ THEN REPLY ~Mimo wszystko, nastêpnym razem postarajcie siê lepiej. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Atak31
SAY ~Rozpoznaliœmy kiedy znaczna czêœæ ¿o³nierzy Roenallów wyjedzie eskortowaæ reprezentanta Zakapturzonych Czarodziei do Atkathli. Wtedy zaatakowaliœmy. Si³y by³y wyrównane. My nie mogliœmy wejœæ do ich zamku, a oni wyjœæ. Kiedy us³yszeliœmy, ¿e oddzia³y z Atkathli wracaj¹, wyda³em rozkaz odwrotu. Trochê za póŸno. Wymknêliœmy siê, ale jeden oddzia³ poleg³. Obawiam siê, ¿e twoja reputacja te¿ trochê podupad³a.~
IF ~~ THEN REPLY ~Có¿, zdarza siê. Chcê prosiæ o coœ jeszcze.~ GOTO Witanie
IF ~~ THEN REPLY ~Nie lubiê traciæ ludzi, ale nic lepszego zrobiæ nie mog³eœ. Trzymaj siê kapitanie!~ EXIT
IF ~~ THEN REPLY ~Obejdziemy siê bez tego jednego oddzia³u, ma³a strata. ¯egnaj.~ DO ~IncrementGlobal("KPRevolt","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Atak32
SAY ~Wszystko by³o zaplanowane. Szliœmy boczn¹ drog¹ na ich zamek. Niestety oni wybrali t¹ sam¹ drogê, Arkand uwa¿a, ze szli na nasz¹ warowniê. Si³y by³y wyrównane. Straci³em po³owê oddzia³ów, oni te¿. Obie strony wróci³y sk¹d przysz³y. Obwiam sie, ze wieœci o tym niepowodzeniu dodtar³y do naszych ludzi i nie zosta³y dobrze przyjête.~
IF ~~ THEN REPLY ~Có¿, to doœæ nieszczêœliwy przypadek. Chcê prosiæ o coœ jeszcze.~ GOTO Witanie
IF ~~ THEN REPLY ~Nie lubiê traciæ ludzi, ale nic lepszego zrobiæ nie mog³eœ. Trzymaj siê kapitanie!~ EXIT
IF ~~ THEN REPLY ~Widaæ ci co zginêli byli s³abi, albo marnie wyszkoleni. Zostali ci silniejsi, to dobrze. ¯egnaj.~ DO ~IncrementGlobal("KPRevolt","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Atak33
SAY ~Ciê¿ko mi o tym mówiæ. Ktoœ nas zdradzi³. Mo¿liwe, ¿e roenallscy wieœniacy, którzy obiecywali pomoc... Mo¿e jeden z naszych juz teraz martwych ludzi... Nie wiem. Wpadlismy w pu³apkê. Prze¿yliœmy tylko ja, Arkand i jeden oddzia³.~
IF ~~ THEN REPLY ~To smutne, ale musimy sobie z tym poradziæ. Chcê prosiæ o coœ jeszcze.~ GOTO Witanie
IF ~~ THEN REPLY ~Nie lubiê traciæ ludzi, ale nic lepszego zrobiæ nie mog³eœ. Trzymaj siê kapitanie!~ EXIT
IF ~~ THEN REPLY ~Szkoda, ¿e nie przynieœliœcie z³ota. Za coœ muszê teraz naj¹æ nowych gwardzistów! ¯egnaj.~ DO ~IncrementGlobal("KPRevolt","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Gobliny1
SAY ~Zwiadowcy zauwa¿yli hordê Goblinów zmierzaj¹cych na zamek. Zaraz bêd¹ pod murami! Musimy zadbaæ by most by³ podniesiony, a katapulty gotowe do strza³u! Wyszli tak nagle z lasu, ¿e nie zd¹¿yliœmy ostrzec mieszkañców! Nie bêd¹ zadowoleni.~
IF ~~ THEN DO ~setglobal("GoblinNajazd","GLOBAL",50) setglobaltimer("CernikInwazja","GLOBAL",FIVE_DAYS) SetGlobal("GWARD01Ogrod","GLOBAL",2) setglobaltimer("CernikTimer","GLOBAL",SEVEN_DAYS) SetGlobal("CernikLicznik","GLOBAL",0) SetGlobal("CernikWiad","GLOBAL",0) IncrementGlobal("KPRevolt","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Gobliny2
SAY ~Zwiadowcy zauwa¿yli hordê Goblinów zmierzaj¹cych na zamek. Zaraz bêd¹ pod murami! Musimy zadbaæ by most by³ podniesiony, a katapulty gotowe do strza³u! Wyszli z lasu tak nagle, ale dziêki schronom w gospodarstwach ludzie powinni siê schowaæ na czas. Nie bêd¹ mieæ do ciebie ¿alu.~
IF ~~ THEN DO ~setglobal("GoblinNajazd","GLOBAL",50) setglobaltimer("CernikInwazja","GLOBAL",FIVE_DAYS) SetGlobal("GWARD01Ogrod","GLOBAL",2) setglobaltimer("CernikTimer","GLOBAL",SEVEN_DAYS) SetGlobal("CernikLicznik","GLOBAL",0) SetGlobal("CernikWiad","GLOBAL",0)~ EXIT
END

IF ~~ THEN BEGIN Karawana
SAY ~Nasi zwiadowcy donieœli, ¿e po naszych drogach podró¿uje karawana kupiecka. Jeœli chcesz zwiadowcy mog¹ przekonaæ kupców aby nad³o¿yli drogi i zatrzymali siê na dzieñ, u nas na dziedziñcu.~
IF ~~ THEN REPLY ~Oczywiœcie. Niech siê u nas zatrzymaj¹. Chêtnie z nimi pohandlujê.~ DO ~setglobal("KupcyNajazd","GLOBAL",1) SetGlobalTimer("KupcyStart","GLOBAL",ONE_DAY) SetGlobalTimer("KupcyStop","GLOBAL",TWO_DAYS) setglobaltimer("CernikTimer","GLOBAL",SEVEN_DAYS) SetGlobal("CernikLicznik","GLOBAL",0) SetGlobal("CernikWiad","GLOBAL",0)~ GOTO Kupcy
IF ~~ THEN REPLY ~Nie. Nie zatrzymuj ich.~ DO ~setglobaltimer("CernikTimer","GLOBAL",SEVEN_DAYS) SetGlobal("CernikLicznik","GLOBAL",0) SetGlobal("CernikWiad","GLOBAL",0)~ EXIT
END

IF ~~ THEN BEGIN Kupcy
SAY ~Doskonale. Kupcy bêd¹ potrzebowali dzieñ ¿eby tu dotrzeæ i pozostan¹ tu przez ca³y nastêpny dzieñ.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Plus
SAY ~U jednego z naszych rolników zatrzyma³o siê paru najemników. Dinara trochê powêszy³a i twierdzi, ¿e mo¿na im ufaæ. Chc¹ wst¹piæ do naszej gwardii. Maj¹ ju¿ swój sprzêt, wiêc koszt naboru wyniós³by jedynie 2500 sztuk z³ota. Czy zgadzasz siê na to?~
IF ~PartyGoldGT(2499)~ THEN REPLY ~Przyda siê dodatkowy oddzia³. Oto pieniadze.~ DO ~TakePartyGold(2500) DestroyGold(2500) incrementglobal("DarniseRezerwy","GLOBAL",1) incrementglobal("DarniseTotal","GLOBAL",1) setglobaltimer("CernikTimer","GLOBAL",SEVEN_DAYS) SetGlobal("CernikLicznik","GLOBAL",0) SetGlobal("CernikWiad","GLOBAL",0)~ GOTO Najemnik
IF ~~ THEN REPLY ~Nie staæ nas teraz na taki wydatek.~ DO ~setglobaltimer("CernikTimer","GLOBAL",SEVEN_DAYS) SetGlobal("CernikLicznik","GLOBAL",0) SetGlobal("CernikWiad","GLOBAL",0)~ EXIT
END

IF ~~ THEN BEGIN Najemnik
SAY ~Bardzo siê cieszê. Zaraz po nich poœlê!~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Nowy4
SAY ~Niestety koszary nie pomieszcz¹ wiêcej oddzia³ów. Mo¿emy teraz przyjmowaæ nowe odddzia³y tylko w specjalnych okolicznoœciach.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia
SAY ~Oczywiœcie, <PRO_LADYLORD>. Co chcesz wiedzieæ?~
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
IF ~global("GoblinKoszary","GLOBAL",0)~ THEN REPLY ~Ile oddzia³ów pomieszcz¹ nasze koszary?~ GOTO Koszary0
IF ~global("GoblinKoszary","GLOBAL",1)~ THEN REPLY ~Ile oddzia³ów pomieszcz¹ nasze koszary?~ GOTO Koszary1
IF ~globalLT("DarniseTotal","GLOBAL",10) global("GoblinKoszary","GLOBAL",0) global("RatavaPosi","GLOBAL",3)~ THEN REPLY ~Potrzebujemy dodatkowy oddzia³ gwardii.~ GOTO Nowy0
IF ~globalLT("DarniseTotal","GLOBAL",10) global("GoblinKoszary","GLOBAL",0) !global("RatavaPosi","GLOBAL",3) GlobalLT("kprevolt","GLOBAL",0)~ THEN REPLY ~Potrzebujemy dodatkowy oddzia³ gwardii.~ GOTO Nowy1
IF ~globalLT("DarniseTotal","GLOBAL",10) global("GoblinKoszary","GLOBAL",0) !global("RatavaPosi","GLOBAL",3) GlobalGT("kprevolt","GLOBAL",-1) GlobalLT("kprevolt","GLOBAL",6)~ THEN REPLY ~Potrzebujemy dodatkowy oddzia³ gwardii.~ GOTO Nowy2
IF ~globalLT("DarniseTotal","GLOBAL",10) global("GoblinKoszary","GLOBAL",0) !global("RatavaPosi","GLOBAL",3) GlobalGT("kprevolt","GLOBAL",5)~ THEN REPLY ~Potrzebujemy dodatkowy oddzia³ gwardii.~ GOTO Nowy3
IF ~globalGT("DarniseTotal","GLOBAL",9)  global("GoblinKoszary","GLOBAL",0)~ THEN REPLY ~Potrzebujemy dodatkowy oddzia³ gwardii.~ GOTO Nowy4
IF ~globalLT("DarniseTotal","GLOBAL",15) global("GoblinKoszary","GLOBAL",1) global("RatavaPosi","GLOBAL",3)~ THEN REPLY ~Potrzebujemy dodatkowy oddzia³ gwardii.~ GOTO Nowy0
IF ~globalLT("DarniseTotal","GLOBAL",15) global("GoblinKoszary","GLOBAL",1) !global("RatavaPosi","GLOBAL",3) GlobalLT("kprevolt","GLOBAL",0)~ THEN REPLY ~Potrzebujemy dodatkowy oddzia³ gwardii.~ GOTO Nowy1
IF ~globalLT("DarniseTotal","GLOBAL",15) global("GoblinKoszary","GLOBAL",1) !global("RatavaPosi","GLOBAL",3) GlobalGT("kprevolt","GLOBAL",-1) GlobalLT("kprevolt","GLOBAL",6)~ THEN REPLY ~Potrzebujemy dodatkowy oddzia³ gwardii.~ GOTO Nowy2
IF ~globalLT("DarniseTotal","GLOBAL",15) global("GoblinKoszary","GLOBAL",1) !global("RatavaPosi","GLOBAL",3) GlobalGT("kprevolt","GLOBAL",5)~ THEN REPLY ~Potrzebujemy dodatkowy oddzia³ gwardii.~ GOTO Nowy3
IF ~globalGT("DarniseTotal","GLOBAL",14) global("GoblinKoszary","GLOBAL",1)~ THEN REPLY ~Potrzebujemy dodatkowy oddzia³ gwardii.~ GOTO Nowy4
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~To ju¿ wszystko. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Koszary0
SAY ~Koszary mieszcz¹ 10 oddzia³ów.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Koszary1
SAY ~Koszary mieszcz¹ 15 oddzia³ów.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia0
SAY ~Dysponujemy tylko szkieletow¹ za³og¹ warownii.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia1
SAY ~Dysponujemy szkieletow¹ za³og¹ warownii i jednym oddzia³em.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia2
SAY ~Dysponujemy szkieletow¹ za³og¹ warownii i dwoma oddzia³ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia3
SAY ~Dysponujemy szkieletow¹ za³og¹ warownii i trzema oddzia³ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia4
SAY ~Dysponujemy szkieletow¹ za³og¹ warownii i czterema oddzia³ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia5
SAY ~Dysponujemy szkieletow¹ za³og¹ warownii i piêcioma oddzia³ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia6
SAY ~Dysponujemy szkieletow¹ za³og¹ warownii i szeœcioma oddzia³ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia7
SAY ~Dysponujemy szkieletow¹ za³og¹ warownii i siedmioma oddzia³ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia8
SAY ~Dysponujemy szkieletow¹ za³og¹ warownii i oœmioma oddzia³ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia9
SAY ~Dysponujemy szkieletow¹ za³og¹ warownii i dziewiêcioma oddzia³ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia10
SAY ~Dysponujemy szkieletow¹ za³og¹ warownii i dziesiêcioma oddzia³ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia11
SAY ~Dysponujemy szkieletow¹ za³og¹ warownii i jedenastoma oddzia³ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia12
SAY ~Dysponujemy szkieletow¹ za³og¹ warownii i dwunastoma oddzia³ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia13
SAY ~Dysponujemy szkieletow¹ za³og¹ warownii i trzynastoma oddzia³ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia14
SAY ~Dysponujemy szkieletow¹ za³og¹ warownii i czternastoma oddzia³ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia15
SAY ~Dysponujemy szkieletow¹ za³og¹ warownii i piêtnastoma oddzia³ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia16
SAY ~Dysponujemy szkieletow¹ za³og¹ warownii i szesnastoma oddzia³ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia17
SAY ~Dysponujemy szkieletow¹ za³og¹ warownii i siedemnastoma oddzia³ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia18
SAY ~Dysponujemy szkieletow¹ za³og¹ warownii i osiemnastoma oddzia³ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END


IF ~~ THEN BEGIN Armia19
SAY ~Dysponujemy szkieletow¹ za³og¹ warownii i dziewiêtnastoma oddzia³ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia20
SAY ~Dysponujemy szkieletow¹ za³og¹ warownii i dwudziestoma oddzia³ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia21
SAY ~Dysponujemy szkieletow¹ za³og¹ warownii i ponad dwudziestoma oddzia³ami.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszej armii.~ GOTO Armia
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO Witanie
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END