action
toggleIsChallenge
	self mcq isChallenge
		ifTrue: [ self mcq: self mcq mcq ]
		ifFalse: [ self mcq: (OOChallengeMCQ decorate: self mcq) ]