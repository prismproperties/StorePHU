FROM sitback/soe:php7.1
MAINTAINER Chin Godawita <chin@sitback.com.au>

# Install all required packages.
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y php7.1-redis \
        php7.1-mbstring php7.1-zip php7.1-mcrypt php7.1-bcmath \
        && rm -rf /var/lib/apt/lists/*

RUN composer self-update

# Copy project Apache config.
COPY ./config/docker/apacheconf.conf /etc/apache2/sites-available/000-default.conf

# Copy project PHP settings.
COPY ./config/docker/phpconf.ini /etc/php/7.1/cli/conf.d/30-phpconf.ini
