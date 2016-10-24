copying
postCopy
	super postCopy.
	self answers: (self answers collect: #copy)