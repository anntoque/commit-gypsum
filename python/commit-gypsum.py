import slackweb
import config
from datetime import datetime

slack = slackweb.Slack(url=config.SLACK_WEBHOOK)
github_token = config.GITHUB_TOKEN

current_date = datetime.now().strftime("%Y/%m/%d %H:%M:%S")
slack_message = "pythonからslackpytttt" + current_date
slack.notify(text=slack_message)