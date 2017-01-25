*OOnoz-WebApplication-Core
themeMediaUrl
	^ self imagePath
		ifNil: [ self subThemes
				detect: #hasMedia
				ifFound: #mediaLink
				ifNone: [ self theme ifNil: [ OOAbstractTheme defaultMediaLink ] ifNotNil: #themeMediaUrl ] ]