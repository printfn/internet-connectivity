#!/usr/bin/env bash
set -euo pipefail

OUTPUT_FILE="/public/internet-log.csv"

prev=unknown

run() {
    sleep 1
    if ping -c 3 -W 1 -i 1 8.8.8.8 >/dev/null; then
        internet=1
    else
        internet=0
    fi
    if [[ "$internet" != "$prev" || "$RANDOM" -le 1000 ]]; then
        echo "$(date +%s),$internet" >>"$OUTPUT_FILE"
        echo "$(date): $internet"
    else
        echo "unchanged: $(date): $internet"
    fi
    prev="$internet"
}

while :; do
    run
done
