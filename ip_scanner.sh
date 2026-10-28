#!/usr/bin/env bash
trap 'echo; echo "exiting..."; exit 130' INT

read -rp "enter a network prefix: " prefix

outfile=$prefix.txt

echo "scanning $prefix.0/24"

for i in {1..254}; do
	ip=$prefix.$i
	if ping -c 1 "$ip" &> /dev/null; then
		echo "$ip is up"
		echo "$ip is up" >> "$outfile"
	fi
done

echo "results saved to $outfile"
