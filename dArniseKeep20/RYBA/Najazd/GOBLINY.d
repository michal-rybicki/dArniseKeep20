BEGIN ~GOBLINYD~

IF ~global("GoblinSojusz","GLOBAL",1)~ THEN BEGIN Tratatata
SAY ~Pozdrowienie. Podj�li�cie madr� decyzj�.~
   IF ~~ THEN EXIT
END

IF ~global("GoblinGadanie","GLOBAL",0)~ THEN BEGIN FirstMeeting
SAY ~Odwr�t! Odwr�t!...Zaraz...Chcesz porozmawia�?~
   IF ~~ THEN REPLY ~Oczywi�cie. Porozmawiajmy.~ DO ~setglobal("GoblinGadanie","GLOBAL",1)~ GOTO Sceptyczny
   IF ~~ THEN REPLY ~Nie b�dziemy rozmawia�. Najechali�cie moje ziemie!~ GOTO GoAway
END

IF ~!global("GoblinGadanie","GLOBAL",0)~ THEN BEGIN NextMeeting
SAY ~I co? Mo�emy si� wprowadza�?~
   IF ~~ THEN REPLY ~Tak. Wprowadzajcie si�.~ GOTO Zgoda
   IF ~~ THEN REPLY ~Musz� si� jeszcze zastanowi�. Poczekajcie tu.~ EXIT
   IF ~~ THEN REPLY ~Niestety nie b�dziecie mogli si� wprowadzi�. Musimy si� po�egna�.~ GOTO GoAway
END


IF ~~ THEN BEGIN Sceptyczny
SAY ~Ciekawi mnie, dlaczego mieliby�cie rozmawia� z goblinami?~
   IF ~~ THEN REPLY ~Znacie wi�cej s��w ni� wasi koledzy szturmuj�cy nasze bramy, wie� pewnie rozmowa bedzie mo�liwa. Wol� rozmawia� ni� walczy�.~ GOTO 2
   IF ~~ THEN REPLY ~Wygl�dzasz inteligentnie, w�tpie �eby� chcia� co� niszczy�, raczej co� budowa�.~ GOTO 2
   IF ~~ THEN REPLY ~Masz racj�. Lepiej jak was zabij�.~ GOTO GoAway
END

IF ~~ THEN BEGIN 2
SAY ~No dobrze. S�yszeli�my, �e dali�cie prac� i schronienie jednemu z Yuan-ti. Do tej pory w to nie wierzy�em. Przyszli�my popatrze� na wasze katapulty w akcji, po tym kiedy nasi zwiadowcy dostrzegli Dzikich zmierzaj�cych na zamek. My�l�, �e mogliby�my sprawi�, by strzela�y cz�ciej, ale musieliby�my by� w pobli�u.~
   IF ~~ THEN REPLY ~Usprawni� katapulty? Co jeszcze mogliby�cie zrobi�?~ GOTO 3
   IF ~~ THEN REPLY ~Nie potrzebuj� waszych usprawnie�.~ GOTO GoAway
END

IF ~~ THEN BEGIN 3
SAY ~Zaj�� si� wydobyciem diament�w za jedn� z cel w lochach zamku. Kiedy� by�y tam wydobywane.~
   IF ~~ THEN REPLY ~Diamenty? To st�d ta dziura. Proponujesz jaki� uk�ad? Mo�ecie zaoferowa� jeszcze jakie� us�ugi?~ GOTO 4
   IF ~~ THEN REPLY ~Ciekawe. Co chcecie w zamian?~ GOTO 4
   IF ~~ THEN REPLY ~Nie potrzebuj� waszych us�ug.~ GOTO GoAway
END

IF ~~ THEN BEGIN 4
SAY ~Gdyby�my mogli zamieszka� w zamku i jego okolicach mogliby�my udost�pni� nasz� brygad� transportow� do noszenia ekwipunku, nie musieliby�my ju� si� przenosi� z miejsca na miejsce.~
   IF ~~ THEN REPLY ~A wi�c chcecie tu zamieszka�? Zgadzam si�.~ GOTO Zgoda
   IF ~~ THEN REPLY ~Musz� si� zastanowi�. Nie wiem jak zareaguj� moi ludzie. Poczekajcie tu i nie wrzeszcie ju� tak!~ EXIT
   IF ~~ THEN REPLY ~Nie potrzebuj� waszych us�ug.~ GOTO GoAway
END

IF ~~ THEN BEGIN Zgoda
SAY ~Zatem niech sojusz mi�dzy Goblinami z Klanu Zr�cznej R�ki i lud�mi z warownii d'Arnise przeniesie wszystkim korzy�ci! Wprowadzamy si�!~
IF ~~ THEN DO ~setglobal("GoblinSojusz","GLOBAL",1) SetGlobalTimer("GoblinIKopie","GLOBAL",ONE_DAY) setglobal("GoblinAr1305","GLOBAL",1) setglobal("GoblinIAr1306","GLOBAL",1) setglobal("GoblinGadanie","GLOBAL",0) IncrementGlobal("KPRevolt","GLOBAL",5)~ EXIT
END

IF ~~ THEN BEGIN GoAway
SAY ~No to uciekamy!~
IF ~~ THEN DO ~setglobal("GoblinUcieka","GLOBAL",1)~ EXIT
END