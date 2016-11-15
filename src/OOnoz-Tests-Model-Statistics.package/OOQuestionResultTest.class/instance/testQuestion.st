tests
testQuestion
	| question |
	question := Mock named: 'Question'.
	question stub answers willReturn: (Set with: (OOAnswer text: 'test' isRight: true) with: (OOAnswer text: 'test2' isRight: false)).
	result question: question.
	self assert: result userAnswers size equals: 2