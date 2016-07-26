#!/bin/bash
docker run -e spring_profiles_active=dev -p 8080:8080 -i -t example-spring-boot-docker:latest
