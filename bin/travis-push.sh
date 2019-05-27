#!/usr/bin/env bash

pdfFile=$1

echo "Trying to push PDF to GitHub"
# setup git
git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis CI"

# committing pdf file
git checkout ${TRAVIS_BRANCH}
git add -f "${pdfFile}"
git commit -m "Travis: Updating PDF (${pdfFile})" -m "$(date) (Build ${TRAVIS_BUILD_NUMBER})" -m "[skip ci]" >/dev/null 2>&1
result=$?

# only push changes if the commit was successful
if [ ${result} -eq 0 ]; then
  echo "A new PDF file exists. Uploading it to GitHub"
  git remote add github "https://${GH_TOKEN}@github.com/CodeLionX/selfhealing-k8s-paper.git" >/dev/null 2>&1
  git push --quiet --set-upstream github ${TRAVIS_BRANCH} >/dev/null 2>&1
else
  echo "No changes. Skipping upload"
fi
