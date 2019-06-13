BEGIN ~GOBLINYD~

IF ~global("GoblinSojusz","GLOBAL",1)~ THEN BEGIN Tratatata
SAY ~Pozdrowienie. Podjêliœcie madr¹ decyzjê.~
   IF ~~ THEN EXIT
END

IF ~global("GoblinGadanie","GLOBAL",0)~ THEN BEGIN FirstMeeting
SAY ~Odwrót! Odwrót!...Zaraz...Chcesz porozmawiaæ?~
   IF ~~ THEN REPLY ~Oczywiœcie. Porozmawiajmy.~ DO ~setglobal("GoblinGadanie","GLOBAL",1)~ GOTO Sceptyczny
   IF ~~ THEN REPLY ~Nie bêdziemy rozmawiaæ. Najechaliœcie moje ziemie!~ GOTO GoAway
END

IF ~!global("GoblinGadanie","GLOBAL",0)~ THEN BEGIN NextMeeting
SAY ~I co? Mo¿emy siê wprowadzaæ?~
   IF ~~ THEN REPLY ~Tak. Wprowadzajcie siê.~ GOTO Zgoda
   IF ~~ THEN REPLY ~Muszê siê jeszcze zastanowiæ. Poczekajcie tu.~ EXIT
   IF ~~ THEN REPLY ~Niestety nie bêdziecie mogli siê wprowadziæ. Musimy siê po¿egnaæ.~ GOTO GoAway
END


IF ~~ THEN BEGIN Sceptyczny
SAY ~Ciekawi mnie, dlaczego mielibyœcie rozmawiaæ z goblinami?~
   IF ~~ THEN REPLY ~Znacie wiêcej s³ów ni¿ wasi koledzy szturmuj¹cy nasze bramy, wieæ pewnie rozmowa bedzie mo¿liwa. Wolê rozmawiaæ ni¿ walczyæ.~ GOTO 2
   IF ~~ THEN REPLY ~Wygl¹dzasz inteligentnie, w¹tpie ¿ebyœ chcia³ coœ niszczyæ, raczej coœ budowaæ.~ GOTO 2
   IF ~~ THEN REPLY ~Masz racjê. Lepiej jak was zabijê.~ GOTO GoAway
END

IF ~~ THEN BEGIN 2
SAY ~No dobrze. S³yszeliœmy, ¿e daliœcie pracê i schronienie jednemu z Yuan-ti. Do tej pory w to nie wierzy³em. Przyszliœmy popatrzeæ na wasze katapulty w akcji, po tym kiedy nasi zwiadowcy dostrzegli Dzikich zmierzaj¹cych na zamek. Myœlê, ¿e moglibyœmy sprawiæ, by strzela³y czêœciej, ale musielibyœmy byæ w pobli¿u.~
   IF ~~ THEN REPLY ~Usprawniæ katapulty? Co jeszcze moglibyœcie zrobiæ?~ GOTO 3
   IF ~~ THEN REPLY ~Nie potrzebujê waszych usprawnieñ.~ GOTO GoAway
END

IF ~~ THEN BEGIN 3
SAY ~Zaj¹æ siê wydobyciem diamentów za jedn¹ z cel w lochach zamku. Kiedyœ by³y tam wydobywane.~
   IF ~~ THEN REPLY ~Diamenty? To st¹d ta dziura. Proponujesz jakiœ uk³ad? Mo¿ecie zaoferowaæ jeszcze jakieœ us³ugi?~ GOTO 4
   IF ~~ THEN REPLY ~Ciekawe. Co chcecie w zamian?~ GOTO 4
   IF ~~ THEN REPLY ~Nie potrzebujê waszych us³ug.~ GOTO GoAway
END

IF ~~ THEN BEGIN 4
SAY ~Gdybyœmy mogli zamieszkaæ w zamku i jego okolicach moglibyœmy udostêpniæ nasz¹ brygadê transportow¹ do noszenia ekwipunku, nie musielibyœmy ju¿ siê przenosiæ z miejsca na miejsce.~
   IF ~~ THEN REPLY ~A wiêc chcecie tu zamieszkaæ? Zgadzam siê.~ GOTO Zgoda
   IF ~~ THEN REPLY ~Muszê siê zastanowiæ. Nie wiem jak zareaguj¹ moi ludzie. Poczekajcie tu i nie wrzeszcie ju¿ tak!~ EXIT
   IF ~~ THEN REPLY ~Nie potrzebujê waszych us³ug.~ GOTO GoAway
END

IF ~~ THEN BEGIN Zgoda
SAY ~Zatem niech sojusz miêdzy Goblinami z Klanu Zrêcznej Rêki i ludŸmi z warownii d'Arnise przeniesie wszystkim korzyœci! Wprowadzamy siê!~
IF ~~ THEN DO ~setglobal("GoblinSojusz","GLOBAL",1) SetGlobalTimer("GoblinIKopie","GLOBAL",ONE_DAY) setglobal("GoblinAr1305","GLOBAL",1) setglobal("GoblinIAr1306","GLOBAL",1) setglobal("GoblinGadanie","GLOBAL",0) IncrementGlobal("KPRevolt","GLOBAL",5)~ EXIT
END

IF ~~ THEN BEGIN GoAway
SAY ~No to uciekamy!~
IF ~~ THEN DO ~setglobal("GoblinUcieka","GLOBAL",1)~ EXIT
END