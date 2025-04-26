# Use the official Node.js image from DockerHub
FROM node:20

# Create and set the working directory inside the container
WORKDIR /app

# Install dependencies
RUN npm install

# Copy the rest of your application code
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Command to run your application
CMD ["npm", "start"]
