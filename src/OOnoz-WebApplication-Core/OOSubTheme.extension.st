Extension { #name : #OOSubTheme }

{ #category : #'*OOnoz-WebApplication-Core' }
OOSubTheme >> themeMediaUrl [
	^ self hasMedia
		ifTrue: [ self mediaLink ]
		ifFalse: [ self theme defaultMediaLink ]
]
