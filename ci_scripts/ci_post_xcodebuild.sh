#!/bin/sh
set -e

if [ "$CI_WORKFLOW" = "Pull Request Validation" ]
then
  # run in a subshell as this script changes the directory
  xcodebuild \
    -workspace "$CI_WORKSPACE/$CI_XCODE_PROJECT" \
    -scheme "iOS Production" \
    -destination 'platform=iOS Simulator,OS=15.0,name=iPhone 12' \
    -enableCodeCoverage YES \
    test-without-building
  (./run_sonar_analysis.sh)
fi
