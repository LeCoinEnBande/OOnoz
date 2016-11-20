printing
printOn: aStream
	super printOn: aStream.
	aStream
		<< $[;
		<< self firstName;
		space;
		<< self lastName;
		<< $]