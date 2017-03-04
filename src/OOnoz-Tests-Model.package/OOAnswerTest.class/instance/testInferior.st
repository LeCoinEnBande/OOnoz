tests
testInferior
	| a1 a2 |
	a1 := OOAnswer text: 'aaa' isRight: true.
	a2 := OOAnswer text: 'zzz' isRight: true.
	self assert: a1 < a2