#!/bin/bash
if [ "$1" = "toggle" ]; then
    if systemctl is-active --quiet docker; then
        sudo systemctl stop docker
        sudo systemctl stop docker.socket
        sudo systemctl stop containerd
        sudo ip link delete docker0 2>/dev/null
        for br in $(ip -o link show | grep -oP 'br-\w+'); do
            sudo ip link delete "$br" 2>/dev/null
        done
    else
        sudo systemctl start docker.socket
        sudo systemctl start docker
    fi
    exit 0
fi

if systemctl is-active --quiet docker; then
    containers=$(docker ps --format '{{.Names}}' 2>/dev/null)
    count=$(echo "$containers" | grep -c .)

    if [ "$count" -gt 0 ]; then
        list=$(echo "$containers" | paste -sd '\n' - | sed 's/"/\\"/g')
        echo "{\"text\": \" \", \"class\": \"active\", \"tooltip\": \"Docker: active\\n${count} containers\\n─────────\\n${list}\"}"
    else
        echo "{\"text\": \" \", \"class\": \"active\", \"tooltip\": \"Docker: active\\nNo containers\"}"
    fi
else
    echo "{\"text\": \" \", \"class\": \"inactive\", \"tooltip\": \"Docker: stopped\"}"
fi