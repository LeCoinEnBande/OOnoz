*OOnoz-WebApplication
description
	^ String
		streamContents: [ :s | 
			s
				<<
					'Question à réponse multiple: Cette question peut avoir plusieurs réponses possibles. Entre ';
				<< self minNumberOfRightAnswers;
				<< ' et ';
				<< self maxNumberOfRightAnswers;
				<< ' bonne réponse possible.' ]