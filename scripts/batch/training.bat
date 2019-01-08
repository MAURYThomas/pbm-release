@echo off

rem if [%1]==[] goto Error else goto Variables

rem :Variables
rem set numCommande=%1
rem set file1=%~2
rem set file2=%~3

rem :Error
rem echo no args found


rem Argument 1 et 2
set Param1=%~1
set Param2=%~2

rem Test l'integrité des arguments
if [%Param1%] == [] (GOTO END) else (echo Param1 = %Param1%)
if [%Param2%] == [] (GOTO END) else (echo Param2 = %Param2%)

echo here is the mistake

:NOEND
echo WOOOOORKS

:END
echo FAILS
%ERRORLEVEL%


rem :MAIL
rem set emailFrom = thomas.maury42@yahoo.fr
rem set emailRecipient = thomas.maury@pbm.fr
rem set body = Un parametre semble avoir causer l'arrêt prématuré du script lors du transfert de fichier vers le serveur FTP (automatically created message)
rem set subj = CAP3D/FTP Script error

rem *** blat *** 
rem blat.exe -mailfrom %emailFrom% -to %emailRecipient% -body "%body%" -subject "%subj%" -server localhost
