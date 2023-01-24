FROM node:lts

ENV NODE_OPTIONS=--openssl-legacy-provider

RUN npm install --global --silent yo && npm install --global generator-alfresco-docker-installer

RUN adduser -u 501 yeoman && \
  echo "yeoman ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN mkdir /generated && chown yeoman:yeoman /generated
WORKDIR /generated

USER yeoman

CMD ["yo", "alfresco-docker-installer"]
