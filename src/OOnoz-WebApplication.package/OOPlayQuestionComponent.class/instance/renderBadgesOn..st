rendering
renderBadgesOn: html
	| checkedAnswers |
	checkedAnswers := (self result userAnswers values select: [ :r | r ]) size.
	html tbsBadge
		beSuccessIf: (checkedAnswers between: self question minNumberOfRightAnswers and: self question maxNumberOfRightAnswers);
		beDangerIf: (checkedAnswers between: self question minNumberOfRightAnswers and: self question maxNumberOfRightAnswers) not;
		with: checkedAnswers greaseString