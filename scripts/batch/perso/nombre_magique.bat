@echo off

:DEBUT
set MAX=100
set MIN=10
set /a N=%MIN%+%RANDOM%*(1+%MAX%-%MIN%)/32767
set COMPTEUR=0

:JEU
echo L'ordiNateur a choisi un nombre. A vous de le deviner !
echo.

:POUM
set /a COMPTEUR+=1
set /a COMPTRESTANT=10-%COMPTEUR%
set /p J="Saisissez un nombre entre 0 et 100 : "
if "%J%"=="" (echo tapez un nombre)

if %N% neq %J% (
if %N% lss %J% echo rate, c'est MOINS !
if %N% gtr %J% echo rate, c'est PLUS !
if %COMPTRESTANT% geq 0 (
    echo Il vous reste %COMPTRESTANT% essai
) else (
    echo PERDU !
    GOTO REJOUER
)
GOTO POUM
) else (
    echo Bravo, c'est GAGNE !
    echo Vous en etiez a votre %COMPTEUR%e essai
   
)

:REJOUER
set /p REPLAY=Voulez vous rejouer ? (O/N^)
if %REPLAY%==O (GOTO DEBUT)
if %REPLAY%==o (GOTO DEBUT)
pause>NUL