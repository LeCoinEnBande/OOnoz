rendering
renderAvatarErrorOn: html
	self avatarError ifNil: [ ^ self ].
	
	html tbsAlert
		beDanger;
		with: [ html strong: 'Avatar incorrect. '.
			html text: 'Un avatar doit faire moins de 1Mo et être une image au format png.' ].
		
	self avatarError: nil