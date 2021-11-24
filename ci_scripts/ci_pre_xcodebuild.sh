#!/bin/sh
set -e

if [ "$CI_WORKFLOW" = "Pull Request Validation" ]
then
    ./run_swiftlint.sh
    ./run_sonar_analysis.sh
elif [ "$CI_WORKFLOW" = "Alpha Release" ]
then
    fastlane run badge alpha:true path:$CI_WORKSPACE
elif [ "$CI_WORKFLOW" = "Beta Release" ]
then
    fastlane run badge dark:true path:$CI_WORKSPACE
fi
