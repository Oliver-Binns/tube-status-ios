#!/bin/sh

if [ CI_WORKFLOW = 'Pull Request Validation' ]
then
  echo $CI_WORKFLOW;
  ./run_swiftlint.sh
  ./install_sonar_dependencies.sh
else
  echo $CI_WORKSPACE;
  ./run_swiftlint.sh
  ./install_sonar_dependencies.sh
fi
