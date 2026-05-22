---
label: Problèmes détectés
icon: alert
order: 70
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

# Problèmes détectés et Solutions

Malgré tous nos tests, il est possible que des coquilles ou des bugs se glissent dans nos patchs. Retrouvez ici la liste des problèmes connus et les solutions fréquentes.

---

## Bugs connus 

==- Five Memories Spent With You

Voici la liste des problèmes actuellement étudiés par l'équipe sur la version actuelle du patch :

<div style="text-align: center;">

[!badge variant="success" text="Résolu et en attente d'implémentation"]

</div>

- Correction des guillemets apparaissants dans la voie d'Ichika
- Lettre manquante lors d'une phrase de Nino au niveau de la remise des diplômes
- Sous-titres des vidéos touristiques maintenant lisibles

<div style="text-align: center;">

[!badge variant="warning" text="En cours"]

</div>

- Route des Quintuplées en cours de traduction. Sortie prévue pour la v1.2
- Au niveau des choix, le texte est resté en anglais (même si la phrase d'origine est bien en français)


<div style="text-align: center;">


[!badge variant="danger" text="Signalés"]

</div>

- Allignements des textes en jeu

===

---

## Dépannage fréquent (FAQ)

Si votre jeu ne fonctionne pas correctement, vérifiez ces solutions avant de nous contacter :

==- Le jeu est toujours en Anglais / Japonais après l'installation
C'est le problème le plus courant. Cela signifie que les fichiers n'ont pas été placés au bon endroit.
1. Assurez-vous d'avoir extrait le contenu de l'archive **à l'intérieur** du dossier `windata`.
2. Si vous mettez à jour votre patch, Windows doit obligatoirement vous demander de **"Remplacer les fichiers existants"**. Si ce n'est pas le cas, c'est que vous avez créé un sous-dossier inutile.
3. Si c'est la première fois que vous ouvrez le jeu, les réglages peuvent faire que la langue par défaut est le japonais ou le chinois. Dans ce cas, vous allez devoir changer la langue du jeu par vous même dans les Paramètres. Utilisez votre téléphone avec une application de traduction de texte pour trouver votre chemin.
===

==- Le jeu crash à un moment précis
Si le jeu se ferme tout seul lors d'une ligne de dialogue spécifique, c'est probablement lié à une erreur dans notre code de traduction (une balise manquante, par exemple). Notez bien le moment précis (chapitre, personnage qui parle) et venez nous le signaler !
===

==- Le jeu indique des fichiers .dll manquants
Cette erreur est souvent présente quand vous installez une version crackée du jeu. En effet, Steam télécharge automatiquement les librairies pour que le jeu fonctionne correctement. 
Si cette erreur vous arrive, rendez-vous sur la <a href="https://www.microsoft.com/fr-fr/download/details.aspx?id=35" target="_blank" rel="noopener noreferrer" style="color: #5297f0; text-decoration: underline;">page officielle de Microsoft</a> pour télécharger les librairies requises au bon fonctionnement du jeu.
===

---

## Signaler un nouveau bug

Vous avez trouvé un problème qui n'est pas listé ici ? Votre aide est précieuse ! 

Pour le signaler efficacement, essayez de fournir :
* Une capture d'écran du problème.
* La version du patch que vous utilisez.
* Le contexte exact (à quel moment cela s'est produit).

[!button target="blank" text="Signaler le bug sur notre Discord" icon="comment-discussion" variant="danger"](https://discord.gg/w4qK3RvCeg)