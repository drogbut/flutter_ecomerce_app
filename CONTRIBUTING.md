# 🛠️ Guide de contribution au projet

Merci de contribuer à ce projet ! Afin de garantir un développement propre, cohérent et sans conflit, merci de suivre les règles ci-dessous.

---

## 🔀 Flux de travail Git (Git Flow)

Nous utilisons un modèle simple basé sur deux branches principales :

- `main` : contient uniquement le code **stable en production**. Elle est **protégée** — **aucun push direct n’est autorisé**.
- `develop` : branche de développement active. Toutes les nouvelles fonctionnalités et corrections passent par ici.

---

## 🧑‍💻 Comment contribuer

### 1. Créer une branche à partir de `develop`
Nomme ta branche selon le type de tâche :

- `feature/ma-nouvelle-fonctionnalite`
- `bugfix/corriger-un-bug`
- `hotfix/urgence-si-besoin`

Exemple :
```bash
git checkout develop
git pull origin develop
git checkout -b feature/ajout-login

### 1. Pousser ta branche et créer une Pull Request vers develop
```bash
git push origin feature/ajout-login

Puis, crée une PR vers develop.

⚠️ Ne crée jamais de PR vers main sauf cas exceptionnel (hotfix validé).
