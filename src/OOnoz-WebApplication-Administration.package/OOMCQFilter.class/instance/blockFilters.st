as yet unclassified
blockFilters
	| filters |
	filters := OrderedCollection new.
	self keepChallenges
		ifFalse: [ filters add: [ :coll | coll reject: #isChallenge ] ].
	self keepELearning
		ifFalse: [ filters add: [ :coll | coll reject: #isELearning ] ].
	self keepInactives
		ifFalse: [ filters add: [ :coll | coll reject: #isInactivated ] ].
	self keepActives
		ifFalse: [ filters add: [ :coll | coll reject: #isActivated ] ].
	filters add: [ :coll | coll select: [ :mcq | self levels includes: mcq level ] ].
	^ filters