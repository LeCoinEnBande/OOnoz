Extension { #name : #OOUser }

{ #category : #'*OOnoz-WebApplication-Front' }
OOUser >> alreadyPlayedTo: aMCQ [
	^ (OOMCQResult selectOne: [ :r | r mcq = aMCQ and: [ r user = self ] ]) isNotNil
]
