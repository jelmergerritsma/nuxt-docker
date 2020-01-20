# Setup image laag/ container die gebruikt wordt voor het bouwen van de applicatie
FROM node:lts-alpine as builder

# Maak de folder 'vue' en set deze als root folder
WORKDIR /vue

# Kopieer de package.json en package-lock.json
COPY package*.json ./

# Installeer de node modules
RUN npm cache clean --force && npm install

# Kopieer alles naar de root directory
COPY . .

# Run de npm build (nuxt build)
RUN npm run build

# Nieuwe laag waar de gebouwde applicatie in zal draaien
FROM node:lts-alpine as app

# Maak de folder 'vue' en set deze als root folder van waaruit de app zal draaien
WORKDIR /vue

# Kopieer de gecompilde bestanden naar deze laag/ container
COPY --from=builder /vue ./

# Zet de timezone voor de container
ENV TZ=Europe/Amsterdam

# Instaleer tzdata in de alpine image zodat de bovenstaande timezone ook gebruikt gaat worden.
RUN apk update
RUN apk add --update tzdata

# Gebruik expliciet 0.0.0.0 anders kan AWS niet bij de container.
ENV HOST=0.0.0.0

# Het commando waarmee het project in productiemodus draait
CMD ["npm", "run", "run"]

# Build docker build -t nuxt-docker .
# Start deze build met $ docker run -p 3500:3000 nuxt-docker
