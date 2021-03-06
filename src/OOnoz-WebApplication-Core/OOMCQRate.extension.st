Extension { #name : #OOMCQRate }

{ #category : #'*OOnoz-WebApplication-Core' }
OOMCQRate class >> displayRateOf: aMCQ [
	^ String
		streamContents: [ :s | 
			s
				<< ((self rateOf: aMCQ) printShowingMaxDecimalPlaces: 2);
				<< ' (';
				<< (OOMCQRate selectMany: [ :r | r isRated and: [ r mcq = aMCQ ] ]) size;
				<< ' votes)' ]
]
