<div align="center">
  <img width="1460" height="349" alt="Image" src="https://github.com/user-attachments/assets/00b62be7-1d56-4f06-bdd7-b9b5e20349c8" />
<h1>🧬 Dr-quine </h1>
  <h2>Mon premier pas vers les programmes auto-réplicants</h2>
  <p align="center">
  <img src="https://img.shields.io/badge/C-00599C?style=for-the-badge&logo=c&logoColor=white" alt="C">
  <img src="https://img.shields.io/badge/Assembly%20NASM-000000?style=for-the-badge&logo=assembly&logoColor=white" alt="Assembly">
  <img src="https://img.shields.io/badge/Rust-000000?style=for-the-badge&logo=rust&logoColor=white" alt="Rust">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Status-Active-success.svg?style=flat-square" alt="Status">
</p>
</div>

Un projet complet pour découvrir l'auto-réplication informatique à travers le développement de Quines en C, Assembleur et Rust.

---

## 📚 Table des matières

- [Introduction](#-introduction)
  - [Qu'est-ce qu'une Quine ?](#-une-quine--cest-quoi-)
  - [Les règles du jeu](#-les-règles-du-jeu)
- [Architecture](#-architecture)
- [Les Exercices](#-les-exercices)
  - [Colleen](#1️⃣-colleen)
  - [Grace](#2️⃣-grace)
  - [Sully](#3️⃣-sully)
- [Bonus : Rust](#-bonus--rust)
- [Installation & Utilisation](#-installation--utilisation)

---

## 🌐 Introduction

### 🧬 Une Quine : c'est quoi ?

Une **Quine** est un programme informatique qui, lorsqu'il est exécuté, **imprime son propre code source** à l'identique, sans prendre aucune entrée.

Le concept tire son nom du philosophe et logicien *Willard Van Orman Quine*.
Hacker une Quine demande d'exploiter la manière dont les langages gèrent la manipulation des chaînes de caractères. Le programme doit en fait se diviser en deux parties formelles : un "code" et une "donnée" qui représente le code. 

```
┌────────────────┐      ┌────────────────┐
│ Code Source    │ ---> │  Exécution     │ ---> Sortie identique au code source !
│ (A = "A")      │      │  print(A)      │
└────────────────┘      └────────────────┘
```

#### 🎯 Les règles du jeu
Pour qu'un programme soit considéré comme une véritable Quine, les règles sont strictes :
- ❌ **Interdiction de lire le fichier source** (`open`, `read`, `cat`, etc., sont complètement proscrits).
- ❌ **Tricherie interdite** : un programme vide qui sort un résultat vide n'est pas une Quine.
- ✅ Il faut utiliser les spécificités de formatage de chaînes propres à chaque langage (`printf` et variables formatées, macros, etc.).

---

## 🏗️ Architecture

Le projet est hiérarchisé par niveau de langage (C, ASM, RUST), chacun incluant tout ou partie des sous-exercices :

```
dr-quine/
├── ASM/               # Implémentations bas niveau Assembleur (NASM)
│   ├── Colleen/
│   ├── Grace/
│   └── Sully/
├── C/                 # Implémentations en langage C
│   ├── Colleen/
│   ├── Grace/
│   └── Sully/
└── RUST/              # Implémentations en Rust (Bonus)
    ├── Colleen/
    └── Grace/
```

---

## 🧠 Les Exercices

### 1️⃣ Colleen
**Le but :** Créer une Quine basique avec des contraintes de structure explicites.
- Le programme doit contenir une fonction `main` et au moins **une autre fonction**.
- Il doit contenir **deux commentaires** à des endroits précis (un dans le main, un en dehors).
- L'exécution doit afficher **exactement** le contenu du fichier source `.c` (ou `.asm`, `.rs`).

### 2️⃣ Grace
**Le but :** Augmenter le niveau. Créer une Quine en passant par des macros et fichiers.
- Aucun `main()` déclaré n'a le droit de faire le travail de réplication directement.
- On doit utiliser exactement **3 macros** (ou l'équivalent selon le langage).
- Ne s'imprime pas sur la sortie standard (`stdout`), mais **écrit son code source** dans un nouveau fichier nommé `Grace_kid.c` (ou `.asm`, `.rs`).

### 3️⃣ Sully
**Le but :** La réplication virale en chaîne avec recomplilation.
- Le code source contient un entier `i` défini à `5`.
- À l'exécution, il copie son code source dans un fichier nommé `Sully_X.c` (où X est `i - 1`).
- Il **compile** ce nouveau fichier et l'**exécute** directement au sein de son propre processus.
- À l'exécution, `Sully_4` crée `Sully_3`, et ainsi de suite.
- L'inception s'arrête lorsque `i` atteint `0`.  

---

## 🦀 Bonus : RUST

Le langage de base du projet est traditionnellement le C et l'Assembleur. En bonus, j'ai introduit des implémentations de ces casse-têtes en **Rust**.
Je n'avais fais de Rust donc j'ai profité de ce projet pour me lancer et maitriser les fonctions basiques du langage (formatage, gestion de fichiers, etc.) tout en respectant les contraintes d'une Quine.
Écrire une Quine en Rust est redoutablement intéressant avec les contraintes strictes du compilateur (`rustc`), la gestion stricte du formatage avec la macro `format!`, et le respect des guillemets d'échappement sécurisés.Grace a cette exercice, j'ai envie de me plonger plus profondément dans Rust et d'explorer ses capacités qui est un mélange fascinant de puissance et de sécurité.

Ma plus grosse difficulté a été de trouver un moyen de faire le formatage de ma chaine de caractères avec print!. Je voulais utiliser print! comme en C mais le formatage de Rust est plus strict et ne permet pas d'utiliser des variables dans la chaine de formatage. J'ai du trouver une astuce pour contourner ce problème en utilisant la macro format! pour construire la chaine de caractères avant de l'imprimer.
Et egalement bloque le formatage d'une seul occurence de {:?} dans la chaine de formatage pour éviter que le code ne soit imprimé deux fois.C'est pour ca que en haut de la page, j'ai mis la definition de ma variable code qui contient la chaine de caractères du code source, et que j'utilise la fonction replacen pour remplacer seulement la première occurence de {:?} par le formatage de code lui même.

````rust
print!("{}", code.replacen("{:?}", &format!("{:?}", code), 1));
````
---

## 🚀 Installation & Utilisation

### 1️⃣ Clone le projet

```bash
git clone https://github.com/ton_pseudo/dr-quine.git
cd dr-quine
```

### 2️⃣ Test d'une implémentation

Chaque sous-dossier possède son `Makefile`.

**Exemple : Valider C - Colleen**
```bash
cd C/Colleen
make diff
# Si diff ne renvoie rien, la Quine est parfaite ! 👌
```

**Exemple : Valider C - Grace**
```bash
cd C/Grace
make diff
# Si diff ne renvoie rien, la Quine est parfaite ! 👌
```

**Exemple : Constater la contamination Sully**
```bash
cd C/Sully
make run (pour lancer l'armée de Sully)
make diff (pour lancer l'army de Sully et vérifier que les fichiers de base Sully.c est identiques à Sully_0.c)
# Si diff ne renvoie rien, la Quine est parfaite ! 👌 
```
