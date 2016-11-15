rendering
renderHeaderOn: html
	html header
		id: self titleId;
		class: #'panel-heading';
		class: #'playing-question';
		role: #tab;
		attributeAt: #'data-toggle' put: #collapse;
		attributeAt: #'data-parent' put: #'#questionsList';
		attributeAt: #'data-target' put: '#' , self id;
		ariaExpanded: self isActive;
		ariaControles: self id;
		onClick: (html jQuery ajax callback: [ self headerClickAction ]) if: true;
		with: [ html tbsPanelTitle
				level3;
				with: [ html text: 'Question ' , self index greaseString.
					html div
						tbsPullRight;
						id: self badgeId;
						with: [ self renderBadgesOn: html ] ] ]