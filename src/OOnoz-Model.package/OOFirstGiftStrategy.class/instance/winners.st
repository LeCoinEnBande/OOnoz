action
winners
	^ (OOMCQResult selectMany: [ :r | r mcq isChallenge and: [ r mcq gift = self gift ] ])
		select: [ :r | r numberOfCorrectQuestions = OOMCQ maximumNumberOfQuestions ]
		thenCollect: #user