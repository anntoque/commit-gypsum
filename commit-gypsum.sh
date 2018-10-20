#!/bin/sh
TODAY=`date "+%w"`
ACCESS_TOKEN=${1}

LATEST_COMMIT_DATE=`curl -u :${ACCESS_TOKEN} https://api.github.com/users/anntoque/events | \
jq '.[0] | select(.["type"]=="PushEvent")' | jq '.["created_at"]' | cut -c 2-11`

CURRENT_DATE=`date "+%Y-%m-%d"`

if [ "${LATEST_COMMIT_DATE}" = "${CURRENT_DATE}" ]; then
  echo "今日もcommitしたな。お疲れ様"
else
  echo "なぜcomiitしない！！"
fi