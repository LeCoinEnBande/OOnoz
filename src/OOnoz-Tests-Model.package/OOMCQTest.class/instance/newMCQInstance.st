instance creation
newMCQInstance
	^ OOMCQ questions: (Set with: OOAbstractQuestionTest new newQuestionInstance)