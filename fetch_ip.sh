#!/bin/bash
# Fetch the public IP address
USER_IP=$(curl -s http://ipinfo.io/ip)

# Check if the IP was fetched successfully
if [ -z "$USER_IP" ]; then
    echo "Failed to fetch IP address."
    exit 1
fi

# Export the IP as an environment variable
export TF_VAR_user_ip=$USER_IP

echo "User IP fetched and exported as TF_VAR_user_ip: $USER_IP"