initialization
initialize
	super initialize.
	self hasBeenValidated: false.
	self challengeComponent: (OOChallengeEditionComponent owner: self)