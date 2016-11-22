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
							(html jQuery ajax
								callback: [ self resetAnswers ];
								onComplete:
									((html jQuery id: self badgeId) load html: [ :r | self renderValidationBadgeOn: r ])
										,
											((html jQuery id: self answersId) load
												html: [ :r | self renderAnswersOn: r ];
												onComplete: self owner initCheckboxesJs));
						beWarning;
						with: 'Effacer'.
					self renderNextQuestionButtonOn: html ] ]