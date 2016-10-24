*OOnoz-WebApplication
addEmptyAnswer
	self
		addAnswer:
			(OOAnswer new
				index: ((1 to: self class maximumNumberOfAnswers) \ (self answers collect: #index)) first;
				yourself)