rendering
renderContentOn: html
	html tbsArticlePanel
		beDefault;
		with: [ self renderHeaderOn: html.
			html div
				id: self id;
				class: #'panel-collapse';
				class: #collapse;
				class: #in;
				role: #tabpanel;
				ariaLabelledBy: self titleId;
				with: [ html section
						class: #'panel-body';
						with: [ html heading
								level2;
								with: self question description.
							self renderAlertOn: html.
							html tbsRow: [ self renderAnswersOn: html ] ] ] ]