initialization
initUserAnswers
	self
		userAnswers: (Dictionary withAll: (self question answers collect: [ :answer | answer -> nil ]))