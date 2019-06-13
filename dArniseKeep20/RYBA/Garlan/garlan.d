BEGIN GARLAN
IF ~NumTimesTalkedTo(0)~ THEN BEGIN FirstMeeting
SAY ~Witaj! Jestem Garlan.~
   IF ~~ THEN REPLY ~Witam. Kim jeste�?~ GOTO Powitanie
   IF ~~ THEN REPLY ~R�d d'Arnise nie b�dzie potrzebowa� ju� twoich us�ug.~ GOTO GoAway
END

IF ~~ THEN BEGIN Powitanie
SAY ~Pracowa�em u lorda d'Arnise jako, mo�na powiedzie�, nadworny mag. Stara�em si� s�u�y� rad� w sprawach magicznych i uczy�em wybranych cz�onk�w rodu magii, r�wnie� panienk� Nali�. Czasami pomagam umagiczni� jaki� przedmiot wykonywany w naszej ku�ni. Odpowiada�em te� za mentalne przekazywanie wa�nych informacji o zamku zarz�dcy twierdzy. W czasie wolnym tworz� magiczne zwoje, mo�na je kupi� w ku�ni. Szczerze m�wi�c jestem ju� zm�czony.~
   IF ~!global("KomnataAktywna","GLOBAL",0)~ THEN REPLY ~Czy m�g�by� zdalnie wy��czy� komnat� treningow�?~ DO ~setglobal("KomnataOverride","GLOBAL",1)~ GOTO Komnata
   IF ~~ THEN REPLY ~Przejd�my si� po zamku, Garlanie.~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~global("GarlanInfo","GLOBAL",0) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chc� aby� mi przekazywa� mentalnie wa�ne informacje z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",1)~ GOTO Zgoda1
   IF ~global("GarlanInfo","GLOBAL",1) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chc� aby� zaniecha� przekazywania mi mentalnie informacji z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",0)~ GOTO Zgoda2
   IF ~~ THEN REPLY ~Jak szkolisz ludzi na mag�w?~ GOTO Magia
   IF ~~ THEN REPLY ~R�d d'Arnise nie b�dzie potrzebowa� ju� twoich us�ug.~ GOTO GoAway
   IF ~~ THEN REPLY ~Doskonale. Mi�ego dnia Garlanie.~ EXIT
END

IF ~~ THEN BEGIN Magia
SAY ~Robi� im nudne wyk�ady. Ka�� czyta� ksi��ki, kt�re znikn�y po naje�dzie troli. No i to tyle... Chocia�, nie! Jest jeszcze komnata treningowa w lochach. Przerobi�em star� kaplic� rodow�. Powinni�cie p�j�� tam po�wiczy�!~
   IF ~!global("KomnataAktywna","GLOBAL",0)~ THEN REPLY ~Czy m�g�by� zdalnie wy��czy� komnat� treningow�?~ DO ~setglobal("KomnataOverride","GLOBAL",1)~ GOTO Komnata
   IF ~~ THEN REPLY ~Przejd�my si� po zamku, Garlanie.~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~global("GarlanInfo","GLOBAL",0) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chc� aby� mi przekazywa� mentalnie wa�ne informacje z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",1)~ GOTO Zgoda1
   IF ~global("GarlanInfo","GLOBAL",1) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chc� aby� zaniecha� przekazywania mi mentalnie informacji z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",0)~ GOTO Zgoda2
   IF ~~ THEN REPLY ~Przypomnij mi kim jeste�.~ GOTO Powitanie
   IF ~~ THEN REPLY ~R�d d'Arnise nie b�dzie potrzebowa� ju� twoich us�ug.~ GOTO GoAway
   IF ~~ THEN REPLY ~Doskonale. Mi�ego dnia Garlanie.~ EXIT
END

IF ~~ THEN BEGIN GoAway
SAY ~Wreszcie upragniona emerytura. Dziekuj�.~
  IF ~~ THEN DO ~AddexperienceParty(150000) setglobal("GarlanPosi","GLOBAL",3) setglobal("GarlanInfo","GLOBAL",0) EscapeArea()~
EXIT
END

IF ~~ THEN BEGIN RefusedAgain
SAY ~Zawsze mi�o ci� widzie�.~
IF ~~ THEN EXIT
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN ReturnDialogue
SAY ~Witaj ponownie.~
   IF ~!global("KomnataAktywna","GLOBAL",0)~ THEN REPLY ~Czy m�g�by� zdalnie wy��czy� komnat� treningow�?~ DO ~setglobal("KomnataOverride","GLOBAL",1)~ GOTO Komnata
   IF ~~ THEN REPLY ~Witaj. Przejd�my si� po zamku, Garlanie.~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~global("GarlanInfo","GLOBAL",0) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chc� aby� mi przekazywa� mentalnie wa�ne informacje z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",1)~ GOTO Zgoda1
   IF ~global("GarlanInfo","GLOBAL",1) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chc� aby� zaniecha� przekazywania mi mentalnie informacji z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",0)~ GOTO Zgoda2
   IF ~~ THEN REPLY ~Przypomnij mi kim jeste�.~ GOTO Powitanie
   IF ~~ THEN REPLY ~Jak szkolisz ludzi na mag�w?~ GOTO Magia
   IF ~~ THEN REPLY ~R�d d'Arnise nie b�dzie potrzebowa� ju� twoich us�ug.~ GOTO GoAway
   IF ~~ THEN REPLY ~Witaj, tylko ci� odwiedzam.~ GOTO RefusedAgain
END

IF ~~ THEN BEGIN Zgoda1
SAY ~Oczywi�cie. Chocia� nasz majordomus cz�sto woli korzysta� z pos�a�c�w. Doprawdy nie wiem czemu.~
   IF ~!global("KomnataAktywna","GLOBAL",0)~ THEN REPLY ~Czy m�g�by� zdalnie wy��czy� komnat� treningow�?~ DO ~setglobal("KomnataOverride","GLOBAL",1)~ GOTO Komnata
   IF ~~ THEN REPLY ~Przejd�my si� po zamku, Garlanie.~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~~ THEN REPLY ~Przypomnij mi kim jeste�.~ GOTO Powitanie
   IF ~~ THEN REPLY ~Jak szkolisz ludzi na mag�w?~ GOTO Magia
   IF ~~ THEN REPLY ~R�d d'Arnise nie b�dzie potrzebowa� ju� twoich us�ug.~ GOTO GoAway
   IF ~~ THEN REPLY ~Doskonale. Mi�ego dnia Garlanie.~ EXIT
END

IF ~~ THEN BEGIN Zgoda2
SAY ~Oczywi�cie. Zaniecham komunikacji mentalnej z tob�.~
   IF ~!global("KomnataAktywna","GLOBAL",0)~ THEN REPLY ~Czy m�g�by� zdalnie wy��czy� komnat� treningow�?~ DO ~setglobal("KomnataOverride","GLOBAL",1)~ GOTO Komnata
   IF ~~ THEN REPLY ~Przejd�my si� po zamku, Garlanie.~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~~ THEN REPLY ~Przypomnij mi kim jeste�.~ GOTO Powitanie
   IF ~~ THEN REPLY ~Jak szkolisz ludzi na mag�w?~ GOTO Magia
   IF ~~ THEN REPLY ~R�d d'Arnise nie b�dzie potrzebowa� ju� twoich us�ug.~ GOTO GoAway
   IF ~~ THEN REPLY ~Doskonale. Mi�ego dnia Garlanie.~ EXIT
END

IF ~~ THEN BEGIN Komnata
SAY ~Oczywi�cie. Znowu kto� tam zgin�� i nie wiecie jak wydoby� jego graty ze �rodka?~
   IF ~~ THEN REPLY ~Przejd�my si� po zamku, Garlanie.~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~global("GarlanInfo","GLOBAL",0) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chc� aby� mi przekazywa� mentalnie wa�ne informacje z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",1)~ GOTO Zgoda1
   IF ~global("GarlanInfo","GLOBAL",1) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chc� aby� zaniecha� przekazywania mi mentalnie informacji z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",0)~ GOTO Zgoda2
   IF ~~ THEN REPLY ~Przypomnij mi kim jeste�.~ GOTO Powitanie
   IF ~~ THEN REPLY ~Jak szkolisz ludzi na mag�w?~ GOTO Magia
   IF ~~ THEN REPLY ~R�d d'Arnise nie b�dzie potrzebowa� ju� twoich us�ug.~ GOTO GoAway
   IF ~~ THEN REPLY ~Doskonale. Mi�ego dnia Garlanie.~ EXIT
END

BEGIN GARLANP

IF ~Global("GarlanJoined","GLOBAL",1)~ THEN BEGIN KickOut1
SAY ~Czy mam wr�ci� do mojej komnaty?~
IF ~~ THEN REPLY ~Nie, nie. Zosta� w dru�ynie.~ DO ~JoinParty()~ EXIT
IF ~~ THEN REPLY ~Poczekaj tutaj.~ DO ~SetGlobal("GarlanJoined","GLOBAL",0)~ EXIT
IF ~~ THEN REPLY ~Tak, wr�� do swojego pokoju.~ DO ~SetGlobal("GarlanJoined","GLOBAL",0) EscapeAreaMove("ar1307",1460,1600,0) ~ EXIT
END

IF ~true()~ THEN BEGIN Rejoin1
SAY ~Witaj ponownie.~
IF ~~ THEN REPLY ~Witaj. Przejd�my si� po zamku, Garlanie.~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~!global("KomnataAktywna","GLOBAL",0)~ THEN REPLY ~Czy m�g�by� zdalnie wy��czy� komnat� treningow�?~ DO ~setglobal("KomnataOverride","GLOBAL",1)~ GOTO Komnata1
   IF ~global("GarlanInfo","GLOBAL",0) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chc� aby� mi przekazywa� mentalnie wa�ne informacje z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",1)~ GOTO Zgoda11
   IF ~global("GarlanInfo","GLOBAL",1) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chc� aby� zaniecha� przekazywania mi mentalnie informacji z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",0)~ GOTO Zgoda21
IF ~~ THEN REPLY ~Przypomnij mi kim jeste�.~ GOTO Powitanie1
IF ~~ THEN REPLY ~R�d d'Arnise ju� nie potrzebuje twoich us�ug.~ GOTO GoAway1
IF ~~ THEN REPLY ~Witaj, tylko ci� odwiedzam.~ GOTO RefusedAgain1
END

IF ~~ THEN BEGIN RefusedAgain1
SAY ~Zawsze mi�o ci� widzie�.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Magia1
SAY ~Robi� im nudne wyk�ady. Ka�� czyta� ksi��ki, kt�re znikn�y po naje�dzie troli. No i to tyle... Chocia�, nie! Jest jeszcze komnata treningowa w lochach. Przerobi�em star� kaplic� rodow�. Powinni�cie p�j�� tam po�wiczy�!~
   IF ~!global("KomnataAktywna","GLOBAL",0)~ THEN REPLY ~Czy m�g�by� zdalnie wy��czy� komnat� treningow�?~ DO ~setglobal("KomnataOverride","GLOBAL",1)~ GOTO Komnata1
   IF ~~ THEN REPLY ~Przejd�my si� po zamku, Garlanie~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~global("GarlanInfo","GLOBAL",0) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chc� aby� mi przekazywa� mentalnie wa�ne informacje z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",1)~ GOTO Zgoda11
   IF ~global("GarlanInfo","GLOBAL",1) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chc� aby� zaniecha� przekazywania mi mentalnie informacji z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",0)~ GOTO Zgoda21
   IF ~~ THEN REPLY ~Przypomnij mi kim jeste�.~ GOTO Powitanie1
   IF ~~ THEN REPLY ~R�d d'Arnise nie b�dzie potrzebowa� ju� twoich us�ug.~ GOTO GoAway1
   IF ~~ THEN REPLY ~Doskonale. Mi�ego dnia Garlanie.~ EXIT
END

IF ~~ THEN BEGIN Powitanie1
SAY ~Pracowa�em u lorda d'Arnise jako, mo�na powiedzie�, nadworny mag. Stara�em si� s�u�y� rad� w sprawach magicznych i uczy�em wybranych cz�onk�w rodu magii, r�wnie� panienk� Nali�. Czasami pomagam umagiczni� jaki� przedmiot wykonywany w naszej ku�ni. Odpowiada�em te� za mentalne przekazywanie wa�nych informacji o zamku zarz�dcy twierdzy. W czasie wolnym tworz� magiczne zwoje, mo�na je kupi� w ku�ni. Szczerze m�wi�c jestem ju� zm�czony.~
   IF ~!global("KomnataAktywna","GLOBAL",0)~ THEN REPLY ~Czy m�g�by� zdalnie wy��czy� komnat� treningow�?~ DO ~setglobal("KomnataOverride","GLOBAL",1)~ GOTO Komnata1
IF ~~ THEN REPLY ~Przejd�my si� po zamku, Garlanie.~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~global("GarlanInfo","GLOBAL",0) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chc� aby� mi przekazywa� mentalnie wa�ne informacje z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",1)~ GOTO Zgoda11
   IF ~global("GarlanInfo","GLOBAL",1) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chc� aby� zaniecha� przekazywania mi mentalnie informacji z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",0)~ GOTO Zgoda21
IF ~~ THEN REPLY ~Jak szkolisz ludzi na mag�w?~ GOTO Magia1
IF ~~ THEN REPLY ~R�d d'Arnise ju� nie potrzebuje twoich us�ug.~ GOTO GoAway1
IF ~~ THEN REPLY ~Doskonale. Mi�ego dnia Garlanie.~ EXIT
END

IF ~~ THEN BEGIN GoAway1
SAY ~Wreszcie upragniona emerytura. Dziekuj�.~
  IF ~~ THEN DO ~AddexperienceParty(150000) setglobal("GarlanPosi","GLOBAL",3)  setglobal("GarlanInfo","GLOBAL",0) EscapeArea() ~ EXIT
END

IF ~~ THEN BEGIN Zgoda11
SAY ~Oczywi�cie. Chocia� nasz majordomus cz�sto woli korzysta� z pos�a�c�w. Doprawdy nie wiem czemu.~
   IF ~!global("KomnataAktywna","GLOBAL",0)~ THEN REPLY ~Czy m�g�by� zdalnie wy��czy� komnat� treningow�?~ DO ~setglobal("KomnataOverride","GLOBAL",1)~ GOTO Komnata1
   IF ~~ THEN REPLY ~Przejd�my si� po zamku, Garlanie.~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~~ THEN REPLY ~Przypomnij mi kim jeste�.~ GOTO Powitanie1
   IF ~~ THEN REPLY ~Jak szkolisz ludzi na mag�w?~ GOTO Magia1
   IF ~~ THEN REPLY ~R�d d'Arnise nie b�dzie potrzebowa� ju� twoich us�ug.~ GOTO GoAway1
   IF ~~ THEN REPLY ~Doskonale. Mi�ego dnia Garlanie.~ EXIT
END

IF ~~ THEN BEGIN Zgoda21
SAY ~Oczywi�cie. Zaniecham komunikacji mentalnej z tob�.~
   IF ~!global("KomnataAktywna","GLOBAL",0)~ THEN REPLY ~Czy m�g�by� zdalnie wy��czy� komnat� treningow�?~ DO ~setglobal("KomnataOverride","GLOBAL",1)~ GOTO Komnata1
   IF ~~ THEN REPLY ~Przejd�my si� po zamku, Garlanie.~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~~ THEN REPLY ~Przypomnij mi kim jeste�.~ GOTO Powitanie1
   IF ~~ THEN REPLY ~Jak szkolisz ludzi na mag�w?~ GOTO Magia1
   IF ~~ THEN REPLY ~R�d d'Arnise nie b�dzie potrzebowa� ju� twoich us�ug.~ GOTO GoAway1
   IF ~~ THEN REPLY ~Doskonale. Mi�ego dnia Garlanie.~ EXIT
END

IF ~~ THEN BEGIN Komnata1
SAY ~Oczywi�cie. Znowu kto� tam zgin�� i nie wiecie jak wydoby� jego graty ze �rodka?~
   IF ~~ THEN REPLY ~Przejd�my si� po zamku, Garlanie.~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~global("GarlanInfo","GLOBAL",0) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chc� aby� mi przekazywa� mentalnie wa�ne informacje z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",1)~ GOTO Zgoda11
   IF ~global("GarlanInfo","GLOBAL",1) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chc� aby� zaniecha� przekazywania mi mentalnie informacji z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",0)~ GOTO Zgoda21
   IF ~~ THEN REPLY ~Przypomnij mi kim jeste�.~ GOTO Powitanie1
   IF ~~ THEN REPLY ~Jak szkolisz ludzi na mag�w?~ GOTO Magia1
   IF ~~ THEN REPLY ~R�d d'Arnise nie b�dzie potrzebowa� ju� twoich us�ug.~ GOTO GoAway1
   IF ~~ THEN REPLY ~Doskonale. Mi�ego dnia Garlanie.~ EXIT
END
