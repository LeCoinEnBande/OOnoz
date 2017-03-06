printing
printOn: aStream
	super printOn: aStream.
	aStream
		<< $[;
		<< (self firstName ifNil: [ 'No name' ]);
		space;
		<< (self lastName ifNil: [ 'No surname' ]);
		<< $];
		<< $(;
		<< self role asString third;
		<< $)