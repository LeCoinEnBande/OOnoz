instance creation
newMCQInstance
	^ self actualClass new
		questions: (Set with: OOMultipleAnswersQuestionTest new newQuestionInstance);
		title: 'A title';
		markingScheme: OOStrictScheme;
		yourself