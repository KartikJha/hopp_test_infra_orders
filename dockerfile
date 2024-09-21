# Use the official Node.js image as the base image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json (if available)
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the application source code to the container
COPY . .

# Build the application
RUN npm run build

# Expose port (default for NestJS)
EXPOSE 3000

# Define environment variables that can be injected during runtime
ENV DATABASE=""
ENV HOST=""
ENV USERNAME=""
ENV PASSWORD=""

# Start the application in production mode
CMD ["npm", "run", "start:prod"]
