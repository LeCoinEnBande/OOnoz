initialization
initialize
	super initialize.
	self mcq: OOMCQ new.
	self hasBeenValidated: false.
	self challengeComponent: (OOChallengeEditionComponent owner: self)