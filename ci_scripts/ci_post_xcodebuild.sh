#!/bin/sh
set -e

if [ "$CI_WORKFLOW" = "Pull Request Validation" ]
then
  (cd $CI_WORKSPACE && ./run_sonar_analysis.sh)
fi
