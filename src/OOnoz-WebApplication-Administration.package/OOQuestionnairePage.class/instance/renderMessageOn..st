rendering
renderMessageOn: html
	self message ifNil: [ ^ self ].
	html tbsAlert
		beInfo;
		beDismissible;
		role: #alert;
		with: [ html tbsDismissAlertButton.
			html strong: self message ].
	self message: nil