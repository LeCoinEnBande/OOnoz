rendering
renderContentOn: html
	html tbsArticlePanel
		beDefault;
		with: [ html tbsArticlePanelHeader
				parent: #'#mcqCreation';
				toggle: #collapse;
				target: self id;
				onClick: (html jQuery ajax callback: [ self headerClickAction ]);
				with: [ html tbsPanelTitle
						level2;
						with: 'Question ' , self index asString ].
			self renderErrorOn: html.
			html div
				id: self id;
				class: #'panel-collapse';
				class: #collapse;
				class: #in if: self isActive;
				role: #tabpanel;
				with: [ self renderFormContentOn: html ] ]