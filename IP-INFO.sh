#!/bin/bash

get_ip_details() {
    ip_address=$1
    api_url="https://ipinfo.io/${ip_address}/json"
    
    response=$(curl -s "$api_url")

    if [ "$(echo "$response" | jq '.ip' 2>/dev/null)" != "null" ]; then
        echo "IP Address: $(echo "$response" | jq -r '.ip')"
        echo "Hostname: $(echo "$response" | jq -r '.hostname // "N/A")"
        echo "City: $(echo "$response" | jq -r '.city // "N/A")"
        echo "Region: $(echo "$response" | jq -r '.region // "N/A")"
        echo "Country: $(echo "$response" | jq -r '.country // "N/A")"
        echo "Location: $(echo "$response" | jq -r '.loc // "N/A")"
        echo "Organization: $(echo "$response" | jq -r '.org // "N/A")"
    else
        echo "Error: Unable to fetch details for ${ip_address}"
    fi
}

read -p "Enter the IP address to look up: " ip_address_to_lookup
get_ip_details "$ip_address_to_lookup"
