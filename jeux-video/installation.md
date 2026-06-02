---
label: Installation
icon: package
order: 100
---

<style>
  @media (max-width: 768px) {
    /* Verrouillage strict de la largeur de la page pour stopper le glissement */
    html, body {
      max-width: 100% !important;
      overflow-x: hidden !important;
      width: 100vw !important;
    }
  }
</style>

# Guide d'installation

Retrouvez ici toutes les étapes pour appliquer correctement notre patch de traduction sur votre jeu.

---

## Instructions pas-à-pas (PC)

1. **Accédez aux fichiers locaux du jeu :**
   * Dans votre bibliothèque Steam, faites un clic droit sur le jeu.
   * Survolez l'option **Gérer**, puis cliquez sur **Parcourir les fichiers locaux**.

2. **Ouvrez le dossier de données :**
   * Une fois dans le dossier du jeu, ouvrez le dossier nommé `windata`.

3. **Extrayez le patch :**
   * Ouvrez l'archive `.zip` du patch que vous avez téléchargée.
   * Extrayez (ou glissez-déposez) les fichiers `patch_body` et `patch_info` directement à l'intérieur du dossier `windata`.

4. **Lancez le jeu :**
   * C'est terminé ! Démarrez le jeu normalement, la traduction française sera active.

<hr style="width: 20%; margin: 30px auto; border: none; border-top: 2px solid var(--accent, #888888); opacity: 0.5;">

## Instructions pas-à-pas (Switch)

### Émulateur (Ryujinx)

*Note : Ce patch est conçu pour être joué comme un MOD LayeredFS pour Ryujinx. La configuration de Ryujinx est sous votre propre responsabilité. Une fois l'émulateur correctement configuré, suivez ces instructions pour charger le patch.*

1. **Accédez aux fichiers de mods :**
   * Faites un clic droit sur le jeu, puis sélectionnez **Open Mods Directory**.
   * Cela ouvrira une nouvelle fenêtre de l'explorateur pointant vers le dossier des mods du jeu sélectionné.

2. **Extrayez le patch :**
   * Ouvrez le fichier `.zip` du patch.
   * Extrayez le dossier `Quintalis STUDIO` vers le dossier des mods.

3. **Gérez les mods :**
   * Fermez les fenêtres de l'explorateur. 
   * De retour sur la liste des jeux, faites de nouveau un clic droit sur le jeu et sélectionnez **Manage Mods**.

4. **Activez le mod :**
   * Dans cette fenêtre, assurez-vous que le mod listé portant le même nom que le dossier extrait (`Quintalis STUDIO`) est bien coché. 
   * Vous saurez qu'il est activé lorsque l'accent de couleur à gauche de la liste est visible (comme indiqué sur l'image de référence).

5. **Lancez le jeu :**
   * Cliquez sur sauvegarder, puis démarrez le jeu. 
   * Si vous voyez des sous-titres sur la vidéo d'ouverture, le mod a été installé avec succès.

---

### Console Switch (CFW Atmosphere)

*Note : Jouer sur le matériel d'origine nécessite une Nintendo Switch équipée d'un CFW (Custom Firmware). L'installation du CFW est sous votre propre responsabilité.*

1. **Accédez au dossier système :**
   * Sur votre carte SD, naviguez jusqu'au répertoire `/atmosphere/contents`.

2. **Créez le dossier du jeu :**
   * Créez un dossier nommé `01005E9016BDE000` et ouvrez-le.

3. **Extrayez le patch :**
   * Ouvrez l'archive `.zip` du patch et entrez dans le dossier `Quintalis STUDIO`.
   * Extrayez le dossier `romfs` vers le dossier `01005E9016BDE000` que vous venez de créer.
  
4. **Lancez le jeu :**
   * C'est terminé ! Lancez simplement le jeu pendant que vous êtes sur le CFW Atmosphere.

---

:::center
**Un souci technique ?** [Consultez notre page des problèmes détectés](bug.md)
:::



