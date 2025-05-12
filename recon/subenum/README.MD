# subenum.sh

**subenum.sh** est un script Bash simple et efficace pour effectuer une énumération de sous-domaines en mode reconnaissance (`passive` + `active`) dans un contexte de bug bounty ou de pentest.

---

## Fonctionnalités

- Récupération passive des sous-domaines via [crt.sh](https://crt.sh/)
- Optionnel : ajout des résultats via [`subfinder`](https://github.com/projectdiscovery/subfinder) (si installé)
- Nettoyage des doublons
- Vérification de la disponibilité des sous-domaines :
  - via [`httpx`](https://github.com/projectdiscovery/httpx) (si installé)
  - sinon via `curl` (fallback)

---

## Arborescence des résultats
recon/
└── domain.com/
├── subs.txt       # Tous les sous-domaines trouvés
├── alive.txt      # Sous-domaines actifs
└── dead.txt       # Sous-domaines inactifs (curl fallback uniquement)
---

## Dépendances

Certaines fonctionnalités utilisent les outils suivants **si disponibles** :

- `jq` (obligatoire)
- `subfinder` (optionnel)
- `httpx` (optionnel)
- `curl` (fallback)

> Installe-les avec `apt`, `brew`, ou `go install` selon ta distrib.

---

## Utilisation

```bash
chmod +x subenum.sh
./subenum.sh domain.com
```
Exemple
```bash
./subenum.sh example.com
```

## Avertissement

Ce script est à usage éducatif et légal uniquement. Toujours avoir l’autorisation explicite du propriétaire du domaine avant de lancer des opérations de reconnaissance.

⸻

## Auteur

Développé dans un cadre de formation offensive pour bug bounty par une passionnée de cybersécurité.