#!/bin/bash

echo "Running fetch-ssl.sh to get SSL files..."
/home/node/app/fetch-ssl.sh

echo "Starting app with PM2..."

exec pm2-runtime bin/www