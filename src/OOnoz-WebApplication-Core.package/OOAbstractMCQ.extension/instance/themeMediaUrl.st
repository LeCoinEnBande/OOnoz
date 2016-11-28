*OOnoz-WebApplication-Core
themeMediaUrl
	^ self subThemes
		detect: [ :s | s hasMedia ]
		ifFound: [ :s | s mediaLink ]
		ifNone: [ self theme hasMedia
				ifTrue: [ self theme mediaLink ]
				ifFalse: [ self theme class defaultMediaLink ] ]