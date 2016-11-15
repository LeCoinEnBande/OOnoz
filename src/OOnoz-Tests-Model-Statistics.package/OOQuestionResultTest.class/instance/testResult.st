tests
testResult
	| mcqResult |
	result userAnswers: self strictlyRightUserAnswers.
	mcqResult := Mock named: 'result'.
	mcqResult stub markingScheme willReturn: OOStrictScheme.
	result owner: mcqResult.
	self assert: result result equals: 1