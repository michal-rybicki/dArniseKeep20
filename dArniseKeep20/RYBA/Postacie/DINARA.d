BEGIN ~DINARA~ 2

IF ~global("CernikPozwolenie","GLOBAL",0) !InPartySlot(LastTalkedToBy,0)~ THEN BEGIN Nic
SAY ~Witaj! Je¿eli z twojego powodu coœ stanie siê naszemu przywódcy, to tobie stanie siê coœ gorszego w nastepnej kolejnoœci. Mi³o ciê poznaæ.~
IF ~~ THEN EXIT
END

IF ~true()~ THEN BEGIN Gadanie
SAY ~W czym mogê ci s³u¿yæ?~
IF ~~ THEN REPLY ~Mam kilka pytañ.~ GOTO Pytania
IF ~~ THEN REPLY ~Omówmy rozmieszczenie oddzia³ow obronnych zamku.~ GOTO Zamek
IF ~~ THEN REPLY ~Porozmawiajmy o naszym ma³ym wiêzieniu a lochach.~ GOTO Wiezienie
IF ~global("DinaraTajemne","GLOBAL",0)~ THEN REPLY ~Chcê, aby tajmne przejœcia w zamku by³y zamykane.~ DO ~setglobal("DinaraTajemne","GLOBAL",1) SetGlobalTimer("DarniseTajemne1","GLOBAL",ONE_DAY) SetGlobalTimer("DarniseTajemne2","GLOBAL",ONE_DAY) SetGlobalTimer("DarniseTajemne3","GLOBAL",ONE_DAY)~ GOTO Tajemne1
IF ~global("DinaraTajemne","GLOBAL",1)~ THEN REPLY ~Je¿eli otworzê jakieœ tajemne przejœcie w zamku, chcê aby zosta³o otwarte.~ DO ~setglobal("DinaraTajemne","GLOBAL",0)~ GOTO Tajemne2
IF ~global("RatavaPosi","GLOBAL",3)~ THEN REPLY ~Mog³abyœ odszukaæ Sejdara? Mo¿emy jeszcze potrzebowaæ jego us³ug.~ DO ~setglobal("RatavaPosi","GLOBAL",0) setglobal("RatavaExist","GLOBAL",0)~ GOTO RatavaGada
IF ~global("GarlanPosi","GLOBAL",3)~ THEN REPLY ~Mog³abyœ odszukaæ Garlana? Mo¿emy jeszcze potrzebowaæ tego starego maga.~ GOTO GarlanGada
IF ~global("NimonPosi","GLOBAL",3)~ THEN REPLY ~Mog³abyœ odszukaæ Nimona? Myœlê, ¿e lepiej mu bedzie u nas.~ DO ~setglobal("NimonPosi","GLOBAL",1) setglobal("Nimon1Exist","GLOBAL",1)~ GOTO Nimon1Gada
IF ~~ THEN REPLY ~Obecnie niczego nie potrzebujê.~ EXIT
END

IF ~~ THEN BEGIN Tajemne1
SAY ~Tak jest. Raz dziennie bêdê wysy³a³a gwardzistê, który pozamyka otwarte przejœcia.~
IF ~~ THEN REPLY ~Chcê prosiæ o coœ jeszcze.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~  EXIT
END

IF ~~ THEN BEGIN Tajemne2
SAY ~Tak jest. Poinstruujê gwardzistów.~
IF ~~ THEN REPLY ~Chcê prosiæ o coœ jeszcze.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN RatavaGada
SAY ~Oczywiœcie. Posiada wa¿ne informacje o zamku, wiêc obserwowa³am go. Nied³ugo zjawi siê w kuŸni.~
IF ~~ THEN REPLY ~Chcê prosiæ o coœ jeszcze.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN GarlanGada
SAY ~Niestety. Próbowa³am go œledziæ, ale jego magiczne sposoby podró¿owania uniemo¿liwi³y mi to.~
IF ~~ THEN REPLY ~Szkoda. Chcê prosiæ o coœ jeszcze.~ GOTO Gadanie
IF ~~ THEN REPLY ~Niedobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Nimon1Gada
SAY ~Oczywiœcie. Posiada wa¿ne informacje o zamku, wiêc obserwowa³am go. Bêdzie w swojej komnacie przed zmrokiem.~
IF ~~ THEN REPLY ~Szkoda. Chcê prosiæ o coœ jeszcze.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~  EXIT
END

IF ~~ THEN BEGIN Pytania
SAY ~Co chesz wiedzieæ?~
IF ~~ THEN REPLY ~Czym siê zajmujesz?~ GOTO Przedstawienie
IF ~InPartySlot(LastTalkedToBy,0) GlobalLT("kprevolt","GLOBAL",0)~ THEN REPLY ~Jak postrzegaj¹ mnie mieszkañcy naszych ziem?~ GOTO Nowy1
IF ~InPartySlot(LastTalkedToBy,0) GlobalGT("kprevolt","GLOBAL",-1) GlobalLT("kprevolt","GLOBAL",6)~ THEN REPLY ~Jak postrzegaj¹ mnie mieszkañcy naszych ziem?~ GOTO Nowy2
IF ~InPartySlot(LastTalkedToBy,0) GlobalGT("kprevolt","GLOBAL",5)~ THEN REPLY ~Jak postrzegaj¹ mnie mieszkañcy naszych ziem?~ GOTO Nowy3
IF ~Global("GoblinSojusz","GLOBAL",1)~ THEN REPLY ~Jak nasi ludzie dogaduj¹ siê z Goblinami?~ GOTO Gobliny
IF ~~ THEN REPLY ~Chcê prosiæ o coœ innego.~ GOTO Gadanie
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Przedstawienie
SAY ~Polujê na przestêpców. Nadzorujê nasze wiêzienie w lochach. Wysy³am zwiadowców na tereny wroga. Organizujê patrole po zamku i w bezpoœrednim jego otoczeniu. Rozmieszczam oddzia³y obronne zamku. Mam oko na naszych pracowników. Gdyby któryœ ci uciek³ albo zosta³ zwolniony przez przypadek to daj znaæ, wyœlê kogoœ ¿eby go odnalaz³.~
IF ~~ THEN REPLY ~Mam inne pytanie.~ GOTO Pytania
IF ~~ THEN REPLY ~Chcê prosiæ o coœ innego.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Nowy1
SAY ~Wszystko w porz¹dku, <PRO_LADYLORD>. Zarówno lud, jak i stra¿ lubi¹ ciê. Podobnie jak uwielbiali Lorda d'Arnise. Oby nic tego nie zmieni³o.~
IF ~~ THEN REPLY ~Mam inne pytanie.~ GOTO Pytania
IF ~~ THEN REPLY ~Chcê prosiæ o coœ innego.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Nowy2
SAY ~Ludzie siê wahaj¹, <PRO_LADYLORD>... Mo¿e nale¿y braæ przyk³ad z Lorda d'Arnise - ludzie nie znios¹ tyranii.~
IF ~~ THEN REPLY ~Mam inne pytanie.~ GOTO Pytania
IF ~~ THEN REPLY ~Chcê prosiæ o coœ innego.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Nowy3
SAY ~Ludzie siê skar¿¹, <PRO_LADYLORD>. Uwa¿aj¹, ¿e nie nadajesz siê na nastêpcê Lorda d'Arnise. Jeœli nadal bêdziesz tak dzia³aæ, mog¹ odmówiæ ci pos³uszeñstwa.~
IF ~~ THEN REPLY ~Mam inne pytanie.~ GOTO Pytania
IF ~~ THEN REPLY ~Chcê prosiæ o coœ innego.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Gobliny
SAY ~Kiedy Gobliny zamieszka³y wœród nas, ludzie byli wzburzeni. Wynika³o to z uprzedzeñ w stosunku do Goblinów. Teraz zaprzyjaŸniaj¹ siê. Gobliny pomagaj¹ usprawniæ podstawowe maszyny naszych rolników. W zamian dostaj¹ jedzenie.~
IF ~~ THEN REPLY ~Mam inne pytanie.~ GOTO Pytania
IF ~~ THEN REPLY ~Chcê prosiæ o coœ innego.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Zamek
SAY ~Oczywiœcie. Oto plan zamku. Zaznaczy³am strategiczne punkty, w których mo¿emy ustawiæ oddzia³y.~
IF ~global("DinaraArmia","GLOBAL",0) !GlobalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wyœlij oddzia³ gwardzistów do palisady i przeka¿ ich bezpoœrednio pod moje rozkazy.~ DO ~setglobal("DinaraArmia","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Armia1
IF ~global("DinaraArmia","GLOBAL",1)~ THEN REPLY ~Wycofaj oddzia³ operuj¹cy z palisady.~ DO ~setglobal("DinaraArmia","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Armia1
IF ~global("DinaraMost","GLOBAL",0) !GlobalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wyœlij oddzia³ do obrony podejœcia do mostu zwodzonego.~ DO ~setglobal("DinaraMost","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Armia1
IF ~global("DinaraMost","GLOBAL",1)~ THEN REPLY ~Wycofaj oddzia³ broni¹cy podejœcia do mostu.~ DO ~setglobal("DinaraMost","GLOBAL",0) SetGlobal("DinaraMostTu","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Armia1
IF ~global("DinaraPlac","GLOBAL",0) !GlobalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Ustaw oddzia³ na dziedziñcu, tu¿ za bram¹.~ DO ~setglobal("DinaraPlac","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Armia1
IF ~global("DinaraPlac","GLOBAL",1)~ THEN REPLY ~Wycofaj oddzia³ z dziedziñca.~ DO ~setglobal("DinaraPlac","GLOBAL",0) setglobal("DinaraPlacTu","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Armia1
IF ~global("DinaraKatapultS","GLOBAL",0) !GlobalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wyœlij oddzia³ do obs³ugi katapult na zachodniej wie¿y.~ DO ~setglobal("DinaraKatapultS","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Armia1
IF ~global("DinaraKatapultS","GLOBAL",1)~ THEN REPLY ~Odwo³aj oddzia³ obs³ugujacy katapulty na zachodniej wie¿y.~ DO ~setglobal("DinaraKatapultS","GLOBAL",0) setglobal("KatapultySON","GLOBAL",0) setglobal("DinaraKatapultSTu","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Armia1
IF ~global("DinaraKatapultN","GLOBAL",0) !GlobalLT("DarniseRezerwy","GLOBAL",1)~ THEN REPLY ~Wyœlij oddzia³ do obs³ugi katapult na wschodniej wie¿y.~ DO ~setglobal("DinaraKatapultN","GLOBAL",1) incrementglobal("DarniseRezerwy","GLOBAL",-1)~ GOTO Armia1
IF ~global("DinaraKatapultN","GLOBAL",1)~ THEN REPLY ~Odwo³aj oddzia³ obs³ugujacy katapulty na wschodniej wie¿y.~ DO ~setglobal("DinaraKatapultN","GLOBAL",0) setglobal("KatapultyNON","GLOBAL",0) setglobal("DinaraKatapultNTu","GLOBAL",0) incrementglobal("DarniseRezerwy","GLOBAL",1)~ GOTO Armia1
IF ~~ THEN REPLY ~Chcê prosiæ o coœ innego.~ GOTO Gadanie
IF ~~ THEN REPLY ~To ju¿ wszystko. ¯egnaj.~  EXIT
END

IF ~~ THEN BEGIN Armia
SAY ~Tak jest.~
IF ~~ THEN REPLY ~Chcê prosiæ o coœ jeszcze.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Armia1
SAY ~Tak jest. Czy chcesz przesun¹c jeszcze jakiœ oddzia³?~
IF ~~ THEN REPLY ~Tak.~ GOTO Zamek
IF ~~ THEN REPLY ~Nie. Chcê prosiæ o coœ innego.~ GOTO Gadanie
IF ~~ THEN REPLY ~Tak jest dobrze. ¯egnaj.~ EXIT
END


IF ~~ THEN BEGIN Wiezienie
SAY ~Oczywiœcie. Co chcesz wiedzieæ?~
IF ~~ THEN REPLY ~Jak czêsto gwardziœci sprawdzaj¹ czy cele s¹ zamkniête?~ GOTO Cele
IF ~global("NimonPosi","GLOBAL",0)~ THEN REPLY ~Jacyœ ciekawi wiêŸniowie pojawili sie ostatnio w lochach?~ GOTO NimonGada
IF ~!global("NimonPosi","GLOBAL",0)~ THEN REPLY ~Jacyœ ciekawi wiêŸniowie pojawili sie ostatnio w lochach?~ GOTO Nie
IF ~OR(2) global("JeniecExist","GLOBAL",1) Global("RoenallJeniec","GLOBAL",1)~ THEN REPLY ~Co s¹dzisz o tym Roenallu w celi?~ DO ~SG("JeniecWiem",1)~ GOTO Jeniec
IF ~!PartyHasItem("key10")~ THEN REPLY ~Poproszê klucz do cel w lochach.~ DO ~GiveItemCreate("key10",LastTalkedToBy,1,1,1)~ GOTO Klucz
IF ~~ THEN REPLY ~Chcê prosiæ o coœ innego.~ GOTO Gadanie
IF ~~ THEN REPLY ~Ju¿ niewa¿ne. ¯egnaj.~  EXIT
END

IF ~~ THEN BEGIN Cele
SAY ~Raz dziennie. Dla pewnoœci zamykaj¹ wszystkie cele i blokuj¹ wszystkie zamki.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszego wiêzienia.~ GOTO Wiezienie
IF ~~ THEN REPLY ~Chcê zapytaæ o coœ innego.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~  EXIT
END

IF ~~ THEN BEGIN Nie
SAY ~Obecnie nie przetrzymujemy nikogo o kim warto informowaæ.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszego wiêzienia.~ GOTO Wiezienie
IF ~~ THEN REPLY ~Chcê zapytaæ o coœ innego.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~  EXIT
END

IF ~~ THEN BEGIN Klucz
SAY ~Proszê, oto klucz.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszego wiêzienia.~ GOTO Wiezienie
IF ~~ THEN REPLY ~Chcê prosiæ o coœ jeszcze.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dziekujê. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN NimonGada
SAY ~Jeden z Yuan-Ti podda³ siê kiedy zajmowaliœmy zamek. Kapitan kaza³ go zamkn¹æ. Chocia¿ ja uwa¿am, ¿e w¹¿ znalaz³ siê tylko w z³ym miejscu o niew³aœciwej porze. Mo¿e pójdziesz i z nim pogadasz?~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszego wiêzienia.~ GOTO Wiezienie
IF ~~ THEN REPLY ~Chcê prosiæ o coœ jeszcze.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Jeniec
SAY ~Roenallowie nie zap³ac¹ za niego z³amanej sztuki z³ota, sprawdzi³am. Myœlê jednak, ¿e mo¿e mieæ informacje, które odda w zamian za wolnoœæ.~
IF ~~ THEN REPLY ~Mam inne pytania na temat naszego wiêzienia.~ GOTO Wiezienie
IF ~~ THEN REPLY ~Chcê prosiæ o coœ jeszcze.~ GOTO Gadanie
IF ~~ THEN REPLY ~Dobrze. ¯egnaj.~ EXIT
END