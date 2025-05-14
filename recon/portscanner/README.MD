# TCP Scanner - Bash Edition

Ce script est un **scanner de ports TCP simple en Bash**, créé dans un but **éducatif**.

- Mode rapide (-F) pour les ports communs
- Option de banner grabbing (-b)
- Résultats sauvegardés dans `recon/<domain>/`

## Usage

```bash
./scanner.sh <ip|domain> [-F] [-b]
```
Exemples : 
```bash
./scanner.sh example.com -F -b
```

## Arborescence des résultats

Les résultats sont stockés dans le dossier :
recon/<domain>/port.txt

## Avertissement

**Ce script est à usage éducatif uniquement.**
Il a été conçu pour comprendre le fonctionnement basique d’un port scanner en Bash.
**N’utilisez cet outil que sur des cibles que vous possédez ou avez l’autorisation de scanner.**