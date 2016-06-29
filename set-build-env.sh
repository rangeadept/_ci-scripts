#!/bin/sh

set -e

export SHORT_SHA1=`git rev-parse --short ${CIRCLE_SHA1}`

