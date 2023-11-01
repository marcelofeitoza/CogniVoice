FROM node:16

WORKDIR /usr/src/app

# First, copy just the package.json and yarn.lock (or package-lock.json) to leverage Docker cache
COPY package*.json ./

RUN npm install

# Now, copy the rest of the app files
COPY . .

# Next, run the Prisma commands
RUN npx prisma generate
RUN npx prisma migrate dev --name init

CMD [ "node", "index.js" ]

EXPOSE 3001
