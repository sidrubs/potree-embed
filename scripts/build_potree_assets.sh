#!/usr/bin/env bash

# Builds the `potree` assets.

set -x
set -eo pipefail

SCRIPT_DIR=$(dirname "$0")
POTREE_DIR=${SCRIPT_DIR}/../potree

# Install `potree` deps and build.
(cd ${POTREE_DIR} && npm i)
