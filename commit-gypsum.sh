#!/bin/sh

TODAY=`date "+%w"`
ACCESS_TOKEN=${1}
REPO_LIST=`curl -u :${ACCESS_TOKEN} https://api.github.com/user/repos | jq '.[].full_name'`

for owner_repo in ${REPO_LIST[@]}
do
  echo "${owner_repo}"
  OWNER_REPO_URL=`echo ${owner_repo} | sed 's/"//g'`
 # curl -u :${ACCESS_TOKEN} https://api.github.com/repos/${OWNER_REPO_URL}/stats/punch_card | jq '.['${TODAY}'] | .[2]'
 curl -u :${ACCESS_TOKEN} https://api.github.com/repos/${OWNER_REPO_URL}/stats/punch_card | jq '.[] | select(.[0]=='${TODAY}') | .[2]'
done