Extension { #name : #OOGift }

{ #category : #'*OOnoz-WebApplication-Core' }
OOGift class >> label [
	^ 'Avec cadeau'
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOGift >> labelDescription [
	^ self winningStrategy labelDescription
]
