running
go
	self components ifEmpty: [ self components add: (OOThemeSelectionComponent page: self page) ].
	self
		call: self components last
		onAnswer: [ :compOrInteger | 
			compOrInteger isInteger
				ifTrue: [ compOrInteger timesRepeat: [ self components removeLast ] ]
				ifFalse: [ self components add: compOrInteger ] ]