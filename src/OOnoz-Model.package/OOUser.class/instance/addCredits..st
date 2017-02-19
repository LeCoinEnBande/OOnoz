adding
addCredits: anInteger
	self assert: anInteger >= 0.
	self credits: self credits + anInteger