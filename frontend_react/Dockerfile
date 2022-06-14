FROM node:16.15.0-alpine AS development

# Environment variables.
ENV NODE_ENV development

# Add a work directory.
WORKDIR /app

# Cache and Install dependencies.
COPY package.json .
COPY yarn.lock .

# Copy app files.
COPY . .

# Expose port.
EXPOSE 3000

# Start the app.
CMD ["yarn", "install"]
CMD ["yarn", "start"]
