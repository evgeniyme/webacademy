#!/bin/bash

# Start Redis container
docker run --name my-redis-container-3 -d redis

# Start Python container and link to Redis
docker run --name my-python --link my-redis-container-3:redis -d flask-web