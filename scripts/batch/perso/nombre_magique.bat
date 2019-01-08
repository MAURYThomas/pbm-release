@echo off

:DEBUT
set /a n="%random%%101"

:JEU
echo L'ordinateur à choisi un nombre. A vous de le deviner !
set /p j="Saisissez un nombre entre 0 et 100"

echo vous avez choisi le numéro %j% ! Bonne chance !

:POUM
if %n% lss %j% echo raté, c'est MOINS !
if %n% gtr %j% echo raté, c'est PLUS !
GOTO POUM

if %n% equ %j% echo Bravo, C'est GAGNE !
