accessing
rateOf: aMCQ
	^ ((OOMCQRate selectMany: [ :r | r isRated and: [ r mcq = aMCQ ] ]) collect: #rate)
		ifEmpty: [ 0 ]
		ifNotEmpty: [ :coll | coll average ]