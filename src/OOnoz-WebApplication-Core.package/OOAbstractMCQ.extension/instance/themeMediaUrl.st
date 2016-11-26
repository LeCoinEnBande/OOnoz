*OOnoz-WebApplication-Core
themeMediaUrl
	^ self subThemes
		detect: [ :s | s hasMedia ]
		ifFound: [ :s | s mediaLink ]
		ifNone: [ self theme hasMedia
				ifTrue: [ self theme mediaLink ]
				ifFalse: [ 'https://image.freepik.com/photos-libre/close-up-mains-et-examen_1098-209.jpg' ] ]