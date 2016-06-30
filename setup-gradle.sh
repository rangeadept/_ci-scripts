#!/bin/sh

set -e

ZIPFILE=$HOME/gradle.zip

: ${GRADLE_VERSION:?"ERR: GRADLE_VERSION environment var must be set!"}

curl -o $ZIPFILE -sLO https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-all.zip
unzip $ZIPFILE -d $HOME/
mv $HOME/gradle-${GRADLE_VERSION} $HOME/gradle
rm $ZIPFILE
