rendering
renderValidationButtonOn: html
	html mdlButton
		disabled: self isValidated;
		accentColor;
		raised;
		rippleEffect;
		onClick:
			(html jQuery ajax
				callback: [ self validate ];
				context: (JSStream on: 'this');
				onSuccess:
					(html jQuery
						script: [ :s | 
							s
								<<
									((html jQuery this parents: '.mcq-question') parent load
										html: [ :ajaxHtml | self renderQuestionOn: ajaxHtml ];
										onComplete: 'componentHandler.upgradeDom();');
								<< (((html jQuery this parents: '.mcq') children: '.mcq__informations') load html: [ :ajaxHtml | self mcq renderMCQInfosOn: ajaxHtml ]) ]));
		with: 'Validate'