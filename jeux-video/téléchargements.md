---
label: Téléchargements
icon: download
order: 200
---

<style>
  @media (max-width: 768px) {
    /* 1. Le même CSS anti-décalage que la page d'avant */
    html, body {
      max-width: 100vw !important;
      overflow-x: hidden !important;
    }

    /* Empêche le long titre de se couper en deux */
    h1 {
      word-break: normal !important;
      overflow-wrap: normal !important;
    }

    /* 3. Le même ciblage exact que la page d'avant */
    .mobile-tabs-fix > div > div:first-child,
    .mobile-tabs-fix > retype-tabs > div:first-child,
    .mobile-tabs-fix [role="tablist"] {
      display: flex !important;
      flex-direction: row !important;
      flex-wrap: nowrap !important;
      overflow-x: auto !important;
      max-width: 100vw !important;
      -webkit-overflow-scrolling: touch !important;
      padding-bottom: 10px !important;
    }

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

Attention : plusieurs liens de téléchargements vous sont proposés, ainsi que différentes plateformes. Veillez-bien à télécharger les fichiers correspondant à votre plateforme (PC/Switch)

---

::: div {.mobile-tabs-fix}
+++ Memories of a Quintessential Summer
![](static/soon.png)
+++ Five Memories Spent With You
[!button text="Télécharger le patch PC (local)" icon="custom-jeu" variant="success" color="#8b5cf6" size="l"](https://quintalis-studio.emcloudhost.fr/patchs_manuels/Patch_VF_v1.2.zip) [!badge variant="question" text="v1.2"]

[!button target="blank" text="Téléchargement alternatif PC (via MEGA)" icon="custom-mega" variant="success" color="#8b5cf6" size="l"](https://mega.nz/file/peslka6A#KSsYCY9pWuJbbrqieAj8LvIBFFFh_viusE5ztGyfAqY) [!badge variant="question" text="v1.2"]

[!button text="Télécharger le patch Switch (local)" icon="custom-jeu" variant="danger" color="#8b5cf6" size="l"](https://quintalis-studio.emcloudhost.fr/patchs_manuels/Patch_VF_Switch_v1.0.zip) [!badge variant="question" text="v1.0"]

[!button target="blank" text="Téléchargement alternatif Switch (via MEGA)" icon="custom-mega" variant="danger" color="#8b5cf6" size="l"](https://mega.nz/file/0eNilJAb#yF2qdzSDXTSGh2MjZPDnTbPHYHd-k-qFa2RbbUeiA0s) [!badge variant="question" text="v1.0"]

Assurez vous d'avoir toujours la dernière version en date afin de profiter d'une expérience de jeu optimale.


[Consulter le patch note pour ce jeu](static/patch-note-fmswy.txt){download="patch-note-fmswy.txt"} (version PC uniquement)

==- Informations du patch Switch
La version actuelle (soit la 1.0) ne comprends, pour l'instant, que le scénario et quelques autres textes de traduits. L'interface et les menus sont toujours en anglais. Cela sera corrigé lors de la version final du patch pour cette plateforme (si aucun bug n'est à survenir) : la 1.1. Cette dernière sortira lorsque la post-production du patch PC sera entièrement terminée car étant plus simple à développer et à tester.

Merci de votre compréhension.
===

+++ Five Promises Exchanged with Her
![](static/soon.png)
+++ The Quintessential Princess
![](static/soon.png)
+++
:::

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
  /* Le même script d'urgence de la page d'avant ! */
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
            el.style.setProperty('max-width', '100vw', 'important');
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