#!/bin/bash

set -euo pipefail
echo "1"
SCHEME="$(xcodebuild -list -json | jq -r '.project.schemes[0]')"
echo "2"
PRODUCT_NAME="$(xcodebuild -scheme "$SCHEME" -showBuildSettings | grep " PRODUCT_NAME " | sed "s/[ ]*PRODUCT_NAME = //")"
echo "::set-env name=PRODUCT_NAME::$PRODUCT_NAME"