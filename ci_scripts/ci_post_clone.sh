#!/bin/sh
set -e

if [ "$CI_WORKFLOW" = "Pull Request Validation" ]
then
  git -C $CI_WORKSPACE checkout -b temp
  git -C $CI_WORKSPACE branch -d develop
  git -C $CI_WORKSPACE pull
  git -C $CI_WORKSPACE checkout develop
  git -C $CI_WORKSPACE checkout temp

  ./install_dependencies.sh
fi
