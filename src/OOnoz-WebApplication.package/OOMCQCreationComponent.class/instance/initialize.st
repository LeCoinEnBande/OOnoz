initialization
initialize
	super initialize.
	self mcq: OOMCQ new.
	self questions: (Array new: OOMCQ minimumNumberOfQuestions).
	self questions doWithIndex: [ :a :ind | self questions at: ind put: nil -> nil ]