FROM node:24.22.1-alpine3.24

# Set working directory
WORKDIR /app

# Copy package files first for better caching
COPY package*.json ./

# Explicitly set the environment to production
ENV NODE_ENV=production

# Install dependencies (production only to keep image small)
RUN npm ci --omit=dev --no-audit --no-fund

# Copy application source code
COPY . .

# Expose the port (matching the default in server.js)
EXPOSE 8080

# Default command
CMD ["node", "server.js"]
