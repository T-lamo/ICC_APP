# Use an official Node.js Alpine image as a parent image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Bundle your app source code inside the Docker image
COPY . .

# Expose the port your app runs on
EXPOSE 80

# Command to run your application
CMD ["npm", "start"]