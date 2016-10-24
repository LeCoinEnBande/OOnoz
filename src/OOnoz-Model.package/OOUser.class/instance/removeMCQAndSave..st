removing
removeMCQAndSave: aMCQ
	self mcqs remove: aMCQ.
	aMCQ remove.
	self save