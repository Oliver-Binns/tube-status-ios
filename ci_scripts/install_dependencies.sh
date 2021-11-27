#!/bin/sh

brew install fastlane

if [ "$CI_WORKFLOW" = "Pull Request Validation" ]
then
  brew install swiftlint
  brew install sonar-scanner

  echo 'current'
  ls
  echo 'workspace'
  ls $CI_WORKSPACE

  (cd $CI_WORKSPACE && fastlane add_plugin xcresult_to_junit)
elif [ "$CI_WORKFLOW" = "Alpha Release" ]
then
  fastlane add_plugin badge
elif [ "$CI_WORKFLOW" = "Beta Release" ]
then
  fastlane add_plugin badge
fi
