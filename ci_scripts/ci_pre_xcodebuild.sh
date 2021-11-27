#!/bin/sh
set -e

./install_dependencies.sh

if [ "$CI_WORKFLOW" = "Pull Request Validation" ]
then
  if which swiftlint >/dev/null; then
    ./run_swiftlint.sh
  fi
elif [ "$CI_WORKFLOW" = "Alpha Release" ]
then
  fastlane run badge alpha:true path:$CI_WORKSPACE
elif [ "$CI_WORKFLOW" = "Beta Release" ]
then
  fastlane run badge dark:true path:$CI_WORKSPACE
fi
