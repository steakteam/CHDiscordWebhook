# discord_webhook
# params:
# url: discord webhook's url
# json: data of sending message(use webhook_json to make it)
proc _discord_webhook(@url, @json) {
	http_request(@url.'/slack',
		array(
			'method':'POST',
			'headers': array(
				'User-Agent': 'DiscordBot ('.@url.', 1.0)',
				'Content-type': 'application/json'
			),
			'params':@json,
			'success':closure(@response) {
				if(@response[body] == 'ok') {
					console('[CHDiscordWebhook] Message Sent.')
				} else {
					console('[CHDiscordWebhook] Message Not Sent:'@response[body])
				}
			}
		)
	)
}

# webhook_json
# params:
# text: String, Message's Text
# username(optional): String, bot's name
# icon_url(optional): URL(String), bot's icon image URL
# attachments(optional): attachmentsArray, format is: array(attachmentArray1, attachmentArray2, attachmentArray...) and you can make attachmentArray in _webhook_json_attachment
proc _webhook_json(@text, @username = '', @icon_url = '', @attachments = '') {
	@json = array(
		"username":@username,
		"icon_url":@icon_url,
		"text":@text,
		"attachments":@attachments
	)
	return(json_encode(@json))
}

# webhook_json_attachment
# params:
# author_name: String, attachment author's name
# fields: array of fieldArray, fieldArray must be: array('title':'field Title', 'value':'field Value')
# author_icon(optional): URL(String), attachment's icon image URL
# color(optional): Attachment's Color
proc _webhook_json_attachment(@author_name, @fields, @author_icon = '', @color = '') {
	@attachment = array(
		"author_icon": @author_icon,
		"author_name": @author_name,
		"color": @color,
		"fields": @fields
	)
	return(@attachment)
}
