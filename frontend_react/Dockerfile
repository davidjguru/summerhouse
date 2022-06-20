FROM node:16.15.0-alpine AS development

# Environment variables.
ENV NODE_ENV development
# Expose ports in the container and copy resources.
EXPOSE 3000

EXPOSE 3000
RUN mkdir /app
WORKDIR /app
COPY . . 
RUN yarn install
CMD ["yarn start"]
