Extension { #name : #OOAbstractMCQ }

{ #category : #'*OOnoz-WebApplication-Core' }
OOAbstractMCQ >> backgroundMediaUrl [
	^ self backgroundPath
		ifNil: [ self subThemes
				detect: #hasMedia
				ifFound: #mediaLink
				ifNone: [ self theme ifNil: [ OOAbstractTheme defaultMediaLink ] ifNotNil: #themeMediaUrl ] ]
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOAbstractMCQ class >> kind [
	^ self subclassResponsibility
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOAbstractMCQ class >> kindDescription [
	^ self subclassResponsibility
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOAbstractMCQ >> renderThemeAndSubThemesOn: html [
	self theme
		ifNotNil: [ :t | 
			html tbsLabel
				bePrimary;
				with: t title ].
	(self subThemes first: (3 min: self subThemes size))
		do: [ :s | 
			html space.
			html tbsLabel
				beDefault;
				with: s title ].
	self subThemes size > 3
		ifFalse: [ ^ self ].
	html space.
	html tbsLabel
		beDefault;
		with: '...'
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOAbstractMCQ >> themeMediaUrl [
	^ self imagePath
		ifNil: [ self subThemes
				detect: #hasMedia
				ifFound: #mediaLink
				ifNone: [ self theme ifNil: [ OOAbstractTheme defaultMediaLink ] ifNotNil: #themeMediaUrl ] ]
]
