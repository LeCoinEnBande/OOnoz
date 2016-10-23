validation
validate
	self description isEmptyOrNil
		ifTrue: [ self invalidate: 'Une question devrait avoir une description.' ].
	(self answers size between: self class minimumNumberOfAnswers and: self class maximumNumberOfAnswers)
		ifFalse: [ self
				invalidate:
					(String
						streamContents: [ :s | 
							s
								<< 'Le nombre de réponses doit être compris entre ';
								<< self class minimumNumberOfAnswers;
								<< ' et ';
								<< self class maximumNumberOfAnswers;
								<< $. ]) ].
	((self answers select: #isRight) size between: self class minNumberOfRightAnswers and: self class maxNumberOfRightAnswers)
		ifFalse: [ self
				invalidate:
					(String
						streamContents: [ :s | 
							s
								<< 'Le nombre de réponses valides doit être compris entre ';
								<< self class minNumberOfRightAnswers;
								<< ' et ';
								<< self class maxNumberOfRightAnswers;
								<< $. ]) ]