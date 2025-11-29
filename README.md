## Structure du projet

Le projet est organisé de manière claire :

- **main.tf** — contient la déﬁnition du provider MinIO et des ressources (bucket + fichiers statiques)
- **variables.tf** — déclare toutes les variables utilisées  
- **terraform.tfvars** *(non versionné)* — contient les secrets (serveur, identifiants, nom du bucket)
- **index.html** — page HTML déployée dans MinIO  
- **style.css** — feuille de style associée  
- **outputs.tf** — permet d’afficher les URLs utiles après déploiement  
- **.gitignore** — empêche de versionner les fichiers sensibles ou internes
- **README.md** — documentation du projet

---

## Déroulement du TP

### 1. Mise en place de MinIO
- Exécution du serveur MinIO en local  
- Accès à la console : `http://127.0.0.1:9001`  
- Connexion avec les identifiants par défaut : `minioadmin / minioadmin`  
- Création automatique du bucket via OpenTofu

### 2. Mise en place du projet OpenTofu
- Initialisation du projet (`tofu init`)  
- Ajout du fournisseur MinIO  
- Séparation claire entre :
  - la configuration (`main.tf`)  
  - les variables (`variables.tf`)  
  - les secrets (`terraform.tfvars`)  
- Respect de la structure recommandée pour un projet IaC

### 3. Déploiement du site statique
- Le bucket MinIO est créé automatiquement  
- Les fichiers `index.html` et `style.css` sont envoyés dans le bucket  
- Le site devient accessible via :  
  `http://127.0.0.1:9000/webbucket/index.html`

Commandes principales utilisées :  
```
tofu init
tofu plan
tofu apply
```

---

## Sécurité (Étape 3.6)

L’objectif était de permettre l’accès public uniquement aux fichiers nécessaires au site.  
Actions réalisées :

- Les **identifiants MinIO** sont stockés dans `terraform.tfvars` (non versionné)  
- Le `.gitignore` bloque correctement :
  - `.terraform/`
  - `terraform.tfstate*`
  - `terraform.tfvars`
- Le bucket contient uniquement les fichiers du site, aucun fichier sensible  
- L’accès public sert uniquement à lire les fichiers HTML/CSS  
- L’infrastructure respecte la consigne du TP :  
  **“seuls les fichiers importants doivent être accessibles.”**

---

## Reproductibilité avec IaC (Étape 3.7)

L’infrastructure a été testée pour vérifier sa reproductibilité :

### Suppression complète :
```
tofu destroy
```

### Recréation automatique :
```
tofu apply
```

Résultat :  
✔ Le bucket est recréé  
✔ Les fichiers HTML/CSS sont réimportés  
✔ Le site refonctionne immédiatement  
-> La reproductibilité IaC est validée

---

## Gestion Git & GitHub

Le projet suit les bonnes pratiques Git :

- Aucun secret n’est versionné  
- Aucun fichier interne Terraform n’est stocké dans GitHub  
- Le repo est propre et lisible pour l’enseignant  
- Le projet est disponible ici :  
  👉 https://github.com/makhlouf2001/tp1-cloud-minio

---

## 🖼️ Capture d’écran MinIO
<img width="1910" height="571" alt="image" src="https://github.com/user-attachments/assets/df369597-f0c1-4eab-9884-5d4ce3001e18" />
