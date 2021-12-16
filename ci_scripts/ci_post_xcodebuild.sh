#!/bin/sh
set -e

if [ "$CI_WORKFLOW" = "Pull Request Validation" ]
then
  if which fastlane >/dev/null; then
    rm -rf $CI_RESULT_BUNDLE_PATH

    xcodebuild \
      -workspace "$CI_WORKSPACE/$CI_XCODE_PROJECT" \
      -scheme "iOS Production" \
      -destination 'platform=iOS Simulator,name=iPhone 13' \
      -enableCodeCoverage YES \
      -resultBundlePath $CI_RESULT_BUNDLE_PATH \
      test-without-building

    # run in a subshell as this script changes the directory
    (./run_sonar_analysis.sh)
  fi
fi
