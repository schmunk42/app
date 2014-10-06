#!/bin/bash

# This file performs certain actions in the end of the buildpack build process,
# thus changes here are compiled into the application slug.
# The working directory is $BUILD_DIR

set -eo pipefail; [[ $DOKKU_TRACE ]] && set -x

# buildpack paths are sent as the first three arguments
BUILD_DIR="$1"
CACHE_DIR="$2"
basedir="$3"

# fourth argument: relative path to folder to perform actions within
REL_PATH="$4"

# Load some convenience functions like status() echo(), indent()
source $basedir/common.sh

# step into the folder to perform actions within
cd $BUILD_DIR/$REL_PATH

# bootstrap configuration environment
./init --env="Environment configuration based on environment variables" --overwrite=1

# install composer-asset-plugin globally
php "$BUILD_DIR/vendor/composer/bin/composer.phar" global require "fxp/composer-asset-plugin:1.0.0-beta2"

# install also dev dependencies
php "$BUILD_DIR/vendor/composer/bin/composer.phar" install \
    --prefer-dist \
    --optimize-autoloader \
    --no-interaction \
    --dev
