printing
displayAnswered
	^ String
		streamContents: [ :s | 
			s
				<< 'Répondu: ';
				<< (self questions select: #isValidated) size;
				<< $/;
				<< self questions size ]