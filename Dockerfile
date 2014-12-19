FROM ubuntu:14.04

# Install Dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates \
  curl \
  build-essential \
  pkg-config \
  git \
  python \
  && rm -rf /var/lib/apt/lists/*

# Install Node
ENV NODE_VERSION 0.10.34
ENV NPM_VERSION 2.1.12
RUN gpg --keyserver pgp.mit.edu --recv-keys 7937DFD2AB06298B2293C3187D33FF9D0246406D
RUN curl -SLO "http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
  && curl -SLO "http://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
  && gpg --verify SHASUMS256.txt.asc \
  && grep " node-v$NODE_VERSION-linux-x64.tar.gz\$" SHASUMS256.txt.asc | sha256sum -c - \
  && tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
  && rm "node-v$NODE_VERSION-linux-x64.tar.gz" SHASUMS256.txt.asc \
  && npm install -g npm@"$NPM_VERSION" \
  && npm cache clear

# Install Hubot
RUN npm install -g coffee-script@1.8.0 hubot@2.8.3

# Create Hubot
RUN mkdir /app
WORKDIR /app
RUN hubot --create johnny5
WORKDIR /app/johnny5

# Install hubot-irc
RUN npm install hubot-irc --save && npm install

# Set Hubot Options
ENV HUBOT_IRC_UNFLOOD true

# HTTP Listener listen port 9980
ENV PORT 9980
EXPOSE 9980

# Run Hubot
ENTRYPOINT ["bin/hubot", "-a", "irc"]
