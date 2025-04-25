# Use Node.js official image
FROM node:18

# Set working directory
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy app files
COPY . .

# Expose backend port
EXPOSE 3000

# Start server
CMD ["node", "app.js"]

