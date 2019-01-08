@echo off

echo open sftp.pbm-draftbox.fr>extra.ftp
echo pbmdraftsp-be>>extra.ftp
echo 8SOMT1LMt3>>extra.ftp

if [%1]=="" (GOTO ERROR)
if [%2]=="" (GOTO ERROR) else (goto VARIABLES)

:VARIABLES
REM %1 n°commande || %2 ficher 1 (coffrage) || %3 fichier 2 (ferraillage)
set numCommande=%1
set file1=%2
set file2=%3

if %ERRORLEVEL% == 0 (goto CREATEDIR) else (GOTO ERROR)

:CREATEDIR
echo mkdir %numCommande%>>extra.ftp
echo cd %numCommande%>>extra.ftp
echo put %file1%>>extra.ftp
echo put %file2%>>extra.ftp
echo quit>>extra.ftp

REM if %ERRORLEVEL% == 0 (goto END) else (GOTO ERROR)

:ERROR
echo Something went wrong

ftp -s:extra.ftp

REM :END
