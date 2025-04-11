# Use Node.js 18.16.0 to match your local environment
FROM node:18.16.0

# Set working directory inside the container
WORKDIR /app

# Copy package.json to install dependencies
COPY package.json ./

# Install dependencies (using the npm version bundled with node:18.16.0)
RUN npm install

# Install TypeScript globally (optional, per the guide)
RUN npm install -g typescript

# Install supergateway globally
RUN npm install -g supergateway

# Copy the rest of your application files (including index2.js)
COPY . .

# Expose the port (optional, for documentation)
EXPOSE 8000

# Command to run your MCP server with Supergateway
CMD ["npx", "-y", "supergateway", "--stdio", "node index.js", "--port", "8000"]
