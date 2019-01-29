@echo off
echo option batch on>script.ftp
echo option confirm off>>script.ftp
echo option transfer binary>>script.ftp

echo open sftp://pbmdraftsp-be:8SOMT1LMt3@sftp.pbm-draftbox.fr:22 -hostkey=*>>script.ftp


REM %1 = Server Folder (\\SRV-PVMSQL\data_etudes\...) || %2 = n°command || %3 = Fichier de Coffrage || %4 = Fichier de Ferraillage
if [%~1]=="" (GOTO NOPARAMETER)
if [%~2]=="" (GOTO NOPARAMETER)
if [%~3]=="" (GOTO NOPARAMETER)
if [%~4]=="" (GOTO NOPARAMETER)

set file=command.path
for /f "tokens=1-2 delims=\" %%i in (%file%) do (
    echo %%i/%%j
)


:VARIABLES
rem set SERVERFOLDER=%~1
set NUMCOMMANDE=%~1
echo %NUMCOMMANDE%
set FILE1=%~n2
set FILE2=%~n3

:PARAMETERS
REM Parametres
set WINSCPDIR="C:\Program Files (x86)\Winscp\"
set WINSCPPROMPT=winscp.com
rem ****
set ARBORESCENCE=%Data_PATH%\%pattern10%\Produits\REP-%pattern20:~4%\%pattern40%
rem ****
set FILEPATH=C:\Users\thomas.maury\Documents\pbm-release\scripts\batch\3
set LAUNCHCOMMAND=/ini=nul /script=C:\Users\thomas.maury\Documents\pbm-release\scripts\batch\3\script.ftp
rem set URLPARSED=command.path

if %ERRORLEVEL% NEQ 0 (GOTO ERROR)

REM Creation de l'arborescence et transfert des fichiers
:COMMANDS
echo mkdir %ARBOESCENCE%>>script.ftp
echo cd %ARBORESCENCE%>>script.ftp
echo %ERRORLEVEL%>>script.ftp
rem if %ERRORLEVEL% NEQ 0 (echo %ERRORLEVEL% && GOTO ERROR)
echo put %FILEPATH%\%FILE1%>>script.ftp
echo put %FILEPATH%\%FILE2%>>script.ftp
echo exit>>script.ftp


:LAUNCH
cd %WINSCPDIR%
%WINSCPPROMPT% %LAUNCHCOMMAND%

REM A ENLEVER
cd %FILEPATH%

:END
EXIT /b

:NOPARAMETER
echo PARAMETER(S) IS MISSING
echo ERROR LEVEL = %ERRORLEVEL%

:ERROR
echo SOMETHING WENT WRONG
echo ERROR LEVEL = %ERRORLEVEL%
EXIT /b