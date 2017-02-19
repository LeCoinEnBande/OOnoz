accessing
rateOf: aMCQ
	^ ((self selectMany: [ :r | r isRated and: [ r mcq = aMCQ ] ])
		collect: #rate) ifEmpty: [ 0 ] ifNotEmpty: #average