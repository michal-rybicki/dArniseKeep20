BEGIN ~GANT~ 2

IF ~true()~ THEN BEGIN Start
SAY ~Witam. U mnie kupicie najlepsz¹ amunicjê w ca³ym Amn! Zapraszam!~
IF ~~ THEN REPLY ~Pokaz swój towar.~ DO ~StartStore("GANT",LastTalkedToBy(Myself))~ EXIT
IF ~~ THEN REPLY ~Narazie dziekujê.~ EXIT
END
