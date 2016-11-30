rendering
renderComponentOn: html
	(self currentUser alreadyPlayedTo: self mcq)
		ifFalse: [ self result save.
			self renderPageOn: html ]
		ifTrue: [ self mcq isChallenge
				ifTrue: [ self renderErrorOn: html ]
				ifFalse: [ self renderPageOn: html ] ]