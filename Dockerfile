# Base image of Node.js version 14
FROM node:14

# Set the working directory for the container to /app
WORKDIR /app

# Copy the entire source code to the working directory in the container
COPY . .

# Set the environment variable NODE_ENV to production and DB_HOST to item-db
ENV NODE_ENV=production DB_HOST=item-db

# Install the dependencies
RUN npm install --production --unsafe-perm && npm run build

# Expose the port 8080
EXPOSE 8080

# When the container is launched, run the command 'npm start'
CMD ["npm", "start"]