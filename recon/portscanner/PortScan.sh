#!/bin/bash

# === Variable ===

domain=$1
mode=$2
banner_grab=$3

common_port=(21 22 23 25 53 80 110 139 143 443 445 3306 3389 8080)

# === Check Usage ===

if [ -z "$domain" ]; then
	echo "Usage: $0 <domain.com_or_ip> [-F] [-b]"
	echo " -F : Fast mode (common ports)"
	echo " -b : Banner grabbing (if open)"
	exit 1
fi

# === Check Mode ===

if [ "$mode" == "-F" ]; then
	ports=("${common_port[@]}")
else
	ports=($(seq 1 1024))
fi

# === Create directory ===

mkdir -p recon/$domain

# === Scan Port ===

echo "[***] Scanning TCP Port on $domain"

for port in "${ports[@]}"; do
	if timeout 1 bash -c "echo > /dev/tcp/$domain/$port" 2>/dev/null; then
		output="Port $port is open"

		#Banner grabbing option
		if [ "$banner_grab" == "-b" ]; then
			banner=$(timeout 1 bash -c "echo '' | nc $domain $port" 2>/dev/null | head -n 1)
			if [[ "$port" == 80 || "$port" == 443 || "$port" == 8080 ]]; then
				banner=$(curl -s --max-time 2 -I http://$target:$port | grep -i "Server:" | head -n 1)
			fi
			output+=" - Banner: $banner"
		fi

		echo "$output" | tee - recon/$domain/port.txt
	fi
done

echo "[***] Scan completed."
