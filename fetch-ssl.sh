#!/bin/bash

SSL_CERT_PATH="/home/node/app/server.crt"
SSL_KEY_PATH="/home/node/app/privatekey.pem"

echo "Fetching SSL certificates from S3..."
aws s3 cp "s3://$S3_BUCKET_NAME/server.crt" "$SSL_CERT_PATH"
aws s3 cp "s3://$S3_BUCKET_NAME/privatekey.pem" "$SSL_KEY_PATH"

# Make sure the files are only readable by the owner
chmod 400 "$SSL_KEY_PATH"
chmod 400 "$SSL_CERT_PATH"

echo "SSL certificates downloaded successfully."