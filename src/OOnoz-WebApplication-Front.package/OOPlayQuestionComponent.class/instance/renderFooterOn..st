rendering
renderFooterOn: html
	html
		tbsArticlePanelFooter: [ html tbsButton
				bePush;
				onClick:
					(html jQuery ajax
						callback: [ self resetAnswers ];
						onComplete:
							(self refreshBadgeScriptOn: html)
								,
									((html jQuery id: self answersId) load
										html: [ :r | self renderAnswersOn: r ];
										onComplete: self owner initCheckboxesJs));
				beWarning;
				with: 'Effacer'.
			self renderNextQuestionButtonOn: html ]