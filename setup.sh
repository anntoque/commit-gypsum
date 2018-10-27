#!/bin/sh
#yum install epel-release
#yum install jq

if [ -e config.sh ]; then
  echo "already maked config.sh"
else
  touch config.sh
  
  echo "please input github access token"
  read ACCESS_TOKEN

  echo "please input github slack webhook"
  read SLACK_WEBHOOK

fi

echo "GITHUB_TOKEN=${ACCESS_TOKEN}" >> config.sh
echo "SLACK_WEBHOOK=${SLACK_WEBHOOK}" >> config.sh

echo "end setup"
