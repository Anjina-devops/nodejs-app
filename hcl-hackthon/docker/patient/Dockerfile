# Use official Node.js runtime
FROM node:20

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install

# Copy app source
COPY . .

# Bind to port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
