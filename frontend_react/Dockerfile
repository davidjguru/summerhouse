FROM node:16.15.0-alpine AS development

# Environment variables.
ENV NODE_ENV development
# Expose ports in the container and copy resources.
EXPOSE 3000

EXPOSE 3000
RUN mkdir /app
WORKDIR /app
COPY . . 
ADD start.sh /app/start.sh
RUN chmod +x /app/start.sh
RUN ./start.sh
CMD ["chmod -R 777 ./node_modules"]
