rendering
renderContentOn: html
	html article
		class: #panel;
		class: #'panel-default';
		with: [ self renderHeaderOn: html.
			html div
				id: self id;
				class: #'panel-collapse';
				class: #collapse;
				class: #in if: self isFirst;
				role: #tabpanel;
				ariaLabelledBy: self titleId;
				with: [ html section
						class: #'panel-body';
						with: [ html heading: self question description.
							self question renderAnswersToPlayFrom: self on: html.
							self renderFooterOn: html ] ] ]