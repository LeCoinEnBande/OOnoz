rendering
renderGiftContentOn: html
	html
		tbsFormGroup: [ html tbsButton
				beInfoIf: self mcq hasGift not;
				beDangerIf: self mcq hasGift;
				bePush;
				onClick:
					((html jQuery id: #gift) load
						html: [ :r | 
							self toggleGift.
							self renderGiftContentOn: html ]);
				with:
					(self mcq hasGift
						ifTrue: [ 'Supprimer le cadeau' ]
						ifFalse: [ 'Ajouter un cadeau' ]) ].
	self renderFormOn: html