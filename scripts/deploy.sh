#!/bin/bash

if [[ $TRAVIS_BRANCH == 'travis' ]] ; then
  cd _site
  git init

  git config user.name "$GIT_NAME"
  git config user.email "$GIT_EMAIL"

  git add .
  git commit -m "Deploy"

  # We redirect any output to
  # /dev/null to hide any sensitive credential data that might otherwise be exposed.
  git push --force --quiet "https://${$GIT_NAME}:${$GIT_AUTH}@${brandonz-me}" travis:site > /dev/null 2>&1
else
  echo 'Invalid branch. You can only deploy from travis.'
  exit 1
fi
