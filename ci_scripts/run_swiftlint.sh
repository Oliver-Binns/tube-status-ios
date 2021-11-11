#!/bin/sh
set -e

brew install swiftlint >/dev/null
swiftlint --strict $CI_WORKSPACE
