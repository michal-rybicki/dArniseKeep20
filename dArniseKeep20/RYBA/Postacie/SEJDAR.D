BEGIN ~Sejdar~ 2

IF ~True()~ THEN BEGIN 0 
  SAY ~W czym ku�nia rodu d'Arnise moze ci pom�c?~ 
  IF ~~ THEN REPLY ~Mam kilka pyta�.~ GOTO Pytania
  IF ~global("GoblinKuznia","GLOBAL",0)~ THEN REPLY ~Interesuj� mnie przedmioty wytwarzane w tej ku�ni.~ GOTO 2
  IF ~global("GoblinKuznia","GLOBAL",1)~ THEN REPLY ~Interesuj� mnie przedmioty wytwarzane w tej ku�ni.~ GOTO 4
  IF ~~ THEN REPLY ~Poszukuj� magicznych zw�j�w Garlana.~ GOTO 3
  IF ~~ THEN REPLY ~R�d D'Arnise nie potrzebuje ju� twoch us�ug.~ GOTO 15
  IF ~~ THEN REPLY ~Na razie niczego nie potrzebuj�.~ GOTO 1
END

IF ~~ THEN BEGIN 1 
  SAY ~Bardzo dobrze, <GABBER>. Wr�� gdy co� b�dzie ci potrzebne.~ 
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 2 
  SAY ~To w�a�nie chcia�em us�ysze�. Jak �atwo zauwa�y� mam szeroki wyb�r towar�w.~
  IF ~~ THEN DO ~StartStore("Kuznia01",LastTalkedToBy(Myself))
~ EXIT
END

IF ~~ THEN BEGIN 4 
  SAY ~To w�a�nie chcia�em us�ysze�. Jak �atwo zauwa�y� mam szeroki wyb�r towar�w. Po ulepszeniu ku�ni uda�o nam si� obni�y� koszty produkcji.~
  IF ~~ THEN DO ~StartStore("Kuznia04",LastTalkedToBy(Myself))
~ EXIT
END


IF ~~ THEN BEGIN 3 
  SAY ~To w�a�nie chcia�em us�ysze�. Garlan b�dzie zachwycony.~
  IF ~~ THEN DO ~StartStore("Kuznia02",LastTalkedToBy(Myself))
~ EXIT
END

IF ~~ THEN BEGIN 15
  SAY ~�egnaj.~ 
  IF ~~ THEN DO ~EscapeArea() setglobal("RatavaPosi","GLOBAL",3)~
EXIT
END

IF ~~ THEN BEGIN 16
  SAY ~W�adasz zamkiem i posiadasz ku�ni�, ale nie jej pracownik�w, a oni wymagaj� wynagrodzenia za swoj� prac�. Poza tym musimy nabywa� surowce i czasami odp�aca� co� ekstra magom za dodatkowe umagicznienie przedmiotu.~ 
IF ~~ THEN REPLY ~Mam inne pytanie.~ GOTO Pytania
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO 0
IF ~~ THEN REPLY ~Rozumiem. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN 17
  SAY ~Znaczna cz�� produkcji jest przeznaczana na odbudow� armii zamku, ale mog� zorganizowa� nadwy�k� na sprzeda�. Musz� przyzna�, �e to kusz�cy pomys�. Czemu pytasz?~
  IF ~~ THEN REPLY ~Czy wiesz gdzie mogliby�my za�o�y� sklep?~ GOTO 18
  IF ~~ THEN REPLY ~Mam inne pytanie.~ GOTO Pytania
  IF ~~ THEN REPLY ~Z ciekawo�ci. Porozmawiajmy o czym� innym.~ GOTO 0
  IF ~~ THEN REPLY ~Z ciekawo�ci. Musz� juz i��.~ EXIT
END


IF ~~ THEN BEGIN 18
  SAY ~Niech pomy�l�... Mog� porozmawia� z Ribaldem. On mnie lubi i my�l�, �e si� zgodzi na dodatkowego sprzedawc� na Targu Przyg�d w Atkathli. Ale b�d� potrzebowa� 1500 sztuk z�ota na rozkr�cenie interesu, a ty musisz znale�� sprzedawc�. Co ty na to?~
  IF ~PartyGoldGT(1499)~ THEN REPLY ~Zrobimy tak. Dogadaj sie z Ribaldem, a ja przy�l� ci sprzedawc�.~ DO ~TakePartyGold(1500) AddexperienceParty(5000) DestroyGold(1500) setglobal("KuzniaHandel","GLOBAL",1)~ GOTO 19
  IF ~~ THEN REPLY ~Mam inne pytanie.~ GOTO Pytania
  IF ~~ THEN REPLY ~Pomy�l� nad tym. Porozmawiajmy o czym� innym.~ GOTO 0
  IF ~~ THEN REPLY ~Pomy�l� nad tym. Na razie musze juz i��.~ EXIT
END

IF ~~ THEN BEGIN 19
   SAY ~Ta warowania ma niewyczerpane zapasy pos�a�c�w, ju� wysy�am jednego do Ribalda.~
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Pytania
SAY ~Oczywi�cie. Co chcesz wiedzie�?~
IF ~global("NimonPosi","GLOBAL",1) global("KuzniaHandel","GLOBAL",0)~ THEN REPLY ~Czy wytwarzasz na tyle du�o przedmiot�w aby�my mogli je sprzedawa�?~ GOTO 17
IF ~~ THEN REPLY ~Co to za miejsce?~ GOTO Kuznia
IF ~~ THEN REPLY ~Czemu musz� p�aci� za przedmioty z w�asnej ku�ni?~ GOTO 16
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO 0
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnaj.~ EXIT
END

IF ~~ THEN BEGIN Kuznia
SAY ~To ku�nia rodu d'Arnise. Wytwarzam tu uzbrojenie i zbroje dla twojej gwardii i dla ciebie. W tej ku�ni powsta�o wiele s�awnych broni. Mia�em zaszczyt przej�� j� niedawno. Jestem przyjacielem Arkanda. Poprzedni kowal zgin�� w ataku Troli. Sprzedaj� tu te� zwoje produkowane przez Garlana, on nie ma ju� g�owy do handlu.~
IF ~~ THEN REPLY ~Mam inne pytanie.~ GOTO Pytania
IF ~~ THEN REPLY ~Porozmawiajmy o czym� innym.~ GOTO 0
IF ~~ THEN REPLY ~Wiem ju� wszystko. �egnaj.~ EXIT
END