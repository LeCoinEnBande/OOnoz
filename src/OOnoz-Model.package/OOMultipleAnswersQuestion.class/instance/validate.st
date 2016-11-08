validation
validate
	| min max |
	super validate.
	min := self questionClass minNumberOfRightAnswers.
	max := self questionClass maxNumberOfRightAnswers min: self answers size - 1.
	((self answers select: #isRight) size between: min and: max)
		ifFalse: [ self
				invalidate:
					(String
						streamContents: [ :s | 
							s
								<< 'Le nombre de réponses valides doit être compris entre ';
								<< min;
								<< ' et ';
								<< max;
								<< $. ]) ]