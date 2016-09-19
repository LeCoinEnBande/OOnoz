printing
displayResult
	^ String
		streamContents: [ :s | 
			s
				<< 'Résultat: ';
				<< (self result asFloat round: 2) asString;
				<< $/;
				<< self questions size ]