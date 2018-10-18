#!/bin/sh

ACCESS_TOKEN=${1}
REPO_LIST=`curl -u :${ACCESS_TOKEN} https://api.github.com/user/repos | jq '.[].full_name'`

for owner_repo in ${REPO_LIST[@]}
do
  OWNER_REPO_URL=`echo ${owner_repo} | sed 's/"//g'`
  COMMIT_LIST=`curl -u :${ACCESS_TOKEN} https://api.github.com/repos/${OWNER_REPO_URL}/commits`
done