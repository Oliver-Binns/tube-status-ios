#!/bin/sh

if [ CI_WORKFLOW = 'Pull Request Validation' ]
then
	./run_swiftlint.sh
        ./install_sonar_dependencies.sh
fi
