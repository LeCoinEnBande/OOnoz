rendering
renderImageOn: html
	html image
		class: 'img-responsive';
		url:
			(self subTheme mediaLink isEmptyOrNil
				ifTrue: [ self subTheme class defaultMediaLink ]
				ifFalse: [ self subTheme mediaLink ])