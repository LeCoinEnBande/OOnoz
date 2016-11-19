rendering
renderFooterOn: html
	html footer
		class: #'panel-footer';
		class: #clearfix;
		with: [ html div
				tbsPullRight;
				with: [ html tbsButton
						bePush;
						onClick:
							((html jQuery this closest: '.panel') load
								html: [ :r | 
									self resetAnswers.
									self renderQuestionOn: r ];
								onComplete: self owner initCheckboxesJs);
						beWarning;
						with: 'Effacer'.
					self renderNextQuestionButtonOn: html ] ]