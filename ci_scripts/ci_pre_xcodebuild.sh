#!/bin/sh
set -e

if [ "$CI_WORKFLOW" = "Alpha Release" ]
then
    fastlane run badge alpha:true
elif [ "$CI_WORKFLOW" = "Beta Release" ]
then
    fastlane run badge dark:true
fi
