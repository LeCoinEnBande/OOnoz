accessing
allActivesFromTheme: aTheme playableBy: aUser
	^ self allActives select: [ :mcq | mcq theme = aTheme and: [ (OOMCQResult selectOne: [ :res | res mcq = mcq and: [ res user = aUser ] ]) isNil ] ]