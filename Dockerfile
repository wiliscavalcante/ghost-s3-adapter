FROM ghost:4.41.3-alpine

WORKDIR /var/lib/ghost
##NPM install ghost-storage-adapter-s3 and link the 2 directories
RUN npm install -g ghost-storage-adapter-s3 && \
  ln -s /usr/local/lib/node_modules/ghost-storage-adapter-s3 ./current/core/server/adapters/storage/s3

#Copy a new default config to include our storage adapter
RUN rm config.production.json
COPY config.json config.production.json
COPY config.json config.json