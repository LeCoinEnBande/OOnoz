testing
shouldRenderAddAnswerButton
	^ self question class isAbstract
		or: [ self question class maximumNumberOfAnswers
				= self question answers size ]