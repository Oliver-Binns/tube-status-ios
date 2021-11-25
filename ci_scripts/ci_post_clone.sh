#!/bin/sh
set -e

if [ "$CI_WORKFLOW" = "Pull Request Validation" ]
then
  git -C $CI_WORKSPACE branch -r
  git -C $CI_WORKSPACE branch temp
  git -C $CI_WORKSPACE config --replace-all remote.origin.fetch '+refs/develop:refs/remotes/origin/develop'
  git -C $CI_WORKSPACE fetch
  git -C $CI_WORKSPACE branch -r
  git -C $CI_WORKSPACE reset --hard origin/develop
  git -C $CI_WORKSPACE checkout temp

  ./install_dependencies.sh
fi
