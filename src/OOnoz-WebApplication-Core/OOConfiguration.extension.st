Extension { #name : #OOConfiguration }

{ #category : #'*OOnoz-WebApplication-Core' }
OOConfiguration >> avatarsURL [
	^ self resourcesURL , '/Avatars/'
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOConfiguration >> mcqHeaderUrl [
	^ self resourcesURL , '/images/mcq.png'
]
