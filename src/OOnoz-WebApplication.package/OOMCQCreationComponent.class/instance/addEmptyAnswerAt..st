action
addEmptyAnswerAt: aQuestion
	self flag: #todo. "Should be in the question"
	aQuestion
		addAnswer:
			(OOAnswer new
				index: aQuestion answers size + 1;
				yourself)