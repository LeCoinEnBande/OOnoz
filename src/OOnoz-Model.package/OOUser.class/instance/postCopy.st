copying
postCopy
	super postCopy.
	self mcqs: (self mcqs collect: #copy)