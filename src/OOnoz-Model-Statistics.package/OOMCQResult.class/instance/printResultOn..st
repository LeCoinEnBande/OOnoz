printing
printResultOn: aStream
	aStream
		<< self result;
		<< $/;
		<< self questionResults size