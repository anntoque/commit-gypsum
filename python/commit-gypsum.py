import slackweb
import config
import requests
from datetime import datetime
import datetime as dt

now = dt.datetime.now()
current_date = now.strftime("%Y/%m/%d %H:%M:%S")
slack = slackweb.Slack(url=config.SLACK_WEBHOOK)
github_token = config.GITHUB_TOKEN
headers = {'Authorization': 'token ' + github_token}

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

def send_message():
    slack_message = "pythonからslackpytttt" + current_date
    slack.notify(text=slack_message)

if __name__ == '__main__':
    events = get_github_events()
    # last_commit = get_last_commit(events)
    last_commit_date = get_last_commit(events)
    send_message()