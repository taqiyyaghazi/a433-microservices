FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first for better caching
COPY --chown=node:node package*.json ./

# Install dependencies (using npm ci for a cleaner install based on package-lock)
RUN npm ci --only=production

# Copy application code
COPY --chown=node:node . .

# Expose the application port (defaulting to 3000)
ENV PORT=3000
EXPOSE 3000

# Use non-root user for security
USER node

# Run the application
CMD ["npm", "start"]
