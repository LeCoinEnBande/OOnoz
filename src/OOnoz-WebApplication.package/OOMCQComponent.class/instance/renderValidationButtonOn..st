rendering
renderValidationButtonOn: html
	self isValidated ifFalse: [ ^ self ].
	
	html mdlButton
		accentColor;
		raised;
		rippleEffect;
		onClick: 'location.reload()';
		with: 'Validate'