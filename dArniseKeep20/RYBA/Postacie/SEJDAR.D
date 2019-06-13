BEGIN ~Sejdar~ 2

IF ~True()~ THEN BEGIN 0 
  SAY ~W czym kuŸnia rodu d'Arnise moze ci pomóc?~ 
  IF ~~ THEN REPLY ~Mam kilka pytañ.~ GOTO Pytania
  IF ~global("GoblinKuznia","GLOBAL",0)~ THEN REPLY ~Interesuj¹ mnie przedmioty wytwarzane w tej kuŸni.~ GOTO 2
  IF ~global("GoblinKuznia","GLOBAL",1)~ THEN REPLY ~Interesuj¹ mnie przedmioty wytwarzane w tej kuŸni.~ GOTO 4
  IF ~~ THEN REPLY ~Poszukujê magicznych zwójów Garlana.~ GOTO 3
  IF ~~ THEN REPLY ~Ród D'Arnise nie potrzebuje ju¿ twoch us³ug.~ GOTO 15
  IF ~~ THEN REPLY ~Na razie niczego nie potrzebujê.~ GOTO 1
END

IF ~~ THEN BEGIN 1 
  SAY ~Bardzo dobrze, <GABBER>. Wróæ gdy coœ bêdzie ci potrzebne.~ 
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 2 
  SAY ~To w³aœnie chcia³em us³yszeæ. Jak ³atwo zauwa¿yæ mam szeroki wybór towarów.~
  IF ~~ THEN DO ~StartStore("Kuznia01",LastTalkedToBy(Myself))
~ EXIT
END

IF ~~ THEN BEGIN 4 
  SAY ~To w³aœnie chcia³em us³yszeæ. Jak ³atwo zauwa¿yæ mam szeroki wybór towarów. Po ulepszeniu kuŸni uda³o nam siê obni¿yæ koszty produkcji.~
  IF ~~ THEN DO ~StartStore("Kuznia04",LastTalkedToBy(Myself))
~ EXIT
END


IF ~~ THEN BEGIN 3 
  SAY ~To w³aœnie chcia³em us³yszeæ. Garlan bêdzie zachwycony.~
  IF ~~ THEN DO ~StartStore("Kuznia02",LastTalkedToBy(Myself))
~ EXIT
END

IF ~~ THEN BEGIN 15
  SAY ~¯egnaj.~ 
  IF ~~ THEN DO ~EscapeArea() setglobal("RatavaPosi","GLOBAL",3)~
EXIT
END

IF ~~ THEN BEGIN 16
  SAY ~W³adasz zamkiem i posiadasz kuŸniê, ale nie jej pracowników, a oni wymagaj¹ wynagrodzenia za swoj¹ pracê. Poza tym musimy nabywaæ surowce i czasami odp³acaæ coœ ekstra magom za dodatkowe umagicznienie przedmiotu.~ 
IF ~~ THEN REPLY ~Mam inne pytanie.~ GOTO Pytania
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO 0
IF ~~ THEN REPLY ~Rozumiem. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN 17
  SAY ~Znaczna czêœæ produkcji jest przeznaczana na odbudowê armii zamku, ale mogê zorganizowaæ nadwy¿kê na sprzeda¿. Muszê przyznaæ, ¿e to kusz¹cy pomys³. Czemu pytasz?~
  IF ~~ THEN REPLY ~Czy wiesz gdzie moglibyœmy za³o¿yæ sklep?~ GOTO 18
  IF ~~ THEN REPLY ~Mam inne pytanie.~ GOTO Pytania
  IF ~~ THEN REPLY ~Z ciekawoœci. Porozmawiajmy o czymœ innym.~ GOTO 0
  IF ~~ THEN REPLY ~Z ciekawoœci. Muszê juz iœæ.~ EXIT
END


IF ~~ THEN BEGIN 18
  SAY ~Niech pomyœlê... Mogê porozmawiaæ z Ribaldem. On mnie lubi i myœlê, ¿e siê zgodzi na dodatkowego sprzedawcê na Targu Przygód w Atkathli. Ale bêdê potrzebowa³ 1500 sztuk z³ota na rozkrêcenie interesu, a ty musisz znaleŸæ sprzedawcê. Co ty na to?~
  IF ~PartyGoldGT(1499)~ THEN REPLY ~Zrobimy tak. Dogadaj sie z Ribaldem, a ja przyœlê ci sprzedawcê.~ DO ~TakePartyGold(1500) AddexperienceParty(5000) DestroyGold(1500) setglobal("KuzniaHandel","GLOBAL",1)~ GOTO 19
  IF ~~ THEN REPLY ~Mam inne pytanie.~ GOTO Pytania
  IF ~~ THEN REPLY ~Pomyœlê nad tym. Porozmawiajmy o czymœ innym.~ GOTO 0
  IF ~~ THEN REPLY ~Pomyœlê nad tym. Na razie musze juz iœæ.~ EXIT
END

IF ~~ THEN BEGIN 19
   SAY ~Ta warowania ma niewyczerpane zapasy pos³añców, ju¿ wysy³am jednego do Ribalda.~
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Pytania
SAY ~Oczywiœcie. Co chcesz wiedzieæ?~
IF ~global("NimonPosi","GLOBAL",1) global("KuzniaHandel","GLOBAL",0)~ THEN REPLY ~Czy wytwarzasz na tyle du¿o przedmiotów abyœmy mogli je sprzedawaæ?~ GOTO 17
IF ~~ THEN REPLY ~Co to za miejsce?~ GOTO Kuznia
IF ~~ THEN REPLY ~Czemu muszê p³aciæ za przedmioty z w³asnej kuŸni?~ GOTO 16
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO 0
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnaj.~ EXIT
END

IF ~~ THEN BEGIN Kuznia
SAY ~To kuŸnia rodu d'Arnise. Wytwarzam tu uzbrojenie i zbroje dla twojej gwardii i dla ciebie. W tej kuŸni powsta³o wiele s³awnych broni. Mia³em zaszczyt przej¹æ j¹ niedawno. Jestem przyjacielem Arkanda. Poprzedni kowal zgin¹³ w ataku Troli. Sprzedajê tu te¿ zwoje produkowane przez Garlana, on nie ma ju¿ g³owy do handlu.~
IF ~~ THEN REPLY ~Mam inne pytanie.~ GOTO Pytania
IF ~~ THEN REPLY ~Porozmawiajmy o czymœ innym.~ GOTO 0
IF ~~ THEN REPLY ~Wiem ju¿ wszystko. ¯egnaj.~ EXIT
END