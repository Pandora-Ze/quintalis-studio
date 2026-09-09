@echo off
chcp 65001 >nul
setlocal
title Quintalis Studio - Gestionnaire de Branches

:menu
cls
set "CURRENT_BRANCH=Inconnue"
for /f "tokens=*" %%a in ('git rev-parse --abbrev-ref HEAD 2^>nul') do set "CURRENT_BRANCH=%%a"

echo =======================================================
echo          QUINTALIS STUDIO - GESTION DU REPO
echo =======================================================
echo   Branche active actuelle : [%CURRENT_BRANCH%]
echo =======================================================
echo.
echo   1. Basculer sur DEV  - Espace de travail et tests
echo   2. Basculer sur MAIN - Espace stable et site officiel
echo   7. Repasser de DEV vers MAIN - Sans rien publier
echo.
echo   3. Envoyer les modifs de [%CURRENT_BRANCH%] sur GitHub
echo   4. Publier DEV sur MAIN - Mise en ligne officielle
echo   5. Tester en local - http://localhost:5000
echo   6. Quitter
echo.
echo =======================================================
set "choix="
set /p "choix=Fais ton choix [1-7] : "

if "%choix%"=="1" goto switch_dev
if "%choix%"=="2" goto switch_main
if "%choix%"=="3" goto push_current
if "%choix%"=="4" goto merge_all
if "%choix%"=="5" goto run_local
if "%choix%"=="6" goto fin
if "%choix%"=="7" goto dev_to_main
goto menu

REM STREAMING_CHUNK:Handling branch switching routines...
:switch_dev
cls
echo --- Sauvegarde automatique de la branche actuelle...
git add -A
git diff-index --quiet HEAD || git commit -m "Sauvegarde auto avant bascule DEV"
echo.
echo --- Bascule vers DEV...
git checkout dev
if errorlevel 1 git checkout -b dev
echo.
echo =======================================================
echo   Branche DEV active. Tes fichiers sont prets.
echo =======================================================
pause
goto menu

:switch_main
cls
echo --- Sauvegarde automatique de la branche actuelle...
git add -A
git diff-index --quiet HEAD || git commit -m "Sauvegarde auto avant bascule MAIN"
echo.
echo --- Bascule vers MAIN et mise a jour...
git checkout main
if errorlevel 1 git checkout -b main
git pull origin main
echo.
echo =======================================================
echo   Branche MAIN active et synchronisee avec GitHub.
echo =======================================================
pause
goto menu

REM STREAMING_CHUNK:Executing commit and push operations...
:push_current
cls
echo =======================================================
echo   ENVOI EN LIGNE DE LA BRANCHE : [%CURRENT_BRANCH%]
echo =======================================================
echo.
git add -A
set "msg="
set /p "msg=Message de commit [Entree pour auto] : "
if "%msg%"=="" set "msg=Mise a jour sur %CURRENT_BRANCH%"
git commit -m "%msg%"
echo.
echo --- Envoi vers GitHub...
git push origin %CURRENT_BRANCH%
if errorlevel 1 goto err_push_current
echo.
echo =======================================================
if "%CURRENT_BRANCH%"=="main" goto msg_push_main
echo   Site de test mis a jour : https://dev.quintalis-studio.pages.dev
goto push_done

:msg_push_main
echo   Site officiel mis a jour : https://quintalis-studio.pages.dev

:push_done
echo =======================================================
pause
goto menu

:err_push_current
echo.
echo [ERREUR] L envoi vers GitHub a echoue.
pause
goto menu

REM STREAMING_CHUNK:Managing full merge from DEV to MAIN...
:merge_all
cls
echo =======================================================
echo   FUSION COMPLETE : DEV VERS MAIN
echo =======================================================
echo.
echo Attention : Tout ton chantier DEV va etre fusionne
echo dans MAIN et deploye sur le site officiel.
echo.
pause

echo.
echo --- [1/6] Nettoyage preventif...
git merge --abort >nul 2>nul

echo.
echo --- [2/6] Sauvegarde et envoi du chantier DEV...
git checkout dev
if errorlevel 1 goto err_dev
git add -A
git diff-index --quiet HEAD || git commit -m "Finalisation DEV avant publication"
git push origin dev
if errorlevel 1 goto err_push_dev

echo.
echo --- [3/6] Bascule sur la branche MAIN...
git checkout main
if errorlevel 1 goto err_main

echo.
echo --- [4/6] Synchronisation de MAIN avec GitHub...
git pull origin main

echo.
echo --- [5/6] Fusion de DEV dans MAIN...
git merge dev -m "Publication officielle des nouveautes DEV"
if errorlevel 1 goto err_merge

echo.
echo --- [6/6] Envoi de MAIN vers le site officiel...
git push origin main
if errorlevel 1 goto err_push_main

echo.
echo --- Retour automatique sur DEV...
git checkout dev

echo.
echo =======================================================
echo   SUCCES TOTAL ! Le site officiel a ete mis a jour.
echo   Cloudflare Pages compile la version en ligne (1-2 min).
echo   Tu es de retour sur DEV pour continuer a travailler.
echo =======================================================
pause
goto menu

:err_dev
echo.
echo [ERREUR] Impossible de basculer sur la branche dev.
pause
goto menu

:err_push_dev
echo.
echo [ERREUR] L envoi de la branche dev sur GitHub a echoue.
pause
goto menu

:err_main
echo.
echo [ERREUR CRITIQUE] Impossible de basculer sur main.
pause
goto menu

:err_merge
echo.
echo =======================================================
echo [CONFLIT DETECTE] Git a signale un conflit de fusion.
echo Fais 'git status' pour inspecter les fichiers en conflit.
echo Pour annuler, tape : git merge --abort
echo =======================================================
pause
goto menu

:err_push_main
echo.
echo [ERREUR] L envoi vers origin main a echoue.
pause
goto menu

REM STREAMING_CHUNK:Configuring local test server and quick backswitch...
:run_local
cls
echo =======================================================
echo   TEST EN LOCAL - RETYPE
echo =======================================================
echo.
echo Lancement du serveur Retype sur http://localhost:5000...
echo Pour arreter le serveur, fais Ctrl + C
echo.
call npx retypeapp start
goto menu

:dev_to_main
cls
echo =======================================================
echo   RETOUR RAPIDE : DEV VERS MAIN
echo =======================================================
echo.
if not "%CURRENT_BRANCH%"=="dev" goto not_on_dev
echo --- Sauvegarde automatique de DEV...
git add -A
git diff-index --quiet HEAD || git commit -m "Sauvegarde auto avant retour MAIN"
echo.
echo --- Bascule vers MAIN sans publier...
git checkout main
if errorlevel 1 git checkout -b main
git pull origin main
echo.
echo =======================================================
echo   Tu es revenu sur MAIN ! Rien n a ete publie.
echo =======================================================
pause
goto menu

:not_on_dev
echo Tu n es pas sur la branche DEV actuellement.
echo Branche active : %CURRENT_BRANCH%
pause
goto menu

:fin
exit /b