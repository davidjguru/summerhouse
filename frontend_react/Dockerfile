FROM node:16.15.0-alpine AS development

# Environment variables.
ENV NODE_ENV development
# Expose ports in the container and copy resources.
EXPOSE 3000

# Setting the working directory and running dependencies.
RUN mkdir /app
WORKDIR /app
COPY . . 
RUN yarn install

# Load the entrypoint in container.
ENTRYPOINT ["/usr/local/bin/yarn"]
CMD ["start"]
