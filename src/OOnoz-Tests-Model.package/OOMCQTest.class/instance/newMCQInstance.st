instance creation
newMCQInstance
	^ OOMCQ questions: (Set with: OOQuestionTest new newQuestionInstance)