BEGIN GARLAN
IF ~NumTimesTalkedTo(0)~ THEN BEGIN FirstMeeting
SAY ~Witaj! Jestem Garlan.~
   IF ~~ THEN REPLY ~Witam. Kim jesteœ?~ GOTO Powitanie
   IF ~~ THEN REPLY ~Ród d'Arnise nie bêdzie potrzebowa³ ju¿ twoich us³ug.~ GOTO GoAway
END

IF ~~ THEN BEGIN Powitanie
SAY ~Pracowa³em u lorda d'Arnise jako, mo¿na powiedzieæ, nadworny mag. Stara³em siê s³u¿yæ rad¹ w sprawach magicznych i uczy³em wybranych cz³onków rodu magii, równie¿ panienkê Naliê. Czasami pomagam umagiczniæ jakiœ przedmiot wykonywany w naszej kuŸni. Odpowiada³em te¿ za mentalne przekazywanie wa¿nych informacji o zamku zarz¹dcy twierdzy. W czasie wolnym tworzê magiczne zwoje, mo¿na je kupiæ w kuŸni. Szczerze mówi¹c jestem ju¿ zmêczony.~
   IF ~!global("KomnataAktywna","GLOBAL",0)~ THEN REPLY ~Czy móg³byœ zdalnie wy³¹czyæ komnatê treningow¹?~ DO ~setglobal("KomnataOverride","GLOBAL",1)~ GOTO Komnata
   IF ~~ THEN REPLY ~PrzejdŸmy siê po zamku, Garlanie.~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~global("GarlanInfo","GLOBAL",0) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chcê abyœ mi przekazywa³ mentalnie wa¿ne informacje z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",1)~ GOTO Zgoda1
   IF ~global("GarlanInfo","GLOBAL",1) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chcê abyœ zaniecha³ przekazywania mi mentalnie informacji z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",0)~ GOTO Zgoda2
   IF ~~ THEN REPLY ~Jak szkolisz ludzi na magów?~ GOTO Magia
   IF ~~ THEN REPLY ~Ród d'Arnise nie bêdzie potrzebowa³ ju¿ twoich us³ug.~ GOTO GoAway
   IF ~~ THEN REPLY ~Doskonale. Mi³ego dnia Garlanie.~ EXIT
END

IF ~~ THEN BEGIN Magia
SAY ~Robiê im nudne wyk³ady. Ka¿ê czytaæ ksi¹¿ki, które zniknê³y po najeŸdzie troli. No i to tyle... Chocia¿, nie! Jest jeszcze komnata treningowa w lochach. Przerobi³em star¹ kaplicê rodow¹. Powinniœcie pójœæ tam poæwiczyæ!~
   IF ~!global("KomnataAktywna","GLOBAL",0)~ THEN REPLY ~Czy móg³byœ zdalnie wy³¹czyæ komnatê treningow¹?~ DO ~setglobal("KomnataOverride","GLOBAL",1)~ GOTO Komnata
   IF ~~ THEN REPLY ~PrzejdŸmy siê po zamku, Garlanie.~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~global("GarlanInfo","GLOBAL",0) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chcê abyœ mi przekazywa³ mentalnie wa¿ne informacje z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",1)~ GOTO Zgoda1
   IF ~global("GarlanInfo","GLOBAL",1) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chcê abyœ zaniecha³ przekazywania mi mentalnie informacji z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",0)~ GOTO Zgoda2
   IF ~~ THEN REPLY ~Przypomnij mi kim jesteœ.~ GOTO Powitanie
   IF ~~ THEN REPLY ~Ród d'Arnise nie bêdzie potrzebowa³ ju¿ twoich us³ug.~ GOTO GoAway
   IF ~~ THEN REPLY ~Doskonale. Mi³ego dnia Garlanie.~ EXIT
END

IF ~~ THEN BEGIN GoAway
SAY ~Wreszcie upragniona emerytura. Dziekujê.~
  IF ~~ THEN DO ~AddexperienceParty(150000) setglobal("GarlanPosi","GLOBAL",3) setglobal("GarlanInfo","GLOBAL",0) EscapeArea()~
EXIT
END

IF ~~ THEN BEGIN RefusedAgain
SAY ~Zawsze mi³o ciê widzieæ.~
IF ~~ THEN EXIT
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN ReturnDialogue
SAY ~Witaj ponownie.~
   IF ~!global("KomnataAktywna","GLOBAL",0)~ THEN REPLY ~Czy móg³byœ zdalnie wy³¹czyæ komnatê treningow¹?~ DO ~setglobal("KomnataOverride","GLOBAL",1)~ GOTO Komnata
   IF ~~ THEN REPLY ~Witaj. PrzejdŸmy siê po zamku, Garlanie.~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~global("GarlanInfo","GLOBAL",0) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chcê abyœ mi przekazywa³ mentalnie wa¿ne informacje z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",1)~ GOTO Zgoda1
   IF ~global("GarlanInfo","GLOBAL",1) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chcê abyœ zaniecha³ przekazywania mi mentalnie informacji z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",0)~ GOTO Zgoda2
   IF ~~ THEN REPLY ~Przypomnij mi kim jesteœ.~ GOTO Powitanie
   IF ~~ THEN REPLY ~Jak szkolisz ludzi na magów?~ GOTO Magia
   IF ~~ THEN REPLY ~Ród d'Arnise nie bêdzie potrzebowa³ ju¿ twoich us³ug.~ GOTO GoAway
   IF ~~ THEN REPLY ~Witaj, tylko ciê odwiedzam.~ GOTO RefusedAgain
END

IF ~~ THEN BEGIN Zgoda1
SAY ~Oczywiœcie. Chocia¿ nasz majordomus czêsto woli korzystaæ z pos³añców. Doprawdy nie wiem czemu.~
   IF ~!global("KomnataAktywna","GLOBAL",0)~ THEN REPLY ~Czy móg³byœ zdalnie wy³¹czyæ komnatê treningow¹?~ DO ~setglobal("KomnataOverride","GLOBAL",1)~ GOTO Komnata
   IF ~~ THEN REPLY ~PrzejdŸmy siê po zamku, Garlanie.~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~~ THEN REPLY ~Przypomnij mi kim jesteœ.~ GOTO Powitanie
   IF ~~ THEN REPLY ~Jak szkolisz ludzi na magów?~ GOTO Magia
   IF ~~ THEN REPLY ~Ród d'Arnise nie bêdzie potrzebowa³ ju¿ twoich us³ug.~ GOTO GoAway
   IF ~~ THEN REPLY ~Doskonale. Mi³ego dnia Garlanie.~ EXIT
END

IF ~~ THEN BEGIN Zgoda2
SAY ~Oczywiœcie. Zaniecham komunikacji mentalnej z tob¹.~
   IF ~!global("KomnataAktywna","GLOBAL",0)~ THEN REPLY ~Czy móg³byœ zdalnie wy³¹czyæ komnatê treningow¹?~ DO ~setglobal("KomnataOverride","GLOBAL",1)~ GOTO Komnata
   IF ~~ THEN REPLY ~PrzejdŸmy siê po zamku, Garlanie.~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~~ THEN REPLY ~Przypomnij mi kim jesteœ.~ GOTO Powitanie
   IF ~~ THEN REPLY ~Jak szkolisz ludzi na magów?~ GOTO Magia
   IF ~~ THEN REPLY ~Ród d'Arnise nie bêdzie potrzebowa³ ju¿ twoich us³ug.~ GOTO GoAway
   IF ~~ THEN REPLY ~Doskonale. Mi³ego dnia Garlanie.~ EXIT
END

IF ~~ THEN BEGIN Komnata
SAY ~Oczywiœcie. Znowu ktoœ tam zgin¹³ i nie wiecie jak wydobyæ jego graty ze œrodka?~
   IF ~~ THEN REPLY ~PrzejdŸmy siê po zamku, Garlanie.~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~global("GarlanInfo","GLOBAL",0) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chcê abyœ mi przekazywa³ mentalnie wa¿ne informacje z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",1)~ GOTO Zgoda1
   IF ~global("GarlanInfo","GLOBAL",1) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chcê abyœ zaniecha³ przekazywania mi mentalnie informacji z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",0)~ GOTO Zgoda2
   IF ~~ THEN REPLY ~Przypomnij mi kim jesteœ.~ GOTO Powitanie
   IF ~~ THEN REPLY ~Jak szkolisz ludzi na magów?~ GOTO Magia
   IF ~~ THEN REPLY ~Ród d'Arnise nie bêdzie potrzebowa³ ju¿ twoich us³ug.~ GOTO GoAway
   IF ~~ THEN REPLY ~Doskonale. Mi³ego dnia Garlanie.~ EXIT
END

BEGIN GARLANP

IF ~Global("GarlanJoined","GLOBAL",1)~ THEN BEGIN KickOut1
SAY ~Czy mam wróciæ do mojej komnaty?~
IF ~~ THEN REPLY ~Nie, nie. Zostañ w dru¿ynie.~ DO ~JoinParty()~ EXIT
IF ~~ THEN REPLY ~Poczekaj tutaj.~ DO ~SetGlobal("GarlanJoined","GLOBAL",0)~ EXIT
IF ~~ THEN REPLY ~Tak, wróæ do swojego pokoju.~ DO ~SetGlobal("GarlanJoined","GLOBAL",0) EscapeAreaMove("ar1307",1460,1600,0) ~ EXIT
END

IF ~true()~ THEN BEGIN Rejoin1
SAY ~Witaj ponownie.~
IF ~~ THEN REPLY ~Witaj. PrzejdŸmy siê po zamku, Garlanie.~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~!global("KomnataAktywna","GLOBAL",0)~ THEN REPLY ~Czy móg³byœ zdalnie wy³¹czyæ komnatê treningow¹?~ DO ~setglobal("KomnataOverride","GLOBAL",1)~ GOTO Komnata1
   IF ~global("GarlanInfo","GLOBAL",0) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chcê abyœ mi przekazywa³ mentalnie wa¿ne informacje z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",1)~ GOTO Zgoda11
   IF ~global("GarlanInfo","GLOBAL",1) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chcê abyœ zaniecha³ przekazywania mi mentalnie informacji z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",0)~ GOTO Zgoda21
IF ~~ THEN REPLY ~Przypomnij mi kim jesteœ.~ GOTO Powitanie1
IF ~~ THEN REPLY ~Ród d'Arnise ju¿ nie potrzebuje twoich us³ug.~ GOTO GoAway1
IF ~~ THEN REPLY ~Witaj, tylko ciê odwiedzam.~ GOTO RefusedAgain1
END

IF ~~ THEN BEGIN RefusedAgain1
SAY ~Zawsze mi³o ciê widzieæ.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Magia1
SAY ~Robiê im nudne wyk³ady. Ka¿ê czytaæ ksi¹¿ki, które zniknê³y po najeŸdzie troli. No i to tyle... Chocia¿, nie! Jest jeszcze komnata treningowa w lochach. Przerobi³em star¹ kaplicê rodow¹. Powinniœcie pójœæ tam poæwiczyæ!~
   IF ~!global("KomnataAktywna","GLOBAL",0)~ THEN REPLY ~Czy móg³byœ zdalnie wy³¹czyæ komnatê treningow¹?~ DO ~setglobal("KomnataOverride","GLOBAL",1)~ GOTO Komnata1
   IF ~~ THEN REPLY ~PrzejdŸmy siê po zamku, Garlanie~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~global("GarlanInfo","GLOBAL",0) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chcê abyœ mi przekazywa³ mentalnie wa¿ne informacje z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",1)~ GOTO Zgoda11
   IF ~global("GarlanInfo","GLOBAL",1) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chcê abyœ zaniecha³ przekazywania mi mentalnie informacji z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",0)~ GOTO Zgoda21
   IF ~~ THEN REPLY ~Przypomnij mi kim jesteœ.~ GOTO Powitanie1
   IF ~~ THEN REPLY ~Ród d'Arnise nie bêdzie potrzebowa³ ju¿ twoich us³ug.~ GOTO GoAway1
   IF ~~ THEN REPLY ~Doskonale. Mi³ego dnia Garlanie.~ EXIT
END

IF ~~ THEN BEGIN Powitanie1
SAY ~Pracowa³em u lorda d'Arnise jako, mo¿na powiedzieæ, nadworny mag. Stara³em siê s³u¿yæ rad¹ w sprawach magicznych i uczy³em wybranych cz³onków rodu magii, równie¿ panienkê Naliê. Czasami pomagam umagiczniæ jakiœ przedmiot wykonywany w naszej kuŸni. Odpowiada³em te¿ za mentalne przekazywanie wa¿nych informacji o zamku zarz¹dcy twierdzy. W czasie wolnym tworzê magiczne zwoje, mo¿na je kupiæ w ku¿ni. Szczerze mówi¹c jestem ju¿ zmêczony.~
   IF ~!global("KomnataAktywna","GLOBAL",0)~ THEN REPLY ~Czy móg³byœ zdalnie wy³¹czyæ komnatê treningow¹?~ DO ~setglobal("KomnataOverride","GLOBAL",1)~ GOTO Komnata1
IF ~~ THEN REPLY ~PrzejdŸmy siê po zamku, Garlanie.~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~global("GarlanInfo","GLOBAL",0) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chcê abyœ mi przekazywa³ mentalnie wa¿ne informacje z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",1)~ GOTO Zgoda11
   IF ~global("GarlanInfo","GLOBAL",1) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chcê abyœ zaniecha³ przekazywania mi mentalnie informacji z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",0)~ GOTO Zgoda21
IF ~~ THEN REPLY ~Jak szkolisz ludzi na magów?~ GOTO Magia1
IF ~~ THEN REPLY ~Ród d'Arnise ju¿ nie potrzebuje twoich us³ug.~ GOTO GoAway1
IF ~~ THEN REPLY ~Doskonale. Mi³ego dnia Garlanie.~ EXIT
END

IF ~~ THEN BEGIN GoAway1
SAY ~Wreszcie upragniona emerytura. Dziekujê.~
  IF ~~ THEN DO ~AddexperienceParty(150000) setglobal("GarlanPosi","GLOBAL",3)  setglobal("GarlanInfo","GLOBAL",0) EscapeArea() ~ EXIT
END

IF ~~ THEN BEGIN Zgoda11
SAY ~Oczywiœcie. Chocia¿ nasz majordomus czêsto woli korzystaæ z pos³añców. Doprawdy nie wiem czemu.~
   IF ~!global("KomnataAktywna","GLOBAL",0)~ THEN REPLY ~Czy móg³byœ zdalnie wy³¹czyæ komnatê treningow¹?~ DO ~setglobal("KomnataOverride","GLOBAL",1)~ GOTO Komnata1
   IF ~~ THEN REPLY ~PrzejdŸmy siê po zamku, Garlanie.~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~~ THEN REPLY ~Przypomnij mi kim jesteœ.~ GOTO Powitanie1
   IF ~~ THEN REPLY ~Jak szkolisz ludzi na magów?~ GOTO Magia1
   IF ~~ THEN REPLY ~Ród d'Arnise nie bêdzie potrzebowa³ ju¿ twoich us³ug.~ GOTO GoAway1
   IF ~~ THEN REPLY ~Doskonale. Mi³ego dnia Garlanie.~ EXIT
END

IF ~~ THEN BEGIN Zgoda21
SAY ~Oczywiœcie. Zaniecham komunikacji mentalnej z tob¹.~
   IF ~!global("KomnataAktywna","GLOBAL",0)~ THEN REPLY ~Czy móg³byœ zdalnie wy³¹czyæ komnatê treningow¹?~ DO ~setglobal("KomnataOverride","GLOBAL",1)~ GOTO Komnata1
   IF ~~ THEN REPLY ~PrzejdŸmy siê po zamku, Garlanie.~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~~ THEN REPLY ~Przypomnij mi kim jesteœ.~ GOTO Powitanie1
   IF ~~ THEN REPLY ~Jak szkolisz ludzi na magów?~ GOTO Magia1
   IF ~~ THEN REPLY ~Ród d'Arnise nie bêdzie potrzebowa³ ju¿ twoich us³ug.~ GOTO GoAway1
   IF ~~ THEN REPLY ~Doskonale. Mi³ego dnia Garlanie.~ EXIT
END

IF ~~ THEN BEGIN Komnata1
SAY ~Oczywiœcie. Znowu ktoœ tam zgin¹³ i nie wiecie jak wydobyæ jego graty ze œrodka?~
   IF ~~ THEN REPLY ~PrzejdŸmy siê po zamku, Garlanie.~ DO ~SetGlobal("GarlanJoined","GLOBAL",1) JoinParty()~ EXIT
   IF ~global("GarlanInfo","GLOBAL",0) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chcê abyœ mi przekazywa³ mentalnie wa¿ne informacje z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",1)~ GOTO Zgoda11
   IF ~global("GarlanInfo","GLOBAL",1) InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Chcê abyœ zaniecha³ przekazywania mi mentalnie informacji z zamku.~ DO ~setglobal("GarlanInfo","GLOBAL",0)~ GOTO Zgoda21
   IF ~~ THEN REPLY ~Przypomnij mi kim jesteœ.~ GOTO Powitanie1
   IF ~~ THEN REPLY ~Jak szkolisz ludzi na magów?~ GOTO Magia1
   IF ~~ THEN REPLY ~Ród d'Arnise nie bêdzie potrzebowa³ ju¿ twoich us³ug.~ GOTO GoAway1
   IF ~~ THEN REPLY ~Doskonale. Mi³ego dnia Garlanie.~ EXIT
END
