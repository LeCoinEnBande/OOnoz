rendering
renderFooterOn: html
	html footer
		class: #'panel-footer';
		class: #clearfix;
		with: [ html div
				tbsPullRight;
				with: [ html tbsButton
						bePush;
						beOutline;
						onClick: ((html jQuery id: self answersId) load html: [ :r | self renderAnswersOn: r ]);
						beWarning;
						with: 'Effacer'.
					self renderNextQuestionButtonOn: html ] ]