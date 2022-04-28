#!/usr/bin/env bash

OUTPUT_FILE="/public/internet-log.csv"

run() {
    sleep 1
    if ping -c 3 -W 1 -i 1 8.8.8.8 >/dev/null; then
        internet=1
    else
        internet=0
    fi
    echo "$(date +%s),$internet" >>"$OUTPUT_FILE"
    echo "$(date): $internet"
}

while :; do
    run
done
