adding
removeQuestion: aQuestion 
	self flag: #todo. "baaad"
	self questions rehash.
	self questions remove: aQuestion