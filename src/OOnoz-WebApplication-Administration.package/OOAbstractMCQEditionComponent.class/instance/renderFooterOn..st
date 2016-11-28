rendering
renderFooterOn: html
	html
		tbsArticlePanelFooter: [ html tbsAnchor
				role: #button;
				url: '#question1';
				attributeAt: #'data-toggle' put: #collapse;
				attributeAt: #'data-parent' put: #'#mcqCreation';
				bePrimary;
				onClick: (html jQuery ajax callback: [ self activateQuestionAt: 1 ]);
				with: 'Suivant' ]