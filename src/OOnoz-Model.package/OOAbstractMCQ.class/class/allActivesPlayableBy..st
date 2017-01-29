accessing
allActivesPlayableBy: aUser
	^ self allActives reject: [ :mcq | (OOMCQResult selectOne: [ :res | res mcq = mcq and: [ res user = aUser ] ]) isNotNil ]