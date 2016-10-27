tests
testOrderedAnswers
	question answers: (self generateAnswersUpTo: 10 rights: 2).
	self
		assert:
			(question orderedAnswers
				collectWithIndex: [ :each :index | 
					each index = index
						ifTrue: [ 1 ]
						ifFalse: [ 0 ] ]) sum < 10