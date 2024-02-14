FROM node:14
WORKDIR /app
COPY android/package.json /app/
RUN npm install
COPY . /app/
CMD ["npm", "start"]
