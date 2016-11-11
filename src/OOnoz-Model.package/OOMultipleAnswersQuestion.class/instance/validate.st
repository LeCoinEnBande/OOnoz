validation
validate
	super validate.
	((self answers select: #isRight) size
		between: self minNumberOfRightAnswers
		and: self maxNumberOfRightAnswers)
		ifFalse: [ self
				invalidate:
					(String
						streamContents: [ :s | 
							s
								<< 'Le nombre de réponses valides doit être compris entre ';
								<< self minNumberOfRightAnswers;
								<< ' et ';
								<< self maxNumberOfRightAnswers;
								<< $. ]) ]