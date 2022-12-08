#!/usr/bin/env bash

escapedPath="$(echo $(pwd) | sed 's/\//\\\//g')"

if grep flutter pubspec.yaml >/dev/null; then
  if [ -d "coverage" ]; then
    # combine line coverage info from package tests to a common file
    if [ ! -d "$MELOS_ROOT_PATH/coverage_report" ]; then
      mkdir "$MELOS_ROOT_PATH/coverage_report"
    fi
    roothPath = ${MELOS_ROOT_PATH:2}
    # rm -rf "$MELOS_ROOT_PATH/coverage_report"
    sed "s/^SF:lib/SF:$escapedPath\/lib/g" coverage/lcov.info >>"$MELOS_ROOT_PATH/coverage_report/lcov.info"
    # rm -rf "coverage"
  fi
fi
