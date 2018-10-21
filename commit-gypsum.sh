#!/bin/sh
TODAY=`date "+%w"`
ACCESS_TOKEN=${1}
CURRENT_DATE=`date "+%Y-%m-%d"`

COMMITED_MESSAGE="ナイス！コミット！"
NOT_COMMITED_MESSAGE="なぜcommitしない"
WEBHOOK_URL=${2}
LATEST_COMMIT_DATE=`curl -u :${ACCESS_TOKEN} https://api.github.com/users/anntoque/events | \
jq '.[0] | select(.["type"]=="PushEvent")' | jq '.["created_at"]' | cut -c 2-11`

if [ "${LATEST_COMMIT_DATE}" = "${CURRENT_DATE}" ]; then
  echo ${COMMITED_MESSAGE}
else
  echo ${NOT_COMMITED_MESSAGE}
  curl -X POST --data-urlencode "payload={\"channel\": \"#test-webhook\", \"username\":\"webhookbot\",\
   \"text\": \"${NOT_COMMITED_MESSAGE}\", \"icon_emoji\": \":warning:\"}" ${WEBHOOK_URL}
fi