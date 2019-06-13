BEGIN ~GOBLINS~ 2

IF ~true()~ THEN BEGIN Gada
SAY ~Pozdrowienie. Przyjemnie �yje si� tu w tej twojej twierdzy.~
IF ~~ THEN REPLY ~Mam kilka pyta�.~ GOTO Gada1
IF ~~ THEN REPLY ~Co do tej pory stworzyli�cie na tych ziemiach?~ GOTO Raporty
IF ~~ THEN REPLY ~Macie jakie� pomys�y na zbudowanie tu czego�?~ GOTO Nowe
IF ~~ THEN REPLY ~Ciesz� sie. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Gada2
SAY ~Oczywi�cie. Co chcesz om�wi�?~
IF ~~ THEN REPLY ~Mam kilka pyta�.~ GOTO Gada1
IF ~~ THEN REPLY ~Co do tej pory stworzyli�cie na tych ziemiach?~ GOTO Raporty
IF ~!globalGT("GoblinUpgrade","GLOBAL",3)~ THEN REPLY ~Macie jakie� pomys�y na zbudowanie tu czego� nowego?~ GOTO Nowe
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Raporty
SAY ~Oto raporty z doko�czonych lub ci�g�ych projekt�w. Szczeg�y, kt�rego projektu chcesz zozbaczy�?~
IF ~global("GoblinBunkry","GLOBAL",1)~ THEN REPLY ~Schrony w gospodarstwach.~ GOTO Schrony2
IF ~global("GoblinDrogi","GLOBAL",1)~ THEN REPLY ~Modernizacja dr�g.~ GOTO Drogi2
IF ~global("GoblinKuznia","GLOBAL",1)~ THEN REPLY ~Modernizacja ku�ni.~ GOTO Kuznia2
IF ~global("GoblinKoszary ","GLOBAL",1)~ THEN REPLY ~Przebudowa koszar.~ GOTO Koszary2
IF ~~ THEN REPLY ~Brygady robocze.~ GOTO Brygady
IF ~~ THEN REPLY ~Chc� porozmawia� o czym� innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Brygady
SAY ~Brygada in�ynieryjna, transportowa i magazynowa melduj� pe�n� gotowo��. O przydziale poszczeg�lnych brygad rozmawiaj z ich cz�onkami.~
IF ~~ THEN REPLY ~Wr��my do raport�w o uko�czonych projektach.~ GOTO Raporty
IF ~~ THEN REPLY ~Chc� porozmawia� o czym� innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Schrony2
SAY ~Wszystkie gospodarstwa zosta�y zabezpieczone. W razie niespodziewanego ataku nasi mieszka�cy maj� si� gdzie schowa�.~
IF ~~ THEN REPLY ~Wr��my do raport�w o uko�czonych projektach.~ GOTO Raporty
IF ~~ THEN REPLY ~Chc� porozmawia� o czym� innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Drogi2
SAY ~Drogi zosta�y utwardzone i poszerzone. Transport odbywa si� teraz p�ynniej, a patrole okolicy s� �atwiejsze.~
IF ~~ THEN REPLY ~Wr��my do raport�w o uko�czonych projektach.~ GOTO Raporty
IF ~~ THEN REPLY ~Chc� porozmawia� o czym� innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Kuznia2
SAY ~Ku�nia jest teraz wydajniejsza i zmniejszone zosta�o zu�ycie materia�u. Obs�uga ku�ni melduje, �e jest zadowolona z usprawnie�.~
IF ~~ THEN REPLY ~Wr��my do raport�w o uko�czonych projektach.~ GOTO Raporty
IF ~~ THEN REPLY ~Chc� porozmawia� o czym� innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Koszary2
SAY ~Po przebudowie koszary mieszcz� 15 oddzia��w.~
IF ~~ THEN REPLY ~Wr��my do raport�w o uko�czonych projektach.~ GOTO Raporty
IF ~~ THEN REPLY ~Chc� porozmawia� o czym� innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Nowe
SAY ~Mamy ju� kilka pomys��w, ale ca�y czas rozeznajemy teren w poszukiwaniu nowych. Prosz� oto nasze projekty. O kt�rym chcesz porozmawia�?~
IF ~global("GoblinBunkry","GLOBAL",0)~ THEN REPLY ~Schrony w gospodarstwach.~ GOTO Schrony1
IF ~global("GoblinDrogi","GLOBAL",0)~ THEN REPLY ~Modernizacja dr�g.~ GOTO Drogi1
IF ~global("GoblinKuznia","GLOBAL",0)~ THEN REPLY ~Modernizacja ku�ni.~ GOTO Kuznia1
IF ~global("GoblinKoszary ","GLOBAL",0)~ THEN REPLY ~Przebudowa koszar.~ GOTO Koszary1
IF ~~ THEN REPLY ~Chc� porozmawia� o czym� innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Schrony1
SAY ~Propozycja obejmuje stworzenie w ka�dym gospodarstwie miejsca, gdzie mieszka�cy mogliby w ukryciu przeczeka� przemarsz wrogich wojsk przez okolice. Szczeg�lnie przydatne, gdy nie ma czasu ostrzec mieszka�c�w. Koszt budowy wyni�s�by 18500 sztuk z�ota.~
IF ~PartyGoldGT(18499) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Prosz�, oto pieniadze.~ DO ~TakePartyGold(18500) DestroyGold(17500) incrementglobal("GoblinUpgrade","GLOBAL",1) setglobal("GoblinBunkry","GLOBAL",1)~ GOTO Zgoda
IF ~PartyGoldGT(18499) !InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Prosz�, oto pieniadze.~ DO ~~ GOTO Odmowa
IF ~~ THEN REPLY ~Wr��my innych waszych propozycji.~ GOTO Nowe
IF ~~ THEN REPLY ~Chc� porozmawia� o czym� innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Drogi1
SAY ~Wiekszo�� dr�g nale�y poszerzy� i utwardzi�. Trzeba te� doprowadzi� wygodne drogi do granic naszych teren�w. Je�eli doprowadzimy drogi do porz�dnego stanu zach�ci do handlarzy do wizyt u nas i przyspieszy oraz u�atwi poruszanie si� po okolicy. Koszt budowy wyni�s�by 24500 sztuk z�ota.~
IF ~PartyGoldGT(24499) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Prosz�, oto pieniadze.~ DO ~TakePartyGold(24500) DestroyGold(23500) incrementglobal("GoblinUpgrade","GLOBAL",1) setglobal("GoblinDrogi","GLOBAL",1)~ GOTO Zgoda
IF ~PartyGoldGT(24499) !InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Prosz�, oto pieniadze.~ DO ~~ GOTO Odmowa
IF ~~ THEN REPLY ~Wr��my innych waszych propozycji.~ GOTO Nowe
IF ~~ THEN REPLY ~Chc� porozmawia� o czym� innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Kuznia1
SAY ~Tutejsza ku�nia powsta�a wtedy, kiedy budowano zamek. Wyposa�enie jest stare. Kiedy je odnowimy wytwarzane dla ciebie przedmioty bed� ta�sze, a zyski ze sprzeda�y wi�ksze. Koszt budowy wyni�s�by 11500 sztuk z�ota.~
IF ~PartyGoldGT(11499) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Prosz�, oto pieniadze.~ DO ~TakePartyGold(11500) DestroyGold(10500) incrementglobal("GoblinUpgrade","GLOBAL",1) setglobal("GoblinKuznia","GLOBAL",1)~ GOTO Zgoda
IF ~PartyGoldGT(11499) !InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Prosz�, oto pieniadze.~ DO ~~ GOTO Odmowa
IF ~~ THEN REPLY ~Wr��my innych waszych propozycji.~ GOTO Nowe
IF ~~ THEN REPLY ~Chc� porozmawia� o czym� innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Koszary1
SAY ~Koszary w twierdzy mieszcz� 10 oddzia��w. Mozemy postawic kilka scianek dzia�owych i zmieni� funkcje pomieszcze� tak, aby mog�y pomie�ci� 15 oddzia��w. Koszt budowy wyni�s�by 6500 sztuk z�ota.~
IF ~PartyGoldGT(6499) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Prosz�, oto pieniadze.~ DO ~TakePartyGold(6500) DestroyGold(5500) incrementglobal("GoblinUpgrade","GLOBAL",1) setglobal("GoblinKoszary","GLOBAL",1)~ GOTO Zgoda
IF ~PartyGoldGT(6499) !InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Prosz�, oto pieniadze.~ DO ~~ GOTO Odmowa
IF ~~ THEN REPLY ~Wr��my innych waszych propozycji.~ GOTO Nowe
IF ~~ THEN REPLY ~Chc� porozmawia� o czym� innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Zgoda
SAY ~Zabieramy si� do pracy.~
IF ~~ THEN REPLY ~Chc� porozmawia� o czym� innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Doskonale. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Odmowa
SAY ~Tylko w�a�ciciel twierdzy mo�e wyda� takie polecienie.~
IF ~~ THEN REPLY ~Chc� porozmawia� o czym� innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Gada1
SAY ~Jakie masz pytania?~
IF ~~ THEN REPLY ~Kim jeste�?~ GOTO Przedstawienie
IF ~~ THEN REPLY ~Przypomnij mi postanowienia naszego sojuszu.~ GOTO Zalety
IF ~~ THEN REPLY ~Jak uk�ada sie wam wsp�praca z mieszka�cami naszych ziem?~ GOTO Tutaj
IF ~~ THEN REPLY ~Jak �yliscie zanim zamieszkali�cie tutaj?~ GOTO Tam
IF ~~ THEN REPLY ~Chc� porozmawia� o czym� innym.~ GOTO Gada2
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnaj.~ EXIT
END

IF ~~ THEN Przedstawienie
SAY ~Jestem jednym ze starszych In�ynier�w Klanu Zr�cznej R�ki. Strasi In�ynierowie tworz� Rad� Klanu, kt�ra podejmuje wszystkie wa�ne decyzje.~
IF ~~ THEN REPLY ~Chc� zapyta� o co� innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnaj.~ EXIT
END

IF ~~ THEN Zalety
SAY ~Gobliny z naszego klanu mog� si� osiedla� na tych ziemiach. W zamian masz do dypozycji naszych in�ynier�w oraz kilka innych wyspecjalizowanych brygad. O brygadach dowiesz si� najwi�cej od cz�onk�w tych brygad.~
IF ~~ THEN REPLY ~Chc� zapyta� o co� innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnaj.~ EXIT
END

IF ~~ THEN Tutaj
SAY ~Z racji poczyna� wi�kszo�ci osobnik�w naszego gatunku ludzie podchodz� do nas sceptycznie. Czasami nawet ze strachem. Ale staramy si� pomaga� nasz� wiedz� i umiej�tno�ciami oraz nie dajemy sie sprowokowa�. W ten spos�p zyskali�my ju� kilku przyjaci� i my�l�, �e zykamy ich jeszcze wi�cej.~
IF ~~ THEN REPLY ~Chc� zapyta� o co� innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnaj.~ EXIT
END

IF ~~ THEN Tam
SAY ~Cz�sto musieli�my si� przeprowadza�. Nie jeste�my walecznym klanem, wi�c z naszych dom�w wypiera�y nas inne klany, a czasami za�lepieni nienawi�ci� ludzie. Trudno w takich warunkach zwieksza� liczebno�� klanu, ale przecie� nawet w drodze mogli�my mysle�. W ten spos�b zgromadzilismy sporo wiedzy o urz�dzeniach. Jeste�my mali, wi�c �atwo jest nam operowa� przy skomplikowanych mechanizmach. Czasami najmowali�my si� do budowania machin zniszczenia dla tego czy innego niebawem-upad�ego mrocznego lorda i zarabiali�my w ten spos�b na �ycie. W trakcie jednej z przeprowadzek trafili�my na was.~
IF ~~ THEN REPLY ~Chc� zapyta� o co� innego.~ GOTO Gada1
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnaj.~ EXIT
END