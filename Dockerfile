<<<<<<< HEAD
FROM node:14
WORKDIR /app
COPY android/package.json /app/
RUN npm install
COPY . /app/
CMD ["dart", "lib/main.dart"]
=======
FROM node:14
WORKDIR /app
COPY android/package.json /app/
RUN npm install
COPY . /app/
CMD ["npm", "start"]
>>>>>>> 127edab82b6b0ef37556eb463c0d5556e4ff86f1
