FROM node:22.14

WORKDIR /home/node/app

RUN apt-get update && apt-get install -y awscli

COPY package.json package-lock.json ./
RUN npm install --production && npm install -g pm2

COPY . .

COPY entrypoint.sh ~/app/entrypoint.sh
COPY fetch-ssl.sh ~/app/fetch-ssl.sh
RUN chmod +x ~/app/entrypoint.sh ~/app/fetch-ssl.sh

EXPOSE 8080 8083

CMD ["/home/node/app/entrypoint.sh"]