accessing
allActivesFromSubTheme: aSubTheme playableBy: aUser
	^ self allActives select: [ :mcq | (mcq subThemes includes: aSubTheme) and: [ (OOMCQResult selectOne: [ :res | res mcq = mcq and: [ res user = aUser ] ]) isNil ] ]