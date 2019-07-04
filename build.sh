#!/bin/bash
docker build -t emscripten-bazel:beta .
docker system prune -f
