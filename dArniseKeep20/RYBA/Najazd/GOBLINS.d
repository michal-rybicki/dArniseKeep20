BEGIN ~GOBLINS~ 2

IF ~true()~ THEN BEGIN Gada
SAY ~Pozdrowienie. Przyjemnie ¿yje siê tu w tej twojej twierdzy.~
IF ~~ THEN REPLY ~Mam kilka pytañ.~ GOTO Gada1
IF ~~ THEN REPLY ~Co do tej pory stworzyliœcie na tych ziemiach?~ GOTO Raporty
IF ~~ THEN REPLY ~Macie jakieœ pomys³y na zbudowanie tu czegoœ?~ GOTO Nowe
IF ~~ THEN REPLY ~Cieszê sie. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Gada2
SAY ~Oczywiœcie. Co chcesz omówiæ?~
IF ~~ THEN REPLY ~Mam kilka pytañ.~ GOTO Gada1
IF ~~ THEN REPLY ~Co do tej pory stworzyliœcie na tych ziemiach?~ GOTO Raporty
IF ~!globalGT("GoblinUpgrade","GLOBAL",3)~ THEN REPLY ~Macie jakieœ pomys³y na zbudowanie tu czegoœ nowego?~ GOTO Nowe
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Raporty
SAY ~Oto raporty z dokoñczonych lub ci¹g³ych projektów. Szczegó³y, którego projektu chcesz zozbaczyæ?~
IF ~global("GoblinBunkry","GLOBAL",1)~ THEN REPLY ~Schrony w gospodarstwach.~ GOTO Schrony2
IF ~global("GoblinDrogi","GLOBAL",1)~ THEN REPLY ~Modernizacja dróg.~ GOTO Drogi2
IF ~global("GoblinKuznia","GLOBAL",1)~ THEN REPLY ~Modernizacja kuŸni.~ GOTO Kuznia2
IF ~global("GoblinKoszary ","GLOBAL",1)~ THEN REPLY ~Przebudowa koszar.~ GOTO Koszary2
IF ~~ THEN REPLY ~Brygady robocze.~ GOTO Brygady
IF ~~ THEN REPLY ~Chcê porozmawiaæ o czymœ innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Brygady
SAY ~Brygada in¿ynieryjna, transportowa i magazynowa melduj¹ pe³n¹ gotowoœæ. O przydziale poszczególnych brygad rozmawiaj z ich cz³onkami.~
IF ~~ THEN REPLY ~Wróæmy do raportów o ukoñczonych projektach.~ GOTO Raporty
IF ~~ THEN REPLY ~Chcê porozmawiaæ o czymœ innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Schrony2
SAY ~Wszystkie gospodarstwa zosta³y zabezpieczone. W razie niespodziewanego ataku nasi mieszkañcy maj¹ siê gdzie schowaæ.~
IF ~~ THEN REPLY ~Wróæmy do raportów o ukoñczonych projektach.~ GOTO Raporty
IF ~~ THEN REPLY ~Chcê porozmawiaæ o czymœ innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Drogi2
SAY ~Drogi zosta³y utwardzone i poszerzone. Transport odbywa siê teraz p³ynniej, a patrole okolicy s¹ ³atwiejsze.~
IF ~~ THEN REPLY ~Wróæmy do raportów o ukoñczonych projektach.~ GOTO Raporty
IF ~~ THEN REPLY ~Chcê porozmawiaæ o czymœ innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Kuznia2
SAY ~KuŸnia jest teraz wydajniejsza i zmniejszone zosta³o zu¿ycie materia³u. Obs³uga kuŸni melduje, ¿e jest zadowolona z usprawnieñ.~
IF ~~ THEN REPLY ~Wróæmy do raportów o ukoñczonych projektach.~ GOTO Raporty
IF ~~ THEN REPLY ~Chcê porozmawiaæ o czymœ innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Koszary2
SAY ~Po przebudowie koszary mieszcz¹ 15 oddzia³ów.~
IF ~~ THEN REPLY ~Wróæmy do raportów o ukoñczonych projektach.~ GOTO Raporty
IF ~~ THEN REPLY ~Chcê porozmawiaæ o czymœ innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Nowe
SAY ~Mamy ju¿ kilka pomys³ów, ale ca³y czas rozeznajemy teren w poszukiwaniu nowych. Proszê oto nasze projekty. O którym chcesz porozmawiaæ?~
IF ~global("GoblinBunkry","GLOBAL",0)~ THEN REPLY ~Schrony w gospodarstwach.~ GOTO Schrony1
IF ~global("GoblinDrogi","GLOBAL",0)~ THEN REPLY ~Modernizacja dróg.~ GOTO Drogi1
IF ~global("GoblinKuznia","GLOBAL",0)~ THEN REPLY ~Modernizacja kuŸni.~ GOTO Kuznia1
IF ~global("GoblinKoszary ","GLOBAL",0)~ THEN REPLY ~Przebudowa koszar.~ GOTO Koszary1
IF ~~ THEN REPLY ~Chcê porozmawiaæ o czymœ innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Schrony1
SAY ~Propozycja obejmuje stworzenie w ka¿dym gospodarstwie miejsca, gdzie mieszkañcy mogliby w ukryciu przeczekaæ przemarsz wrogich wojsk przez okolice. Szczególnie przydatne, gdy nie ma czasu ostrzec mieszkañców. Koszt budowy wyniós³by 18500 sztuk z³ota.~
IF ~PartyGoldGT(18499) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Proszê, oto pieniadze.~ DO ~TakePartyGold(18500) DestroyGold(17500) incrementglobal("GoblinUpgrade","GLOBAL",1) setglobal("GoblinBunkry","GLOBAL",1)~ GOTO Zgoda
IF ~PartyGoldGT(18499) !InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Proszê, oto pieniadze.~ DO ~~ GOTO Odmowa
IF ~~ THEN REPLY ~Wróæmy innych waszych propozycji.~ GOTO Nowe
IF ~~ THEN REPLY ~Chcê porozmawiaæ o czymœ innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Drogi1
SAY ~Wiekszoœæ dróg nale¿y poszerzyæ i utwardziæ. Trzeba te¿ doprowadziæ wygodne drogi do granic naszych terenów. Je¿eli doprowadzimy drogi do porz¹dnego stanu zachêci do handlarzy do wizyt u nas i przyspieszy oraz u³atwi poruszanie siê po okolicy. Koszt budowy wyniós³by 24500 sztuk z³ota.~
IF ~PartyGoldGT(24499) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Proszê, oto pieniadze.~ DO ~TakePartyGold(24500) DestroyGold(23500) incrementglobal("GoblinUpgrade","GLOBAL",1) setglobal("GoblinDrogi","GLOBAL",1)~ GOTO Zgoda
IF ~PartyGoldGT(24499) !InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Proszê, oto pieniadze.~ DO ~~ GOTO Odmowa
IF ~~ THEN REPLY ~Wróæmy innych waszych propozycji.~ GOTO Nowe
IF ~~ THEN REPLY ~Chcê porozmawiaæ o czymœ innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Kuznia1
SAY ~Tutejsza kuŸnia powsta³a wtedy, kiedy budowano zamek. Wyposa¿enie jest stare. Kiedy je odnowimy wytwarzane dla ciebie przedmioty bed¹ tañsze, a zyski ze sprzeda¿y wiêksze. Koszt budowy wyniós³by 11500 sztuk z³ota.~
IF ~PartyGoldGT(11499) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Proszê, oto pieniadze.~ DO ~TakePartyGold(11500) DestroyGold(10500) incrementglobal("GoblinUpgrade","GLOBAL",1) setglobal("GoblinKuznia","GLOBAL",1)~ GOTO Zgoda
IF ~PartyGoldGT(11499) !InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Proszê, oto pieniadze.~ DO ~~ GOTO Odmowa
IF ~~ THEN REPLY ~Wróæmy innych waszych propozycji.~ GOTO Nowe
IF ~~ THEN REPLY ~Chcê porozmawiaæ o czymœ innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Koszary1
SAY ~Koszary w twierdzy mieszcz¹ 10 oddzia³ów. Mozemy postawic kilka scianek dzia³owych i zmieniê funkcje pomieszczeñ tak, aby mog³y pomieœciæ 15 oddzia³ów. Koszt budowy wyniós³by 6500 sztuk z³ota.~
IF ~PartyGoldGT(6499) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Proszê, oto pieniadze.~ DO ~TakePartyGold(6500) DestroyGold(5500) incrementglobal("GoblinUpgrade","GLOBAL",1) setglobal("GoblinKoszary","GLOBAL",1)~ GOTO Zgoda
IF ~PartyGoldGT(6499) !InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Proszê, oto pieniadze.~ DO ~~ GOTO Odmowa
IF ~~ THEN REPLY ~Wróæmy innych waszych propozycji.~ GOTO Nowe
IF ~~ THEN REPLY ~Chcê porozmawiaæ o czymœ innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Zgoda
SAY ~Zabieramy siê do pracy.~
IF ~~ THEN REPLY ~Chcê porozmawiaæ o czymœ innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Doskonale. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Odmowa
SAY ~Tylko w³aœciciel twierdzy mo¿e wydaæ takie polecienie.~
IF ~~ THEN REPLY ~Chcê porozmawiaæ o czymœ innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Gada1
SAY ~Jakie masz pytania?~
IF ~~ THEN REPLY ~Kim jesteœ?~ GOTO Przedstawienie
IF ~~ THEN REPLY ~Przypomnij mi postanowienia naszego sojuszu.~ GOTO Zalety
IF ~~ THEN REPLY ~Jak uk³ada sie wam wspó³praca z mieszkañcami naszych ziem?~ GOTO Tutaj
IF ~~ THEN REPLY ~Jak ¿yliscie zanim zamieszkaliœcie tutaj?~ GOTO Tam
IF ~~ THEN REPLY ~Chcê porozmawiaæ o czymœ innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnaj.~ EXIT
END

IF ~~ THEN Przedstawienie
SAY ~Jestem jednym ze starszych In¿ynierów Klanu Zrêcznej Rêki. Strasi In¿ynierowie tworz¹ Radê Klanu, która podejmuje wszystkie wa¿ne decyzje.~
IF ~~ THEN REPLY ~Chcê zapytaæ o coœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnaj.~ EXIT
END

IF ~~ THEN Zalety
SAY ~Gobliny z naszego klanu mog¹ siê osiedlaæ na tych ziemiach. W zamian masz do dypozycji naszych in¿ynierów oraz kilka innych wyspecjalizowanych brygad. O brygadach dowiesz siê najwiêcej od cz³onków tych brygad.~
IF ~~ THEN REPLY ~Chcê zapytaæ o coœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnaj.~ EXIT
END

IF ~~ THEN Tutaj
SAY ~Z racji poczynañ wiêkszoœci osobników naszego gatunku ludzie podchodz¹ do nas sceptycznie. Czasami nawet ze strachem. Ale staramy siê pomagaæ nasz¹ wiedz¹ i umiejêtnoœciami oraz nie dajemy sie sprowokowaæ. W ten sposóp zyskaliœmy ju¿ kilku przyjació³ i myœlê, ¿e zykamy ich jeszcze wiêcej.~
IF ~~ THEN REPLY ~Chcê zapytaæ o coœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnaj.~ EXIT
END

IF ~~ THEN Tam
SAY ~Czêsto musieliœmy siê przeprowadzaæ. Nie jesteœmy walecznym klanem, wiêc z naszych domów wypiera³y nas inne klany, a czasami zaœlepieni nienawiœci¹ ludzie. Trudno w takich warunkach zwiekszaæ liczebnoœæ klanu, ale przecie¿ nawet w drodze mogliœmy mysleæ. W ten sposób zgromadzilismy sporo wiedzy o urz¹dzeniach. Jesteœmy mali, wiêc ³atwo jest nam operowaæ przy skomplikowanych mechanizmach. Czasami najmowaliœmy siê do budowania machin zniszczenia dla tego czy innego niebawem-upad³ego mrocznego lorda i zarabialiœmy w ten sposób na ¿ycie. W trakcie jednej z przeprowadzek trafiliœmy na was.~
IF ~~ THEN REPLY ~Chcê zapytaæ o coœ innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnaj.~ EXIT
END