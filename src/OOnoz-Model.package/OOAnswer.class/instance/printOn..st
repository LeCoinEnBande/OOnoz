printing
printOn: aStream
	super printOn: aStream.
	aStream
		<< $(;
		<< self isRight asString;
		<< '-';
		<< self index;
		<< $)