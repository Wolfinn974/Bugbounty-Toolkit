#!/bin/bash

# === Variable ===

domain=$1

# === Check Usage === 
if [ -z "$domain" ]; then
	echo "Usage : $0 domain.com"
	exit 1
fi

# === Create Directory ===

mkdir -p recon/$domain

# === WHOIS ===

echo "[***]WHOIS"
whois $domain > recon/$domain/whois.txt

# === DIG ===
echo "[***]DIG"
dig +short $domain > recon/$domain/ip.txt

# === GET IP ===

ip=$(dig +short $domain)

# === Check IP ===

if [ -z "$ip" ]; then
	echo "No IP found"
else
	echo "IP found: $ip"
fi

# === NSLOOKUP ===

echo "[***]NSLOOKUP"
nslookup $domain > recon/$domain/nslookup.txt

# === PING ===

echo "[***]PING"
ping -c 1 $domain > recon/$domain/ping.txt

if ping -c 1 $domain > /dev/null; then 
	echo "Domain is reachable"
else
	echo "Domain not reachable"
fi

# === HOST ===
echo "[***]HOST"
host $domain > recon/$domain/host.txt

# === NMAP ===
echo "[***]NMAP"
nmap -Pn -sV -sC -T4 $domain > recon/$domain/nmap_results.txt


# === END ===
echo "[***]Recon finish"
