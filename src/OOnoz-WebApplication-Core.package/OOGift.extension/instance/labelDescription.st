*OOnoz-WebApplication-Core
labelDescription
	^ String
		streamContents: [ :s | 
			s
				<< 'À gagner: ';
				<< self description;
				<< '. Il reste: ';
				<< self remainingGifts;
				<< ' sur les ';
				<< self number;
				<< ' à gagner.' ]