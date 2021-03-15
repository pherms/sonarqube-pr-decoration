#!/bin/bash

set -e

if [[ "${GITHUB_EVENT_NAME}" == "pull_request" ]]; then
	EVENT_ACTION=$(jq -r ".action" "${GITHUB_EVENT_PATH}")
	if [[ "${EVENT_ACTION}" != "opened" ]]; then
		echo "No need to run analysis. It is already triggered by the push event."
		exit
	fi
fi
# INPUT_REF
if [[ "$INPUT_REF" == *master ]]; then
sonar-scanner \
-Dsonar.host.url=${INPUT_HOST} \
-Dsonar.login=${INPUT_LOGIN} \
-Dsonar.projectKey=${INPUT_PROJECTKEY} \
-Dsonar.branch.name=${INPUT_REF:11} \
-Dsonar.scm.provider=git
else
sonar-scanner \
-Dsonar.host.url=${INPUT_HOST} \
-Dsonar.login=${INPUT_LOGIN} \
-Dsonar.projectKey=${INPUT_PROJECTKEY} \
-Dsonar.scm.provider=git \
-Dsonar.java.binaries=/tmp
fi