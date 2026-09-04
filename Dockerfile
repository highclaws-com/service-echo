FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files first for better caching
COPY package*.json ./

# Explicitly set the environment to production
ENV NODE_ENV=production

# Install dependencies (production only to keep image small)
RUN npm ci --only=production --no-audit --no-fund

# Copy application source code
COPY . .

# Expose the port (matching the default in server.js)
EXPOSE 8080

# Default command
CMD ["node", "server.js"]
