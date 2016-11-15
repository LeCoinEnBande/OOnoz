tests
testMarkingScheme
	| mcq |
	mcq := Mock named: 'mcq'.
	mcq stub markingScheme willReturn: OOStrictScheme.
	mcq stub questions willReturn: Set new.
	result mcq: mcq.
	self assert: result markingScheme equals: OOStrictScheme