FROM node:16.15.0-alpine AS development

# Environment variables.
ENV NODE_ENV development

# Add a work directory.
EXPOSE 3000
WORKDIR /app
COPY . . 

# Start the app.
ENTRYPOINT ["yarn"]
CMD ["install"]
CMD ["start"]
