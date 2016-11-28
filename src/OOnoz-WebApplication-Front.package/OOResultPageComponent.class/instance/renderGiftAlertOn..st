rendering
renderGiftAlertOn: html
	self mcqResult mcq hasGift
		ifFalse: [ ^ self ].
	html tbsAlert
		beInfo;
		beDismissible;
		role: #alert;
		with: [ html tbsDismissAlertButton.
			html
				strong: 'Vos réponses ont bien étés prises en compte pour le gain du cadeau. Si vous avez gagnés vous serez contactés sous peu.' ]