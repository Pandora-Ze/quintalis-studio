:prod
cls
echo =======================================================
echo   PASSAGE EN PRODUCTION (SITE OFFICIEL)
echo =======================================================
echo.
echo Attention : Cela va mettre a jour le site officiel en ligne !
pause
echo.

echo [+] Sauvegarde automatique des changements en cours...
git add -A
git commit -m "[AUTO] Derniers ajustements avant passage en prod" >nul 2>&1

echo [+] Bascule sur la branche MAIN...
git checkout main
if %errorlevel% neq 0 (
    echo.
    echo [ERREUR] Impossible de basculer sur main !
    echo Verifie que tu n'as pas de conflit ou de fichier verrouille.
    pause
    goto menu
)

echo [+] Recuperation de la derniere version en ligne de MAIN...
git pull origin main

echo [+] Fusion des ajouts de la branche DEV...
git merge dev --no-edit
if %errorlevel% neq 0 (
    echo.
    echo [ERREUR] Conflit de fusion detecte entre dev et main !
    pause
    goto menu
)

echo.
echo [+] Envoi de la version officielle sur GitHub...
git push origin main
if %errorlevel% neq 0 (
    echo.
    echo [ERREUR] Le push vers origin main a echoue !
    pause
    goto menu
)

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