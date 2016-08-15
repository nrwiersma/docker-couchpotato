FROM alpine:3.4
MAINTAINER Nicholas Wiersma <nick@wiersma.co.za>

ENV VERSION 3.0.1

# Create user and group for SickBeard.
RUN addgroup -S -g 666 couchpotato \
    && adduser -S -u 666 -G couchpotato -h /couchpotato -s /bin/sh couchpotato

# Install Dependencies
RUN apk add --no-cache ca-certificates py-openssl py-lxml git

# Add SickBeard init script.
ADD entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

# Define container settings.
VOLUME ["/datadir", "/download", "/media"]

EXPOSE 5050

# Start SickBeard.
WORKDIR /couchpotato

CMD ["/entrypoint.sh"]
