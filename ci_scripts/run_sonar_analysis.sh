#!/bin/sh

sonar-scanner \
  -Dsonar.organization=oliver-binns \
  -Dsonar.projectKey=tube-status-ios \
  -Dsonar.sources=. \
  -Dsonar.host.url=https://sonarcloud.io \
  -Dsonar.c.file.suffixes=- \
  -Dsonar.cpp.file.suffixes=- \
  -Dsonar.objc.file.suffixes=-
