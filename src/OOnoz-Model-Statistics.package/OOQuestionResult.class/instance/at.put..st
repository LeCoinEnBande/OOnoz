accessing
at: anAnswer put: aBoolean
	self userAnswers
		at: anAnswer
		ifPresentPut: aBoolean
		ifAbsent: [ OOError signal: 'This answer is not in this question.' ]