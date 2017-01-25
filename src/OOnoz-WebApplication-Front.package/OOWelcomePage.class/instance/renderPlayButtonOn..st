rendering
renderPlayButtonOn: html
	(self isLogged
		ifTrue: [ html tbsAnchor
				callback: [ self rootComponent setInstanceOf: OOPlayPage ];
				yourself ]
		ifFalse: [ html tbsButton
				onClickUpdateRootDialogWith: [ :canvas | self renderLoginModalOn: canvas ];
				yourself ])
		bePrimary;
		beLarge;
		with: 'Jouez maintenant !'