@echo off
echo %ERRORLEVEL% SSSSSSSSSSSSSAAAA
echo option batch on>script.ftp
echo option confirm off>>script.ftp
echo option transfer binary>>script.ftp

echo open sftp://pbmdraftsp-be:8SOMT1LMt3@sftp.pbm-draftbox.fr:22 -hostkey=*>>script.ftp


if [%~1]=="" (GOTO NOPARAMETER)
if [%~2]=="" (GOTO NOPARAMETER)
if [%~3]=="" (GOTO NOPARAMETER)

:VARIABLES
REM %1 = n°commande || %2 = ficher 1 (coffrage) || %3 = fichier 2 (ferraillage)


set NUMCOMMANDE=%~1
set FILE1=%~2
set FILE2=%~3

:PARAMETERS
REM Parametres
set WINSCPDIR="C:\Program Files (x86)\Winscp\"
set WINSCPPROMPT=winscp.com
set FILEPATH=C:\Users\thomas.maury\Documents\pbm-release\scripts\batch\3
set LAUNCHCOMMAND=/ini=nul /script=C:\Users\thomas.maury\Documents\pbm-release\scripts\batch\3\script.ftp

echo TATATA%ERRORLEVEL%
if %ERRORLEVEL% NEQ 0 (GOTO ERROR)

REM Creation de l'arborescence et transfert des fichiers
:COMMANDS
echo mkdir %NUMCOMMANDE%>>script.ftp
echo cd %NUMCOMMANDE%>>script.ftp
echo teeeeest %ERRORLEVEL%
if %ERRORLEVEL% NEQ 0 (echo %ERRORLEVEL% && GOTO ERROR)
echo put %FILEPATH%\%FILE1%>>script.ftp
echo put %FILEPATH%\%FILE2%>>script.ftp
echo exit>>script.ftp


:LAUNCH
cd %WINSCPDIR%
echo TESSST
%WINSCPPROMPT% %LAUNCHCOMMAND%
REM A ENLEVER
cd %FILEPATH%\3

:END
EXIT /b

:NOPARAMETER
echo PARAMETER(S) IS MISSING
echo ERROR LEVEL = %ERRORLEVEL%

:ERROR
echo SOMETHING WENT WRONG
echo ERROR LEVEL = %ERRORLEVEL%
EXIT /b