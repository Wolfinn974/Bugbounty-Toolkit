# ReconAuto

**ReconAuto** est un script Bash simple d'automatisation de reconnaissance de domaine.  
Il effectue les premières étapes classiques d'une phase de recon passive/active en créant une arborescence propre pour stocker les résultats.

---

## Fonctionnalités

- Whois
- Résolution DNS (dig)
- Lookup DNS (nslookup)
- Ping
- Résolution d'hôtes (host)
- Création automatique de dossiers `recon/<domaine>`

---

## Utilisation

```bash
./ReconAuto.sh domain.com
```

## Dépendances

Le script utilise des commandes standard UNIX :
	•	whois
	•	dig
	•	nslookup
	•	ping
	•	host

## OUTPUT
```bash
[***] WHOIS
[***] DIG
IP found: 93.184.216.34
[***] NSLOOKUP
[***] PING
Domain is reachable
[***] HOST
[***] Recon finished
```

## À venir
	•	Ajout de sous-domain enumeration
	•	Analyse de ports (nmap)
	•	Intégration Gobuster (si installé)
	•	Option -v pour mode verbeux
	•	Option -o pour définir le dossier de sortie

## Licence

MIT — libre à utiliser et à modifier