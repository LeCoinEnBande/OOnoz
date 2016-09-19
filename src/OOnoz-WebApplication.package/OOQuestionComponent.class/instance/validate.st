actions
validate
	self isValidated: true.
	self result: (self model resultFrom: self userAnswers)