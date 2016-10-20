action
save
	| computed |
	self flag: #todo.	"Manage the errors."
	computed := self questions
		inject: self mcq
		into: [ :m :asso | 
			m
				addQuestion:
					(asso value
						inject: asso key
						into: [ :question :answer | 
							question addAnswer: answer.
							question ]).
			m ].
	self currentUser addMCQ: computed.
	computed save.
	self currentUser save