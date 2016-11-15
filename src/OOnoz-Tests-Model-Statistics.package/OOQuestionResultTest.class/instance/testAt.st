tests
testAt
	| question answer |
	answer := OOAnswer text: 'test' isRight: true.
	question := Mock named: 'Question'.
	question stub answers
		willReturn: (Set with: answer with: (OOAnswer text: 'test2' isRight: false)).
	result question: question.
	self assert: (result at: answer) equals: false.
	result at: answer put: true.
	self assert: (result at: answer)