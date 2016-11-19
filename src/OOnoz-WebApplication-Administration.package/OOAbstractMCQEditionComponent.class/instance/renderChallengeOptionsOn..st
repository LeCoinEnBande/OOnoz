rendering
renderChallengeOptionsOn: html
	self mcq isChallenge
		ifFalse: [ ^ self ].
	html hr.
	