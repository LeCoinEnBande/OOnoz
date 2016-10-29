copying
postCopy
	super postCopy.
	self questions: (self questions collect: #copy)