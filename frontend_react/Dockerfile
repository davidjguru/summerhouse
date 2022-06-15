FROM node:16.15.0-alpine AS development

# Environment variables.
ENV NODE_ENV development

# Add a work directory.
EXPOSE 3000
WORKDIR /app
COPY . . 
ADD start.sh /app
RUN chmod +x /app/start.sh

# Start the app.
CMD ["/app/start.sh"]
