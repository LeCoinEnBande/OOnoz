rendering
renderFooterOn: html
	html footer
		class: #'panel-footer';
		class: #clearfix;
		with: [ html div
				tbsPullRight;
				with: [ html tbsButton
						role: #button;
						beOutline;
						beReset;
						beWarning;
						with: 'Effacer'.
					self renderNextQuestionButtonOn: html ] ]