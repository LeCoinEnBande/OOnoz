printing
displayResult
	^ String
		streamContents: [ :s | 
			s
				<< (self result asFloat round: 2) asString;
				<< '/1' ]