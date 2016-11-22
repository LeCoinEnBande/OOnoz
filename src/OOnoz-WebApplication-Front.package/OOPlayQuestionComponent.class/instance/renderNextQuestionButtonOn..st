rendering
renderNextQuestionButtonOn: html
	self isLast
		ifTrue: [ ^ self ].
	html space.
	html tbsAnchor
		role: #button;
		url: '#question' , (self index + 1) greaseString;
		class: self id;
		attributeAt: #'data-toggle' put: #collapse;
		attributeAt: #'data-parent' put: #'#questionsList';
		ariaExpanded: true;
		ariaControles: self id;
		bePrimary;
		onClick:
			(html jQuery ajax
				callback: [ self desactivate.
					self owner activateQuestionAt: self index + 1 ];
				onComplete: ('launchClock(' , (self index + 1) greaseString , ')') js);
		with: 'Question suivante'