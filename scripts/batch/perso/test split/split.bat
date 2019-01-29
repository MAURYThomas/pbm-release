@echo off
set Data_PATH=\\SRV-SPVMSQL\Data_Etudes\Commandes




set fileC=Coffrage.path
for /f "tokens=5 delims=\" %%i in (%fileC%) do (
    echo Coffrage %%~n%i
    set Coffrage=%%~n%i
)


set fileF=Ferraillage.path
for /f "tokens=5 delims=\" %%i in (%fileF%) do (
    echo Ferraillage %%~n%i
    set Ferraillage=%%~n%i
)

REM Découpe du nom de fichier pour créer l'arborescence
set fileP=Pattern.file
:Feraillage_PATH
echo %Ferraillage%>Pattern.file
set token=1
set temp=1
GOTO LOOP

:Coffrage_PATH
echo %Coffrage%>Pattern.file
set token=1
set temp=0
GOTO LOOP



:LOOP
if %token% LEQ 4 (
    for /f "tokens=%token% delims=-" %%i in (%fileP%) do (
        echo pattern%token%%temp% : %%i
        REM Ex: pattern41 = Token(4)Ferraillage(1)      ||      pattern20 = Token(2)Coffrage(0)
        set pattern%token%%temp%=%%i
    )
    set /a token+=1
    GOTO LOOP
)
if %temp% EQU 1 GOTO Coffrage_PATH

REM Traduction du Plan en REP (Plan1 --> REP-1) pour le chemin d'accès

%pattern20:~4%
%pattern21:~4%

echo rep : %pattern20%
echo rep : %pattern21%


set FILE_PATH_COFF=%Data_PATH%\%pattern10%\Produits\REP-%pattern20:~4%\%pattern40%
set FILE_PATH_FERR=%Data_PATH%\%pattern11%\Produits\REP-%pattern21:~4%\%pattern41%

echo COFF : %FILE_PATH_COFF%
echo FERR : %FILE_PATH_FERR%
Rem Avec : 110000004-Plan1-COFF-Rev_0
Rem doit être : Commandes\110000004\produits\REP-1\REV_0\110000004-Plan1-COFF-Rev_0.pdf