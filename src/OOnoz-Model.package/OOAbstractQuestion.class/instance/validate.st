validation
validate
	self description isEmptyOrNil
		ifTrue: [ self invalidate: 'Une question devrait avoir une description.' ].
	(self answers size
		between: self questionClass minimumNumberOfAnswers
		and: self questionClass maximumNumberOfAnswers)
		ifFalse: [ self
				invalidate:
					(String
						streamContents: [ :s | 
							s
								<< 'Le nombre de réponses doit être compris entre ';
								<< self questionClass minimumNumberOfAnswers;
								<< ' et ';
								<< self questionClass maximumNumberOfAnswers;
								<< $. ]) ].
	((self answers select: #isRight) size
		between: self questionClass minNumberOfRightAnswers
		and: self questionClass maxNumberOfRightAnswers)
		ifFalse: [ self
				invalidate:
					(String
						streamContents: [ :s | 
							s
								<< 'Le nombre de réponses valides doit être compris entre ';
								<< self questionClass minNumberOfRightAnswers;
								<< ' et ';
								<< self questionClass maxNumberOfRightAnswers;
								<< $. ]) ].
	self answers
		do: [ :a | 
			a text isEmptyOrNil
				ifTrue: [ self invalidate: 'Une réponse doit avoir un texte.' ] ]