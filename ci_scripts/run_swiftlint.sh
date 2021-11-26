#!/bin/sh
set -e

swiftlint --strict $CI_WORKSPACE --config "$CI_WORKSPACE/.swiftlint.yml"
