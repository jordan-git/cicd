#!/bin/bash

echo "Running fetch-ssl.sh to get SSL files..."
~/app/fetch-ssl.sh

echo "Starting app"
exec node ~/app/bin/www