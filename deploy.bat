@echo off
title Deploy Quintalis Studio
echo ===========================================
echo   DEPLOIEMENT AUTOMATIQUE QUINTALIS STUDIO
echo ===========================================
echo.

:: Étape 1 : Ajout des fichiers
echo [+] Ajout des modifications...
git add .

:: Étape 2 : Commit avec un message automatique (date et heure)
set current_date=%date% %time%
echo [+] Validation des fichiers (Commit)...
git commit -m "Mise a jour automatique du %current_date%"

:: Étape 3 : Envoi vers GitHub
echo [+] Envoi vers GitHub (Push)...
git push origin main

echo.
echo ===========================================
echo   TERMINE ! GitHub va deployer le site.
echo ===========================================
pause