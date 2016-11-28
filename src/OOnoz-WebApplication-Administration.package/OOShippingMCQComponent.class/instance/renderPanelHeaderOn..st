rendering
renderPanelHeaderOn: html
	html header
		id: self titleId;
		class: #'panel-heading';
		role: #tab;
		attributeAt: #'data-parent' put: #'#mcqsList';
		attributeAt: #'data-toggle' put: #collapse;
		attributeAt: #'data-target' put: '#' , self id;
		ariaExpanded: self index = 1;
		ariaControles: self id;
		with: [ html tbsPanelTitle
				level3;
				with: [ html text: 'Challenge: ' , self mcq title.
					html div
						tbsPullRight;
						class: #'oonoz-badges';
						with: [ self renderBadgeOn: html ] ] ]