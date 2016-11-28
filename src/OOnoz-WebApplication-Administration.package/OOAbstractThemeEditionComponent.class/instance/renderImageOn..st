rendering
renderImageOn: html
	html image
		class: 'img-responsive';
		url:
			(self theme mediaLink isEmptyOrNil
				ifTrue: [ self theme class defaultMediaLink ]
				ifFalse: [ self theme mediaLink ])