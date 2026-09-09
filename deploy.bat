@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
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
echo   [1] Basculer sur DEV  - Espace de travail et tests
echo   [2] Basculer sur MAIN - Espace stable et site officiel
echo   [7] Repasser de DEV vers MAIN - Retour rapide sans publier
echo   [8] Mettre a jour DEV avec MAIN - Evite les divergences
echo.
echo   [3] Envoyer les modifs en ligne sur %CURRENT_BRANCH%
echo   [4] Fusionner DEV vers MAIN - Publier tout le chantier
echo   [5] Tester en local - localhost:5000
echo   [6] Quitter
echo.
echo =======================================================
set "choix="
set /p choix="Fais ton choix [1-8] : "

if "%choix%"=="1" goto switch_dev
if "%choix%"=="2" goto switch_main
if "%choix%"=="3" goto push_current
if "%choix%"=="4" goto merge_all
if "%choix%"=="5" goto run_local
if "%choix%"=="7" goto dev_to_main
if "%choix%"=="8" goto sync_dev
if "%choix%"=="6" goto fin
goto menu

:switch_dev
cls
echo [+] Sauvegarde automatique de la branche actuelle...
git add -A
git diff-index --quiet HEAD || git commit -m "[AUTO-SAVE] Avant bascule sur DEV"
echo.
echo [+] Bascule vers DEV...
git checkout dev
if errorlevel 1 git checkout -b dev
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
echo [+] Bascule vers MAIN et synchronisation avec GitHub...
git checkout main
if errorlevel 1 git checkout -b main
git pull origin main
echo.
echo =======================================================
echo   Tu es maintenant sur MAIN ! Ton dossier est propre
echo   et synchronise avec le site officiel.
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
set "msg="
set /p msg="Message de commit (ou Entree pour message auto) : "
if "%msg%"=="" set msg=Mise a jour sur %CURRENT_BRANCH%
git commit -m "%msg%"
echo.
echo [+] Envoi vers GitHub (origin %CURRENT_BRANCH%)...
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
echo [!] ERREUR : L'envoi vers GitHub a echoue.
pause
goto menu

:merge_all
cls
echo =======================================================
echo   FUSION COMPLETE : DEV VERS MAIN
echo =======================================================
echo.
echo Attention : Tout ton chantier DEV va etre fusionne dans MAIN
echo et publie sur le site officiel.
echo.
pause

echo.
echo [+] [1/6] Nettoyage preventif de fusions bloquees...
git merge --abort >nul 2>nul

echo.
echo [+] [2/6] Sauvegarde et envoi du chantier DEV...
git checkout dev
if errorlevel 1 goto err_dev
git add -A
git diff-index --quiet HEAD || git commit -m "Finalisation DEV avant merge"
git push origin dev
if errorlevel 1 goto err_push_dev

echo.
echo [+] [3/6] Bascule sur la branche MAIN...
git checkout main
if errorlevel 1 goto err_main

echo.
echo [+] [4/6] Synchronisation de MAIN avec GitHub...
git pull origin main

echo.
echo [+] [5/6] Fusion de DEV dans MAIN...
git merge dev -m "Publication officielle des nouveautes DEV"
if errorlevel 1 goto err_merge

echo.
echo [+] [6/6] Envoi de MAIN vers le site officiel...
git push origin main
if errorlevel 1 goto err_push_main

echo.
echo [+] Retour automatique sur la branche DEV...
git checkout dev

echo.
echo =======================================================
echo   SUCCES TOTAL ! Le site officiel a ete mis a jour.
echo   Cloudflare Pages compile la version en ligne (1 a 2 min).
echo   Tu es revenu sur DEV pour continuer ton travail.
echo =======================================================
pause
goto menu

:err_dev
echo.
echo [!] ERREUR : Impossible de basculer sur dev.
pause
goto menu

:err_push_dev
echo.
echo [!] ERREUR : L'envoi de la branche dev a echoue.
pause
goto menu

:err_main
echo.
echo [!] ERREUR CRITIQUE : Impossible de basculer sur main.
echo     Des fichiers non suivis bloquent peut-etre le passage.
pause
goto menu

:err_merge
echo.
echo =======================================================
echo [!] CONFLIT DE FUSION DETECTE PAR GIT !
echo =======================================================
echo Des fichiers ont ete modifies a la fois sur DEV et sur MAIN.
echo Fais 'git status' pour voir les fichiers marques en conflit.
echo Pour annuler et revenir en arriere, tape : git merge --abort
echo =======================================================
pause
goto menu

:err_push_main
echo.
echo [!] ERREUR : L'envoi vers origin main a echoue !
pause
goto menu

:run_local
cls
echo =======================================================
echo   TEST EN LOCAL - REPASSE SUR MAIN
echo =======================================================
echo.
echo [+] Sauvegarde automatique de la branche actuelle...
git add -A
git diff-index --quiet HEAD || git commit -m "[AUTO-SAVE] Avant bascule sur MAIN pour test local"
echo.
echo [+] Bascule vers MAIN...
git checkout main
if errorlevel 1 git checkout -b main
git pull origin main
echo.
echo =======================================================
echo   Tu es maintenant sur MAIN. Lancement du serveur...
echo =======================================================
echo.
echo Lancement du serveur Retype sur http://localhost:5000...
echo Pour arreter le serveur, fais Ctrl + C
call npx retypeapp start
goto menu

:dev_to_main
cls
echo =======================================================
echo   RETOUR RAPIDE : DEV VERS MAIN
echo =======================================================
echo.
if not "%CURRENT_BRANCH%"=="dev" goto not_on_dev
echo [+] Sauvegarde automatique de DEV...
git add -A
git diff-index --quiet HEAD || git commit -m "[AUTO-SAVE] Avant retour rapide DEV vers MAIN"
echo.
echo [+] Retour vers MAIN sans rien publier...
git checkout main
if errorlevel 1 git checkout -b main
git pull origin main
echo.
echo =======================================================
echo   Tu es revenu sur MAIN depuis DEV ! Rien n'a ete publie.
echo =======================================================
pause
goto menu

:not_on_dev
echo [!] Tu n'es pas sur DEV actuellement.
echo     Branche active : %CURRENT_BRANCH%
echo     Cette option est prevue uniquement pour revenir de DEV vers MAIN.
pause
goto menu

:sync_dev
cls
echo =======================================================
echo   MISE A JOUR DE DEV AVEC MAIN
echo =======================================================
echo.
echo Ceci recupere les derniers changements de MAIN et les
echo fusionne dans DEV, pour eviter que les deux branches
echo divergent trop l'une de l'autre.
echo.

echo [+] [1/5] Sauvegarde du travail en cours sur %CURRENT_BRANCH%...
git add -A
git diff-index --quiet HEAD || git commit -m "[AUTO-SAVE] Avant synchronisation DEV avec MAIN"

echo.
echo [+] [2/5] Bascule sur MAIN et synchronisation avec GitHub...
git checkout main
if errorlevel 1 goto err_sync_main
git pull origin main

echo.
echo [+] [3/5] Bascule sur DEV...
git checkout dev
if errorlevel 1 goto err_sync_dev

echo.
echo [+] [4/5] Fusion de MAIN dans DEV...
git merge main --no-edit
if errorlevel 1 goto err_sync_merge

echo.
echo [+] [5/5] Envoi de DEV mis a jour vers GitHub...
git push origin dev
if errorlevel 1 goto err_sync_push

echo.
echo =======================================================
echo   SUCCES ! DEV est maintenant a jour avec MAIN.
echo =======================================================
pause
goto menu

:err_sync_main
echo.
echo [!] ERREUR : Impossible de basculer sur MAIN.
pause
goto menu

:err_sync_dev
echo.
echo [!] ERREUR : Impossible de basculer sur DEV.
pause
goto menu

:err_sync_merge
echo.
echo =======================================================
echo [!] CONFLIT DE FUSION DETECTE PAR GIT !
echo =======================================================
echo Des fichiers ont ete modifies differemment sur DEV et MAIN.
echo Fais 'git status' pour voir les fichiers en conflit.
echo Pour annuler et revenir en arriere, tape : git merge --abort
echo =======================================================
pause
goto menu

:err_sync_push
echo.
echo [!] ERREUR : L'envoi de DEV vers GitHub a echoue.
pause
goto menu

:fin
exit /b