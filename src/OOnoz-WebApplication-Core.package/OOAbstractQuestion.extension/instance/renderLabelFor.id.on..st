*OOnoz-WebApplication-Core
renderLabelFor: answer id: anId on: html
	html label
		for: anId;
		with: [ html span
				tbsScreenReaderOnly;
				with: 'Proposition ' , answer index asString ]