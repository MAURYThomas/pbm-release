@echo off
echo option batch on>script.ftp
echo option confirm off>>script.ftp
echo option transfer binary>>script.ftp

echo open pbmdraftsp-be@sftp.pbm-draftbox.fr>>script.ftp

if [%~1]=="" (GOTO ERROR)
if [%~2]=="" (GOTO ERROR)

:VARIABLES
REM %1 = n°commande || %2 = ficher 1 (coffrage) || %3 = fichier 2 (ferraillage)
set NUMCOMMANDE=%~1
set FILE1=%~2
set FILE2=%~3

REM Variable d'instanciation
set WINSCPDIR="C:\Program Files (x86)\Winscp"
set FILEPATH=C:\Users\thomas.maury\Documents\PBM\pbm-release\scripts\batch
set LAUNCHCOMMAND="C:\Program Files (x86)\WinSCP\winscp.com" /ini=nul /script=C:\Users\thomas.maury\Documents\PBM\pbm-release\scripts\batch\3\script.ftp -hostkey=*

echo %ERRORLEVEL%
if %ERRORLEVEL% NEQ 0 (GOTO ERROR)

REM Creation de l'arborescence et transfert des fichiers
:COMMANDS
echo mkdir %NUMCOMMANDE%>>script.ftp
echo cd %NUMCOMMANDE%>>script.ftp
if %ERRORLEVEL%==1 (GOTO ERROR)
echo lcd "C:\Users\thomas.maury\Documents\PBM\pbm-release\scripts\batch\">>script.ftp
echo put %FILEPATH%\%FILE1%>>script.ftp
echo put %FILEPATH%\%FILE2%>>script.ftp
echo exit>>script.ftp


:LAUNCH
cd %WINSCPDIR%
%LAUNCHCOMMAND%
REM A ENLEVER
cd C:\Users\thomas.maury\Documents\PBM\pbm-release\scripts\batch\3

:END
EXIT /b

:ERROR
echo SOMETHING WENT WRONG
echo ERROR LEVEL = %ERRORLEVEL%
EXIT /b