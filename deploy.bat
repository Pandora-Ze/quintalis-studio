@echo off
title Deploy Quintalis Studio
echo ===========================================
echo   DEPLOIEMENT AUTOMATIQUE QUINTALIS STUDIO
echo ===========================================
echo.

:: Étape 1 : Ajout des fichiers
echo [+] Ajout des modifications...
git add .

:: Étape 2 : Saisie du message de commit
echo.
set /p msg="Entrez le nom de la modif (ex: Maj Chapitre 1) : "

:: Si tu appuies sur Entree sans rien ecrire, il met un message par defaut
if "%msg%"=="" set msg="Mise a jour sans nom"

echo.
echo [+] Validation des fichiers...
git commit -m "%msg%"

:: Étape 3 : Envoi vers GitHub
echo.
echo [+] Envoi vers GitHub...
git push origin main

echo.
echo ===========================================
echo   ENVOI REUSSI ! Le site se met a jour...
echo ===========================================
pause