accessing
theme: anTheme
	theme ifNotNil: [ :t | t removeSubTheme: self ].
	theme := anTheme