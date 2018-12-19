#!/bin/bash

printf "Started\n"
printf "Username: $KBC_DEVELOPERPORTAL_USERNAME\n"
printf "Vendor: $KBC_DEVELOPERPORTAL_VENDOR\n"
printf "App: $KBC_DEVELOPERPORTAL_APP\n"
export REPOSITORY=`docker run --rm -e KBC_DEVELOPERPORTAL_USERNAME -e KBC_DEVELOPERPORTAL_PASSWORD -e KBC_DEVELOPERPORTAL_URL quay.io/keboola/developer-portal-cli-v2:latest ecr:get-repository $KBC_DEVELOPERPORTAL_VENDOR $KBC_DEVELOPERPORTAL_APP`
printf "Repository: $REPOSITORY\n"
printf "Tag: $REPOSITORY_TAG\n"
docker tag $APP_IMAGE:latest $REPOSITORY:$REPOSITORY_TAG
eval $(docker run --rm -e KBC_DEVELOPERPORTAL_USERNAME -e KBC_DEVELOPERPORTAL_PASSWORD -e KBC_DEVELOPERPORTAL_URL quay.io/keboola/developer-portal-cli-v2:latest ecr:get-login $KBC_DEVELOPERPORTAL_VENDOR $KBC_DEVELOPERPORTAL_APP)
printf "Login succeed\n"
docker push $REPOSITORY:$REPOSITORY_TAG
printf "Pushed\n"