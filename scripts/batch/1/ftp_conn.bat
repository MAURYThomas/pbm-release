@echo off

echo open sftp.pbm-draftbox.fr>extra.ftp
echo pbmdraftsp-be>>extra.ftp
echo 8SOMT1LMt3>>extra.ftp

if [%1]=="" (GOTO ERROR)
if [%2]=="" (GOTO ERROR) else (GOTO VARIABLES)

:VARIABLES
REM %1 n°commande || %2 ficher 1 (coffrage) || %3 fichier 2 (ferraillage)
set NUMCOMMANDE=%~1
set FILE1=%~2
set FILE2=%~3

echo %ERRORLEVEL%
if %ERRORLEVEL% == 0 (GOTO CREATEDIR) else (GOTO ERROR)

REM Creation du repertoire et transfert des fichiers
:CREATEDIR
echo mkdir %NUMCOMMANDE%>>extra.ftp
echo cd %NUMCOMMANDE%>>extra.ftp
if %ERRORLEVEL%==1 (GOTO ERROR)
echo put %FILE1%>>extra.ftp
echo put %FILE2%>>extra.ftp
echo quit>>extra.ftp


:LAUNCH
ftp -s:extra.ftp

:END
EXIT /b

:ERROR
echo Something went WRONG
echo ERROR LEVEL = %ERRORLEVEL%
EXIT /b