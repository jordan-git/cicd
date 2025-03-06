#!/bin/bash

SSL_CERT_PATH="~/app/server.crt"
SSL_KEY_PATH="~/app/privatekey.pem"

echo "📥 Fetching SSL certificates from S3..."
aws s3 cp "s3://$S3_BUCKET_NAME/server.crt" "$SSL_CERT_PATH"
aws s3 cp "s3://$S3_BUCKET_NAME/privatekey.pem" "$SSL_KEY_PATH"

chmod 600 "$SSL_KEY_PATH"
chmod 644 "$SSL_CERT_PATH"

echo "SSL certificates downloaded successfully."