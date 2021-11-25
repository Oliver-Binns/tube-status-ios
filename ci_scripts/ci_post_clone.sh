#!/bin/sh
set -e

if [ "$CI_WORKFLOW" = "Pull Request Validation" ]
then
  # fetch a reference to the develop branch on GitHub
  # this will allow SonarQube analysis to work
  git -C $CI_WORKSPACE config --replace-all remote.origin.fetch '+refs/heads/develop:refs/remotes/origin/develop'
  git -C $CI_WORKSPACE fetch

  ./install_dependencies.sh
fi
