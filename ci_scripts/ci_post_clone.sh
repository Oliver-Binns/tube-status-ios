#!/bin/sh
set -e

if [ "$CI_WORKFLOW" = "Pull Request Validation" ]
then
  ./install_dependencies.sh
fi
