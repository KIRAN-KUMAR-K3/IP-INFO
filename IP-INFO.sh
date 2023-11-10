#!/bin/bash

# Function to get IP information
get_ip_info() {
    local ip_address=$1
    local api_url="https://ipinfo.io/$ip_address/json"

    # Use curl to make a GET request to the API and store the response in a variable
    local response=$(curl -s "$api_url")

    # Check if the request was successful
    if [ $? -eq 0 ]; then
        # Print the details of the IP address
        echo "Details for IP Address: $ip_address"
        echo "$response" | jq    # Requires jq for pretty printing JSON, you can install it with 'sudo apt-get install jq'
    else
        echo "Error fetching details for IP Address: $ip_address"
    fi
}

# Prompt the user to choose between fetching their own IP or entering one
read -p "Do you want information for your own IP? (y/n): " choice

if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
    # Use curl to fetch the public IP address
    ip_address=$(curl -s ifconfig.me)

    # Display the public IP address
    echo "Your public IP address: $ip_address"
else
    # Prompt the user to enter an IP address
    read -p "Enter an IP address: " user_ip
    get_ip_info "$user_ip"
fi
