#!/bin/bash

# === Variable ===

domain=$1

# === Check usage ===

if [ -z "$domain" ]; then
	echo "Usage : $0 domain.com"
	exit 1
fi

# === Create Directory ===
mkdir -p recon/$domain

# === API Call ===
echo "[***]Getting subdomains"
curl -s "https://crt.sh/?q=%25.$domain&output=json"\
	| jq -r '.[].name_value' \
	| sed 's/\*\.//g' \
	| sort -u > recon/$domain/subs.txt

# === bonus subfinder ===

if command -v subfinder >/dev/null 2>&1; then
	echo "[***]Subfinder found, test incoming..."
	subfinder -d "$domain" -silent >> recon/$domain/subs.txt
fi

sort -u recon/$domain/subs.txt -o recon/$domain/subs.txt

# === file ===
sub_file="recon/$domain/subs.txt"

# === Check if alive ===

if command -v httpx >/dev/null 2>&1; then
	echo "[***]Checking live subs with httpx..."
	cat recon/$domain/subs.txt | httpx -silent > recon/$domain/alive.txt
else
	echo "[***]Checking alive subs..."
	while read sub; do
		if curl -Is --max-time 2 http://$sub | grep -q "HTTP/"; then
			echo "$sub" >> recon/$domain/alive.txt
		else
			echo "$sub" >> recon/$domain/dead.txt
		fi
	done < "$sub_file"
fi

# === END ===

echo "[***]Sub enum completed"
