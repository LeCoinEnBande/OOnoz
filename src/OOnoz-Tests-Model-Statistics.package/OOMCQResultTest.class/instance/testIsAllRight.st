tests
testIsAllRight
	result
		questionResults:
			((1 to: 20)
				collect: [ :element | 
					| mock |
					mock := Mock new.
					mock stub isCorrect willReturn: true.
					mock ]).
	self assert: result isAllRight.
	result questionResults anyOne stub isCorrect willReturn: false.
	self deny: result isAllRight