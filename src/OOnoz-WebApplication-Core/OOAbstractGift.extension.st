Extension { #name : #OOAbstractGift }

{ #category : #'*OOnoz-WebApplication-Core' }
OOAbstractGift >> label [
	^ self class label
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOAbstractGift class >> label [
	^ self subclassResponsibility
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOAbstractGift class >> labelDescription [
	^ self subclassResponsibility
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOAbstractGift >> labelDescription [
	^ self class labelDescription
]
