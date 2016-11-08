printing
printResultOn: aStream
	aStream
		<< (self result printShowingMaxDecimalPlaces: 2);
		<< '/1'