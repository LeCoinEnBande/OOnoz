rendering
renderBadgesOn: html
	| checkedAnswers |
	checkedAnswers := (self result userAnswers values select: [ :r | r ]) size.
	html tbsLabel
		beSuccessIf: (checkedAnswers between: self question minNumberOfRightAnswers and: self question maxNumberOfRightAnswers);
		beDangerIf: (checkedAnswers between: self question minNumberOfRightAnswers and: self question maxNumberOfRightAnswers) not;
		with:
			(String
				streamContents: [ :s | 
					s
						<< checkedAnswers greaseString;
						<< $/;
						<< self question maxNumberOfRightAnswers ])