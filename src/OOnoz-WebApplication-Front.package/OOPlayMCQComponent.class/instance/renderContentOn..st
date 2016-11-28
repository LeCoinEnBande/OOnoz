rendering
renderContentOn: html
	(self currentUser alreadyPlayedTo: self mcq)
		ifFalse: [ self result save.
			self renderComponentOn: html ]
		ifTrue: [ self mcq isChallenge
				ifTrue: [ self renderErrorOn: html ]
				ifFalse: [ self renderComponentOn: html ] ]