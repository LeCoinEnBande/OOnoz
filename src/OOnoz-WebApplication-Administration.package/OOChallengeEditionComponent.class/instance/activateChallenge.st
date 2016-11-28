action
activateChallenge
	self mcq isChallenge
		ifFalse: [ self mcq: (OOChallengeMCQ decorate: self mcq) ]