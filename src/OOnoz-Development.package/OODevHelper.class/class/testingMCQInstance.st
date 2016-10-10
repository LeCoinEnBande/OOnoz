helpers
testingMCQInstance
	^ OOMCQ
		questions:
			({('Who is the quality responsable?'
				->
					{('Aurélien' -> true).
					('Cyril' -> false).
					('Maxime' -> false).
					('Sylvie' -> false).
					('Laurence' -> false).
					('Clément' -> false)}).
			('Who is the technical responsable?'
				->
					{('Aurélien' -> false).
					('Cyril' -> true).
					('Maxime' -> false).
					('Sylvie' -> false).
					('Laurence' -> false).
					('Clément' -> false)}).
			('Who is the functional responsable?'
				->
					{('Aurélien' -> false).
					('Cyril' -> false).
					('Maxime' -> true).
					('Sylvie' -> false).
					('Laurence' -> false).
					('Clément' -> false)}).
			('Who is the manager?'
				->
					{('Aurélien' -> false).
					('Cyril' -> false).
					('Maxime' -> false).
					('Sylvie' -> true).
					('Laurence' -> false).
					('Clément' -> false)}).
			('Who is the MOA?'
				->
					{('Aurélien' -> false).
					('Cyril' -> false).
					('Maxime' -> false).
					('Sylvie' -> false).
					('Laurence' -> true).
					('Clément' -> false)}).
			('Who is the quality teacher?'
				->
					{('Aurélien' -> false).
					('Cyril' -> false).
					('Maxime' -> false).
					('Sylvie' -> false).
					('Laurence' -> false).
					('Clément' -> true)}).
			('Who is the MOE?'
				->
					{('Aurélien' -> true).
					('Cyril' -> true).
					('Maxime' -> true).
					('Sylvie' -> true).
					('Laurence' -> false).
					('Clément' -> false)}).
			('What is the name of the project?'
				->
					{('OOnoz' -> true).
					('Toto' -> false).
					('Beulzland' -> false).
					('Timoleon' -> false).
					('Potatoz' -> false).
					('Partinizer' -> false)}).
			('Who is the best?'
				->
					{('Aurélien' -> false).
					('Cyril' -> false).
					('Maxime' -> false).
					('Sylvie' -> false).
					('Laurence' -> false).
					('Clément' -> false)}).
			('Random ?! Test your luck.'
				->
					{('Aurélien' -> false).
					('Cyril' -> false).
					('Maxime' -> false).
					('Sylvie' -> true).
					('Laurence' -> false).
					('Clément' -> false)})}
				collect: [ :each | 
					OOMultipleAnswersQuestion
						description: each key
						answers: (each value collect: [ :asso | OOAnswer text: asso key isRight: asso value ]) asSet ])
				asSet