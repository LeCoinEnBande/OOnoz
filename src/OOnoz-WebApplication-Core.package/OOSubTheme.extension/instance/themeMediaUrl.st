*OOnoz-WebApplication-Core
themeMediaUrl
	^ self hasMedia
		ifTrue: [ self mediaLink ]
		ifFalse: [ self theme defaultMediaLink ]