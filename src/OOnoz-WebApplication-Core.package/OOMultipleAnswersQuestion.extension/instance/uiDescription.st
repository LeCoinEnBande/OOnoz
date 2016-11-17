*OOnoz-WebApplication-Core
uiDescription
	^ String
		streamContents: [ :s | 
			s
				<< 'Entre ';
				<< self minNumberOfRightAnswers;
				<< ' et ';
				<< self maxNumberOfRightAnswers;
				<< ' réponses possibles.' ]