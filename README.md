# Johnny5
Johnny5 is a bot used for cool things. He's based on [Hubot](https://hubot.github.com/).

## Building
Builds are automatically done by Docker Hub

## Running
```
docker run -dt --name hubot-redis \
  -v /opt/hubot-redis:/data \
 redis redis-server --appendonly yes

docker run -dt --name johnny5 \
  -p 127.0.0.1:9980:9980\
  --link hubot-redis:redis
  -e REDIS_URL=redis://redis:6379
  -e HUBOT_SLACK_TOKEN=secrets \
  dsfcc/johnny5:latest
```

## TODO List
 - Add custom scripts
 - Import old data
