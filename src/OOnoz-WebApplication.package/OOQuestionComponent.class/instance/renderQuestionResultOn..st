rendering
renderQuestionResultOn: html
	self isValidated ifFalse: [ ^ self ].
	
	html
		mdlChip: [ html mdlChipContact hexColor: self colorForResult.
			html text: self displayResult ]