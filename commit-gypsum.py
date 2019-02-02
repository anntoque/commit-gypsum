import requests
import os
from datetime import datetime
import datetime as dt
from flask import Flask, request, abort
from linebot import (
    LineBotApi, WebhookHandler
)
from linebot.exceptions import (
    InvalidSignatureError
)
from linebot.models import (
    FollowEvent, MessageEvent, TextMessage, TextSendMessage, ImageMessage,
    ImageSendMessage, TemplateSendMessage, ButtonsTemplate, PostbackTemplateAction,
    MessageTemplateAction, URITemplateAction
)

app = Flask(__name__)

LINE_CHANNEL_ACCESS_TOKEN = os.environ["LINE_CHANNEL_ACCESS_TOKEN"]
LINE_CHANNEL_SECRET = os.environ["LINE_CHANNEL_SECRET"]

line_bot_api = LineBotApi(LINE_CHANNEL_ACCESS_TOKEN)
handler = WebhookHandler(LINE_CHANNEL_SECRET)

github_token = os.environ["GITHUB_TOKEN"]
headers = {'Authorization': 'token ' + github_token}

now = dt.date.today()
current_date = now.strftime("%Y/%m/%d %H:%M:%S")

def get_github_events(): 
    response = requests.get(
        'https://api.github.com/users/anntoque/events',
        headers=headers)

    return response.json()

def get_last_commit(events):
    event_date = events[0]["created_at"]
    event_date_dt = dt.datetime.strptime(event_date, '%Y-%m-%dT%H:%M:%SZ')

    event_jp_date= event_date_dt + dt.timedelta(hours=9)

    return event_jp_date

def fix_message(from_datetime):
    from_date = from_datetime.date()
    if from_date == now: 
        slack_message = "毎日1commit…その積み重ねが大事！お疲れ様自分！"
    else:
        slack_message = "なぜcommitしないいいいいいいい！今すぐしろおおおおおおお！！"
    
    return slack_message

@app.route("/callback", methods=['POST'])
def callback():
    # ヘッダーの値を取得
    signature = request.headers['X-Line-Signature']

    # ボディを取得
    body = request.get_data(as_text=True)
    #app.logger.info("Request body" + body)

    #
    try: 
        handler.handle(body, signature)
    except InvalidSignatureError:
        abort(400)
    return 'OK'

@handler.add(MessageEvent, message=TextMessage)
def handle_message(event):
    line_bot_api.reply_message(
        event.reply_token,
        TextMessage(text=event.message.text))

if __name__ == '__main__':
    #events = get_github_events()
    #last_commit_date = get_last_commit(events)
    #message_text = fix_message(last_commit_date)
    port = int(os.getenv("PORT", 5000))
    app.run(host="0.0.0.0", port=port)