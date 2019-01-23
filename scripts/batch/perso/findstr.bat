@echo off
set path=C:\Users\thomas.maury\Documents\pbm-release\scripts\batch\3\Data_Etudes\Commandes\201803570\Produits\REP-1\Rev_0

echo %path%>command.path

echo DEBUT : %ERRORLEVEL%

FINDSTR /c:"Users" command.path
echo %ERRORLEVEL%