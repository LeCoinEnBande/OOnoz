tests
testAtPutWithNonExistingAnswer
	| question answer |
	answer := OOAnswer text: 'test' isRight: true.
	question := Mock named: 'Question'.
	question stub answers willReturn: (Set with: answer with: (OOAnswer text: 'test2' isRight: false)).
	result question: question.
	self should: [ result at: (OOAnswer text: 'test that does not exist' isRight: true) put: true ] raise: OOError