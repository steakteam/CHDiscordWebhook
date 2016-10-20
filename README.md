# CHDiscordWebhook
CommandHelper class for Discord Webhooks

# Example

<pre>
/webhooktest = >>>
	include('includes/discord_webhook.ms')
  @url = "https://ptb.discordapp.com/api/webhooks/token"
	@attachment = _webhook_json_attachment(
		"CHDiscordWebhook",
		array(array('title':'CHDiscordWebhook Attachments', 'value':'Attachments!')),
		"",
		"#333333"
	)
	@json = _webhook_json(
		"Test",
		"CHDiscordWebhook",
		"",
		array(@attachment)
	)
	_discord_webhook(@url, @json)
<<<
</pre>
