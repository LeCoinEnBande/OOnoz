rendering
renderWelcomeMessageOn: html
	html tbsRow
		beCentered;
		with: [ html
				tbsColMs: 8
				mo: 2
				with: [ html image
						style: 'height: 100px; width: 100px; border-radius:5000px';
						url: (self currentUser avatarUrlFrom: self configuration).
					html heading
						level3;
						with: 'Bienvenue'.
					html div
						style: 'margin-top: 20px; margin-bottom: 20px;';
						with: 'Ça nous fait plaisir de vous revoir ' , self currentUser firstName.
					html break.
					html tbsAnchor
						callback: [ self rootComponent setInstanceOf: OOPlayPage ];
						bePrimary;
						with: 'Continuer' ] ]