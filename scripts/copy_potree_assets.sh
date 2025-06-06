#!/usr/bin/env bash

# Copies the required built `potree` assets so that they 
# can be used by `rust-embed`.

set -x
set -eo pipefail

SCRIPT_DIR=$(dirname "$0")
BUILT_ASSETS_DIR=${SCRIPT_DIR}/../built_assets
POTREE_DIR=${SCRIPT_DIR}/../potree

# Remove old assets.
rm -rf ${BUILT_ASSETS_DIR}
mkdir -p ${BUILT_ASSETS_DIR}

# Copy assets and remove some that aren't used as they make the
# package too big for crates.io.
#
# There are definitely some that still can be removed but I
# haven't taken the time to figure that out. There could be
# some that are required that I removed, will see soon enough
# I suppose.
cp -r ${POTREE_DIR}/build ${BUILT_ASSETS_DIR}/build
rm ${BUILT_ASSETS_DIR}/build/**/*.js.map
rm -rf ${BUILT_ASSETS_DIR}/build/potree/lazylibs
rm -rf ${BUILT_ASSETS_DIR}/build/potree/resources/models
rm -rf ${BUILT_ASSETS_DIR}/build/potree/resources/shapefiles

cp -r ${POTREE_DIR}/libs ${BUILT_ASSETS_DIR}/libs
rm -rf ${BUILT_ASSETS_DIR}/libs/geopackage
rm -rf ${BUILT_ASSETS_DIR}/libs/sql
rm -rf ${BUILT_ASSETS_DIR}/libs/Cesium
