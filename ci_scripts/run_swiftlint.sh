#!/bin/sh
set -e

swiftlint --strict $CI_WORKSPACE
