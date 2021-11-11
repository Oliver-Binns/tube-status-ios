#!/bin/sh

if [ CI_WORKFLOW = 'Pull Request Validation' ]
then
	./run_sonar_analysis.sh
fi
