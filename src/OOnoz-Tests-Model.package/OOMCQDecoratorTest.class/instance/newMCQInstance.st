instance creation
newMCQInstance
	^ self actualClass
		decorate:
			(OOMCQ new
				questions: (Set with: OOMultipleAnswersQuestionTest new newQuestionInstance);
				title: 'A title';
				markingScheme: OOStrictScheme;
				yourself)