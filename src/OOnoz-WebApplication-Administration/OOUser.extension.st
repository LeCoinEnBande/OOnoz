Extension { #name : #OOUser }

{ #category : #'*OOnoz-WebApplication-Administration' }
OOUser >> admistrationMap [
	^ self role administrationMap
]

{ #category : #'*OOnoz-WebApplication-Administration' }
OOUser >> editableMcqs [
	^ self role mcqsEditableBy: self
]
