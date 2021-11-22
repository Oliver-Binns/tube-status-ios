#!/bin/sh

#sonar-scanner \
#  -Dsonar.organization=oliver-binns \
#  -Dsonar.projectKey=tube-status-ios \
#  -Dsonar.sources=. \
#  -Dsonar.host.url=https://sonarcloud.io \
#  -Dsonar.c.file.suffixes=- \
#  -Dsonar.cpp.file.suffixes=- \
#  -Dsonar.objc.file.suffixes=-

fastlane run sonar \
  project_key:"tube-status-ios" \
  project_name:"tube-status-ios" \
  project_version:"1.0" \
  project_language:"swift" \
  sonar_runner_args:"-Dsonar.projectBaseDir=$CI_WORKSPACE -Dsonar.c.file.suffixes=- -Dsonar.cpp.file.suffixes=- -Dsonar.objc.file.suffixes=-" \
  sources_path:$CI_WORKSPACE \
  sonar_organization:"oliver-binns" \
  sonar_login:$SONAR_TOKEN \
  sonar_url:"https://sonarcloud.io" \
  pull_request_branch: $CI_PULL_REQUEST_SOURCE_BRANCH \
  pull_request_base: $CI_PULL_REQUEST_TARGET_BRANCH \
  pull_request_key: $CI_PULL_REQUEST_NUMBER

