FROM node:14 as build
WORKDIR /app
COPY android/package.json /app/
RUN npm install
COPY . /app/

FROM google/dart:latest
WORKDIR /app
COPY --from=build /app /app
CMD ["dart", "lib/main.dart"]
