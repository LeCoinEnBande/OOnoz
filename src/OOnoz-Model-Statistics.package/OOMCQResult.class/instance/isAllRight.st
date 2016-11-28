testing
isAllRight
	^ self questionResults
		detect: [ :q | q isCorrect not ]
		ifFound: [ false ]
		ifNone: [ true ]