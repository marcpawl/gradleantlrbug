#!/bin/bash -e
cd `dirname $0`
docker build -t gradleantlrbug .
docker run gradleantlrbug /code/bug.sh
