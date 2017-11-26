#!/bin/bash

docker run \
	-ti \
	--rm \
	-p 8080:8080 \
	-p 25565:25565 \
	g33x-minecraft-server \
	/bin/bash
