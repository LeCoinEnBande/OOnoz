accessing
theme
	^ self subThemes ifNotEmpty: [ self subThemes anyOne theme ] ifEmpty: [ nil ]