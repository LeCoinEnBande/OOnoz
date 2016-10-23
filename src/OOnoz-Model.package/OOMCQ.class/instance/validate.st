validate
validate
	self title isEmptyOrNil
		ifTrue: [ self invalidate: 'Un QCM doit avoir un titre.' ].
	self markingScheme ifNil: [ self invalidate: 'Un QCM doit avoir un brème.' ].
	(self questions size between: self class minimumNumberOfQuestions and: self class maximumNumberOfQuestions)
		ifFalse: [ self
				invalidate:
					(String
						streamContents: [ :s | 
							s
								<< 'Le nombre de questions valides doit être de ';
								<< self class minimumNumberOfQuestions;
								<< $. ]) ].
	self questions do: [ :each | each validate ]