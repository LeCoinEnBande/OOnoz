rendering
renderHeaderOn: html
	html tbsArticlePanelHeader
		parent: #'#mcqCreation';
		toggle: #collapse;
		target: self id;
		onClick: (html jQuery ajax callback: [ self headerClickAction ]);
		with: [ html tbsPanelTitle
				level2;
				with: [ html text: 'Question ' , self index asString.
					html div
						tbsPullRight;
						class: #'accordion-status';
						id: self badgeId;
						with: [ self renderValidationBadgeOn: html ] ] ]