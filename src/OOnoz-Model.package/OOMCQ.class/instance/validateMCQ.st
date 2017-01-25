validate
validateMCQ
	self title isEmptyOrNil
		ifTrue: [ self invalidate: 'Un QCM doit avoir un titre.' ].
	self markingScheme ifNil: [ self invalidate: 'Un QCM doit avoir un barème.' ].
	self subThemes ifEmpty: [ self invalidate: 'Un QCM doit avoir au moins un sous thème.' ].
	(self subThemes collect: #theme as: Set) size < 2
		ifFalse: [ self invalidate: 'Un QCM doit avoir des sous thèmes contenus dans un seul thème uniquement.' ].
	(self questions size between: self class minimumNumberOfQuestions and: self class maximumNumberOfQuestions)
		ifFalse: [ self
				invalidate:
					(String
						streamContents: [ :s | 
							s
								<< 'Le nombre de questions valides doit être de ';
								<< self class minimumNumberOfQuestions;
								<< $. ]) ]