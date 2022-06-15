FROM node:16.15.0-alpine AS development

# Environment variables.
ENV NODE_ENV development

# Add a work directory.
EXPOSE 3000
RUN mkdir /app
WORKDIR /app
COPY . . 
ADD start.sh /app/start.sh
RUN chmod +x /app/start.sh

CMD ["./start.sh"]
