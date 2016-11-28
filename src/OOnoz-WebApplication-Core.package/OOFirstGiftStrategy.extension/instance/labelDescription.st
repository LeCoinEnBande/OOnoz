*OOnoz-WebApplication-Core
labelDescription
	^ String
		streamContents: [ :s | 
			s
				<< 'À gagner: ';
				<< self gift description.
			self gift description last = $.
				ifFalse: [ s << $. ].
			s
				<< ' Il en reste ';
				<< self gift remainingGifts;
				<< ' à gagner sur les ';
				<< self gift number;
				<< '.' ]