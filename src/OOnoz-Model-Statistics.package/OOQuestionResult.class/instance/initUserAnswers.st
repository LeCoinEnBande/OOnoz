initialization
initUserAnswers
	self
		userAnswers:
			(self question answers
				inject: Dictionary new
				into: [ :dico :answer | 
					dico add: answer -> nil.
					dico ])