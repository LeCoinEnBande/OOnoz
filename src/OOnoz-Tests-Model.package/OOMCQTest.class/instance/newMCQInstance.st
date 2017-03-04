instance creation
newMCQInstance
	| subtheme |
	subtheme := OOSubTheme title: 'subtest' description: 'subtest description'.
	(OOTheme title: 'test' description: 'test description') addSubTheme: subtheme.
	^ (self actualClass questions: (Set with: OOMultipleAnswersQuestionTest new newQuestionInstance))
		title: 'A title';
		markingScheme: OOStrictScheme;
		addSubTheme: subtheme;
		yourself