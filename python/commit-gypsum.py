import slackweb
import config

slack = slackweb.Slack(url=config.SLACK_WEBHOOK)
slack.notify(text="pythonからslackpytttt")