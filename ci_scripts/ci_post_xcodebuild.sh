#!/bin/sh
set -e

if [ "$CI_WORKFLOW" = "Pull Request Validation" ]
then
  ./install_sonar_dependencies.sh
  ./run_sonar_analysis.sh
fi
