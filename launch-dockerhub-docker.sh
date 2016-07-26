#!/bin/bash
docker pull alexturcot/example-docker-build-git-project
docker run -e spring_profiles_active=dev -i -t alexturcot/example-docker-build-git-project:latest
