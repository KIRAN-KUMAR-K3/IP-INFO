#!/bin/bash

echo "Enter the IP address you want to trace:"
read ip_address

# Make a request to ipinfo.io to get information about the provided IP address
response=$(curl -s "https://ipinfo.io/${ip_address}")

# Check if the request was successful
if [ $? -eq 0 ]; then
    # Display the information
    echo "Information about IP address $ip_address:"
    echo "$response" | jq    # If you don't have jq installed, you can remove this line or install jq for better formatting
else
    echo "Error: Unable to fetch information. Please check your internet connection or try again later."
fi
