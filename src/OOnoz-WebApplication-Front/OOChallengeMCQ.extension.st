Extension { #name : #OOChallengeMCQ }

{ #category : #'*OOnoz-WebApplication-Front' }
OOChallengeMCQ >> canBePlayedBy: anUser [
	^ (OOMCQResult count: [ :res | res mcq = self and: [ res user = anUser ] ]) = 0
]
