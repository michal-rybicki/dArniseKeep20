BEGIN ~GANT~ 2

IF ~true()~ THEN BEGIN Start
SAY ~Witam. U mnie kupicie najlepsz� amunicj� w ca�ym Amn! Zapraszam!~
IF ~~ THEN REPLY ~Pokaz sw�j towar.~ DO ~StartStore("GANT",LastTalkedToBy(Myself))~ EXIT
IF ~~ THEN REPLY ~Narazie dziekuj�.~ EXIT
END
