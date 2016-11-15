tests
testIsCorrect
	| answer |
	result userAnswers: self strictlyRightUserAnswers.
	self assert: result isCorrect.
	answer := result userAnswers keys first.
	result at: answer put: (result at: answer) not.
	self deny: result isCorrect