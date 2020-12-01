############################
# Image: Builds the app.
############################
FROM node:12.6.0 AS builder

# Use bash shell
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install all dependencies.
COPY package* /tmp/
COPY .npmrc /tmp/
RUN cd /tmp && \
    npm install --production=false
RUN mkdir -p /build && \
    cp -a /tmp/node_modules /build/

# Set working directory and copy the source files.
WORKDIR /build
COPY . .

# Build the app.
RUN ./scripts/build.sh

############################
# Image: Runs the app.
############################
FROM node:12.6.0-alpine

ENV NODE_ENV production

# Get distro depencdencies
RUN apk add --no-cache --upgrade bash

WORKDIR /usr/app

# Install production only dependenices
COPY --from=builder /build/package* /usr/app/
RUN npm install --production=true

# Copy build files and startup scripts.
COPY --from=builder /build/.env /usr/app/
COPY --from=builder /build/scripts/set_vars.sh /usr/app/scripts/
COPY --from=builder /build/scripts/start.sh /usr/app/scripts/
COPY --from=builder /build/dist /usr/app/dist

# Open up the port
EXPOSE $PORT

# Fly my pretties!!
CMD ["sh", "-c", "./scripts/start.sh"]
