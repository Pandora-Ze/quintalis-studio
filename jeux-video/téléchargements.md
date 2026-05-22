---
label: Téléchargements
icon: download
order: 200
---

<style>
  @media (max-width: 768px) {
    /* Sécurité absolue avec 100% au lieu de 100vw pour éviter d'écraser le texte */
    html, body {
      max-width: 100% !important;
      overflow-x: hidden !important;
    }

    /* On interdit formellement au titre de couper les mots au milieu */
    h1 {
      word-break: normal !important;
      overflow-wrap: normal !important;
    }

    /* Ciblage structurel de la barre d'onglets Retype */
    .mobile-tabs-fix > div > div:first-child,
    .mobile-tabs-fix > retype-tabs > div:first-child,
    .mobile-tabs-fix [role="tablist"] {
      display: flex !important;
      flex-direction: row !important;
      flex-wrap: nowrap !important;
      overflow-x: auto !important;
      max-width: 100% !important;
      -webkit-overflow-scrolling: touch !important;
      padding-bottom: 10px !important;
    }

    /* On protège les titres des onglets pour ne pas qu'ils s'écrasent */
    .mobile-tabs-fix > div > div:first-child > *,
    .mobile-tabs-fix > retype-tabs > div:first-child > *,
    .mobile-tabs-fix [role="tablist"] > * {
      flex-shrink: 0 !important;
      white-space: nowrap !important;
      display: inline-block !important;
    }
  }
</style>

# Téléchargements des Patchs

Retrouvez ici les liens officiels pour nos traductions. Tous nos patchs sont testés avant publication et garantis sans virus.

Attention : les patch sont disponible uniquement pour une version PC du jeu. Une version Switch/PS4 pourrait être envisagée, mais cela se fera si la demande vient avec, étant donné la différence globale de la façon dont sont organisés les fichiers type "DLC".

---

:::: div {.mobile-tabs-fix}
+++ Memories of a Quintessential Summer
![](static/soon.png)
+++ Five Memories Spent With You
:::grid {cols=2 gap=4}
[!button text="Télécharger le patch (local)" icon="custom-jeu" variant="info" color="#8b5cf6" size="l"](https://quintalis-studio.emcloudhost.fr/patchs_manuels/Patch_VF_v1.1.zip) [!badge variant="question" text="v1.1"]

[!button target="blank" text="Téléchargement alternatif via MEGA" icon="custom-mega" variant="info" color="#8b5cf6" size="l"](https://mega.nz/file/pPVhCT4b#3XovVIYXdghuBCO4xWncRpYSwDwmv9mbyLJAnczYCZU) [!badge variant="question" text="v1.1"]

:::

Assurez vous d'avoir toujours la dernière version en date afin de profiter d'une expérience de jeu optimale.

<a href="\static\patchs\patch-note.txt" download="patch-note.txt">Consulter le patch note pour ce jeu</a>

+++ Five Promises Exchanged with Her
![](static/soon.png)
+++ The Quintessential Princess
![](static/soon.png)
+++
::::

---

## Projets à venir

:::list
- **Memories of a Quintessential Summer** : [!badge variant="warning" text="Phase d'analyse"]
- **Five Promises Exchanged with Her** : [!badge variant="danger" text="En attente"]
- **The Quintessential Princess** : [!badge variant="danger" text="En attente"]
:::

---

### Sécurité et Support
Tous nos fichiers sont scannés et vérifiés afin de garantir qu'aucun virus ne s'est glissé dedans. Si vous rencontrez un problème lors de l'extraction ou un bug en jeu, merci de nous le signaler sur notre [Serveur Discord](https://discord.gg/w4qK3RvCeg){target="blank"}.

En utilisant ce patch, vous garantissez que vous utilisez une version légale du jeu.

<script>
  /* Script d'urgence mis à jour pour respecter le max-width: 100% */
  window.addEventListener('DOMContentLoaded', () => {
    if (window.innerWidth <= 768) {
      const container = document.querySelector('.mobile-tabs-fix');
      if (container) {
        const elements = container.querySelectorAll('*');
        for (let el of elements) {
          const style = window.getComputedStyle(el);
          if ((style.display === 'flex' || style.display === 'inline-flex') && style.flexDirection === 'row') {
            el.style.setProperty('flex-wrap', 'nowrap', 'important');
            el.style.setProperty('overflow-x', 'auto', 'important');
            el.style.setProperty('max-width', '100%', 'important');
            el.style.setProperty('padding-bottom', '12px', 'important');
            
            Array.from(el.children).forEach(btn => {
              btn.style.setProperty('flex-shrink', '0', 'important');
              btn.style.setProperty('white-space', 'nowrap', 'important');
            });
            break;
          }
        }
      }
    }
  });
</script>