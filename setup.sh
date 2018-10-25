#!/bin/sh
yum install epel-release
yum install jq

if[! -e config.sh]; then
  touch config.sh
fi

echo "please input github access token"
read ACCESS_TOKEN

echo "please input github slack webhook"
read SLACK_WEBHOOK

echo "GITHUB_TOKEN=${ACCESS_TOKEN}" >> config.sh
echo "SLACK_WEBHOOK=${SLACK_WEBHOOK}" >> config.sh
