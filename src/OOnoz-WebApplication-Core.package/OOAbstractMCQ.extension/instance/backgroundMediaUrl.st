*OOnoz-WebApplication-Core
backgroundMediaUrl
	^ self backgroundPath
		ifNil: [ self subThemes
				detect: #hasMedia
				ifFound: #mediaLink
				ifNone: [ self theme ifNil: [ OOAbstractTheme defaultMediaLink ] ifNotNil: #themeMediaUrl ] ]