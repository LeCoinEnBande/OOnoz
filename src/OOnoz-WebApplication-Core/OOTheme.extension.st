Extension { #name : #OOTheme }

{ #category : #'*OOnoz-WebApplication-Core' }
OOTheme >> themeMediaUrl [
	^ self hasMedia
		ifTrue: [ self mediaLink ]
		ifFalse: [ self class defaultMediaLink ]
]
