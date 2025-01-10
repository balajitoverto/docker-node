# Base image
FROM node:14.4-alpine3.11

# Define build-time variable
ARG IMAGE_TAG=v0.0.3

# Set the working directory
WORKDIR /app

# Copy dependency files
COPY package.json package.json
COPY package-lock.json package-lock.json

# Install dependencies
RUN npm install

# Copy all other source code
COPY . .

# Optionally, use the IMAGE_TAG in your app if needed
# You can use it for versioning, or include it in a config file, etc.
RUN echo "Building image with tag: $IMAGE_TAG" > tag_info.txt

# Start the application
CMD [ "node", "server.js" ]
