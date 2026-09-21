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
   * Faites un clic droit sur le jeu dans la liste de Ryujinx, puis sélectionnez **Open Mods Directory**.
   * Cela ouvre le dossier des mods dédié au jeu.

2. **Extrayez le patch :**
   * Ouvrez le fichier `.zip` du patch.
   * Glissez-déposez le dossier **`Quintalis STUDIO`** directement dans le dossier des mods.

!!! Attention au dossier parent (Émulateur)
Ne copiez **pas** directement le sous-dossier `romfs` à la racine des mods ! L'émulateur a impérativement besoin du dossier parent `Quintalis STUDIO` pour identifier le mod dans son menu.
!!!

```text
Dossier des Mods/
└── Quintalis STUDIO/
    └── romfs/
        └── (fichiers du patch...)
```

3. **Gérez les mods :**
   * Fermez l'explorateur de fichiers.
   * Sur Ryujinx, faites de nouveau un clic droit sur le jeu et sélectionnez **Manage Mods**.

4. **Activez le mod :**
   * Assurez-vous que la ligne **`Quintalis STUDIO`** est bien cochée.
   * L'indicateur de couleur à gauche valide son activation.

5. **Lancez le jeu :**
   * Cliquez sur **Save**, puis démarrez le jeu.
   * Si la cinématique d'introduction et les menus sont traduits, le patch est en place.

---

### Console Switch (CFW Atmosphere)

*Note : Jouer sur console d'origine nécessite une Nintendo Switch équipée d'un Custom Firmware (CFW). L'installation du CFW est sous votre propre responsabilité.*

1. **Accédez au répertoire système :**
   * Sur votre carte microSD, naviguez vers le dossier `/atmosphere/contents`.

2. **Créez le dossier du jeu (Title ID) :**
   * Créez un dossier nommé exactement `01005E9016BDE000` et ouvrez-le.

3. **Extrayez le contenu :**
   * Ouvrez l'archive `.zip` du patch et entrez dans le dossier `Quintalis STUDIO`.
   * Extrayez uniquement le sous-dossier **`romfs`** directement dans `01005E9016BDE000`.

!!! Piège classique (Console réelle)
Contrairement à l'émulateur, il ne faut **jamais** copier le dossier `Quintalis STUDIO` sur la console. Le dossier `romfs` doit se trouver directement sous le dossier du Title ID.
!!!

```text
SD Card/
└── atmosphere/
    └── contents/
        └── 01005E9016BDE000/
            └── romfs/
                └── (fichiers du patch...)
```

4. **Lancez le jeu :**
   * Réinsérez la carte microSD dans votre console, redémarrez sous Atmosphere et lancez le jeu.

---

:::center
**Un souci technique ?** [Consultez notre page des problèmes détectés](bug.md)
:::