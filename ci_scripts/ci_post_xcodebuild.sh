#!/bin/sh
set -e

if [ "$CI_WORKFLOW" = "Pull Request Validation" ]
then
  # run in a subshell as this script changes the directory
  (./run_sonar_analysis.sh)
fi
