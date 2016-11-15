*OOnoz-WebApplication-Core
printDetailedResult
	^ String
		streamContents: [ :s | 
			s
				<< self numberOfCorrectQuestions;
				<< ' bonne'.
			self numberOfCorrectQuestions < 2
				ifTrue: [ s << $s ].
			s << ' réponse'.
			self numberOfCorrectQuestions < 2
				ifTrue: [ s << $s ].
			s
				<< ' sur ';
				<< self questionResults size ]