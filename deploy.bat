@echo off
setlocal enabledelayedexpansion
title Quintalis Studio - Gestionnaire de Branches

:menu
cls
for /f "tokens=*" %%a in ('git rev-parse --abbrev-ref HEAD 2^>nul') do set CURRENT_BRANCH=%%a
if "%CURRENT_BRANCH%"=="" set CURRENT_BRANCH=Inconnue

echo =======================================================
echo          QUINTALIS STUDIO - GESTION DU REPO
echo =======================================================
echo   Branche active actuelle : [%CURRENT_BRANCH%]
echo =======================================================
echo.
echo   [1] Basculer sur DEV  (Espace de travail / Tests)
echo   [2] Basculer sur MAIN (Espace stable / Site officiel)
echo.
echo   [3] Envoyer les modifs en ligne (Sur la branche [%CURRENT_BRANCH%])
echo   [4] Fusionner DEV dans MAIN (Publier tout le chantier)
echo   [5] Tester en local (localhost:5000)
echo   [6] Quitter
echo.
echo =======================================================
set /p choix="Fais ton choix [1-6] : "

if "%choix%"=="1" goto switch_dev
if "%choix%"=="2" goto switch_main
if "%choix%"=="3" goto push_current
if "%choix%"=="4" goto merge_all
if "%choix%"=="5" goto run_local
if "%choix%"=="6" goto fin
goto menu

:switch_dev
cls
echo [+] Sauvegarde automatique de la branche actuelle...
git add -A
git diff-index --quiet HEAD || git commit -m "[AUTO-SAVE] Avant bascule sur DEV"
echo.
echo [+] Bascule vers DEV...
git checkout dev 2>nul || git checkout -b dev
echo.
echo =======================================================
echo   Tu es maintenant sur DEV ! Tes fichiers de dev
echo   sont charges sur ton disque dur.
echo =======================================================
pause
goto menu

:switch_main
cls
echo [+] Sauvegarde automatique de la branche actuelle...
git add -A
git diff-index --quiet HEAD || git commit -m "[AUTO-SAVE] Avant bascule sur MAIN"
echo.
echo [+] Bascule vers MAIN...
git checkout main 2>nul || git checkout -b main
git pull origin main 2>nul
echo.
echo =======================================================
echo   Tu es maintenant sur MAIN ! Ton dossier est propre
echo   et identique au site officiel.
echo =======================================================
pause
goto menu

:push_current
cls
echo =======================================================
echo   PUBLICATION DE LA BRANCHE ACTIVE : [%CURRENT_BRANCH%]
echo =======================================================
echo.
git add -A
set /p msg="Message de commit (ou Entree) : "
if "%msg%"=="" set msg="Mise a jour sur %CURRENT_BRANCH%"
git commit -m "%msg%"
git push origin %CURRENT_BRANCH%
echo.
echo =======================================================
if "%CURRENT_BRANCH%"=="main" (
    echo   Site officiel mis a jour : https://quintalis-studio.pages.dev
) else (
    echo   Site de test mis a jour : https://dev.quintalis-studio.pages.dev
)
echo =======================================================
pause
goto menu

:merge_all
cls
echo =======================================================
echo   FUSION COMPLETE : DEV -> MAIN
echo =======================================================
echo.
echo Attention : Cela va envoyer TOUT ton chantier DEV sur le site officiel !
pause
git checkout dev
git add -A
git diff-index --quiet HEAD || git commit -m "Finalisation DEV avant merge"
git checkout main
git pull origin main 2>nul
git merge dev -m "Publication officielle des nouveautes DEV"
git push origin main
git checkout dev
echo.
echo =======================================================
echo   SUCCES ! Tout est publie sur le site officiel.
echo   Tu es revenu automatiquement sur DEV pour continuer.
echo =======================================================
pause
goto menu

:run_local
cls
echo Lancement du serveur Retype sur http://localhost:5000...
echo (Fais Ctrl + C pour quitter)
call npx retypeapp start
goto menu

:fin
exit