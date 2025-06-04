#!/usr/bin/env bash

# Builds the `potree` assets and copies them into the `built_assets` dir.

set -x
set -eo pipefail

SCRIPT_DIR=$(dirname "$0")
BUILT_ASSETS_DIR=${SCRIPT_DIR}/../built_assets
POTREE_DIR=${SCRIPT_DIR}/../potree

# Install `potree` deps and build.
(cd ${POTREE_DIR} && npm i)

# Remove old and copy new built assets.
rm -rf ${BUILT_ASSETS_DIR}
mkdir -p ${BUILT_ASSETS_DIR}
cp -r ${POTREE_DIR}/build ${BUILT_ASSETS_DIR}/build
cp -r ${POTREE_DIR}/libs ${BUILT_ASSETS_DIR}/libs