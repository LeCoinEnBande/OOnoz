*OOnoz-WebApplication-Core
displayName
	^ String
		streamContents: [ :s | 
			s
				<< self firstName;
				space;
				<< self lastName ]