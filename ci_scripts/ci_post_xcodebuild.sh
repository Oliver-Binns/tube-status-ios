#!/bin/sh
set -e

if [ "$CI_WORKFLOW" = "Pull Request Validation" ]
then
  # run in a subshell as this script changes the directory
  xcodebuild \
    -workspace TubeStatus.xcworkspace \
    -scheme "iOS Production" \
    -destination 'platform=iOS Simulator,name=iPhone 12' \
    -enableCodeCoverage YES \
    test-without-building
  (./run_sonar_analysis.sh)
fi
