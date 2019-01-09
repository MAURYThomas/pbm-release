@echo off

echo open sftp.pbm-draftbox.fr>winscp.txt
echo pbmdraftsp-be>>winscp.txt
echo 8SOMT1LMt3>>winscp.txt

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
echo mkdir %NUMCOMMANDE%>>winscp.txt
echo cd %NUMCOMMANDE%>>winscp.txt
if %ERRORLEVEL%==1 (GOTO ERROR)
echo put %FILE1%>>winscp.txt
echo put %FILE2%>>winscp.txt
echo quit>>winscp.txt


:LAUNCH
winscp.com /script=winscp.txt /ini=nul

:ERROR
echo Something went WRONG
echo ERROR LEVEL : %ERRORLEVEL%
EXIT /b