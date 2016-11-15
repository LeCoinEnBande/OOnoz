tests
testAtPut
	| question answer |
	answer := OOAnswer text: 'test' isRight: true.
	question := Mock named: 'Question'.
	question stub answers willReturn: (Set with: answer with: (OOAnswer text: 'test2' isRight: false)).
	result question: question.
	result at: answer put: true.
	self assert: (result userAnswers at: answer)