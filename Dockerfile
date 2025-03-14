FROM node:22.14

# Set the working directory
WORKDIR /home/node/app

# Update & install AWS CLI
RUN apt-get update && apt-get install -y awscli

# Install production dependencies and PM2
COPY package.json package-lock.json ./
RUN npm install --production && npm install -g pm2

# Copy the rest of the application
COPY . .

# Copy the scripts explicitly
COPY entrypoint.sh /home/node/app/entrypoint.sh
COPY fetch-ssl.sh /home/node/app/fetch-ssl.sh

# Make the scripts executable
RUN chmod +x /home/node/app/entrypoint.sh /home/node/app/fetch-ssl.sh

EXPOSE 8443

# Run the entrypoint script
CMD ["/home/node/app/entrypoint.sh"]