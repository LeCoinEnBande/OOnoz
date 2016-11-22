*OOnoz-WebApplication-Front
alreadyPlayedTo: aMCQ
	^ (OOMCQResult selectOne: [ :r | r mcq = aMCQ and: [ r user = self ] ]) isNotNil