rendering
renderQuestionOn: html
	self renderHeaderOn: html.
	^ html div
		id: self id;
		class: #'panel-collapse';
		class: #collapse;
		class: #in if: self isActive;
		role: #tabpanel;
		ariaLabelledBy: self titleId;
		with: [ html section
				class: #'panel-body';
				with: [ html heading: self question description.
					(html tag: #em) with: self question questionClass description.
					html div
						id: self answersId;
						with: [ self renderAnswersOn: html ].
					self renderFooterOn: html ] ]