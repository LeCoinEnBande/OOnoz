rendering
renderPanelHeaderOn: html
	html tbsArticlePanelHeader
		id: self titleId;
		parent: #'#mcqsList';
		toggle: #collapse;
		target: self id;
		ariaExpanded: self index = 1;
		ariaControles: self id;
		with: [ html tbsPanelTitle
				level3;
				with: [ html text: 'Challenge: ' , self mcq title.
					html div
						tbsPullRight;
						class: #'oonoz-badges';
						with: [ self renderBadgeOn: html ] ] ]