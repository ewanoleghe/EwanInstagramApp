# Use an official PHP runtime as a parent image
FROM php:8.2-apache
# FROM php:8.2-apache-alpine
# look up the alpine version

# Set the working directory in the container
WORKDIR /2/www/html 

# Copy your PHP application code into the container
COPY . .

# Install PHP extensions and other dependencies
RUN apt-get update && \
    apt-get install -y libpng-dev && \
    docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# Expose the port Apache listens on
EXPOSE 80

# Start Apache when the container runs
CMD ["apache2-foreground"]