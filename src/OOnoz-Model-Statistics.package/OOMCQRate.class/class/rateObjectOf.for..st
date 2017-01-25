accessing
rateObjectOf: aUser for: aMcq
	^ (OOMCQRate selectOne: [ :r | r mcq = aMcq and: [ r user = aUser ] ]) ifNil: [ OOMCQRate mcq: aMcq user: aUser ]