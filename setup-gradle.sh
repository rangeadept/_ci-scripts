#!/bin/sh

set -e

: ${GRADLE_VERSION:?"ERR: GRADLE_VERSION environment var must be set!"}

curl -sLO https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-all.zip 
unzip gradle-${GRADLE_VERSION}-all.zip
ln -s gradle-${GRADLE_VERSION} $HOME/gradle
rm gradle-${GRADLE_VERSION}-all.zip
