#!/bin/sh
set -e

cd $CI_WORKSPACE
fastlane sonar_analysis \
  result_path:$CI_RESULT_BUNDLE_PATH \
  workspace:$CI_WORKSPACE \
  sonar_token:$SONAR_TOKEN \
  target_branch:$CI_PULL_REQUEST_TARGET_BRANCH \
  source_branch:$CI_PULL_REQUEST_SOURCE_BRANCH \
  pr_number:$CI_PULL_REQUEST_NUMBER
