@echo off
title Quintalis Studio - Gestionnaire de Deploiement
:menu
cls
echo =======================================================
echo           QUINTALIS STUDIO - DEPLOIEMENT
echo =======================================================
echo.
echo   [1] PUBLIER EN DIRECT (Site officiel en public)
echo   [2] TESTER SUR DEV    (Site preview prive / test)
echo   [3] TESTER EN LOCAL   (Apercu instantane sur ton PC)
echo   [4] Quitter
echo.
echo =======================================================
set /p choix="Quel est ton choix [1, 2, 3 ou 4] ? : "

if "%choix%"=="1" goto prod
if "%choix%"=="2" goto dev
if "%choix%"=="3" goto local
if "%choix%"=="4" goto fin

echo.
echo Mauvais choix, recommence !
timeout /t 2 >nul
goto menu

:prod
cls
echo =======================================================
echo        MISE EN LIGNE DIRECTE (SITE OFFICIEL)
echo =======================================================
echo.
echo [+] Sauvegarde de toutes les modifications...
git add -A
echo.
set /p msg="Description de la mise a jour (ou appuie sur Entree) : "
if "%msg%"=="" set msg="Mise a jour officielle"
echo.
echo [+] Creation du commit...
git commit -m "%msg%"
echo.
echo [+] Envoi direct vers la branche MAIN...
git branch -M main
git push origin main --force
echo.
echo =======================================================
echo   SUCCES ! Le site officiel est a jour :
echo   https://quintalis-studio.pages.dev
echo =======================================================
echo.
pause
goto menu

:dev
cls
echo =======================================================
echo          DEPLOIEMENT TEST (BRANCHE DEV)
echo =======================================================
echo.
echo [+] Sauvegarde de toutes les modifications...
git add -A
echo.
set /p msg="Description du test (ou appuie sur Entree) : "
if "%msg%"=="" set msg="Test de fonctionnalite"
echo.
echo [+] Creation du commit de test...
git commit -m "[DEV] %msg%"
echo.
echo [+] Envoi vers la branche DEV...
git branch -M dev
git push origin dev --force
echo.
echo =======================================================
echo   SUCCES ! Apercu de test en cours :
echo   https://dev.quintalis-studio.pages.dev
echo =======================================================
echo.
pause
goto menu

:local
cls
echo =======================================================
echo            TEST EN LOCAL SUR TON PC
echo =======================================================
echo.
echo Ton site va s'ouvrir sur : http://localhost:5000
echo (Fais Ctrl + C dans cette fenetre pour arreter Retype)
echo.
call npx retypeapp start
goto menu

:fin
exit