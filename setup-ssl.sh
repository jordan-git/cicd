#!/bin/bash

# Define paths
CERT_DIR="/home/ubuntu/app"
KEY_DIR="/home/ubuntu/app"
CERT_NAME="server.crt"
KEY_NAME="privatekey.pem"

# Move certificates to correct directories
sudo mv ~/$CERT_NAME $CERT_DIR/
sudo mv ~/$KEY_NAME $KEY_DIR/

# Set correct permissions
sudo chmod 600 $KEY_DIR/$KEY_NAME
sudo chmod 644 $CERT_DIR/$CERT_NAME

echo "SSL certificate setup completed successfully!"
