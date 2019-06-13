BEGIN NIMON

IF ~global("NimonPosi","GLOBAL",0)~ THEN BEGIN Lochy
SAY ~CzeúúúÊ! Chcessszzz pohandlowaÊ?~
   IF ~~ THEN REPLY ~O ile wiem nie masz przy sobie niczego czym mÛg≥byú handlowaÊ.~ GOTO 2
   IF ~~ THEN REPLY ~Nie, nie chcÍ. Do widzenia.~ EXIT
   IF ~~ THEN REPLY ~Bra≥eú udzia≥ w najeüdzie na zamek, musisz umrzeÊ.~ DO ~setglobal("NimonPosi","GLOBAL",5) enemy()~ EXIT
   IF ~~ THEN REPLY ~Uciekaj. Jesteú wolny. I øebyú juø siÍ tu nigdy wiÍcej nie pokaza≥!~DO~setglobal("NimonPosi","GLOBAL",5) AddexperienceParty(20000) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 2
SAY ~Jak byúúúúcie mi coúúúúú dali to bym mÛg≥ tym handlowaÊ. MogÍ sssprzedaÊ coú wassszego komuúúúúú innemu. Ja pohandluje, wy zyssskacie.~
   IF ~~ THEN REPLY ~Zanim zaczniemy wchodzic w uk≥ady, WI èNIU, muszÍ wiedzieÊ, co robi≥eú na terenie zamku kiedy by≥ najeødzany przez twoich ziomkÛw?~ GOTO 3
   IF ~~ THEN REPLY ~Nie mogÍ d≥uøej z tobπ gadaÊ. Do widzenia.~ EXIT
   IF ~~ THEN REPLY ~Bra≥eú udzia≥ w najeüdzie na zamek, musisz umrzeÊ.~ DO ~setglobal("NimonPosi","GLOBAL",5) enemy()~ EXIT
   IF ~~ THEN REPLY ~Uciekaj. Jesteú wolny. I øebyú juø siÍ tu nigdy wiÍcej nie pokaza≥!~DO~setglobal("NimonPosi","GLOBAL",5) AddexperienceParty(60000) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 3
SAY ~Oni g≥upi. Oni wsszzysssstko nissszzzczπ kiedy najeøøødøajπ zamki. Oni mnie nie widzπ, bo ja ssssprytniejsszzy. Ja nie nisszzczÍ towarÛw do handlu. Ja nie zabijam potencjalnych klientÛw. Zbieram towary i handlujÍ z potencjalnymi klientami.~
   IF ~~ THEN REPLY ~No dobrze. Znajdü sobie pokÛj w tym zamku i poczekaj tam na mnie, a ja pomyslÍ co z tobπ zrobiÊ.~ DO ~setglobal("NimonPosi","GLOBAL",1) EscapeAreaMove("ar1307",1950,1200,12)~ EXIT
   IF ~~ THEN REPLY ~Nie mogÍ d≥uøej z tobπ gadaÊ. Do widzenia.~ EXIT
   IF ~~ THEN REPLY ~Nie wierzÍ ci, bra≥eú udzia≥ w najeüdzie na zamek, musisz umrzeÊ.~ DO ~setglobal("NimonPosi","GLOBAL",5) enemy()~ EXIT
   IF ~~ THEN REPLY ~Dobrze. Jesteú wolny. I øebyú juø siÍ tu nigdy wiÍcej nie pokaza≥!~ DO~AddexperienceParty(90000) setglobal("NimonPosi","GLOBAL",5) EscapeArea() ~ EXIT
END

IF ~global("NimonPosi","GLOBAL",1)~ THEN BEGIN Zamek
SAY ~CzeúúúÊ! Czy wiesszz juø czym mogÍ dla ciebie handlowaÊ?~
   IF ~global("KuzniaHandel","GLOBAL",1) global("RatavaPosi","GLOBAL",0)~ THEN REPLY ~BÍdziesz sprzedawa≥ wyroby kuüni d'Arnise na Targu PrzygÛd na Promenadzie Waukeen w Athkatli.~ GOTO Super
   IF ~~ THEN REPLY ~Nie, jeszcze nie wiem. Tylko ciÍ odwiedzam.~ EXIT
   IF ~~ THEN REPLY ~Nie i chyba siÍ nie dowiem. Moøesz sobie iúÊ.~ DO ~EscapeArea() setglobal("NimonPosi","GLOBAL",3)~ EXIT
END

IF ~!global("RatavaPosi","GLOBAL",0)~ THEN BEGIN Koniec
SAY ~Nie ma kuüni. Nie ma handlu. Wracam do zamku.~
   IF ~~ THEN DO ~setglobal("NimonPosi","GLOBAL",1) EscapeAreaMove("ar1307",1950,1200,12) ~ EXIT
END

IF ~global("NimonPosi","GLOBAL",2)~ THEN BEGIN Sklep
SAY ~Najlepsszze towary! Z kuüni d'Arnissssse! Tylko tu!...O! SSSzzef! CzeúúúÊ.~
   IF ~~ THEN REPLY ~CzeúÊ. Pokaø swoje towary. Moøe coú kupiÍ, øeby zrobiÊ nam reklamÍ.~ DO ~StartStore("Kuznia03",LastTalkedToBy(Myself))~EXIT
   IF ~global("GoblinKuznia","GLOBAL",0)~ THEN REPLY ~CzeúÊ. Jak interesy?~ GOTO 4
   IF ~global("GoblinKuznia","GLOBAL",1)~ THEN REPLY ~CzeúÊ. Jak interesy?~ GOTO 5
   IF ~~ THEN REPLY ~Wracaj do zamku d'Arnise. Pohandlowa≥eú tu juø swoje.~ DO ~ setglobal("NimonPosi","GLOBAL",1) EscapeAreaMove("ar1307",1950,1200,12)~ EXIT
   IF ~~ THEN REPLY ~CzeúÊ. Tylko ciÍ odwiedzam.~ EXIT
   IF ~~ THEN REPLY ~Nie bÍdÍ juø potrzebowa≥ twoich us≥ug, mozesz odejúÊ.~ DO ~ setglobal("NimonPosi","GLOBAL",3) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 4
SAY ~Zarabiamy oko≥o trrzzzysssta ssszzztuk z≥ota na tydzieÒ. Kiedy zbiera sssiÍ 500 przekazujemy je majordomusssssowi w zamku, ktÛry wk≥ada je tam gdzie zwykle wk≥ada ssszztuki z≥ota dla ciebie.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 5
SAY ~Zarabiamy oko≥o czterysssta ssszzztuk z≥ota na tydzieÒ. Nowa kuünia lepsszza! Kiedy zbiera sssiÍ 500 przekazujemy je majordomusssssowi w zamku, ktÛry wk≥ada je tam gdzie zwykle wk≥ada ssszztuki z≥ota dla ciebie.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Super
SAY ~SSSuper! BÍdÍ handlowaÊ niekradzionymi towarami! Russzzam sszzefie!~
IF ~~ THEN DO ~setglobal("NimonPosi","GLOBAL",2) SetGlobalTimer("NimonHandel","GLOBAL",SEVEN_DAYS) EscapeAreaMove("ar0702",750,335,14)~ EXIT
END
