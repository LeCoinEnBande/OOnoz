accessing
colorForResult
	self flag: #clean.	"The ifs here are really bad :) I need to clean that later :)"
	^ self result = 0
		ifTrue: [ 'f44336' ]
		ifFalse: [ self result = 1
				ifTrue: [ '4CAF50' ]
				ifFalse: [ 'FFC107' ] ]