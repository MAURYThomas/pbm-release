@echo off
ECHO option batch on>script.ftp
ECHO option confirm off>>script.ftp
ECHO option transfer binary>>script.ftp

ECHO open sftp://pbmdraftsp-be:8SOMT1LMt3@sftp.pbm-draftbox.fr:22 -hostkey=*>>script.ftp

REM %1 = path\file1 (coffrage) || %2 = path\file2 (ferraillage)
IF [%~1]=="" (GOTO NOPARAMETER)
IF [%~2]=="" (GOTO NOPARAMETER)

:VARIABLES
REM deja remplacé dans RD
REM SET FILE1=%~1
REM ECHO %FILE1%>Coffrage.file
REM SET FILE2=%~2
REM ECHO %FILE2%>Ferraillage.file
SET CURRENT_DIR="C:\TEMP\SFTP"
SET CURRENT_winscp_DIR="C:\Program Files (x86)"

:PARAMETERS
REM Parametres
SET Data_PATH=\\SRV-SPVMSQL\Data_Etudes\Commandes

SET WINSCPDIR="%CURRENT_winscp_DIR%\WinSCP"
SET WINSCPPROMPT=winscp.com

SET LAUNCHCOMMAND=/ini=nul /script=%CURRENT_DIR%\script.ftp

REM IF %ERRORLEVEL% NEQ 0 (GOTO ERROR)


:SPLIT
:FERRAILAGE
REM SÃ©pare le nom du fichier de son chemin ...
SET fileF=Ferraillage.file
FOR /f "tokens=5 delims=\" %%i in (%fileF%) do (
    SET Ferraillage=%%~n%i
)

:COFFRAGE
REM local variables
SET fileC=Coffrage.file
FOR /f "tokens=5 delims=\" %%i in (%fileC%) do (
    SET Coffrage=%%~n%i
)


REM DÃ©coupe du nom de fichier pour crÃ©er l'arborescence
:Feraillage_PATH
SET fileP=Pattern.file
ECHO %Ferraillage%>Pattern.file
SET token=1
SET temp=1
GOTO LOOP

:Coffrage_PATH
ECHO %Coffrage%>Pattern.file
SET token=1
SET temp=0
GOTO LOOP


REM DÃ©coupe du nom de fichier pour crÃ©er l'arborescence
:LOOP
IF %token% LEQ 4 (
    FOR /f "tokens=%token% delims=-" %%i in (%fileP%) do (
        REM Ex: pattern11 = N°Commande ferraillage
        SET pattern%token%%temp%=%%i
    )
    SET /a token+=1
    GOTO LOOP
)
IF %temp% EQU 1 GOTO Coffrage_PATH


REM Decoupe de l'arborescence pour le MKDIR (!! pblm recursivite)
SET ARBO1=%pattern10%
SET ARBO2=Produits
REM Plan en REP (Plan1 --> REP-1)
SET ARBO3=REP-%pattern20:~4%
SET ARBO4=%pattern40%


SET FILE_PATH=\%pattern10%\Produits\REP-%pattern20:~4%\%pattern40%



REM Creation de l'arborescence sur le SFTP et transfert des fichiers sur le SFTP
REM  !! Recursivite pour MKDIR impossible sous winscp...	
:COMMANDS
ECHO MKDIR %ARBO1%>>script.ftp
ECHO CD %ARBO1%>>script.ftp
ECHO MKDIR %ARBO2%>>script.ftp
ECHO CD %ARBO2%>>script.ftp
ECHO MKDIR %ARBO3%>>script.ftp
ECHO CD %ARBO3%>>script.ftp
ECHO MKDIR %ARBO4%>>script.ftp
ECHO CD %ARBO4%>>script.ftp
ECHO LCD %Data_PATH%%FILE_PATH%>>script.ftp

rem IF %ERRORLEVEL% NEQ 0 (ECHO %ERRORLEVEL% && GOTO ERROR)
ECHO PUT %Ferraillage%.pdf>>script.ftp
ECHO PUT %Coffrage%.pdf>>script.ftp
ECHO EXIT>>script.ftp


:LAUNCH
CD %WINSCPDIR%
%WINSCPPROMPT% %LAUNCHCOMMAND%

REM A enlever
CD %CURRENT_DIR%

:END
EXIT /b

:NOPARAMETER
ECHO PARAMETER(S) IS MISSING
ECHO ERROR LEVEL = %ERRORLEVEL%

:ERROR
ECHO SOMETHING WENT WRONG
ECHO ERROR LEVEL = %ERRORLEVEL%
EXIT /b