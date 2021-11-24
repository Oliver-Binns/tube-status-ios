#!/bin/sh
set -e

if [ "$CI_WORKFLOW" = "Pull Request Validation" ]
then
  git checkout -b temp
  git branch -d develop
  git fetch origin develop
  ./install_dependencies.sh
fi
