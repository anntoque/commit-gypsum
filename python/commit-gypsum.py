import slackweb
import config
import requests
from datetime import datetime

current_date = datetime.now().strftime("%Y/%m/%d %H:%M:%S")
slack = slackweb.Slack(url=config.SLACK_WEBHOOK)
github_token = config.GITHUB_TOKEN
headers = {'Authorization': 'token ' + github_token}

def get_last_commit(): 
    response = requests.get(
        'https://api.github.com/users/anntoque/events',
        headers=headers
    )
    print(response.text)

def send_message(): 
    slack_message = "pythonからslackpytttt" + current_date
    slack.notify(text=slack_message)

if __name__ == '__main__':
    get_last_commit()
    send_message()