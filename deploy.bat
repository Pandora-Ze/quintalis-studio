@echo off
title Deploy Quintalis Studio
echo ===========================================
echo    DEPLOIEMENT AUTOMATIQUE QUINTALIS STUDIO
echo ===========================================
echo.

:: Etape 1 : Ajout force de toutes les modifications
echo [+] Ajout des modifications...
git add -A

:: Etape 2 : Saisie du message de commit
echo.
set /p msg="Entrez le nom de la modif (ex: Maj Chapitre 1) : "
if "%msg%"=="" set msg="Mise a jour sans nom"

:: Etape 3 : Validation
echo.
echo [+] Validation des fichiers...
git commit -m "%msg%"

:: Etape 4 : Envoi vers GitHub
echo.
echo [+] Envoi vers GitHub...
git push origin main

echo.
echo ===========================================
echo    TERMINE !
echo ===========================================
pause