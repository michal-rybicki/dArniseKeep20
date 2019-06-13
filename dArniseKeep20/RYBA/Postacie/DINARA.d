BEGIN ~DINARA~ 2

IF ~global("CernikPozwolenie","GLOBAL",0) !InPartySlot(LastTalkedToBy,0)~ THEN BEGIN Nic
SAY ~Witaj! Je�eli z twojego powodu co� stanie si� naszemu przyw�dcy, to tobie stanie si� co� gorszego w nastepnej kolejno�ci. Mi�o ci� pozna�.~
IF ~~ THEN EXIT
END

IF ~true()~ THEN BEGIN Gadanie
SAY ~W czym mog� ci s�u�y�?~
IF ~~ THEN REPLY ~Mam kilka pyta�.~ GOTO Pytania
IF ~~ THEN REPLY ~Om�wmy rozmieszczenie oddzia�ow obronnych zamku.~ GOTO Zamek
IF ~~ THEN REPLY ~Porozmawiajmy o naszym ma�ym wi�zieniu a lochach.~ GOTO Wiezienie
IF ~global("DinaraTajemne","GLOBAL",0)~ THEN REPLY ~Chc�, aby tajmne przej�cia w zamku by�y zamykane.~ DO ~setglobal("DinaraTajemne","GLOBAL",1) SetGlobalTimer("DarniseTajemne1","GLOBAL",ONE_DAY) SetGlobalTimer("DarniseTajemne2","GLOBAL",ONE_DAY) SetGlobalTimer("DarniseTajemne3","GLOBAL",ONE_DAY)~ GOTO Tajemne1
IF ~global("DinaraTajemne","GLOBAL",1)~ THEN REPLY ~Je�eli otworz� jakie� tajemne przej�cie w zamku, chc� aby zosta�o otwarte.~ DO ~setglobal("DinaraTajemne","GLOBAL",0)~ GOTO Tajemne2
IF ~global("RatavaPosi","GLOBAL",3)~ THEN REPLY ~Mog�aby� odszuka� Sejdara? Mo�emy jeszcze potrzebowa� jego us�ug.~ DO ~setglobal("RatavaPosi","GLOBAL",0) setglobal("RatavaExist","GLOBAL",0)~ GOTO RatavaGada
IF ~global("GarlanPosi","GLOBAL",3)~ THEN REPLY ~Mog�aby� odszuka� Garlana? Mo�emy jeszcze potrzebowa� tego starego maga.~ GOTO GarlanGada
IF ~global("NimonPosi","GLOBAL",3)~ THEN REPLY ~Mog�aby� odszuka� Nimona? My�l�, �e lepiej mu bedzie u nas.~ DO ~setglobal("NimonPosi","GLOBAL",1) setglobal("Nimon1Exist","GLOBAL",1)~ GOTO Nimon1Gada
IF ~~ THEN REPLY ~Obecnie niczego nie potrzebuj�.~ EXIT
END

IF ~~ THEN BEGIN Tajemne1
SAY ~Tak jest. Raz dziennie b�d� wysy�a�a gwardzist�, kt�ry pozamyka otwarte przej�cia.~
IF ~~ THEN REPLY ~Chc� prosi� o co� jeszcze.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~  EXIT
END

IF ~~ THEN BEGIN Tajemne2
SAY ~Tak jest. Poinstruuj� gwardzist�w.~
IF ~~ THEN REPLY ~Chc� prosi� o co� jeszcze.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN RatavaGada
SAY ~Oczywi�cie. Posiada wa�ne informacje o zamku, wi�c obserwowa�am go. Nied�ugo zjawi si� w ku�ni.~
IF ~~ THEN REPLY ~Chc� prosi� o co� jeszcze.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN GarlanGada
SAY ~Niestety. Pr�bowa�am go �ledzi�, ale jego magiczne sposoby podr�owania uniemo�liwi�y mi to.~
IF ~~ THEN REPLY ~Szkoda. Chc� prosi� o co� jeszcze.~ GOTO Gadanie
IF ~~ THEN REPLY ~Niedobrze. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Nimon1Gada
SAY ~Oczywi�cie. Posiada wa�ne informacje o zamku, wi�c obserwowa�am go. B�dzie w swojej komnacie przed zmrokiem.~
IF ~~ THEN REPLY ~Szkoda. Chc� prosi� o co� jeszcze.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~  EXIT
END

IF ~~ THEN BEGIN Pytania
SAY ~Co chesz wiedzie�?~
IF ~~ THEN REPLY ~Czym si� zajmujesz?~ GOTO Przedstawienie
IF ~InPartySlot(LastTalkedToBy,0) GlobalLT("kprevolt","GLOBAL",0)~ THEN REPLY ~Jak postrzegaj� mnie mieszka�cy naszych ziem?~ GOTO Nowy1
IF ~InPartySlot(LastTalkedToBy,0) GlobalGT("kprevolt","GLOBAL",-1) GlobalLT("kprevolt","GLOBAL",6)~ THEN REPLY ~Jak postrzegaj� mnie mieszka�cy naszych ziem?~ GOTO Nowy2
IF ~InPartySlot(LastTalkedToBy,0) GlobalGT("kprevolt","GLOBAL",5)~ THEN REPLY ~Jak postrzegaj� mnie mieszka�cy naszych ziem?~ GOTO Nowy3
IF ~Global("GoblinSojusz","GLOBAL",1)~ THEN REPLY ~Jak nasi ludzie dogaduj� si� z Goblinami?~ GOTO Gobliny
IF ~~ THEN REPLY ~Chc� prosi� o co� innego.~ GOTO Gadanie
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Przedstawienie
SAY ~Poluj� na przest�pc�w. Nadzoruj� nasze wi�zienie w lochach. Wysy�am zwiadowc�w na tereny wroga. Organizuj� patrole po zamku i w bezpo�rednim jego otoczeniu. Rozmieszczam oddzia�y obronne zamku. Mam oko na naszych pracownik�w. Gdyby kt�ry� ci uciek� albo zosta� zwolniony przez przypadek to daj zna�, wy�l� kogo� �eby go odnalaz�.~
IF ~~ THEN REPLY ~Mam inne pytanie.~ GOTO Pytania
IF ~~ THEN REPLY ~Chc� prosi� o co� innego.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Nowy1
SAY ~Wszystko w porz�dku, <PRO_LADYLORD>. Zar�wno lud, jak i stra� lubi� ci�. Podobnie jak uwielbiali Lorda d'Arnise. Oby nic tego nie zmieni�o.~
IF ~~ THEN REPLY ~Mam inne pytanie.~ GOTO Pytania
IF ~~ THEN REPLY ~Chc� prosi� o co� innego.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Nowy2
SAY ~Ludzie si� wahaj�, <PRO_LADYLORD>... Mo�e nale�y bra� przyk�ad z Lorda d'Arnise - ludzie nie znios� tyranii.~
IF ~~ THEN REPLY ~Mam inne pytanie.~ GOTO Pytania
IF ~~ THEN REPLY ~Chc� prosi� o co� innego.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Nowy3
SAY ~Ludzie si� skar��, <PRO_LADYLORD>. Uwa�aj�, �e nie nadajesz si� na nast�pc� Lorda d'Arnise. Je�li nadal b�dziesz tak dzia�a�, mog� odm�wi� ci pos�usze�stwa.~
IF ~~ THEN REPLY ~Mam inne pytanie.~ GOTO Pytania
IF ~~ THEN REPLY ~Chc� prosi� o co� innego.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Gobliny
SAY ~Kiedy Gobliny zamieszka�y w�r�d nas, ludzie byli wzburzeni. Wynika�o to z uprzedze� w stosunku do Goblin�w. Teraz zaprzyja�niaj� si�. Gobliny pomagaj� usprawni� podstawowe maszyny naszych rolnik�w. W zamian dostaj� jedzenie.~
IF ~~ THEN REPLY ~Mam inne pytanie.~ GOTO Pytania
IF ~~ THEN REPLY ~Chc� prosi� o co� innego.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Zamek
SAY ~Oczywi�cie. Oto plan zamku. Zaznaczy�am strategiczne punkty, w kt�rych mo�emy ustawi� oddzia�y.~
IF ~global("DinaraArmia","GLOBAL",0) !GlobalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wy�lij oddzia� gwardzist�w do palisady i przeka� ich bezpo�rednio pod moje rozkazy.~ DO ~setglobal("DinaraArmia","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Armia1
IF ~global("DinaraArmia","GLOBAL",1)~ THEN REPLY ~Wycofaj oddzia� operuj�cy z palisady.~ DO ~setglobal("DinaraArmia","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Armia1
IF ~global("DinaraMost","GLOBAL",0) !GlobalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wy�lij oddzia� do obrony podej�cia do mostu zwodzonego.~ DO ~setglobal("DinaraMost","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Armia1
IF ~global("DinaraMost","GLOBAL",1)~ THEN REPLY ~Wycofaj oddzia� broni�cy podej�cia do mostu.~ DO ~setglobal("DinaraMost","GLOBAL",0) SetGlobal("DinaraMostTu","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Armia1
IF ~global("DinaraPlac","GLOBAL",0) !GlobalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Ustaw oddzia� na dziedzi�cu, tu� za bram�.~ DO ~setglobal("DinaraPlac","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Armia1
IF ~global("DinaraPlac","GLOBAL",1)~ THEN REPLY ~Wycofaj oddzia� z dziedzi�ca.~ DO ~setglobal("DinaraPlac","GLOBAL",0) setglobal("DinaraPlacTu","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Armia1
IF ~global("DinaraKatapultS","GLOBAL",0) !GlobalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wy�lij oddzia� do obs�ugi katapult na zachodniej wie�y.~ DO ~setglobal("DinaraKatapultS","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Armia1
IF ~global("DinaraKatapultS","GLOBAL",1)~ THEN REPLY ~Odwo�aj oddzia� obs�ugujacy katapulty na zachodniej wie�y.~ DO ~setglobal("DinaraKatapultS","GLOBAL",0) setglobal("KatapultySON","GLOBAL",0) setglobal("DinaraKatapultSTu","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Armia1
IF ~global("DinaraKatapultN","GLOBAL",0) !GlobalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wy�lij oddzia� do obs�ugi katapult na wschodniej wie�y.~ DO ~setglobal("DinaraKatapultN","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Armia1
IF ~global("DinaraKatapultN","GLOBAL",1)~ THEN REPLY ~Odwo�aj oddzia� obs�ugujacy katapulty na wschodniej wie�y.~ DO ~setglobal("DinaraKatapultN","GLOBAL",0) setglobal("KatapultyNON","GLOBAL",0) setglobal("DinaraKatapultNTu","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Armia1
IF ~~ THEN REPLY ~Chc� prosi� o co� innego.~ GOTO Gadanie
IF ~~ THEN REPLY ~To ju� wszystko. �egnaj.~  EXIT
END

IF ~~ THEN BEGIN Armia
SAY ~Tak jest.~
IF ~~ THEN REPLY ~Chc� prosi� o co� jeszcze.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia1
SAY ~Tak jest. Czy chcesz przesun�c jeszcze jaki� oddzia�?~
IF ~~ THEN REPLY ~Tak.~ GOTO Zamek
IF ~~ THEN REPLY ~Nie. Chc� prosi� o co� innego.~ GOTO Gadanie
IF ~~ THEN REPLY ~Tak jest dobrze. �egnaj.~ EXIT
END


IF ~~ THEN BEGIN Wiezienie
SAY ~Oczywi�cie. Co chcesz wiedzie�?~
IF ~~ THEN REPLY ~Jak cz�sto gwardzi�ci sprawdzaj� czy cele s� zamkni�te?~ GOTO Cele
IF ~global("NimonPosi","GLOBAL",0)~ THEN REPLY ~Jacy� ciekawi wi�niowie pojawili sie ostatnio w lochach?~ GOTO NimonGada
IF ~!global("NimonPosi","GLOBAL",0)~ THEN REPLY ~Jacy� ciekawi wi�niowie pojawili sie ostatnio w lochach?~ GOTO Nie
IF ~OR(2) global("JeniecExist","GLOBAL",1) Global("RoenallJeniec","GLOBAL",1)~ THEN REPLY ~Co s�dzisz o tym Roenallu w celi?~ DO ~SG("JeniecWiem",1)~ GOTO Jeniec
IF ~!PartyHasItem("key10")~ THEN REPLY ~Poprosz� klucz do cel w lochach.~ DO ~GiveItemCreate("key10",LastTalkedToBy,1,1,1)~ GOTO Klucz
IF ~~ THEN REPLY ~Chc� prosi� o co� innego.~ GOTO Gadanie
IF ~~ THEN REPLY ~Ju� niewa�ne. �egnaj.~  EXIT
END

IF ~~ THEN BEGIN Cele
SAY ~Raz dziennie. Dla pewno�ci zamykaj� wszystkie cele i blokuj� wszystkie zamki.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszego wi�zienia.~ GOTO Wiezienie
IF ~~ THEN REPLY ~Chc� zapyta� o co� innego.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~  EXIT
END

IF ~~ THEN BEGIN Nie
SAY ~Obecnie nie przetrzymujemy nikogo o kim warto informowa�.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszego wi�zienia.~ GOTO Wiezienie
IF ~~ THEN REPLY ~Chc� zapyta� o co� innego.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~  EXIT
END

IF ~~ THEN BEGIN Klucz
SAY ~Prosz�, oto klucz.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszego wi�zienia.~ GOTO Wiezienie
IF ~~ THEN REPLY ~Chc� prosi� o co� jeszcze.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dziekuj�. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN NimonGada
SAY ~Jeden z Yuan-Ti podda� si� kiedy zajmowali�my zamek. Kapitan kaza� go zamkn��. Chocia� ja uwa�am, �e w�� znalaz� si� tylko w z�ym miejscu o niew�a�ciwej porze. Mo�e p�jdziesz i z nim pogadasz?~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszego wi�zienia.~ GOTO Wiezienie
IF ~~ THEN REPLY ~Chc� prosi� o co� jeszcze.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Jeniec
SAY ~Roenallowie nie zap�ac� za niego z�amanej sztuki z�ota, sprawdzi�am. My�l� jednak, �e mo�e mie� informacje, kt�re odda w zamian za wolno��.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszego wi�zienia.~ GOTO Wiezienie
IF ~~ THEN REPLY ~Chc� prosi� o co� jeszcze.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. �egnaj.~ EXIT
END