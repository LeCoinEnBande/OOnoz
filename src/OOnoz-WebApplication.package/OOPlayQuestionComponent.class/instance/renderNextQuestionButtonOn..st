rendering
renderNextQuestionButtonOn: html
	self isLast ifTrue: [ ^ self ].
	
	html space.
	html tbsAnchor
		beOutline;
		role: #button;
		url: '#' , 'question' , (self index + 1) greaseString;
		attributeAt: #'data-toggle' put: #collapse;
		attributeAt: #'data-parent' put: #'#questionsList';
		ariaExpanded: true;
		ariaControles: self id;
		bePrimary;
		with: 'Question suivante'