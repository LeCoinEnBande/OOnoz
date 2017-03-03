*OOnoz-WebApplication-Front
canBePlayedBy: anUser
	^ (OOMCQResult count: [ :res | res mcq = self and: [ res user = anUser ] ]) = 0