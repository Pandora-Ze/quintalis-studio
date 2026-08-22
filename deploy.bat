@echo off
title Quintalis Studio - Deploiement
:menu
cls
echo =======================================================
echo           QUINTALIS STUDIO - GESTION DU SITE
echo =======================================================
echo.
echo   [1] Deploiement TEST (Envoyer sur la branche DEV)
echo   [2] Publication OFFICIELLE (Envoyer sur la branche MAIN)
echo   [3] Tester en LOCAL (Apercu instantane sur ton PC)
echo   [4] Quitter
echo.
echo =======================================================
set /p choix="Fais ton choix [1, 2, 3 ou 4] : "

if "%choix%"=="1" goto dev
if "%choix%"=="2" goto prod
if "%choix%"=="3" goto local
if "%choix%"=="4" goto fin

echo.
echo Option invalide, recommence !
timeout /t 2 >nul
goto menu

:dev
cls
echo =======================================================
echo   DEPLOIEMENT TEST / PREVIEW (BRANCHE DEV)
echo =======================================================
echo.
git checkout -B dev
echo [+] Ajout des modifications...
git add -A
echo.
set /p msg="Description des changements (ex: Ajout fiche Gotoubun) : "
if "%msg%"=="" set msg="Mise a jour test"
echo.
echo [+] Creation du commit...
git commit -m "[DEV] %msg%"
echo.
echo [+] Envoi vers GitHub (Branche DEV)...
git push origin dev --force
echo.
echo =======================================================
echo   Apercu en ligne : https://dev.quintalis-studio.pages.dev
echo =======================================================
echo.
pause
goto menu

:prod
cls
echo =======================================================
echo   PASSAGE EN PRODUCTION (SITE OFFICIEL)
echo =======================================================
echo.
echo Attention : Cela va mettre a jour le site officiel en ligne !
pause
echo.
echo [+] Bascule sur MAIN et fusion de DEV...
git checkout main
git merge dev
echo.
echo [+] Envoi de la version officielle...
git push origin main
echo.
echo [+] Retour sur la branche DEV...
git checkout dev
echo.
echo =======================================================
echo   SUCCES ! Le site officiel est a jour.
echo =======================================================
echo.
pause
goto menu

:local
cls
echo =======================================================
echo   LANCEMENT DU SERVEUR LOCAL RETYPE
echo =======================================================
echo.
echo Ouvre ton navigateur sur : http://localhost:5000
echo Fais Ctrl + C dans cette fenetre pour arreter le serveur.
echo.
call npx retypeapp start
goto menu

:fin
exit