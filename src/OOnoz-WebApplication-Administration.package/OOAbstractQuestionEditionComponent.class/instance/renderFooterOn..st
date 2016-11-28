rendering
renderFooterOn: html
	self isLast
		ifTrue: [ ^ self ].
	html
		tbsArticlePanelFooter: [ html tbsAnchor
				role: #button;
				url: '#question' , (self index + 1) greaseString;
				attributeAt: #'data-toggle' put: #collapse;
				attributeAt: #'data-parent' put: #'#mcqCreation';
				bePrimary;
				onClick:
					(html jQuery ajax
						callback: [ self desactivate.
							self owner activateQuestionAt: self index + 1 ]);
				with: 'Suivant' ]