#!/bin/sh
set -e

if [ "$CI_WORKFLOW" = "Pull Request Validation" ];
then
  # fetch a reference to the develop branch on GitHub
  # this will allow SonarQube analysis to work
  git -C $CI_WORKSPACE checkout -b temp
  git -C $CI_WORKSPACE branch -d $CI_PULL_REQUEST_TARGET_BRANCH

  git -C $CI_WORKSPACE config remote.origin.fetch \
    "+refs/heads/$CI_PULL_REQUEST_SOURCE_BRANCH:refs/remotes/origin/$CI_PULL_REQUEST_SOURCE_BRANCH"
  git -C $CI_WORKSPACE config remote.origin.fetch \
    "+refs/heads/$CI_PULL_REQUEST_TARGET_BRANCH:refs/remotes/origin/$CI_PULL_REQUEST_TARGET_BRANCH"
  git -C $CI_WORKSPACE fetch
fi

./install_dependencies.sh
