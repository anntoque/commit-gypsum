#!/bin/sh

. ./config.sh
echo ${GITHUB_TOKEN}
echo ${SLACK_WEBHOOK}

TODAY=`date "+%w"`
ACCESS_TOKEN=${1}
CURRENT_DATE=`date "+%Y-%m-%d"`

COMMITED_MESSAGE="毎日1commit…その積み重ねが大事！お疲れ様自分！"
NOT_COMMITED_MESSAGE="なぜcommitしないいいいいいいい！今すぐしろおおおおおおお！！"
WEBHOOK_URL=${2}
LATEST_COMMIT_DATE=`curl -u :${ACCESS_TOKEN} https://api.github.com/users/anntoque/events | \
jq '.[0] | select(.["type"]=="PushEvent")' | jq '.["created_at"]' | cut -c 2-11`

if [ "${LATEST_COMMIT_DATE}" = "${CURRENT_DATE}" ]; then
  curl -X POST --data-urlencode "payload={\"channel\": \"#test-webhook\", \"username\":\"webhookbot\",\
   \"text\": \"${COMMITED_MESSAGE}\", \"icon_emoji\": \":man-lifting-weights:\"}" ${WEBHOOK_URL}
else
  curl -X POST --data-urlencode "payload={\"channel\": \"#test-webhook\", \"username\":\"webhookbot\",\
   \"text\": \"${NOT_COMMITED_MESSAGE}\", \"icon_emoji\": \":warning:\"}" ${WEBHOOK_URL}
fi