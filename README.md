# Johnny5
Johnny5 is an irc bot used for cool things. He's based on [Hubot](https://hubot.github.com/).

## Building
Builds are automatically done by Docker Hub

## Running
```
docker run -dt --name johnny5 \
  -p 127.0.0.1:9980:9980\
  -e HUBOT_IRC_SERVER=irc.example.com \
  -e HUBOT_IRC_ROOMS=#coolstuff \
  -e HUBOT_IRC_NICK=Johnny5 \
  -e HUBOT_IRC_PASSWORD=secrets \
  dsfcc/johnny5:latest
```

## TODO List
 - Add custom scripts
 - Set up and link redis container
 - Import old data
