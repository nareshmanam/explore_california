# Use the official nginx image
FROM nginx:alpine

# Copy static HTML files to the nginx web directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80
