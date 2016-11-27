action
desactivateChallenge
	self mcq isChallenge
		ifTrue: [ self mcq: self mcq mcq ]